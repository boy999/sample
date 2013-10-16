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
 * CircuitNetwork.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "CircuitNetwork.h"
#include "MachineType.h"
#include "NetworkInterface_CN.h"
#include "MessageBuffer.h"
#include "Router_CN.h"
#include "Topology.h"	
#include "NetworkLink_CN.h"
//#include "CreditLink_d.h"
#include "NetDest.h"

#include "GarnetNetwork_d.h"

CircuitNetwork::CircuitNetwork(GarnetNetwork_d* m_net_ptr, int nodes, int CSNOC_id)
{
    m_id = CSNOC_id;
    m_network_ptr = m_net_ptr;
	m_nodes = MachineType_base_number(MachineType_NUM); // Total nodes in network
	m_virtual_networks = NUMBER_OF_VIRTUAL_NETWORKS; // Number of virtual networks = number of message classes in the coherence protocol
	m_ruby_start = 0;
	m_flits_recieved = 0;
	m_flits_injected = 0;
	m_network_latency = 0.0;
	m_queueing_latency = 0.0;

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
			m_toNetQueues[node][j]->setOrdering(false);
			//m_fromNetQueues[node][j] = new MessageBuffer();
			m_fromNetQueues[node][j] = m_network_ptr->getFromNetQueue(node, false, j);
		}
	}

	// Setup the network switches
    if (m_id == 1)
    {
    	m_topology_ptr = new Topology(this, m_nodes, true, TopoType_Dir2Buf);
    }
    else
    {
    	m_topology_ptr = new Topology(this, m_nodes, true, TopoType_Default);
    }
	
	int number_of_routers = m_topology_ptr->numSwitches();
	for (int i=0; i<number_of_routers; i++) {
		m_router_ptr_vector.insertAtBottom(new Router_CN(i, this));
	}
    
    m_circuit_paths.setSize(m_nodes);
    m_circuit_preBuild.setSize(m_nodes);
    m_circuit_preFree.setSize(m_nodes);
    m_cirpath_msgs.setSize(m_nodes);

    for(int i = 0; i < m_nodes; i++)
    {
        m_circuit_paths[i].setSize(m_nodes);
        m_circuit_preBuild[i].setSize(m_nodes);
        m_circuit_preFree[i].setSize(m_nodes);
        m_cirpath_msgs[i].setSize(m_nodes);

        for(int j = 0; j < m_nodes; j++)
        {
            m_circuit_paths[i][j] = NONE; // [src][dest]
            m_circuit_preBuild[i][j] = false; // [src][dest]
            m_circuit_preFree[i][j] = false; // [src][dest]
            m_cirpath_msgs[i][j] = 0; // [src][dest]
        }
    }       

	for (int i=0; i < m_nodes; i++) {
		NetworkInterface_CN *ni = new NetworkInterface_CN(i, m_virtual_networks, this);
		ni->addNode(m_toNetQueues[i], m_fromNetQueues[i]);
		m_ni_ptr_vector.insertAtBottom(ni);
	}

	m_topology_ptr->createLinks(false);  // false because this isn't a reconfiguration
	for(int i = 0; i < m_router_ptr_vector.size(); i++)
	{
		m_router_ptr_vector[i]->init();
	}
    
    for(int i = 0; i < m_link_ptr_vector.size(); i++)
    {
        int srcRouter = m_link_ptr_vector[i]->getLinkSrc();     
        m_link_ptr_vector[i]->init(m_router_ptr_vector[srcRouter]);
    }
}

CircuitNetwork::~CircuitNetwork()
{
	for (int i = 0; i < m_nodes; i++) 
	{
		m_toNetQueues[i].deletePointers();
		m_fromNetQueues[i].deletePointers();
	}
	m_router_ptr_vector.deletePointers();
	m_ni_ptr_vector.deletePointers();
	m_link_ptr_vector.deletePointers();
	//m_creditlink_ptr_vector.deletePointers();
	delete m_topology_ptr;
}

void CircuitNetwork::reset()
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

void CircuitNetwork::makeInLink(NodeID src, SwitchID dest, const NetDest& routing_table_entry, int link_latency, int bw_multiplier, bool isReconfiguration)
{
	assert(src < m_nodes);
	
	if(!isReconfiguration)
	{	
		NetworkLink_CN *net_link = new NetworkLink_CN(m_link_ptr_vector.size(), link_latency, this, LinkType_In, src, src, dest);
//		CreditLink_d *credit_link = new CreditLink_d(m_creditlink_ptr_vector.size());
		m_link_ptr_vector.insertAtBottom(net_link);
//		m_creditlink_ptr_vector.insertAtBottom(credit_link);

		//m_router_ptr_vector[dest]->addInPort(net_link, credit_link);
		//m_router_ptr_vector[dest]->addInPort(net_link);
		m_router_ptr_vector[dest]->addInPort(net_link, PortType_Inject);
		//m_ni_ptr_vector[src]->addOutPort(net_link, credit_link);
		m_ni_ptr_vector[src]->addOutPort(net_link, m_router_ptr_vector[dest]);
	}
	else 
	{
		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
		// do nothing
	}
}

/* 
 * This function creates a link from the Network to a NI. 
 * It creates a Network Link from a Router to the NI and 
 * a Credit Link from NI to the Router 
*/

void CircuitNetwork::makeOutLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
{
	assert(dest < m_nodes);
	assert(src < m_router_ptr_vector.size());
	assert(m_router_ptr_vector[src] != NULL);
	
	if(!isReconfiguration)
	{
		NetworkLink_CN *net_link = new NetworkLink_CN(m_link_ptr_vector.size(), link_latency, this, LinkType_Out, dest, src, dest);
//		CreditLink_d *credit_link = new CreditLink_d(m_creditlink_ptr_vector.size());
		m_link_ptr_vector.insertAtBottom(net_link);
//		m_creditlink_ptr_vector.insertAtBottom(credit_link);

//		m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight, credit_link);
		//m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight);
		m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight, PortType_Eject);
		//m_ni_ptr_vector[dest]->addInPort(net_link, credit_link);
		m_ni_ptr_vector[dest]->addInPort(net_link, m_router_ptr_vector[src]);
	} 
	else 
	{
		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
		//do nothing
	}
}

/* 
 * This function creates a internal network links 
*/

void CircuitNetwork::makeInternalLink(SwitchID src, SwitchID dest, const NetDest& routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration)
{
	if(!isReconfiguration)
	{
		NetworkLink_CN *net_link = new NetworkLink_CN(m_link_ptr_vector.size(), link_latency, this, LinkType_Internal, -1, src, dest);
//		CreditLink_d *credit_link = new CreditLink_d(m_creditlink_ptr_vector.size());
		m_link_ptr_vector.insertAtBottom(net_link);
//		m_creditlink_ptr_vector.insertAtBottom(credit_link);

//		m_router_ptr_vector[dest]->addInPort(net_link, credit_link);
		//m_router_ptr_vector[dest]->addInPort(net_link);
		m_router_ptr_vector[dest]->addInPort(net_link, PortType_Internal);
//		m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight, credit_link);
		//m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight);
		m_router_ptr_vector[src]->addOutPort(net_link, routing_table_entry, link_weight, PortType_Internal);
	}
	else
	{	
		ERROR_MSG("Fatal Error:: Reconfiguration not allowed here");
		// do nothing
	}
}

void CircuitNetwork::checkNetworkAllocation(NodeID id, bool ordered, int network_num)
{
	ASSERT(id < m_nodes);
	ASSERT(network_num < m_virtual_networks);

	if (ordered) 
	{
		m_ordered[network_num] = true;
	}
	m_in_use[network_num] = true;
}

MessageBuffer* CircuitNetwork::getToNetQueue(NodeID id, bool ordered, int network_num)
{
	checkNetworkAllocation(id, ordered, network_num);
	return m_toNetQueues[id][network_num];
}

MessageBuffer* CircuitNetwork::getFromNetQueue(NodeID id, bool ordered, int network_num)
{
	checkNetworkAllocation(id, ordered, network_num);
	return m_fromNetQueues[id][network_num];
}

void CircuitNetwork::clearStats()
{
	m_ruby_start = g_eventQueue_ptr->getTime();
}

Time CircuitNetwork::getRubyStartTime()
{
	return m_ruby_start;
}

void CircuitNetwork::printStats(ostream& out) const
{	
    double average_link_utilization = 0.0;
    double average_link_utilization_perLink = 0.0;
    double average_streamlink_utilization = 0.0;
    double average_streamlink_utilization_perLink = 0.0;
	Vector<double > average_vc_load;    
//#ifdef CS_NOC
    
//    out << "In CS_NOC" << endl;
//    average_vc_load.setSize(m_virtual_networks*1);
//#else
//    average_vc_load.setSize(m_virtual_networks*NetworkConfig::getVCsPerClass());
    average_vc_load.setSize(m_virtual_networks * 1 /*the number of VCs per class is 1*/);
//#endif

    Vector<double > average_vc_streamload;
//#ifdef CS_NOC
//    average_vc_streamload.setSize(m_virtual_networks*1);
//#else
//    average_vc_streamload.setSize(m_virtual_networks*NetworkConfig::getVCsPerClass());
    average_vc_streamload.setSize(m_virtual_networks * 1);
//#endif

//#ifdef CS_NOC
//	for(int i = 0; i < m_virtual_networks*1; i++)
//#else    
//	for(int i = 0; i < m_virtual_networks*NetworkConfig::getVCsPerClass(); i++)
	for(int i = 0; i < m_virtual_networks * 1; i++)
//#endif
	{
		average_vc_load[i] = 0;
		average_vc_streamload[i] = 0;
	}

	out << endl;
	out << "Network Stats" << endl;
	out << "-------------" << endl;
	out << endl;
	for(int i = 0; i < m_link_ptr_vector.size(); i++) 
	{
		average_link_utilization += (double(m_link_ptr_vector[i]->getLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start));
		average_streamlink_utilization += (double(m_link_ptr_vector[i]->getStreamLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start));

        if (m_link_ptr_vector[i]->getLinkType() == LinkType_In)
        {
	        out << "In Link : " << MachineType_to_string(m_link_ptr_vector[i]->getMachType())
                << " " << m_link_ptr_vector[i]->getLinkSrc()
                << " -> Router"
                << " " << m_link_ptr_vector[i]->getLinkDest() << endl;
            out << "\t Utilization :: " 
                << (double(m_link_ptr_vector[i]->getLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start))
                << " flits/cycle" << endl;
            out << "\t Stream Utilization :: " 
                << (double(m_link_ptr_vector[i]->getStreamLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start))
                << " flits/cycle" << endl;
        }
        else if (m_link_ptr_vector[i]->getLinkType() == LinkType_Out)
        {
	        out << "Out Link : Router " << m_link_ptr_vector[i]->getLinkSrc()
                << " -> " << MachineType_to_string(m_link_ptr_vector[i]->getMachType())
                << " " << m_link_ptr_vector[i]->getLinkDest() << endl;
            out << "\t Utilization :: " 
                << (double(m_link_ptr_vector[i]->getLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start))
                << " flits/cycle" << endl;
            out << "\t Stream Utilization :: " 
                << (double(m_link_ptr_vector[i]->getStreamLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start))
                << " flits/cycle" << endl;

        }
        else if (m_link_ptr_vector[i]->getLinkType() == LinkType_Internal)
        {
	        out << "Internal Link : Router " << m_link_ptr_vector[i]->getLinkSrc()
                << " -> Router"
                << " " << m_link_ptr_vector[i]->getLinkDest() << endl;
            out << "\t Utilization :: " 
                << (double(m_link_ptr_vector[i]->getLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start))
                << " flits/cycle" << endl;
            out << "\t Stream Utilization :: " 
                << (double(m_link_ptr_vector[i]->getStreamLinkUtilization())) / (double(g_eventQueue_ptr->getTime()-m_ruby_start))
                << " flits/cycle" << endl;

        }
        else
        {
            assert(0 && "Error LinkType");
        }

		Vector<int > vc_load = m_link_ptr_vector[i]->getVcLoad();
		Vector<int > vc_streamload = m_link_ptr_vector[i]->getVcStreamLoad();
		for(int j = 0; j < vc_load.size(); j++)
		{
//#ifdef CS_NOC
//			assert(vc_load.size() == 1*m_virtual_networks);
//#else            
			//assert(vc_load.size() == NetworkConfig::getVCsPerClass()*m_virtual_networks);
			assert(vc_load.size() == 1 * m_virtual_networks);
//#endif
			average_vc_load[j] += vc_load[j];
			
            average_vc_streamload[j] += vc_streamload[j];
		}
	}
	average_link_utilization_perLink = average_link_utilization/m_link_ptr_vector.size();
	average_streamlink_utilization_perLink = average_streamlink_utilization/m_link_ptr_vector.size();
	out << "Average Link Utilization :: " << average_link_utilization << " flits/cycle" << endl;
	out << "Average Link Utilization Per Link:: " << average_link_utilization_perLink << " flits/cycle" << endl;
	out << "Average Stream Link Utilization :: " << average_streamlink_utilization << " flits/cycle" << endl;
	out << "Average Stream Link Utilization Per Link:: " << average_streamlink_utilization_perLink << " flits/cycle" << endl;
	out << "-------------" << endl;

//#ifdef CS_NOC
//	for(int i = 0; i < 1*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#else
//	for(int i = 0; i < NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS; i++)
	for(int i = 0; i < 1 * NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#endif //CS_NOC
	{
		average_vc_load[i] = (double(average_vc_load[i]) / (double(g_eventQueue_ptr->getTime()) - m_ruby_start));
		out << "Average VC Load [" << i << "] = " << average_vc_load[i] << " flits/cycle " << endl;

        average_vc_streamload[i] = (double(average_vc_streamload[i]) / (double(g_eventQueue_ptr->getTime()) - m_ruby_start));
        out << "Average VC Stream Load [" << i << "] = " << average_vc_streamload[i] << " flits/cycle " << endl;
	}
	out << "-------------" << endl;

    out << "Total flits injected = " << m_flits_injected << endl;
    out << "Total flits recieved = " << m_flits_recieved << endl;
    out << "Average network latency = " << ((double) m_network_latency/ (double) m_flits_recieved)<< endl;
    out << "Average network latency I_ = " << ((double) m_network_latency_I / (double) m_flits_recieved)<< endl;
    out << "Average network latency VA_ = " << ((double) m_network_latency_VA / (double) m_flits_recieved)<< endl;
    out << "Average network latency SA_ = " << ((double) m_network_latency_SA / (double) m_flits_recieved)<< endl;
    out << "Average network latency ST_ = " << ((double) m_network_latency_ST / (double) m_flits_recieved)<< endl;
    out << "Average network latency LT_ = " << ((double) m_network_latency_LT / (double) m_flits_recieved)<< endl;
    out << "Average queueing latency = " << ((double) m_queueing_latency/ (double) m_flits_recieved)<< endl;
    out << "Average latency = " << ((double)  (m_queueing_latency + m_network_latency) / (double) m_flits_recieved)<< endl;
    out << "-------------" << endl;

    double m_total_link_power = 0.0;
    double m_total_link_area = 0.0;
	double m_total_router_power = 0.0;

	for(int i = 0; i < m_link_ptr_vector.size(); i++)
	{
		m_total_link_power += m_link_ptr_vector[i]->calculate_power();
        m_total_link_area += m_link_ptr_vector[i]->calculate_area();
	}

    double m_total_buf_read_count = 0.0;
    double m_total_buf_write_count = 0.0;
    double m_total_crossbar_count = 0.0;

	for(int i = 0; i < m_router_ptr_vector.size(); i++)
    {
        //		m_total_router_power += m_router_ptr_vector[i]->calculate_power();
        m_router_ptr_vector[i]->calculate_performance_numbers();
        out << "Router Id - " << m_router_ptr_vector[i]->get_id() << endl;
        out << "\t buf_read_count: " << m_router_ptr_vector[i]->buf_read_count << endl;
        out << "\t buf_write_count: " << m_router_ptr_vector[i]->buf_write_count << endl;
        out << "\t crossbar_count: " << m_router_ptr_vector[i]->crossbar_count << endl;
        m_total_buf_read_count += m_router_ptr_vector[i]->buf_read_count;
        m_total_buf_write_count += m_router_ptr_vector[i]->buf_write_count;
        m_total_crossbar_count += m_router_ptr_vector[i]->crossbar_count;
    }
    out << "m_total_buf_read_count = " << m_total_buf_read_count << endl;
    out << "m_total_buf_write_count = " << m_total_buf_write_count << endl;
    out << "m_total_crossbar_count = " << m_total_crossbar_count << endl;
	out << "Total Link Power = " << m_total_link_power << " W " << endl;
	out << "Total Router Power = " << m_total_router_power << " W " <<endl;
	out << "-------------" << endl;
}

void CircuitNetwork::printConfig(ostream& out) const
{
	out << endl;
	out << "Network Configuration" << endl;
	out << "---------------------" << endl;
	out << "network: CircuitNetwork_d" << endl;
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

void CircuitNetwork::print(ostream& out) const
{
	out << "[CircuitNetwork_d]";
}
