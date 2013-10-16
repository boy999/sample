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
 * SetupNetwork.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

//#include "GarnetNetwork.h"
#include "SetupNetwork.h"
#include "MachineType.h"
#include "NetworkInterface_SN.h"
#include "MessageBuffer.h"
#include "Router_SN.h"
#include "Topology.h"	
#include "SimpleNetwork.h"
//#include "GarnetNetwork_d.h"
#include "NetworkLink_SN.h"
#include "NetDest.h"
#include "CircuitNetwork.h"
#include <fstream>
#include <iostream>
using namespace std;

// calls new to abstract away from the network
//Network* Network::createNetwork(int nodes)
//{
// 	NetworkConfig::readNetConfig();
	// Instantiate a network depending on what kind of network is requested
//	if(NetworkConfig::isGarnetNetwork())
//	{
//		if(NetworkConfig::isDetailNetwork())
//#ifndef IRREGULAR_NOC
//			return new GarnetNetwork_d(nodes);
//#else
//      return new IrregularNetwork_d(nodes);
//#endif
//		else
//			return new GarnetNetwork(nodes);
//	}	
//	else 
//		return new SimpleNetwork(nodes);
//}

//SetupNetwork::SetupNetwork(int nodes)
//{
//	m_nodes = MachineType_base_number(MachineType_NUM); // Total nodes in network
//	m_virtual_networks = NUMBER_OF_VIRTUAL_NETWORKS; // Number of virtual networks = number of message classes in the coherence protocol
//	m_ruby_start = 0;

	// Allocate to and from queues
//    m_toNetQueues.setSize(m_nodes); 	// Queues that are getting messages from protocol
//    m_fromNetQueues.setSize(m_nodes); 	// Queues that are feeding the protocol
//    m_in_use.setSize(m_virtual_networks);
//    m_ordered.setSize(m_virtual_networks);
//    for (int i = 0; i < m_virtual_networks; i++) 
//    {
//        m_in_use[i] = false;
//        m_ordered[i] = false;
//    }

//	for (int node = 0; node < m_nodes; node++) 
//	{
//		//Setting how many vitual message buffers will there be per Network Queue
//		m_toNetQueues[node].setSize(m_virtual_networks);
//		m_fromNetQueues[node].setSize(m_virtual_networks);
//
//		for (int j = 0; j < m_virtual_networks; j++) 
//		{ 
//			m_toNetQueues[node][j] = new MessageBuffer();	// Instantiating the Message Buffers that interact with the coherence protocol
//			m_fromNetQueues[node][j] = new MessageBuffer();
//		}
//	}

	// Setup the network switches
//	m_topology_ptr = new Topology(this, m_nodes);
//	
//	int number_of_routers = m_topology_ptr->numSwitches();
//	for (int i=0; i<number_of_routers; i++) {
//		m_router_ptr_vector.insertAtBottom(new Router_SN(i, this));
//	}
//	
//	for (int i=0; i < m_nodes; i++) {
//		NetworkInterface *ni = new NetworkInterface(i, m_virtual_networks, this);
//		ni->addNode(m_toNetQueues[i], m_fromNetQueues[i]);
//		m_ni_ptr_vector.insertAtBottom(ni);
//	}
//	m_topology_ptr->createLinks(false);  // false because this isn't a reconfiguration
//}

//#ifdef CS_NOC
//this function is called by generating circuit switched setup network
SetupNetwork::SetupNetwork(Vector<CircuitNetwork*> gnetd_ptr, int nodes)
{
    m_cirnet_ptr = gnetd_ptr;

    m_nodes = MachineType_base_number(MachineType_NUM); // Total nodes in network
    m_virtual_networks = NUMBER_OF_VIRTUAL_NETWORKS; // Number of virtual networks = number of message classes in the coherence protocol
    m_ruby_start = 0;

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
            m_toNetQueues[node][j]->setOrdering(false);
            m_fromNetQueues[node][j] = new MessageBuffer();
            m_fromNetQueues[node][j]->setOrdering(false);
        }
    }

    // Setup the network switches
    m_topology_ptr = new Topology(this, m_nodes, true, TopoType_Default);

    int number_of_routers = m_topology_ptr->numSwitches();
    for (int i=0; i<number_of_routers; i++) {
        m_router_ptr_vector.insertAtBottom(new Router_SN(i, this));
    }

    for (int i=0; i < m_nodes; i++) {
        NetworkInterface_SN *ni = new NetworkInterface_SN(i, m_virtual_networks, this);
        ni->addNode(m_toNetQueues[i], m_fromNetQueues[i]);
        m_ni_ptr_vector.insertAtBottom(ni);
    }
    m_topology_ptr->createLinks(false);  // false because this isn't a reconfiguration
}
//#endif //CS_NOC

SetupNetwork::~SetupNetwork()
{
	for (int i = 0; i < m_nodes; i++) 
	{
		m_toNetQueues[i].deletePointers();
		m_fromNetQueues[i].deletePointers();
	}
	m_router_ptr_vector.deletePointers();
	m_ni_ptr_vector.deletePointers();
	m_link_ptr_vector.deletePointers();
	delete m_topology_ptr;
}

void SetupNetwork::reset()
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

void SetupNetwork::makeInLink(NodeID src, SwitchID dest, const NetDest& routing_table_entry, int link_latency, int bw_multiplier, bool isReconfiguration)
{
	assert(src < m_nodes);
	
	if(!isReconfiguration)
	{	
		NetworkLink_SN *net_link = new NetworkLink_SN(m_link_ptr_vector.size(), link_latency, this);
		m_link_ptr_vector.insertAtBottom(net_link);
		m_router_ptr_vector[dest]->addInPort(net_link);
		m_ni_ptr_vector[src]->addOutPort(net_link, m_router_ptr_vector[dest]);
	}
	else 
	{
		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
		// do nothing
	}
}

void SetupNetwork::makeOutLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
{
	assert(dest < m_nodes);
	assert(src < m_router_ptr_vector.size());
	assert(m_router_ptr_vector[src] != NULL);
	
	if(!isReconfiguration)
	{
		NetworkLink_SN *net_link = new NetworkLink_SN(m_link_ptr_vector.size(), link_latency, this);
		m_link_ptr_vector.insertAtBottom(net_link);
		m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight);
		m_ni_ptr_vector[dest]->addInPort(net_link, m_router_ptr_vector[src]);
	} 
	else 
	{
		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
		//do nothing
	}
}

void SetupNetwork::makeInternalLink(SwitchID src, SwitchID dest, const NetDest& routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
{
	if(!isReconfiguration)
	{
		NetworkLink_SN *net_link = new NetworkLink_SN(m_link_ptr_vector.size(), link_latency, this);
		m_link_ptr_vector.insertAtBottom(net_link);
		m_router_ptr_vector[dest]->addInPort(net_link);
		m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight);
	}
	else
	{	
		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
		// do nothing
	}
}

void SetupNetwork::checkNetworkAllocation(NodeID id, bool ordered, int network_num)
{
	ASSERT(id < m_nodes);
	ASSERT(network_num < m_virtual_networks);

	if (ordered) 
	{
		m_ordered[network_num] = true;
	}
	m_in_use[network_num] = true;
}

MessageBuffer* SetupNetwork::getToNetQueue(NodeID id, bool ordered, int network_num)
{
	checkNetworkAllocation(id, ordered, network_num);
	return m_toNetQueues[id][network_num];
}

MessageBuffer* SetupNetwork::getFromNetQueue(NodeID id, bool ordered, int network_num)
{
	checkNetworkAllocation(id, ordered, network_num);
	return m_fromNetQueues[id][network_num];
}

void SetupNetwork::clearStats()
{
	m_ruby_start = g_eventQueue_ptr->getTime();
}

Time SetupNetwork::getRubyStartTime()
{
	return m_ruby_start;
}

void SetupNetwork::printStats(ostream& out) const
{	double average_link_utilization = 0;
	Vector<double > average_vc_load;
	average_vc_load.setSize(m_virtual_networks*NetworkConfig::getVCsPerClass());	
	
	for(int i = 0; i < m_virtual_networks*NetworkConfig::getVCsPerClass(); i++)
	{
		average_vc_load[i] = 0;
	}

	out << endl;
	out << "Network Stats" << endl;
	out << "-------------" << endl;
	out << endl;
	for(int i = 0; i < m_link_ptr_vector.size(); i++) 
	{
		average_link_utilization += m_link_ptr_vector[i]->getLinkUtilization(); 
		Vector<int > vc_load = m_link_ptr_vector[i]->getVcLoad();
		for(int j = 0; j < vc_load.size(); j++)
		{
			assert(vc_load.size() == NetworkConfig::getVCsPerClass()*m_virtual_networks);
			average_vc_load[j] += vc_load[j];
		}
	}
	average_link_utilization = average_link_utilization/m_link_ptr_vector.size();
	out << "Average Link Utilization :: " << average_link_utilization << " flits/cycle" <<endl;
	out << "-------------" << endl;

	for(int i = 0; i < NetworkConfig::getVCsPerClass()*m_virtual_networks; i++)
	{
		average_vc_load[i] = (double(average_vc_load[i]) / (double(g_eventQueue_ptr->getTime()) - m_ruby_start));
		out << "Average VC Load [" << i << "] = " << average_vc_load[i] << " flits/cycle" << endl;
	}
	out << "-------------" << endl;
}

void SetupNetwork::printConfig(ostream& out) const
{
	out << endl;
	out << "Network Configuration" << endl;
	out << "---------------------" << endl;
	out << "network: GARNET_NETWORK" << endl;
	out << "topology: " << g_NETWORK_TOPOLOGY << endl;
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
	if (g_PRINT_TOPOLOGY) 
	{
		m_topology_ptr->printConfig(out);
	}
}

pair<int, int> findLoc(int nodeId)
{
    int x, y; // x is the column index; y is the row index
    int noc_width = NOC_WIDTH;
    //To verify whether the function works correctly, check with Network File
    if ( nodeId < MachineType_base_number(MachineType_L1Cache)
               && nodeId >= MachineType_base_number(MachineType_L2Cache) )
    {
        //For L2 cache NI
        x = nodeId % noc_width;
        y = nodeId / noc_width;
    }
    else if ( nodeId < MachineType_base_number(MachineType_Directory) )
    {
        //For L1 cache NI
        nodeId = nodeId - MachineType_base_number(MachineType_L1Cache);
        x = nodeId % noc_width;
        y = nodeId / noc_width;

    }
    else if ( nodeId < MachineType_base_number(MachineType_SimicsNetworkPort) )
    {
        //For Directory NI
        //Here, for directory NI, we hardcode the position of each directory
        //Look at the Network File to figure out the locations
        //In current Network File, the locations are 8 11 20 23

        nodeId = nodeId - MachineType_base_number(MachineType_Directory);

        switch(nodeId)
        {
            case 0:
                x = 8 % noc_width;
                y = 8 / noc_width;
                break;
            case 1:
                x = 11 % noc_width;
                y = 11 / noc_width;
                break;
            case 2:
                x = 20 % noc_width;
                y = 20 / noc_width;
                break;
            case 3:
                x = 23 % noc_width;
                y = 23 / noc_width;
                break;
            default:
                assert(0 && "Error!");
                break;
        }
    }
    else if ( nodeId < MachineType_base_number(MachineType_NUM) )
    {
        //For SimicsNetworkPort NI
        nodeId = nodeId - MachineType_base_number(MachineType_SimicsNetworkPort);
        x = nodeId % noc_width;
        y = nodeId / noc_width;
    }
    else
    {
        assert(0 && "Invalid nodeId");
    }

    return make_pair(x, y);
}

pair<int, int> SetupNetwork::findLocation(int nodeId)
{
    int x, y; // x is the column index; y is the row index
    int noc_width = NOC_WIDTH; 
    //To verify whether the function works correctly, check with Network File
    if ( nodeId < MachineType_base_number(MachineType_L1Cache) 
            && nodeId >= MachineType_base_number(MachineType_L2Cache) )
    {
        //For L2 cache NI
        x = nodeId % noc_width;
        y = nodeId / noc_width;
    }
    else if ( nodeId < MachineType_base_number(MachineType_Directory) )
    {
        //For L1 cache NI
        nodeId = nodeId - MachineType_base_number(MachineType_L1Cache);
        x = nodeId % noc_width;
        y = nodeId / noc_width;

    }
    else if ( nodeId < MachineType_base_number(MachineType_SimicsNetworkPort) )
    {
        //For Directory NI
        //Here, for directory NI, we hardcode the position of each directory
        //Look at the Network File to figure out the locations
        //In current Network File, the locations are 8 11 20 23
        
        nodeId = nodeId - MachineType_base_number(MachineType_Directory);
        
        switch(nodeId)
        {
            case 0:
                x = 8 % noc_width;
                y = 8 / noc_width;
                break;
            case 1:
                x = 11 % noc_width;
                y = 11 / noc_width;
                break;
            case 2:
                x = 20 % noc_width;
                y = 20 / noc_width;               
                break;
            case 3:
                x = 23 % noc_width;
                y = 23 / noc_width;
                break;
            default:
                assert(0 && "Error!");
                break;
        }
    }
    else if ( nodeId < MachineType_base_number(MachineType_NUM) )
    {
        //For SimicsNetworkPort NI
        nodeId = nodeId - MachineType_base_number(MachineType_SimicsNetworkPort);
        x = nodeId % noc_width;
        y = nodeId / noc_width;
    }
    else
    {
        assert(0 && "Invalid nodeId");
    }

    return make_pair(x, y); 
}

// this function is used to detect whether the circuit path from src to dest
// will conflict with the existing paths in the circuit network layer: CirNetLayer
bool SetupNetwork::CirNetHasNoConflict(int CirNetLayer, int src, int dest)
{
    int i = CirNetLayer;
    bool flag = true;
    for (int j = 0; j < m_cirnet_ptr[i]->m_circuit_paths.size(); j++)
    {
        for (int k = 0; k < m_cirnet_ptr[i]->m_circuit_paths[j].size(); k++)
        {
            if (m_cirnet_ptr[i]->m_circuit_paths[j][k] == BUILD
                    || m_cirnet_ptr[i]->m_circuit_paths[j][k] == FINISH)
            {  

                //if (m_id == j || destID == k)
                //{
                //    flag = false;
                //}                        
                //else
                //{
                //assert(0 && "Test!!!!");
                //flag = CirNetConflictNotDetected(i, j, k, (int)m_id, (int)destID); 
                flag = CirNetConflictNotDetected(i, j, k, src, dest); 
                // circuit network layer, src1, dest1, src2, dest2
                //}
            }
            if (flag == false)
                return false;
            //                            break;
        }
        //                    if (flag == false)
        //                        break;
    }

    return true;
}

bool SetupNetwork::CirNetConflictNotDetected(int CirNetLayer, int src1, int dest1, int src2, int dest2) 
{
    cerr << "cirLayer: " << CirNetLayer << " ; src1: " << src1
        << " ; dest1: " << dest1 << " ; src2: " << src2 << " ; dest2: " << dest2 << endl;

    pair<int, int> src1Loc = findLocation(src1);
    pair<int, int> dest1Loc = findLocation(dest1);
    pair<int, int> src2Loc = findLocation(src2);
    pair<int, int> dest2Loc = findLocation(dest2);
    int src1_x = src1Loc.first;
    int src1_y = src1Loc.second;
    int dest1_x = dest1Loc.first;
    int dest1_y = dest1Loc.second;

    int src2_x = src2Loc.first;
    int src2_y = src2Loc.second;
    int dest2_x = dest2Loc.first;
    int dest2_y = dest2Loc.second;

    //if (accNode / NOC_WIDTH == accNode2 /NOC_WIDTH) // accNode in the same row
    if ( src1_y == src2_y ) //src1 and src2 in the same row
    {                    
        //set<int>::iterator iter = iit->second.begin();
        //set<int>::iterator iter2 = iit2->second.begin();
        //if (accNode % NOC_WIDTH == accNode2 % NOC_WIDTH)
        if (src1_x == src2_x)
        {
            //if (( (*iter) % NOC_WIDTH < accNode % NOC_WIDTH 
            //            && (*iter2) % NOC_WIDTH > accNode % NOC_WIDTH)
            //        || ((*iter) % NOC_WIDTH > accNode % NOC_WIDTH
            //            && (*iter2) % NOC_WIDTH < accNode % NOC_WIDTH))
            //if ((dest1_x <= src1_x && dest2_x >= src1_x) || (dest1_x >= src1_x && dest2_x <= src1_x))
            if ((dest1_x < src1_x && dest2_x < src2_x) || (dest1_x > src1_x && dest2_x > src2_x))
            {
                return false;
                // has conflicts
            }
            if( dest1_x == dest2_x )
            {
                if((dest1_y < src1_y && dest2_y < src2_y) || (dest1_y > src1_y && dest2_y > src2_y))
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                // no  conflicts
                return true;
            }
        }
        //else if ( accNode % NOC_WIDTH < accNode2 % NOC_WIDTH ) 
        else if ( src1_x < src2_x ) 
        {
            if ( dest1_x != dest2_x )
            {
                if ((dest1_x < src1_x && dest2_x < src1_x)
                        || (dest1_x > src2_x && dest2_x > src2_x))
                    return false;
                else
                {
                    // no conflicts
                    return true;
                }
            }
            else
            {
                if (dest1_x < src1_x || dest1_x > src2_x)
                    return false;

                // has conflicts
                //flag_overlap = true;
                if ((dest1_y < src1_y && dest2_y < src2_y) 
                        || (dest1_y > src1_y && dest2_y > src2_y))
                    return false;
                else
                    return true;
            }
        }
        else
        {
            if ( dest1_x != dest2_x )
            {
                if ((dest1_x < src2_x && dest2_x < src2_x)
                        || (dest1_x > src1_x && dest2_x > src1_x))
                    return false;
                else
                {
                    // no conflicts
                    return true;
                }
            }
            else
            {
                if (dest1_x < src2_x || dest1_x > src1_x)
                    return false;

                // has conflicts
                //flag_overlap = true;
                if ((dest1_y < src1_y && dest2_y < src2_y) 
                        || (dest1_y > src1_y && dest2_y > src2_y))
                    return false;
                else
                    return true;
            }
        }
    }
    else if ( src1_y < src2_y ) // src2 is below src1
    {
        //set<int>::iterator iter = iit->second.begin();
        //set<int>::iterator iter2 = iit2->second.begin();
        //if (accNode % NOC_WIDTH == accNode2 % NOC_WIDTH)
        if (src1_x == src2_x)
        {
            //if ( (*iter) % NOC_WIDTH != (*iter2) % NOC_WIDTH )                                      
            if ( dest1_x != dest2_x )                                      
            {
                // no conflicts
                return true;
            }
            else
            {
                //if ( (*iter) / NOC_WIDTH > accNode2 /NOC_WIDTH 
                //        || (*iter2) / NOC_WIDTH < accNode /NOC_WIDTH
                //        || (*iter) / NOC_WIDTH > (*iter2) / NOC_WIDTH )
                //if ( dest1_y > src2_y || dest2_y < src2_y || dest1_y > dest2_y )
                /*cout << "dest2_y: " << dest2_y;
                cout << " dest1_y: " << dest1_y;
                cout << " src1_y: " << src1_y;
                cout << " src2_y: " << src2_y << endl;
                */
                if ( (dest2_y < src1_y && dest1_y < src1_y)
                        || (dest2_y > src2_y && dest1_y > src2_y))              
                {
                    // has conflicts
                    //flag_overlap = true;
                    return false;
                }
                else
                { 
                    // no conflicts
                    return true;
                }
            }
        }
        //else if ( accNode % NOC_WIDTH < accNode2 % NOC_WIDTH ) 
        else if ( src1_x < src2_x ) 
        {
            //if ( (*iter) % NOC_WIDTH != (*iter2) % NOC_WIDTH )                                      
            if ( dest1_x != dest2_x )                                      
            {
                // no conflicts
                return true;
            }
            else
            {
                //if ( (*iter) / NOC_WIDTH > accNode2 /NOC_WIDTH 
                //        || (*iter2) / NOC_WIDTH < accNode /NOC_WIDTH
                //        || (*iter) / NOC_WIDTH > (*iter2) / NOC_WIDTH )
                //if ( dest1_y > src2_y || dest2_y < src1_y || dest1_y > dest2_y )
                if ( (dest2_y < src1_y && dest1_y < src1_y)
                        || (dest2_y > src2_y && dest1_y > src2_y))                            
                {
                    // has conflicts
                    //flag_overlap = true;
                    return false;
                }
                else
                { 
                    // no conflicts
                    return true;
                }
            }
        }
        else
        {
            //if ( (*iter) % NOC_WIDTH != (*iter2) % NOC_WIDTH )                                      
            if ( dest1_x != dest2_x )
            {
                // no conflicts
                return true;
            }
            else
            {
                //if ( (*iter) / NOC_WIDTH > accNode2 /NOC_WIDTH 
                //        || (*iter2) / NOC_WIDTH < accNode /NOC_WIDTH
                //        || (*iter) / NOC_WIDTH > (*iter2) / NOC_WIDTH )
                //if ( dest1_y > src2_y || dest2_y < src1_y || dest1_y > dest2_y )
                if ( (dest2_y < src1_y && dest1_y < src1_y)
                        || (dest2_y > src2_y && dest1_y > src2_y))                                            
                {
                    // has conflicts
                    // flag_overlap = true;
                    return false;
                }
                else
                { 
                    // no conflicts
                    return true;
                }
            }
        }
    }
    else // src2 is above src1 src1_y > src2_y
    {            
        //set<int>::iterator iter = iit->second.begin();
        //set<int>::iterator iter2 = iit2->second.begin();
        //if (accNode % NOC_WIDTH == accNode2 % NOC_WIDTH)
        if ( src1_x == src2_x )
        {
            //if ( (*iter2) % NOC_WIDTH != (*iter) % NOC_WIDTH )                                      
            if ( dest2_x != dest1_x )
            {
                // no conflicts
                return true;
            }
            else
            {
                //if ( (*iter2) / NOC_WIDTH > accNode /NOC_WIDTH 
                //        || (*iter) / NOC_WIDTH < accNode2 /NOC_WIDTH
                //        || (*iter2) / NOC_WIDTH > (*iter) / NOC_WIDTH )
                //if ( dest2_y > src1_y || dest1_y < src2_y || dest2_y > dest1_y )
                if ( (dest2_y > src1_y && dest1_y > src1_y)
                        || (dest2_y < src2_y && dest1_y < src2_y))
                {
                    // has conflicts
                    //flag_overlap = true;
                    return false;
                }
                else
                { 
                    // no conflicts
                    return true;
                }
            }
        }
        //else if ( accNode % NOC_WIDTH < accNode2 % NOC_WIDTH ) 
        else if ( src1_x < src2_x )
        {
            //if ( (*iter2) % NOC_WIDTH != (*iter) % NOC_WIDTH )                                      
            if ( dest2_x != dest1_x )
            {
                // no conflicts
                return true;
            }
            else
            {
                //if ( (*iter2) / NOC_WIDTH > accNode /NOC_WIDTH 
                //        || (*iter) / NOC_WIDTH < accNode2 /NOC_WIDTH
                //        || (*iter2) / NOC_WIDTH > (*iter) / NOC_WIDTH )
                //if ( dest2_y > src1_y || dest1_y < src2_y || dest2_y > dest1_y )
                if ( (dest2_y > src1_y && dest1_y > src1_y)
                        || (dest2_y < src2_y && dest1_y < src2_y))
                {
                    // has conflicts
                    //flag_overlap = true;
                    return false;
                }
                else
                { 
                    // no conflicts
                    return true;
                }
            }

        }
        else
        {
            //if ( (*iter2) % NOC_WIDTH != (*iter) % NOC_WIDTH )                                      
            if ( dest2_x != dest1_x )
            {
                // no conflicts
                return true;
            }
            else
            {
                //if ( (*iter2) / NOC_WIDTH > accNode /NOC_WIDTH 
                //        || (*iter) / NOC_WIDTH < accNode2 /NOC_WIDTH
                //        || (*iter2) / NOC_WIDTH > (*iter) / NOC_WIDTH )
                //if( dest2_y > src1_y || dest1_y < src2_y || dest2_y > dest1_y )
                if ( (dest2_y > src1_y && dest1_y > src1_y)
                        || (dest2_y < src2_y && dest1_y < src2_y))
                {
                    // has conflicts
                    //flag_overlap = true;
                    return false;
                }
                else
                { 
                    // no conflicts
                    return true;
                }
            }

        }
    }
    //return true;
    assert(0 && "Error in check conflicts!");
}



void SetupNetwork::printCircuitMap()
{
    ofstream myfile;
    myfile.open ("CircuitMap.txt");
    string outArr[m_cirnet_ptr.size()][8][4];
    //myfile << "Writing this to a file.\n";
    int count = 1;
    for (int i = 0; i < m_cirnet_ptr.size(); i++)
    {
        for (int j = 0; j < m_cirnet_ptr[i]->m_circuit_paths.size(); j++)
        { 
            for (int k = 0; k < m_cirnet_ptr[i]->m_circuit_paths[j].size(); k++)
            {
                if (m_cirnet_ptr[i]->m_circuit_paths[j][k] == FINISH)
                {   
                    pair<int, int> loc;
                    string str;
                    ostringstream oss;
                    oss << count;
                    str += oss.str();
                    str.append("ss ");
                    loc = findLoc(j);                    
                    //cout << j <<  " true : x: " << loc.first << " ; y: " << loc.second << " : " << str <<  endl;
                    if (outArr[i][loc.second][loc.first].compare("0 ") != 0)
                    {
                        outArr[i][loc.second][loc.first].append(str); 
                    }
                    else
                    {
                        outArr[i][loc.second][loc.first].clear();
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    str.clear();
                    oss.clear();
                    str += oss.str();
                    str.append("dd ");
                    loc = findLoc(k);
                    //cout << k <<  ": true x: " << loc.first << " ; y: " << loc.second << " : " << str << endl;
                    if (outArr[i][loc.second][loc.first].compare("0 ") != 0)
                    {
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    else
                    {
                        outArr[i][loc.second][loc.first].clear();
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    count++;
                    //assert(0 && "test !!!");
                }
                else if (m_cirnet_ptr[i]->m_circuit_paths[j][k] == FREE)
                {   
                    pair<int, int> loc;
                    string str;
                    ostringstream oss;
                    oss << count;
                    str += oss.str();
                    str.append("Fs ");
                    loc = findLoc(j);                    
                    //cout << j <<  " true : x: " << loc.first << " ; y: " << loc.second << " : " << str <<  endl;
                    if (outArr[i][loc.second][loc.first].compare("0 ") != 0)
                    {
                        outArr[i][loc.second][loc.first].append(str); 
                    }
                    else
                    {
                        outArr[i][loc.second][loc.first].clear();
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    str.clear();
                    oss.clear();
                    str += oss.str();
                    str.append("Fd ");
                    loc = findLoc(k);
                    //cout << k <<  ": true x: " << loc.first << " ; y: " << loc.second << " : " << str << endl;
                    if (outArr[i][loc.second][loc.first].compare("0 ") != 0)
                    {
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    else
                    {
                        outArr[i][loc.second][loc.first].clear();
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    count++;
                    //assert(0 && "test !!!");
                }
                else if(m_cirnet_ptr[i]->m_circuit_paths[j][k] == BUILD)
                {
                    pair<int, int> loc;
                    string str;
                    ostringstream oss;
                    oss << count;
                    str += oss.str();
                    str.append("Bs ");
                    loc = findLoc(j);                    
                    //cout << j <<  " true : x: " << loc.first << " ; y: " << loc.second << " : " << str <<  endl;
                    if (outArr[i][loc.second][loc.first].compare("0 ") != 0)
                    {
                        outArr[i][loc.second][loc.first].append(str); 
                    }
                    else
                    {
                        outArr[i][loc.second][loc.first].clear();
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    str.clear();
                    oss.clear();
                    str += oss.str();
                    str.append("Bd ");
                    loc = findLoc(k);
                    //cout << k <<  ": true x: " << loc.first << " ; y: " << loc.second << " : " << str << endl;
                    if (outArr[i][loc.second][loc.first].compare("0 ") != 0)
                    {
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    else
                    {
                        outArr[i][loc.second][loc.first].clear();
                        outArr[i][loc.second][loc.first].append(str);
                    }
                    count++;
                    //assert(0 && "test !!!");
                }
                else
                {
                    pair<int, int> loc;
                    string str;
                    str.append("0 ");
                    loc = findLoc(j);
                    //cout << j <<  " false : x: " << loc.first << " ; y: " << loc.second << " : " << str << endl;
                    if (outArr[i][loc.second][loc.first].compare("") == 0)
                        outArr[i][loc.second][loc.first].append(str);
                    str.clear();
                    str.append("0 ");
                    loc = findLoc(k);
                    //cout << k <<  " false : x: " << loc.first << " ; y: " << loc.second << " : " << str << endl;
                    if (outArr[i][loc.second][loc.first].compare("") == 0)
                        outArr[i][loc.second][loc.first].append(str);
                }
            }
        }
    }
    
    for(int i = 0; i < m_cirnet_ptr.size(); i++)
    {
        myfile << i << "\n";
        for(int j = 0; j < 8; j++)
        {
            for(int k = 0; k < 4; k++)
            {
                myfile << outArr[i][j][k] << " ; ";
            }
            myfile << "\n";
        }

        myfile << "\n";
    }

    myfile.close();
}

void SetupNetwork::print(ostream& out) const
{
	out << "[SetupNetwork]";
}
