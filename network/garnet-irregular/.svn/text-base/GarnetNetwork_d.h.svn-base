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
 * GarnetNetwork_d.h
 *
 * Niket Agarwal, Princeton University
 * Edited by Mishali for MCSim
 * */

#ifndef GARNETNETWORK_D_H
#define GARNETNETWORK_D_H

#define ADJUST_EVERY_N 125000
#define NW_PHASE_INTERVAL 125000


#include "NetworkHeader.h"
#include "Vector.h"
#include "NetworkConfig.h"
#include "Network.h"
#include "MachineID.h"
#include "Message.h"
class NetworkInterface_d;
class MessageBuffer;
class Router_d;
class Topology;
class NetDest;
class NetworkLink_d;
class CreditLink_d;

#include "Map.h"

///////////////////////


// a class that behaves as a struct with an initializer
class node_stat
{
 public:
  unsigned long long phaseL2Access;
  unsigned long long phaseNwInject;
  unsigned long long phaseExtraBwStall;
  unsigned long long phaseExtraFlitsSent;
  unsigned long long phaseBwStall;
  unsigned long long phaseFlitsSent;
  unsigned long long stalls_q;
  unsigned long long stalls_bw;
  unsigned long long stat_n;
  unsigned long long stat_e;
  unsigned long long stat_s;
  unsigned long long stat_w;
  unsigned long long stat_c;
  unsigned long long stat_extra;

  node_stat()
    {
      phaseL2Access = phaseNwInject = phaseExtraBwStall = phaseExtraFlitsSent
	= phaseBwStall = phaseFlitsSent = stalls_q = stalls_bw = stat_n
	= stat_e = stat_s = stat_w = stat_c = stat_extra = 0;
    }
};



class GarnetNetwork_d : public Network {
 public:

  GarnetNetwork_d(int nodes);
  ~GarnetNetwork_d();

  int getNumNodes(){ return m_nodes;}	
	
  // returns the queue requested for the given component
  MessageBuffer* getToNetQueue(int id, bool ordered, int network_num);
  MessageBuffer* getFromNetQueue(int id, bool ordered, int network_num);
	
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
  inline void increment_queueing_latency(Time latency)
    {
      m_queueing_latency += latency;
    }
  inline void increment_hops(double hops)
    {
      m_number_hops += hops;
    }
  bool isVNetOrdered(int vnet) 
    {
      return m_ordered[vnet]; 
    }
  bool validVirtualNetwork(int vnet) { return m_in_use[vnet]; }

  Time getRubyStartTime();
  	
  void reset();

  unsigned int getPctShortcuts(unsigned int) { return pctShort; }

  bool useShortcuts()
    {
      static unsigned int ctr = 0;
      bool retVal = (ctr < pctShort);
      ctr = (ctr + 1) % 100;
      return retVal;
    }

  // Methods used by Topology to setup the network
  void makeOutLink(SwitchID src, NodeID dest, const NetDest & routing_table_entry, int link_latency, int link_weight,  int bw_multiplier, bool isReconfiguration);
  void makeInLink(SwitchID src, NodeID dest, const NetDest & routing_table_entry, int link_latency, int bw_multiplier, bool isReconfiguration);
  void makeInternalLink(SwitchID src, NodeID dest, const NetDest & routing_table_entry, int link_latency, int link_weight, int bw_multiplier, bool isReconfiguration);


  int getNumRouters(){ return m_routers;}
  
  /*
  void setDeadlockState(bool state) {deadlock = state; deadlockTime = g_eventQueue_ptr->getTime();canDetectDeadlock=false;}
  */

  void updateRouterStats(int source, int dest, int bytes);
	
  void DumpStats();
  
  void incrementBwStall(unsigned int srcId, bool rfPort)
  {
    if((node_stats != NULL) && (srcId < m_nodes))
    {
      (node_stats[srcId]).stalls_bw++;
      (node_stats[srcId]).phaseBwStall++;
      if(rfPort) (node_stats[srcId]).phaseExtraBwStall++;
    }
    incrementQStall(srcId);  // unlike SimpleNoC, queue-stalls
    // and bw-stalls would be same thing
    // here due to credit model...or so
    // I think...  - Adam
  }

  void incrementQStall(unsigned int srcId)
  {
    if((node_stats != NULL) && (srcId < m_nodes))
    {
      (node_stats[srcId]).stalls_q++;
    }
  }

  void incrementFlitsSent(unsigned int srcId, unsigned int flitsSent, outPortMap direction)
  {
    /*
       if((node_stats != NULL) && (srcId < m_nodes))
       {
       (node_stats[srcId]).phaseFlitsSent += flitsSent;
       }
       switch(direction)
       {
       case THERE: (node_stats[srcId]).stat_c += flitsSent; break;
       case NORTH: (node_stats[srcId]).stat_n += flitsSent; break;
       case EAST:  (node_stats[srcId]).stat_e += flitsSent; break;
       case SOUTH: (node_stats[srcId]).stat_s += flitsSent; break;
       case WEST:  (node_stats[srcId]).stat_w += flitsSent; break;
       case RF:
       (node_stats[srcId]).phaseExtraFlitsSent += flitsSent;
       (node_stats[srcId]).stat_extra += flitsSent;
       break;
       }
     */
    if (direction == BASE)
      baselineFlits++;
    totalFlits++;
  }

  int NumSources() { return m_nodes;}
  int NumDests() { return m_nodes;}

  //Mishali: added 07/09 
#ifndef TRACEMODE 
  void generateTraffic();
#endif
  void updateRouterPairMsgCounter(int i, int j) {m_routerPairMsgCounter[i][j]++;}
  void initializeChip2Chip();
  void createNetwork(char* extraLinkFile);
  void makeMesh(char* extraLinkFile);
  void makeFileSpecified(){}
  void makeHierarchicalSwitch(char* extraLinkFile);
  int getMeshDim() { return m_meshdim;}
  ///////////////////////////////////////////////



 private:
  int dest_direction;
  unsigned int extraLinkCapacity;
  void dumpClearPhaseStats();
  // Private copy constructor and assignment operator
  GarnetNetwork_d(const GarnetNetwork_d& obj);
  GarnetNetwork_d& operator=(const GarnetNetwork_d& obj);

  /***********Data Members*************/
  unsigned int baseLinkBw;
  unsigned int minLinkBw;
  unsigned int chip2chipBw;
  unsigned int chip2chipLatency;
  unsigned int chip2chipPorts;
  unsigned int numberOfChips;
  outPortMap currLinkDirection;
  unsigned int pctShort;
  int m_virtual_networks; 
  int m_nodes;
  int m_flits_recieved, m_flits_injected;
  int m_routers;
  double m_network_latency, m_queueing_latency;
  double m_number_hops;
  string m_routingFile_fa;
  string m_routingFile_df;
  int m_meshdim; 
  unsigned int flitCapacity;

  Vector<bool> m_in_use;
  Vector<bool> m_ordered;

  Vector<Vector<MessageBuffer*> > m_toNetQueues; 
  Vector<Vector<MessageBuffer*> > m_fromNetQueues;

  Vector<Router_d *> m_router_ptr_vector;   // All Routers in Network
  Vector<NetworkLink_d *> m_link_ptr_vector; // All links in the network	
  Vector<CreditLink_d *> m_creditlink_ptr_vector; // All links in the network	
  Vector<NetworkInterface_d *> m_ni_ptr_vector;	// All NI's in Network

  Time m_ruby_start;
  Topology* m_topology_ptr;

  Map<int, int> m_nodeToRouterMap;
  unsigned long long m_index;

  int msgInjected;
  int msgDelivered;
  //p2p are for src to dest
  Vector<Vector<unsigned long long> > m_p2pMsgCounter;
  Vector<Vector<unsigned long long> > m_p2pByteCounter;
  
  //for any router pair
  Vector<Vector<unsigned long long> > m_routerPairMsgCounter;
  unsigned long long lastAdjusted;
  unsigned long long lastPhaseInterval;
  node_stat* node_stats;

  Vector<Vector<int> > chip2chipRouterPairs;
  Vector<Vector<bool> > baselineLinks;
  int baselineFlits;
  int totalFlits;

};

// Output operator declaration
ostream& operator<<(ostream& out, const GarnetNetwork_d& obj);

// ******************* Definitions *******************
// Output operator definition
extern inline
ostream& operator<<(ostream& out, const GarnetNetwork_d& obj)
{
  obj.print(out);
  out << flush;
  return out;
}

#endif //GARNETNETWORK_D_H
