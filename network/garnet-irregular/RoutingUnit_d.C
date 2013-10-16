/*
  Copyright (C) 1999-2008 by Mark D. Hill and David A. Wood for the
  Wisconsin Multifacet Project.  Contact: gems@cs.wisc.edu
  http://www.cs.wisc.edu/gems/

  --------------------------------------------------------------------

  This file is part of Garnet (Princeton's interconnect model),
  a component of the Multifacet GEMS (General Execution-driven 
  Multiprocessor Simulator) software toolset originally developed at 
  the University of Wisconsin-Madison.

  Garnet was developed by Niket Agarwal at Princeton University. Orion was
  developed by Princeton University.

  Substantial further development of Multifacet GEMS at the
  University of Wisconsin was performed by Alaa Alameldeen, Brad
  Beckmann, Jayaram Bobba, Ross Dickson, Dan Gibson, Pacia Harper,
  Derek Hower, Milo Martin, Michael Marty, Carl Mauer, Michelle Moravan,
  Kevin Moore, Andrew Phelps, Manoj Plakal, Daniel Sorin, Haris Volos, 
  Min Xu, and Luke Yen.
  --------------------------------------------------------------------

  If your use of this software contributes to a published paper, we
  request that you (1) cite our summary paper that appears on our
  website (http://www.cs.wisc.edu/gems/) and (2) e-mail a citation
  for your published paper to gems@cs.wisc.edu.

  If you redistribute derivatives of this software, we request that
  you notify us and either (1) ask people to register with us at our
  website (http://www.cs.wisc.edu/gems/) or (2) collect registration
  information and periodically send it to us.

  --------------------------------------------------------------------

  Multifacet GEMS is free software; you can redistribute it and/or
  modify it under the terms of version 2 of the GNU General Public
  License as published by the Free Software Foundation.

  Multifacet GEMS is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with the Multifacet GEMS; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
  02111-1307, USA

  The GNU General Public License is contained in the file LICENSE.

  ### END HEADER ###
*/
/* 
 * Routingunit_d.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "RoutingUnit_d.h"
#include "Router_d.h"
#include "InputUnit_d.h"
#include "NetworkMessage.h"
#include "GarnetNetwork_d.h"


vector<vector<int> >**** RoutingUnit_d::route_fa; // Full Adaptive
vector<vector<int> >**** RoutingUnit_d::route_df; // Deadlock Free
int**** RoutingUnit_d::route_dist;
int**** RoutingUnit_d::route_minbw;
int**** RoutingUnit_d::switchToSurfaceOnlyProb;
bool RoutingUnit_d::first=true;
vector<int> RoutingUnit_d::router_with_rfin;

Vector < Vector < Vector <int> > > RoutingUnit_d::route_vector;

RoutingUnit_d::RoutingUnit_d(Router_d *router, char* routingFile_fa, char* routingFile_df, char* extraLinkFile)
{
  m_router = router;
  if (first) {
    int bw_multiplier;
    int s_r,s_c,d_r,d_c,s,d=0;
    FILE* extraLink_file=fopen(extraLinkFile,"r");
    while (1)
    {
      if (fscanf(extraLink_file, "%d %d %d %d %d\n", &s_r, &s_c, &d_r, &d_c, &bw_multiplier)!=EOF)
      {
        router_with_rfin.push_back(d_r*(m_router->get_net_ptr()->getMeshDim()) + d_c);
      }
      else
        break;
    }
    fclose(extraLink_file);

    //Mishali: added 07/09 to support mesh and hier switch
   
    //    TopologyType topology = string_to_TopologyType(g_NETWORK_TOPOLOGY);
    //    if (topology == TopologyType_MESH) {
   
      route_dist = new int***[m_router->get_net_ptr()->getMeshDim()];
      route_minbw = new int***[m_router->get_net_ptr()->getMeshDim()];
      route_fa = new vector<vector<int> >***[m_router->get_net_ptr()->getMeshDim()];
      route_df = new vector<vector<int> >***[m_router->get_net_ptr()->getMeshDim()];
      switchToSurfaceOnlyProb = new int***[m_router->get_net_ptr()->getMeshDim()];
      for(int i=0;i<m_router->get_net_ptr()->getMeshDim();i++)
      {
        route_dist[i] = new int**[m_router->get_net_ptr()->getMeshDim()];
        route_fa[i] = new vector<vector<int> >**[m_router->get_net_ptr()->getMeshDim()];
        route_df[i] = new vector<vector<int> >**[m_router->get_net_ptr()->getMeshDim()];
        route_minbw[i] = new int**[m_router->get_net_ptr()->getMeshDim()];
        switchToSurfaceOnlyProb[i] = new int**[m_router->get_net_ptr()->getMeshDim()];

        for(int j=0;j<m_router->get_net_ptr()->getMeshDim();j++)
        {
          route_dist[i][j] = new int*[m_router->get_net_ptr()->getMeshDim()];
          route_fa[i][j] = new vector<vector<int> >*[m_router->get_net_ptr()->getMeshDim()];
          route_df[i][j] = new vector<vector<int> >*[m_router->get_net_ptr()->getMeshDim()];
          route_minbw[i][j] = new int*[m_router->get_net_ptr()->getMeshDim()];
          switchToSurfaceOnlyProb[i][j] = new int*[m_router->get_net_ptr()->getMeshDim()];

          for(int k=0;k<m_router->get_net_ptr()->getMeshDim();k++)
          {
            route_dist[i][j][k] = new int[m_router->get_net_ptr()->getMeshDim()];
            route_fa[i][j][k] = new vector<vector<int> >[m_router->get_net_ptr()->getMeshDim()];
            route_df[i][j][k] = new vector<vector<int> >[m_router->get_net_ptr()->getMeshDim()];
            route_minbw[i][j][k] = new int[m_router->get_net_ptr()->getMeshDim()];
            switchToSurfaceOnlyProb[i][j][k] = new int[m_router->get_net_ptr()->getMeshDim()];
          }
        }
      }
      /*  
    } else if (topology == TopologyType_HIERARCHICAL_SWITCH) {
      route_vector.setSize(m_router->get_net_ptr()->getNumRouters());
      for (int i = 0; i < route_vector.size(); i++) 
        route_vector[i].setSize(m_router->get_net_ptr()->getNumRouters());
	}*/
     
    initializeRoutingUnit(routingFile_fa, routingFile_df);//first arg is a place holder
    first = false;
  }

}

//Mishali: modified 07/09 to support mesh and hier switch topologies
void RoutingUnit_d::initializeRoutingUnit(char *routing_file_fa, char* routing_file_df)
{
  
  //TopologyType topology = string_to_TopologyType(g_NETWORK_TOPOLOGY);
  //  if (topology == TopologyType_MESH) {
  
    FILE *routeFile_fa;
    FILE *routeFile_df;
 
    routeFile_fa=fopen(routing_file_fa, "r");
    routeFile_df=fopen(routing_file_df, "r");

    if (routeFile_fa == NULL) {
      cerr << "Routing file of full adaptive network doesn't exist! " << endl;
      exit(0);
    }

    if(routeFile_df == NULL) {
      cerr << "Routing file of deadlock-free network doesn't exist! " << endl;
      exit(0);
    }

    int count;
    int k;
    int temp;

    //cerr<<"dim:"<<m_router->get_net_ptr()->getMeshDim()<<endl;

    for (int i=0; i<m_router->get_net_ptr()->getMeshDim(); i++)
      for (int j=0; j<m_router->get_net_ptr()->getMeshDim(); j++)
        for (int x=0; x<m_router->get_net_ptr()->getMeshDim(); x++)
          for (int y=0; y<m_router->get_net_ptr()->getMeshDim(); y++)
          {
            int meshdim = m_router->get_net_ptr()->getMeshDim();
            route_fa[i][j][x][y].clear();
            int ss, dd;
            fscanf(routeFile_fa, "%d %d", &ss, &dd);

            // Local
            vector<int> tempL;
            fscanf(routeFile_fa, "%d", &count);
            for(k=0; k<count; k++)
            {
              fscanf(routeFile_fa, "%d", &temp);
              tempL.push_back(temp);
            }
            route_fa[i][j][x][y].push_back(tempL);

            // N
            vector<int> tempN;
            if(i > 0)
            {
              fscanf(routeFile_fa, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_fa, "%d", &temp);
                tempN.push_back(temp);
              }
            }
            route_fa[i][j][x][y].push_back(tempN);

            // S
            vector<int> tempS;
            if(i < meshdim - 1)
            {
              fscanf(routeFile_fa, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_fa, "%d", &temp);
                tempS.push_back(temp);
              }
            }
            route_fa[i][j][x][y].push_back(tempS);

            // E
            vector<int> tempE;
            if(j < meshdim - 1)
            {
              fscanf(routeFile_fa, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_fa, "%d", &temp);
                tempE.push_back(temp);
              }
            }
            route_fa[i][j][x][y].push_back(tempE);

            // W
            vector<int> tempW;
            if(j > 0)
            {
              fscanf(routeFile_fa, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_fa, "%d", &temp);
                tempW.push_back(temp);
              }
            }
            route_fa[i][j][x][y].push_back(tempW);

            // RF
            vector<int> tempR;
            if(check_router_with_rfin(i*meshdim+j))
            {
              fscanf(routeFile_fa, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_fa, "%d", &temp);
                tempR.push_back(temp);
              }
            }
            route_fa[i][j][x][y].push_back(tempR);
          }

    for (int i=0; i<m_router->get_net_ptr()->getMeshDim(); i++)
      for (int j=0; j<m_router->get_net_ptr()->getMeshDim(); j++)
        for (int x=0; x<m_router->get_net_ptr()->getMeshDim(); x++)
          for (int y=0; y<m_router->get_net_ptr()->getMeshDim(); y++)
          {
            int meshdim = m_router->get_net_ptr()->getMeshDim();
            route_df[i][j][x][y].clear();
            int ss, dd;
            fscanf(routeFile_df, "%d %d", &ss, &dd);

            // Local
            vector<int> tempL;
            fscanf(routeFile_df, "%d", &count);
            for(k=0; k<count; k++)
            {
              fscanf(routeFile_df, "%d", &temp);
              tempL.push_back(temp);
            }
            route_df[i][j][x][y].push_back(tempL);

            // N
            vector<int> tempN;
            if(i > 0)
            {
              fscanf(routeFile_df, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_df, "%d", &temp);
                tempN.push_back(temp);
              }
            }
            route_df[i][j][x][y].push_back(tempN);

            // S
            vector<int> tempS;
            if(i < meshdim - 1)
            {
              fscanf(routeFile_df, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_df, "%d", &temp);
                tempS.push_back(temp);
              }
            }
            route_df[i][j][x][y].push_back(tempS);
            
            // E
            vector<int> tempE;
            if(j < meshdim - 1)
            {
              fscanf(routeFile_df, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_df, "%d", &temp);
                tempE.push_back(temp);
              }
            }
            route_df[i][j][x][y].push_back(tempE);

            // W
            vector<int> tempW;
            if(j > 0)
            {
              fscanf(routeFile_df, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_df, "%d", &temp);
                tempW.push_back(temp);
              }
            }
            route_df[i][j][x][y].push_back(tempW);

            // RF
            vector<int> tempR;
            if(check_router_with_rfin(i*meshdim+j))
            {
              fscanf(routeFile_df, "%d", &count);
              for(k=0; k<count; k++)
              {
                fscanf(routeFile_df, "%d", &temp);
                tempR.push_back(temp);
              }
            }
            route_df[i][j][x][y].push_back(tempR);
          }
    /*
  } else if (topology == TopologyType_HIERARCHICAL_SWITCH) {
    ifstream routefile;
    routefile.open(routing_file_fa);
    for (int i = 0; i < route_vector.size(); i++) {
      for (int j = 0; j < route_vector[i].size(); j++) {
        char line[1000];
        int num = 0;
	routefile.getline(line,1000);
        char* temp;
        temp = strtok(line, " ");
        while (temp != NULL) {
	num = atoi(temp);
          (route_vector[i][j]).insertAtBottom(num);
          temp = strtok(NULL, " ");
        }
	}
    }
  }
    */
}

void RoutingUnit_d::RC_stage(flit_d *t_flit, InputUnit_d *in_unit, int invc)
{
  vector<int> outport_fa;
  vector<int> outport_df;
  vector<int> output_vn_df;
  routeCompute(t_flit, in_unit, invc, outport_fa, outport_df, output_vn_df);
  in_unit->updateRoute(invc, outport_fa, outport_df, output_vn_df);
  t_flit->advance_stage(VA_);
  m_router->vcarb_req();
}

//Mishali: added 07/09 to support mesh and hier switch topologies

void RoutingUnit_d::routeCompute(flit_d *t_flit, InputUnit_d *in_unit, int invc, vector<int>& outport_fa, vector<int>& outport_df, vector<int>& output_vn_df)
{
  outport_fa.clear();
  outport_df.clear();
  output_vn_df.clear();

  /*   TopologyType topology = string_to_TopologyType(g_NETWORK_TOPOLOGY);
  
  if (topology == TopologyType_HIERARCHICAL_SWITCH) {
    int output_link = -1;
    MsgPtr msg = t_flit->get_msg_ptr();
    int node = m_router->get_id();
    int dest = msg->getDestination();
    int src = msg->getSource();
#ifdef NOC_DEBUG
    cerr<<"S:"<<node<<" Computing route I"<<msg->getIndex()<<" from "<<src<<" to "<<dest<<endl;
#endif
    if (node == dest) {
#ifdef NOC_DEBUG
      cerr<<"local destination "<<msg->getNodeID()<<" at router "<<node<<endl;
#endif
      output_link = m_router->getNILinkMap(msg->getNodeID());

    } else {
  
      Vector<int> route = route_vector[src][dest];
      int i=0;
      if (node != src) {
        while (i<route.size()&&route[i] != node ) {
          i++;
        }
        i++;
      }

      //lookup i+1 in the map

      //if (!t_flit->isSurfaceOnly()) {
      output_link = m_router->getRFLinkMap(route[i]);
      if (output_link == -1)
        output_link = m_router->getLinkMap(route[i]);
      //} else {
        //output_link = m_router->getLinkMap(route[i]);
        //}
    }
    if (output_link == -1)
      assert(0);
    outport_fa.push_back(output_link);
  } 
  else if (topology == TopologyType_MESH) 
  {*/
    outPortMap direction;
    int temp_dir = 0;
    MsgPtr msg_ptr = t_flit->get_msg_ptr();
    NetworkMessage* msg = dynamic_cast<NetworkMessage*>(msg_ptr.ref());
    int node = m_router->get_id();
    int node_row = node/m_router->get_net_ptr()->getMeshDim();
    int node_col = node%m_router->get_net_ptr()->getMeshDim();
    NetDest msg_dest = msg->getInternalDestination();
    NodeID nodeID = msg_dest.getAllDest()[0];
    int dest = msg_dest.getAllDest()[0] % (MachineType_base_number(MachineType_NUM) / 3);
    int dest_row = dest/m_router->get_net_ptr()->getMeshDim();
    int dest_col = dest%m_router->get_net_ptr()->getMeshDim();
    int diffx, diffy;
    bool flag = false;

    diffx=node_row-dest_row;
    diffy=node_col-dest_col;

    if (diffx==0 && diffy==0)
      flag = true;

    if(route_fa[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).size() == 0 || route_df[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).size() == 0)
    {
      cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;
      cout<<"Wrong input unit: error at RoutingUnit_d.cpp!\n";
      exit(0);
    }
    else
    {
#ifdef ADAPTIVE_ROUTING
      if(invc / m_router->get_vc_per_vnet() < NUMBER_OF_VIRTUAL_NETWORKS)
      {
        // Still in the full adaptive virtual network
        vector<int>::iterator it;
        for(it = route_fa[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).begin(); it != route_fa[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).end(); ++it)
        {
          assert((*it) < MAXPORT);
          direction = (outPortMap)(*it);
          if (direction == THERE) {
            outport_fa.push_back(m_router->getNILinkMap(nodeID));
          }  
          else if (direction == RF) {
            if(m_router->getRFLinkMap(dest) == -1)
              cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;

            assert(m_router->getRFLinkMap(dest) != -1);
            outport_fa.push_back(m_router->getRFLinkMap(dest));
          }     
          else {
            outport_fa.push_back(m_router->getDirLinkMap((int)direction-1));
          }     
        }
        if (direction!=THERE)
          t_flit->get_msg_ptr()->incHops();
        for(it = route_df[node_row][node_col][dest_row][dest_col].at(0).begin(); it != route_df[node_row][node_col][dest_row][dest_col].at(0).end(); ++it) //// When the packets is moved to deadlock virtual network, it is treated as an injected packets into that network
        {
          output_vn_df.push_back(invc / m_router->get_vc_per_vnet() + ((*it)/MAXPORT + 1)*NUMBER_OF_VIRTUAL_NETWORKS);
          direction = (outPortMap)((*it)%MAXPORT);
          if (direction == THERE) {
            outport_df.push_back(m_router->getNILinkMap(nodeID));
          }  
          else if (direction == RF) {
            if(m_router->getRFLinkMap(dest) == -1)
              cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;

            assert(m_router->getRFLinkMap(dest) != -1);
            outport_df.push_back(m_router->getRFLinkMap(dest));
          }      
          else { 
            outport_df.push_back(m_router->getDirLinkMap((int)direction-1));
          }      
        }
      }
      else
      {
        // Already moved into deadlock free virtual network, only deadlock free routing can be used
        vector<int>::iterator it;
        outport_fa.clear();
        int vnet = (invc / m_router->get_vc_per_vnet())/NUMBER_OF_VIRTUAL_NETWORKS;
        // vnet = 1: it is in the low vc
        // vnet = 2: it is in the high vc
        for(it = route_df[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).begin(); it != route_df[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).end(); ++it) //// When the packets is moved to deadlock virtual network, it is treated as an injected packets into that network
        {
          if((*it)/MAXPORT <= 1)
            output_vn_df.push_back((invc / m_router->get_vc_per_vnet())%NUMBER_OF_VIRTUAL_NETWORKS + ((*it)/MAXPORT + 1)*NUMBER_OF_VIRTUAL_NETWORKS);
          else // hold current vc
            output_vn_df.push_back(vnet);

          direction = (outPortMap)((*it)%MAXPORT);
          if (direction == THERE) {
            outport_df.push_back(m_router->getNILinkMap(nodeID));
          }  
          else if (direction == RF) {
            if(m_router->getRFLinkMap(dest) == -1)
              cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;
            assert(m_router->getRFLinkMap(dest) != -1);
            outport_df.push_back(m_router->getRFLinkMap(dest));
          }      
          else { 
            outport_df.push_back(m_router->getDirLinkMap((int)direction-1));
          }      
        }
        if (direction!=THERE)
          t_flit->get_msg_ptr()->incHops();
      }
#else
      // Deterministic Routing is used
      if(invc / m_router->get_vc_per_vnet() < NUMBER_OF_VIRTUAL_NETWORKS)
      {
        // Still in the full adaptive virtual network
        int route = route_fa[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).at(0);
        assert(route < MAXPORT);
        direction = (outPortMap)(route);
        if (direction == THERE) {
          outport_fa.push_back(m_router->getNILinkMap(nodeID));
        }
        else if (direction == RF) {
          if(m_router->getRFLinkMap(dest) == -1)
            cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;
          assert(m_router->getRFLinkMap(dest) != -1);
          outport_fa.push_back(m_router->getRFLinkMap(dest));
        }
        else {
          outport_fa.push_back(m_router->getDirLinkMap((int)direction-1));
        }
        if (direction!=THERE)
          msg->incHops();

        route = route_df[node_row][node_col][dest_row][dest_col].at(0).at(0);
        output_vn_df.push_back(invc / m_router->get_vc_per_vnet() + (route/MAXPORT + 1)*NUMBER_OF_VIRTUAL_NETWORKS);
        direction = (outPortMap)(route%MAXPORT); // When the packets is moved to deadlock virtual network, it is treated as an injected packets into that network
        if (direction == THERE) {
          outport_df.push_back(m_router->getNILinkMap(nodeID));
        }
        else if (direction == RF) {
          if(m_router->getRFLinkMap(dest) == -1)
            cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;
          assert(m_router->getRFLinkMap(dest) != -1);
          outport_df.push_back(m_router->getRFLinkMap(dest));
        }
        else {
          outport_df.push_back(m_router->getDirLinkMap((int)direction-1));
        }
      }
      else
      {
        // Already moved into deadlock free virtual network, only deadlock free routing can be used
        vector<int>::iterator it;

        int vnet = (invc / m_router->get_vc_per_vnet())/NUMBER_OF_VIRTUAL_NETWORKS;
        // if vnet = 1: it is in the low vc
        // if vnet = 2: it is in the high vc

        int route = route_df[node_row][node_col][dest_row][dest_col].at(in_unit->getDirection()).at(0);

        if(route/MAXPORT <= 1)
          output_vn_df.push_back((invc / m_router->get_vc_per_vnet())%NUMBER_OF_VIRTUAL_NETWORKS + (route/MAXPORT + 1)*NUMBER_OF_VIRTUAL_NETWORKS);
        else // hold current vc
          output_vn_df.push_back(vnet);

        direction = (outPortMap)(route%MAXPORT);
        if (direction == THERE) {
          outport_df.push_back(m_router->getNILinkMap(nodeID));
        }
        else if (direction == RF) {
          if(m_router->getRFLinkMap(dest) == -1)
            cout<<node<<" "<<dest<<" "<<in_unit->getDirection()<<endl;
          assert(m_router->getRFLinkMap(dest) != -1);
          outport_df.push_back(m_router->getRFLinkMap(dest));
        }
        else {
          outport_df.push_back(m_router->getDirLinkMap((int)direction-1));
        }
        if (direction!=THERE)
          msg->incHops();
      }
#endif
    }
}
