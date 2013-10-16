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
 * NetworkLink_d.h
 *
 * Niket Agarwal, Princeton University
 *
 * */

#ifndef NETWORK_LINK_D_H
#define NETWORK_LINK_D_H

#include "NetworkHeader.h"
#include "Consumer.h"
#include "flitBuffer_d.h"
#include "PrioHeap.h"
//#include "power_bus.h"
#include "NetworkPowerArea.h"
#include "MachineType.h"

#ifndef __LinkType
#define __LinkType
enum LinkType {
    LinkType_FIRST,
    LinkType_In = LinkType_FIRST,
    LinkType_Out,
    LinkType_Internal,
    LinkType_Num
};
#endif

class GarnetNetwork_d;

class NetworkLink_d : public Consumer {
public:
	NetworkLink_d(int id);
	~NetworkLink_d();

	NetworkLink_d(int id, int link_latency, GarnetNetwork_d *net_ptr, LinkType type, int machID, int src, int dest);
	void setLinkConsumer(Consumer *consumer);
	void setSourceQueue(flitBuffer_d *srcQueue);
  	void print(ostream& out) const{}
    void printStats(ostream& out);
	int getLinkUtilization();
	int getStreamLinkUtilization();
    LinkType getLinkType() { return m_link_type; }
    MachineType getMachType() {return m_mach_type; }
    int getLinkSrc() {return m_link_src; }
    int getLinkDest() {return m_link_dest;}
	Vector<int> getVcLoad();
	Vector<int> getVcStreamLoad(); //Bo: add to monitor the stream data load
	int get_id(){return m_id;}
	void wakeup();

	//double calculate_offline_power(power_bus*);
    double calculate_offline_power();
	double calculate_power();
    double calculate_area();

	inline bool isReady()
	{
		return linkBuffer->isReady();
	}
	inline flit_d* peekLink()
	{
		return linkBuffer->peekTopFlit();
	}
	inline flit_d* consumeLink()
	{		
		return linkBuffer->getTopFlit();
	}
    inline int get_flit_width()
    {
        return m_flit_width;
    }

protected:
    LinkType m_link_type;
    MachineType m_mach_type;
	int m_id;
	int m_latency;
    int m_link_src;
    int m_link_dest;

	GarnetNetwork_d *m_net_ptr;

	flitBuffer_d *linkBuffer;
	Consumer *link_consumer;	
	flitBuffer_d *link_srcQueue;
	int m_link_utilized;
	int m_streamlink_utilized;
	Vector<int > m_vc_load; 
	Vector<int > m_vc_streamload; //Bo: add to monitor the traffic of buffer access data
	int m_flit_width;
};

#endif

