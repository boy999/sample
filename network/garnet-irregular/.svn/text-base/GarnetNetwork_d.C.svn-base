/*
    copyright (c) 1999-2008 by Mark D. Hill and David A. Wood for the
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
 * GarnetNetwork_d.C
 *
 * Niket Agarwal, Princeton University
 * Edited by Mishali for MCSim
 * */



#include "NetDest.h"
#include "GarnetNetwork_d.h"
#include "NetworkInterface_d.h"
#include "MessageBuffer.h"
#include "Router_d.h"
#include "NetworkLink_d.h"
#include "CreditLink_d.h"
#include "RoutingUnit_d.h"
#include "Topology.h"

//Extern variables 

unsigned int FLITLENGTH;

typedef Vector < Vector <int> > Matrix;

static const int INFINITE_LATENCY = 10000;

GarnetNetwork_d::GarnetNetwork_d(int nodes): node_stats(NULL)
{
  m_nodes = MachineType_base_number(MachineType_NUM); // Total nodes in network
  m_virtual_networks = NUMBER_OF_VIRTUAL_CLASS*NUMBER_OF_VIRTUAL_NETWORKS;
  //m_virtual_networks = NUMBER_OF_VIRTUAL_NETWORKS;
  m_ruby_start = 0;
  m_flits_recieved = 0;
  m_flits_injected = 0;
  m_network_latency = 0.0;
  m_queueing_latency = 0.0;
  m_number_hops = 0.0;

  baselineFlits = 0;
  totalFlits = 0;

  /////////////////////////////////////

  m_router_ptr_vector.clear();

  // Allocate to and from queues
  m_toNetQueues.setSize(m_nodes); 	// Queues that are getting messages from protocol
  m_fromNetQueues.setSize(m_nodes); 	// Queues that are feeding the protocol
  m_in_use.setSize(m_virtual_networks);
  m_ordered.setSize(m_virtual_networks);
  for (int i = 0; i < m_virtual_networks; i++) 
    {
      m_in_use[i] = false;
      m_ordered[i] = false;
    }
  
  for (int node = 0; node < m_nodes; node++) 
    {
      //Setting how many vitual message buffers will there be per Network Queue
      m_toNetQueues[node].setSize(m_virtual_networks);
      m_fromNetQueues[node].setSize(m_virtual_networks);
      
      for (int j = 0; j < m_virtual_networks; j++) 
	{ 
	  m_toNetQueues[node][j] = new MessageBuffer();	// Instantiating the Message Buffers that interact with the coherence protocol
	  m_toNetQueues[node][j]->setOrdering(false);//Mishali
	  m_fromNetQueues[node][j] = new MessageBuffer();
	  m_fromNetQueues[node][j]->setOrdering(false);
	}
    }

  //	m_routers = m_nodes;//Mishali


  m_meshdim = g_MESHDIM;
  

  m_routingFile_fa = g_INPUT_PATH;
  m_routingFile_fa +=  g_ROUTING_FILE_FA;
  m_routingFile_df  = g_INPUT_PATH;
  m_routingFile_df += g_ROUTING_FILE_DF;

  string empty = "/dev/null";
  string tempname  = g_INPUT_PATH;
  if (!empty.compare(g_SHORTCUT_FILE)) 
    tempname = "/dev/null";
  else
    tempname = tempname + g_SHORTCUT_FILE;
  char *extraLinkFile;
  extraLinkFile = (char*)tempname.c_str();

  m_topology_ptr = new Topology(this, m_nodes);

  m_routers = m_topology_ptr->numSwitches();

  for (int i=0; i<m_routers; i++) {
    m_router_ptr_vector.insertAtBottom(new Router_d(i, this, (char*)m_routingFile_fa.c_str(), (char*)m_routingFile_df.c_str(), extraLinkFile));
  }

  for (int i=0; i < m_nodes; i++) {
    NetworkInterface_d *ni = new NetworkInterface_d(i, m_virtual_networks, this);
    ni->addNode(m_toNetQueues[i], m_fromNetQueues[i]);
    m_ni_ptr_vector.insertAtBottom(ni);
  }
	
  baseLinkBw = g_LINK_BW;  // # bits on baseline links
  minLinkBw = g_LINK_BW;

  // check through map_file (first pass through...yeah hacky I know!)
  // to determine minimum-width link in network
  // (at least we're not opening/closing this file in a loop!)


  FILE* map_file=fopen(extraLinkFile,"r");
  int bw_multiplier;
  int s_r, s_c, d_r, d_c; // placeholders
  while (1)
    if (fscanf(map_file, "%d %d %d %d %d\n", &s_r, &s_c,
          &d_r, &d_c, &bw_multiplier)!=EOF)
    {
      if(bw_multiplier < minLinkBw)
        minLinkBw = bw_multiplier;
    }
    else
      break;
  fclose(map_file);
  //FLITLENGTH = minLinkBw / 8;
  g_FLIT_SIZE = minLinkBw/8;
   flitCapacity= baseLinkBw / (g_FLIT_SIZE * 8);
  // NOTE: for the current implementation we assume that each
  // link's bandwidth is some even multiple of the FLITLENGTH
  // (or minimum link bandwidth), and furthermore that each
  // link has an associated capacity...how many flits per cycle
  // it can consume
  // NOTE: this assumes ZERO changes in # of credits (set to 8
  // for now) and # buffer entries at each router
  // However, buffer sizes depend on the FLITLENGTH, as each
  // buffer entry holds a single flit
  // -- Adam 4/22/2008

  m_topology_ptr->createLinks(false);  // false because this isn't a reconfiguration
  createNetwork(extraLinkFile);//Mishali
  for(int i = 0; i < m_router_ptr_vector.size(); i++)
	{
	  m_router_ptr_vector[i]->init();
	}
	

  msgInjected=0;
  msgDelivered=0;
  //Mishali: router stats
  m_p2pMsgCounter.setSize(m_routers);
  m_p2pByteCounter.setSize(m_routers);
  m_routerPairMsgCounter.setSize(m_routers);
  for(int i = 0; i < m_routers; i++)
  {
    m_p2pMsgCounter[i].setSize(m_routers);
    m_p2pByteCounter[i].setSize(m_routers);
    m_routerPairMsgCounter[i].setSize(m_routers);
    for(int j = 0; j < m_routers; j++) {
      m_p2pMsgCounter[i][j] = 0; m_p2pByteCounter[i][j] = 0;
      m_routerPairMsgCounter[i][j] = 0;
    }
  }
  pctShort = g_PCT_SHORTCUTS;
  
  node_stats = new node_stat[m_nodes];
  m_index = 0;

}

GarnetNetwork_d::~GarnetNetwork_d()
{
  //  DumpStats();


	cerr<<"Injected "<< msgInjected<<endl;
	cerr<<"Delivered "<< msgDelivered<<endl;
	for (int i = 0; i < m_nodes; i++) 
	{
		m_toNetQueues[i].deletePointers();
		m_fromNetQueues[i].deletePointers();
	}
	m_router_ptr_vector.deletePointers();
	m_ni_ptr_vector.deletePointers();
	m_link_ptr_vector.deletePointers();
	m_creditlink_ptr_vector.deletePointers();
	//Delete all the port maps
	delete [] node_stats;
	
}

void GarnetNetwork_d::reset()
{
	for (int node = 0; node < m_nodes; node++) 
	{
		for (int j = 0; j < m_virtual_networks; j++) 
		{
			m_toNetQueues[node][j]->clear();
			m_fromNetQueues[node][j]->clear();
		}
	}
}

/* 
 * This function creates a link from the Network Interface (NI) into the Network. 
 * It creates a Network Link from the NI to a Router and a Credit Link from  
 * the Router to the NI
*/

//void GarnetNetwork_d::makeInLink(int src, SwitchID dest, int routing_table_entry, int link_latency, int bw_multiplier, bool isReconfiguration, unsigned int flitCapacity)
void GarnetNetwork_d::makeInLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int bw_multiplier, bool isReconfiguration)
{

	assert(src < m_nodes);
	
	if(!isReconfiguration)
	{	
	  //		NetworkLink_d *net_link = new NetworkLink_d(m_link_ptr_vector.size(), link_latency, this);
	  NetworkLink_d *net_link = new NetworkLink_d(m_link_ptr_vector.size(), link_latency, flitCapacity, -1, this);
		CreditLink_d *credit_link = new CreditLink_d(m_creditlink_ptr_vector.size());
		m_link_ptr_vector.insertAtBottom(net_link);
		m_creditlink_ptr_vector.insertAtBottom(credit_link);
		m_router_ptr_vector[dest]->addInPort(net_link, credit_link, THERE);
		m_ni_ptr_vector[src]->addOutPort(net_link, credit_link);
	}
	else 
	{
	  //		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
	  cerr<<"Fatal Error: line 173"<<endl;
	  assert(0);
		// do nothing
	}
}

/* 
 * This function creates a link from the Network to a NI. 
 * It creates a Network Link from a Router to the NI and 
 * a Credit Link from NI to the Router 
*/

//void GarnetNetwork_d::makeOutLink(SwitchID src, int dest, int routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration, unsigned int flitCapacity)
void GarnetNetwork_d::makeOutLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
{
	assert(dest < m_nodes);
	assert(src < m_router_ptr_vector.size());
	assert(m_router_ptr_vector[src] != NULL);
  int curr_port = m_router_ptr_vector[src]->get_num_outports();
  m_router_ptr_vector[src]->setNILinkMap(dest,curr_port);

	if(!isReconfiguration)
	{
	
	  NetworkLink_d *net_link = new NetworkLink_d(m_link_ptr_vector.size(), link_latency, flitCapacity, THERE, this);
	  CreditLink_d *credit_link = new CreditLink_d(m_creditlink_ptr_vector.size());
	  m_link_ptr_vector.insertAtBottom(net_link);
	  m_creditlink_ptr_vector.insertAtBottom(credit_link);
	  
	  m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight, credit_link);
	  m_ni_ptr_vector[dest]->addInPort(net_link, credit_link);
	} 
	else 
	{
	  cerr<<"Fatal error:205"<<endl;
	  assert(0);
	  //do nothing
	}
}

/* 
 * This function creates a internal network links 
*/

//void GarnetNetwork_d::makeInternalLink(SwitchID src, SwitchID dest, int routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
void GarnetNetwork_d::makeInternalLink(SwitchID src, SwitchID dest, const NetDest & routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
{
  //Add the if block so as to not the change the GEMS API
  int capacity = 0;
  int curr_port = m_router_ptr_vector[src]->get_num_outports();
  int src_col, src_row, dest_ccl, dest_row = 0;
  if (currLinkDirection == RF) {
    currLinkDirection = NORTH;//just to reinitialize the variable
    cerr<<"route_find"<<src<<" "<<dest<<" "<<m_meshdim<<endl;
    int route_fa_index = RoutingUnit_d::getRouteFa(src, dest, m_meshdim);
    for( int i=0; i<m_routers; i++) {
      if(RoutingUnit_d::checkFa(src, i, m_meshdim, route_fa_index)) {
        m_router_ptr_vector[src]->setRFLinkMap(i,curr_port);
      }
    }
    int route_df_index = RoutingUnit_d::getRouteDf(src, dest, m_meshdim);
    for( int i=0; i<m_routers; i++) {
      if(RoutingUnit_d::checkDf(src, i, m_meshdim, route_df_index))
        m_router_ptr_vector[src]->setRFLinkMap(i,curr_port);
    } 
    m_router_ptr_vector[src]->setDestLinkMap(dest,curr_port);
    m_router_ptr_vector[src]->setRFLinkMap(dest,curr_port);
    dest_direction = RF;
    capacity = extraLinkCapacity;
  }else {
    //Mishali- with the current assumption that we are using
    //symmetrical MESH network
    //Create helper functions if other topologies are to be
    //supported
    src_row = src/m_meshdim;
    src_col = src%m_meshdim;
    int destn = (src_row-1)*m_meshdim + src_col;
    int dests = (src_row+1)*m_meshdim + src_col;
    int deste = src_row*m_meshdim + (src_col+1);
    int destw = src_row*m_meshdim + (src_col-1);
    if (dest == destn) {
      currLinkDirection = NORTH; dest_direction = SOUTH;
    }else if (dest == dests) {
      currLinkDirection = SOUTH; dest_direction = NORTH;
    }else if (dest == deste) {
      currLinkDirection = EAST; dest_direction = WEST;
    }else if (dest == destw) {
      currLinkDirection = WEST; dest_direction = EAST;
    }else {
      cerr<<"Garnet:Trying to create a topology other than mesh currently not supported"<<endl;
      assert(0);
    }
#ifdef NOC_DEBUG
    cerr<<"Adding the mapping for ("<<src<<","<<dest<<") dir "<<currLinkDirection<<" port "<<curr_port<<endl;
#endif
    m_router_ptr_vector[src]->setDirLinkMap((int)currLinkDirection,curr_port);
    capacity = flitCapacity;

  }
  if(!isReconfiguration)
    {
      NetworkLink_d *net_link = new NetworkLink_d(m_link_ptr_vector.size(), link_latency, capacity, currLinkDirection, this);
      CreditLink_d *credit_link = new CreditLink_d(m_creditlink_ptr_vector.size());
      m_link_ptr_vector.insertAtBottom(net_link);
      m_creditlink_ptr_vector.insertAtBottom(credit_link);
      m_router_ptr_vector[dest]->addInPort(net_link, credit_link, dest_direction);
      m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight, credit_link);
    }
  else
    {	
      cerr<<"Fatal 230"<<endl;
      assert(0);
    }
}

MessageBuffer* GarnetNetwork_d::getToNetQueue(int id, bool ordered, int network_num)
{

  return m_toNetQueues[id][network_num];
}

MessageBuffer* GarnetNetwork_d::getFromNetQueue(int id, bool ordered, int network_num)
{
  
  return m_fromNetQueues[id][network_num];
}

void GarnetNetwork_d::clearStats()
{
  m_ruby_start = g_eventQueue_ptr->getTime();
}

Time GarnetNetwork_d::getRubyStartTime()
{
  return m_ruby_start;
}

void GarnetNetwork_d::print(ostream& out) const                                                                                                                              
{
  out << "[GarnetNetwork_d]";
}

void GarnetNetwork_d::printStats(ostream& out) const
{	double average_link_utilization = 0;
	Vector<double > average_vc_load;
	average_vc_load.setSize(m_virtual_networks*g_VCS_PER_CLASS);	

	for(int i = 0; i < m_virtual_networks*g_VCS_PER_CLASS; i++)
	{
		average_vc_load[i] = 0;
	}

	out << endl;
	out << "Network Stats" << endl;
	out << "-------------" << endl;
	out << endl;
	
	for(int i = 0; i < m_link_ptr_vector.size(); i++) 
	{
	
	  average_link_utilization += (double(m_link_ptr_vector[i]->getLinkUtilization())) / (double(g_eventQueue_ptr->getTime()));
	
		Vector<int > vc_load = m_link_ptr_vector[i]->getVcLoad();
		for(int j = 0; j < vc_load.size(); j++)
		{
			assert(vc_load.size() == g_VCS_PER_CLASS *m_virtual_networks);
			average_vc_load[j] += vc_load[j];
		}
	}
	
	average_link_utilization = average_link_utilization/m_link_ptr_vector.size();
	out << "Average Link Utilization :: " << average_link_utilization << " flits/cycle" << endl;
	out << "-------------" << endl;

	for(int i = 0; i < g_VCS_PER_CLASS*NUMBER_OF_VIRTUAL_CLASS*NUMBER_OF_VIRTUAL_NETWORKS; i++)
	{
	  average_vc_load[i] = (double(average_vc_load[i]) / (double(g_eventQueue_ptr->getTime())));
		out << "Average VC Load [" << i << "] = " << average_vc_load[i] << " flits/cycle " << endl;
	}
	out << "-------------" << endl;

	//out << "Total flits injected = " << m_flits_injected << endl;
	out << "Total flits received = " << m_flits_recieved << endl;
	out << "Average network latency per flit = " << ((double) m_network_latency/ (double) m_flits_recieved)<< endl;
	out << "Average network latency per packet = " << ((double) m_network_latency/ (double) msgDelivered)<< endl;


	out << "Average number hops = " << ((double) m_number_hops/ (double) msgDelivered) << endl;
	//out << "Average queueing latency = " << ((double) m_queueing_latency/ (double) m_flits_recieved)<< endl;
	//	out << "Average latency = " << ((double)  (m_queueing_latency + m_network_latency) / (double) m_flits_recieved)<< endl;
	out << "-------------" << endl;

	double m_total_link_power = 0.0;
	double m_total_router_power = 0.0;

	for(int i = 0; i < m_link_ptr_vector.size(); i++)
	{
	  //Mishali:uncomment
	  m_total_link_power += m_link_ptr_vector[i]->calculate_power();
	}

	for(int i = 0; i < m_router_ptr_vector.size(); i++)
	{
	  m_total_router_power += m_router_ptr_vector[i]->calculate_power();
	}
	out << "Total Link Power = " << m_total_link_power << " W " << endl;
	out << "Total Router Power = " << m_total_router_power << " W " <<endl;
	out << "-------------" << endl;
	out << "Router stats: # of msgs and # of bytes injected between a pair of routers" << endl;
	for(int i = 0; i < m_routers; i++)
	  {
	    for(int j = 0; j < m_routers; j++)
	      {
		out << "RouterA:" << i << ",RouterB:" << j << ",numMsgs:"
		     << m_p2pMsgCounter[i][j] << ",numBytes:" << m_p2pByteCounter[i][j]<<endl;
	      }
	  }
	out << "--------------" << endl;

  /*
	cout <<"Total number of deadlocks: "<<totalDeadlocks<<endl;
	*/

	out << "**************** <NOC STATS: " << g_eventQueue_ptr->getTime()
		  << " > *************************"
		  << "\n";
	out << "Number of baseline flits injected "<<baselineFlits <<endl;
	out << "Number of total flits injected "<<totalFlits <<endl;

}

void GarnetNetwork_d::printConfig(ostream& out) const
{
	out << endl;
	out << "Network Configuration" << endl;
	out << "---------------------" << endl;
	out << "network: GarnetNetwork_d" << endl;
	out << endl;

	for (int i = 0; i < m_virtual_networks; i++) 
	{
		out << "virtual_net_" << i << ": ";
		if (m_in_use[i]) 
		{
			out << "active, ";
			if (m_ordered[i]) 
			{
				out << "ordered" << endl;
			} 
			else 
			{
				out << "unordered" << endl;
			}
		} 
		else 
		{
			out << "inactive" << endl;
		}
	}
  	out << endl;

	for(int i = 0; i < m_ni_ptr_vector.size(); i++)
	{
		m_ni_ptr_vector[i]->printConfig(out);
	}
	for(int i = 0; i < m_router_ptr_vector.size(); i++)
	{
		m_router_ptr_vector[i]->printConfig(out);
	}	

}
/*
 * Mishali: function definitions added for the interface
 */

// firstNonWhiteSpace
//   * given a c-style string (assumed NULL-delimited)
//   * finds first non-whitespace character (non-tab, non-space)
//     and returns it
//     (if no such char exists, return space ' ')
char firstNonWhiteSpace(char* line)
{
  for(int i = 0; i < strlen(line); i++)
    if(line[i] != '\t' && line[i] != ' ')
      return line[i];
  return ' ';
}


//Mishali: 07/09 Added this function, it uses router assingment
//file to configure mesh
void GarnetNetwork_d::createNetwork(char* extraLinkFile)
{
  makeMesh(extraLinkFile);
  /*
  topology_type topology = string_to_topology_type(g_NETWORK_TOPOLOGY);
  switch (topology) {
  case HIERARCHICAL_SWITCH:
    makeHierarchicalSwitch(extraLinkFile);
    break;
  case MESH:
    makeMesh(extraLinkFile);
    break;
  default:
    cerr<<"Unexpected typology type"<<endl;
    assert(0);
  }
 */
}

/*
void GarnetNetwork_d::makeHierarchicalSwitch(char* extraLinkFile)
{
  ifstream in;
  in.open(config);
  if (in.fail()) {
    cerr<<"Error opening config file for hierarchical crossbar"<<endl;
    assert(0);
  }
  //read the intracluster connections
  int numberConnections = 0;
  int routing_table_entry = 0;//dummy
  int link_latency = 1;
  int bw_multiplier = 0;
  bool isReconfiguration = false;
  int link_weight = 0;
  int source = 0;
  int dest = 0;
  cerr << "Flit size " <<FLITBITLENGTH<<endl;
  vector<NodeInfo*> tempVector;
  for (int i=0; i<m_routers; i++) {
    //This can be changed later
    tempVector = nocInt->getRouterToLocalNodes(i);
    for (int node = 0; node < tempVector.size(); node++) {
      cerr<<"Connecting node "<< (tempVector[node])->nodeID << " to router "<<i<<endl;
      m_nodeToRouterMap.add((tempVector[node])->nodeID,i);
      makeInLink((tempVector[node])->nodeID, i, routing_table_entry, link_latency, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH);
      makeOutLink(i, (tempVector[node])->nodeID, routing_table_entry,link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH);
    }
  }

  int temp_num_routers = 0;//total number of routers
  in >> temp_num_routers;//not used here but used in route generation
  in >> numberConnections;
  bool chip2chip = false;
  for (int i=0; i < numberConnections; i++) {
    in >> source;
    in >> dest;
    //    currLinkDirection = BASE;
    //    baselineLinks[source][dest] = true;
    if (chip2chipPorts != 0 ) {
      for (int port = 0; port < chip2chipRouterPairs[source].size(); port++) {
        if (chip2chipRouterPairs[source][port]==dest)
          chip2chip = true;
      }
    }
    if (chip2chip) {
      cerr <<source<<" "<<dest<<" "<<chip2chipBw/FLITBITLENGTH<<endl;
      makeInternalLink(source, dest,  routing_table_entry, chip2chipLatency, link_weight, bw_multiplier, isReconfiguration, chip2chipBw / FLITBITLENGTH, -1);
      makeInternalLink(dest, source,  routing_table_entry, chip2chipLatency, link_weight, bw_multiplier, isReconfiguration, chip2chipBw / FLITBITLENGTH, -1);
      chip2chip = false;
    } else {
      cerr <<source<<" "<<dest<<" "<<baseLinkBw/FLITBITLENGTH<<endl;
      currLinkDirection = BASE;
      baselineLinks[source][dest] = true;
      makeInternalLink(source, dest,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH, -1);
      makeInternalLink(dest, source,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH, -1);
      //    makeInternalLink(source, dest,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, minLinkBw / FLITBITLENGTH);
      //    makeInternalLink(dest, source,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, minLinkBw / FLITBITLENGTH);
    }
  } 
  int numberLevels = 0;
  in >> numberLevels;
  //switches implies how many switches in the current level
  int switches = 0;
  int inputs = 0;
  //  Vector<int> numSwitches;
  //  Vector<int> numInputs;
  for (int i=0; i < numberLevels; i++) {
    in >> switches;
    in >> inputs;
    for (int j = 0; j < switches; j++) {
      in >> source; //current switch
      for (int k =0; k < inputs ; k++) {
        in >> dest;
        if (chip2chipPorts != 0 ) {
          for (int port = 0; port < chip2chipRouterPairs[source].size(); port++) {
            if (chip2chipRouterPairs[source][port]==dest)
              chip2chip = true;
          }
        }
        if (chip2chip) {
          makeInternalLink(source, dest,  routing_table_entry, chip2chipLatency, link_weight, bw_multiplier, isReconfiguration, chip2chipBw / FLITBITLENGTH, -1);
          makeInternalLink(dest, source,  routing_table_entry, chip2chipLatency, link_weight, bw_multiplier, isReconfiguration, chip2chipBw / FLITBITLENGTH, -1);
          chip2chip = false;
        } else {
          link_latency = altLatency;
          makeInternalLink(source, dest,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH, -1);
          makeInternalLink(dest, source,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH, -1);
        }
        //makeInternalLink(source, dest,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH);
        //makeInternalLink(dest, source,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration, baseLinkBw / FLITBITLENGTH);
      }
    }
  }
  source = 0; dest = 0;
  FILE* map_file=fopen(extraLinkFile,"r");
  while (1)
    if (fscanf(map_file, "%d %d %d\n", &source, &dest, &bw_multiplier)!=EOF) {
      extraLinkCapacity = bw_multiplier / FLITBITLENGTH;
      currLinkDirection = RF;
      makeInternalLink(source, dest,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration);
#ifdef NOC_DEBUG
      cerr<<"RF ("<<source<<","<<dest<<")"<<endl;
#endif
    } else
      break;
    fclose(map_file);
    cerr<<"Done creating hier switch"<<endl;
}
*/

void GarnetNetwork_d::makeMesh(char* extraLinkFile)
{ 
  //Mishali: Default link_latency is 0 because the components are
  //directly connected to the router 

  NetDest routing_table_entry;//dummy
  int link_latency = 1;
  int bw_multiplier = 0;
  bool isReconfiguration = false;
  int link_weight = 0;
  int row = 0;
  int col = 0;
  int dest = 0;
  int curr_port = 0;


  int s_r,s_c,d_r,d_c,s,d=0;
  FILE* map_file=fopen(extraLinkFile,"r");
  while (1)
    if (fscanf(map_file, "%d %d %d %d %d\n", &s_r, &s_c, &d_r, &d_c, &bw_multiplier)!=EOF) {
      s = (s_r*m_meshdim) + s_c;
      d = (d_r*m_meshdim) + d_c;
      extraLinkCapacity = bw_multiplier / (g_FLIT_SIZE * 8);
      currLinkDirection = RF;
      makeInternalLink(s, d,  routing_table_entry, link_latency, link_weight, bw_multiplier, isReconfiguration);
#ifdef NOC_DEBUG
      cerr<<"RF ("<<s<<","<<d<<")"<<endl;
#endif
    } else
      break;
    fclose(map_file);
    cerr<<"Mesh creation done " <<endl;
}

//To update router stats
void GarnetNetwork_d::updateRouterStats(int source, int dest, int bytes) 
{
  m_p2pMsgCounter[source][dest]++;
  m_p2pByteCounter[source][dest] += bytes;
}

void GarnetNetwork_d::dumpClearPhaseStats()
{
  unsigned long long overallL2Access = 0;
  unsigned long long overallNwInject = 0;
  unsigned long long overallExtraBwStall = 0;
  unsigned long long overallExtraFlitsSent = 0;
  unsigned long long overallBwStall = 0;
  unsigned long long overallFlitsSent = 0;
  int node = 0;
  for (int i=0; i < m_meshdim; i++)
    for (int j=0; j < m_meshdim; j++)
      {
	node = (i * m_meshdim) + j;
	if (node < m_routers) {
	node_stat* ptr = &(node_stats[node]);

	overallL2Access += ptr->phaseL2Access;
	overallNwInject += ptr->phaseNwInject;
	overallExtraBwStall += ptr->phaseExtraBwStall;
	overallExtraFlitsSent += ptr->phaseExtraFlitsSent;
	overallBwStall += ptr->phaseBwStall;
	overallFlitsSent += ptr->phaseFlitsSent;

      ptr->phaseL2Access = ptr->phaseNwInject = ptr->phaseExtraBwStall
                         = ptr->phaseExtraFlitsSent = ptr->phaseBwStall
	= ptr->phaseFlitsSent = 0;
	}
      }

  cout << "@" << g_eventQueue_ptr->getTime() << " PHASE L2 ACCESS : " << overallL2Access << endl;
  cout << "@" << g_eventQueue_ptr->getTime() << " PHASE NW INJECT : " << overallNwInject << endl;
  cout << "@" << g_eventQueue_ptr->getTime() << " PHASE RF BW STALL : " << overallExtraBwStall
       << endl;
  cout << "@" << g_eventQueue_ptr->getTime() << " PHASE RF FLITS SENT : " << overallExtraFlitsSent
       << endl;
  cout << "@" << g_eventQueue_ptr->getTime() << " PHASE BW STALL : " << overallBwStall << endl;
  cout << "@" << g_eventQueue_ptr->getTime() << " PHASE FLITS SENT : " << overallFlitsSent << endl;
}


void GarnetNetwork_d::DumpStats()
{
  int i, j;
  int node = 0;
  // print router stats: # msgs injected
  std::cout << "**************** <NOC STATS: " << g_eventQueue_ptr->getTime()
	    << " > *************************"
	    << "\n";
  for (i=0; i < m_meshdim; i++)
    for (j=0; j < m_meshdim; j++)
      {
	node = (i * m_meshdim) + j;
        if (node < m_routers) {
        node_stat* ptr = &(node_stats[node]);
	std::cout << "Router(" << i << "," << j << ") " << ptr->stat_c << " " << ptr->stat_n << " " << ptr->stat_e << " " << ptr->stat_s << " " << ptr->stat_w
		  << " " << ptr->stat_extra;
        ptr->stat_n=0;
        ptr->stat_e=0;
        ptr->stat_s=0;
        ptr->stat_w=0;
        ptr->stat_c=0;
        ptr->stat_extra=0;
	std::cout  << " " << ptr->stalls_bw << " " << ptr->stalls_q << std::endl;
        ptr->stalls_bw=0;
        ptr->stalls_q=0;
	}
      }
  std::cout << "**************** </NOC STATS: " << g_eventQueue_ptr->getTime()
	    << " > ***********************"
	    << "\n";
}

