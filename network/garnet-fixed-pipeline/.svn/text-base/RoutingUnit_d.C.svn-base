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

RoutingUnit_d::RoutingUnit_d(Router_d *router)
{
	m_router = router;
	m_routing_table.clear();
	m_weight_table.clear();
}

void RoutingUnit_d::addRoute(const NetDest& routing_table_entry)
{
	m_routing_table.insertAtBottom(routing_table_entry);
}

void RoutingUnit_d::addWeight(int link_weight)
{
	m_weight_table.insertAtBottom(link_weight);
}

void RoutingUnit_d::RC_stage(flit_d *t_flit, InputUnit_d *in_unit, int invc)
{
    int outport = routeCompute(t_flit);

    int csnoc_index = t_flit->m_CSNOC_index;

    if (csnoc_index >=0 ) // this is a setup or free network message
    {
        pair<int, int> srcDest = make_pair(t_flit->m_srcNetIntfId, t_flit->m_destNode);
        int in_port = in_unit->get_id();
        bool setuporfree = t_flit->m_setuporfree; 
        CircuitNetwork* cirnet_ptr = m_router->get_net_ptr()->m_circuitnet_ptr[csnoc_index];
        if(setuporfree)
        {
            //only check the conflicts when setup the circuit paths
            //circuit setup network: configure the circuit switch network's connections
            for(int i = 0; i < cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->get_num_outports(); i++)
            {
                if(cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect[i][in_port])
                {
                    if (i == outport)
                    {
                        continue;
                    }
                    //outport = i;
                    //break;

                    if(cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->InPortTypes[in_port] == PortType_Inject)
                    {
                        continue;
                    }

                    pair<int, int> srcdestpair = cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect_pair[i][in_port];
                    if(cirnet_ptr->m_circuit_paths[srcdestpair.first][srcdestpair.second] == FREE)
                    {
                        continue;
                    }

                    m_router->get_net_ptr()->printCircuitMap();
                    cout << "on CSNOC: " << csnoc_index << endl;
                    cout << "setup path from src: " << srcDest.first << ", to dest: " << srcDest.second << endl;
                    cout << "router id: " << m_router->get_id() << " , inport: " << in_port << " , existing outport: "
                        << i << " , request outport: " << outport << endl;
                    cout << "The inport type is : " << cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->InPortTypes[in_port] << endl;
                    cout << "conflict route is from src: " << srcdestpair.first << ", to dest: " << srcdestpair.second << endl;
                    cout << "conflict route status is " << cirnet_ptr->m_circuit_paths[srcdestpair.first][srcdestpair.second] << endl;
                    assert(0 && "this inport has already connected to another outport");
                }
            }
            for(int i = 0; i < cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->get_num_inports(); i++)
            {
                if(cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect[outport][i])            
                {
                    if (i == in_port)
                    {
                        continue;
                    }

                    if(cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->OutPortTypes[outport] == PortType_Eject)
                    {
                        continue;
                    }

                    pair<int, int> srcdestpair = cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect_pair[outport][i];
                    if(cirnet_ptr->m_circuit_paths[srcdestpair.first][srcdestpair.second] == FREE)
                    {
                        continue;
                    }

                    m_router->get_net_ptr()->printCircuitMap();
                    cout << "on CSNOC: " << csnoc_index << endl;
                    cout << "setup path from src: " << srcDest.first << ", to dest: " << srcDest.second << endl;
                    cout << "router id: " << m_router->get_id() << " , outport: " << outport << " , existing inport: "
                        << i << " , request inport: " << in_port << endl;
                    cout << "The outport type is : " << cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->OutPortTypes[outport] << endl;
                    cout << "conflict route is from src: " << srcdestpair.first << ", to dest: " << srcdestpair.second << endl;
                    cout << "conflict route status is " << cirnet_ptr->m_circuit_paths[srcdestpair.first][srcdestpair.second] << endl;
                    assert(0 && "this outport has already connected to another inport");
                }
            }
        }
        if(setuporfree)        
        {
            cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect[outport][in_port] = true;
            cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect_pair[outport][in_port] = srcDest;
        }
        else
        {        
            assert(cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect[outport][in_port] == true);
            pair<int, int> srcdestpair = cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect_pair[outport][in_port];
            if (srcdestpair.first == srcDest.first
                    && srcdestpair.second == srcDest.second)
                //        {
                //                && m_net_ptr->m_cirnet_ptr[csnoc_index]->m_circuit_paths[srcdestpair.first][srcdestpair.second] == BUI);
                //        }
            {        
                cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect[outport][in_port] = false;
                cirnet_ptr->m_router_ptr_vector[m_router->get_id()]->m_port_connect_pair[outport][in_port] = make_pair(-2, -2);
            }
        }

    }

    in_unit->updateRoute(invc, outport);
    t_flit->advance_stage(VA_);
    m_router->vcarb_req();
}

int RoutingUnit_d::routeCompute(flit_d *t_flit)
{
    MsgPtr msg_ptr = t_flit->get_msg_ptr();
    NetworkMessage* net_msg_ptr = NULL;
    net_msg_ptr = dynamic_cast<NetworkMessage*>(msg_ptr.ref());
    NetDest msg_destination = net_msg_ptr->getInternalDestination();

    int output_link = -1;
    int min_weight = INFINITE_;

    for(int link = 0; link < m_routing_table.size(); link++)
    {
        if (msg_destination.intersectionIsNotEmpty(m_routing_table[link]))
        {
            if(m_weight_table[link] >= min_weight)
                continue;
            output_link = link;
            min_weight = m_weight_table[link];
        }
    }
    if(output_link == -1)
    {
        ERROR_MSG("Fatal Error:: No Route exists from this Router.");
        exit(0);
    }
    return output_link;

}
