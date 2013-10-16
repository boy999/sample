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
 * CircuitNetwork.h
 *
 * Niket Agarwal, Princeton University
 *
 * */

#ifndef CIRCUITNETWORK_H
#define CIRCUITNETWORK_H

#include "NetworkHeader.h"
#include "Vector.h"
#include "NetworkConfig.h"
#include "Network.h"
#include "Router_CN.h"

class NetworkInterface_CN;
class MessageBuffer;
//class Router_CN;
class Topology;
class NetDest;
//class NetworkLink_d;
class NetworkLink_CN;
//class CreditLink_d;

class GarnetNetwork_d;

enum CirPathStatus {
    NONE,
    BUILD,
    FINISH,
    FREE
};

class CircuitNetwork : public Network{
public:
	CircuitNetwork(GarnetNetwork_d*, int nodes, int m_id);

	~CircuitNetwork();

	int getNumNodes(){ return m_nodes;}	
	
	// returns the queue requested for the given component
	MessageBuffer* getToNetQueue(NodeID id, bool ordered, int network_num);
	MessageBuffer* getFromNetQueue(NodeID id, bool ordered, int network_num);
	
	void clearStats();
  	void printStats(ostream& out) const;
  	void printConfig(ostream& out) const;
  	void print(ostream& out) const;

	inline void increment_injected_flits()
	{
		m_flits_injected++;
    }
    inline void increment_recieved_flits()
    {
        m_flits_recieved++;
    }
    inline void increment_network_latency(Time latency)
    {
        m_network_latency += latency;
    }

    inline void increment_network_latency_I(Time latency)
    {
        m_network_latency_I += latency;
    }

    inline void increment_network_latency_VA(Time latency)
    {
        m_network_latency_VA += latency;
    }
    inline void increment_network_latency_SA(Time latency)
    {
        m_network_latency_SA += latency;
    }
    inline void increment_network_latency_ST(Time latency)
    {
        m_network_latency_ST += latency;
    }
    inline void increment_network_latency_LT(Time latency)
    {
        m_network_latency_LT += latency;
    }


	inline void increment_queueing_latency(Time latency)
	{
		m_queueing_latency += latency;
	}

 	bool isVNetOrdered(int vnet) 
	{
		return m_ordered[vnet]; 
	}
  	bool validVirtualNetwork(int vnet) { return m_in_use[vnet]; }

	Time getRubyStartTime();
  	
  	void reset();
	
        // Methods used by Topology to setup the network
  	void makeOutLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int link_weight,  int bw_multiplier, bool isReconfiguration);
  	void makeInLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int bw_multiplier, bool isReconfiguration);
  	void makeInternalLink(SwitchID src, NodeID dest, const NetDest& routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration);

    Vector<Vector<CirPathStatus> > m_circuit_paths;
    Vector<Vector<bool> > m_circuit_preBuild;
    Vector<Vector<bool> > m_circuit_preFree;
    Vector<Vector<unsigned long> > m_cirpath_msgs;
	Vector<NetworkInterface_CN *> m_ni_ptr_vector;	// All NI's in Network
    
	Vector<Router_CN *> m_router_ptr_vector;   // All Routers in Network
	Vector<NetworkLink_CN *> m_link_ptr_vector; // All links in the network	
    int m_id;
    GarnetNetwork_d* get_gnet_d()
    {
        return m_network_ptr;
    }
private:
	void checkNetworkAllocation(NodeID id, bool ordered, int network_num);

// Private copy constructor and assignment operator
	CircuitNetwork(const CircuitNetwork& obj);
	CircuitNetwork& operator=(const CircuitNetwork& obj);

/***********Data Members*************/
	int m_virtual_networks; 
	int m_nodes;
	int m_flits_recieved, m_flits_injected;
	double m_network_latency, m_queueing_latency;
    double m_network_latency_I, m_network_latency_VA, m_network_latency_SA, m_network_latency_ST, m_network_latency_LT;

	Vector<bool> m_in_use;
	Vector<bool> m_ordered;

	Vector<Vector<MessageBuffer*> > m_toNetQueues; 
  	Vector<Vector<MessageBuffer*> > m_fromNetQueues;

//	Vector<CreditLink_d *> m_creditlink_ptr_vector; // All links in the network	

	Topology* m_topology_ptr;        	
	Time m_ruby_start;
    
#ifdef CS_NOC
/**********Circuit Switch Network************************/
    GarnetNetwork_d* m_network_ptr; // setup network pointer
#endif //CS_NOC
};

// Output operator declaration
ostream& operator<<(ostream& out, const CircuitNetwork& obj);

// ******************* Definitions *******************
// Output operator definition
extern inline
ostream& operator<<(ostream& out, const CircuitNetwork& obj)
{
	obj.print(out);
	out << flush;
	return out;
}

#endif //CIRCUITNETWORK_D_H
