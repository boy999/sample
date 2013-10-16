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
 * NetworkLink_d.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "NetworkLink_d.h"
#include "NetworkConfig.h"
#include "GarnetNetwork_d.h"

#include "RequestMsg.h"
#include "ResponseMsg.h"
#include "CacheMsg.h"

NetworkLink_d::NetworkLink_d(int id)
{
	m_id = id;
	m_latency = 1;
//#ifdef CS_NOC
//    m_flit_width = NetworkConfig::getFlitSize() * NetworkConfig::getVCsPerClass();
//#else
	m_flit_width = NetworkConfig::getFlitSize();
	//cerr << "Network Link id - " << m_id << endl;
    //cerr << "\t m_flit_width = " << m_flit_width << endl;
//#endif

	linkBuffer = new flitBuffer_d();
	m_link_utilized = 0;
//#ifdef CS_NOC
    //In CS_NOC, we assume the number of VC is 1
//    m_vc_load.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//	m_vc_streamload.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//#else
    m_vc_load.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
	m_vc_streamload.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
//#endif //CS_NOC

//#ifdef CS_NOC
//	for(int i = 0; i < 1*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#else
	for(int i = 0; i < NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#endif //CS_NOC
    {        
		m_vc_load[i] = 0;
		m_vc_streamload[i] = 0;
    }
}

NetworkLink_d::NetworkLink_d(int id, int link_latency, GarnetNetwork_d *net_ptr, LinkType type, int machID, int src, int dest)
{
    m_flit_width = NetworkConfig::getFlitSize();
    m_link_src = src;
    m_link_dest = dest;
    if (machID == -1) // this link is Internal Links
    {
        assert(type == LinkType_Internal);
        m_mach_type = MachineType_NUM;
    }
    else if (machID >= 0 && machID < (0+RubyConfig::numberOfL2Cache()) )
    {
        m_mach_type = MachineType_L2Cache;
    }
    else if (machID >= (0+RubyConfig::numberOfL2Cache()) 
            && machID < (0+RubyConfig::numberOfL2Cache()+RubyConfig::numberOfL1Cache()))
    {
        m_mach_type = MachineType_L1Cache;
    }
    else if (machID >= (0+RubyConfig::numberOfL2Cache()+RubyConfig::numberOfL1Cache())
            && machID < (0+RubyConfig::numberOfL2Cache()+RubyConfig::numberOfL1Cache()+RubyConfig::numberOfDirectory()))
    {
        m_mach_type = MachineType_Directory;
    }
    else if (machID >= (0+RubyConfig::numberOfL2Cache()+RubyConfig::numberOfL1Cache()+RubyConfig::numberOfDirectory())
            && machID < (0+RubyConfig::numberOfL2Cache()+RubyConfig::numberOfL1Cache()+RubyConfig::numberOfDirectory()+RubyConfig::numberOfSimicsNetworkPort()))
    {
        m_mach_type = MachineType_SimicsNetworkPort;
    }
    else
    {
        assert(0 && "No matching MachineType!");
    }

    m_link_type = type;
	m_net_ptr = net_ptr;
	m_id = id;
	m_latency = link_latency;
	linkBuffer = new flitBuffer_d();
	m_link_utilized = 0;
	m_streamlink_utilized = 0;

//#ifdef CS_NOC
//	m_vc_load.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//	m_vc_streamload.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//#else
	m_vc_load.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
	m_vc_streamload.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
//#endif

//#ifdef CS_NOC
//	for(int i = 0; i < 1*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#else
	for(int i = 0; i < NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#endif        
    {
		m_vc_load[i] = 0;
		m_vc_streamload[i] = 0;
    }
}

NetworkLink_d::~NetworkLink_d()
{
	delete linkBuffer;
}

void NetworkLink_d::setLinkConsumer(Consumer *consumer)
{
	link_consumer = consumer;
}

void NetworkLink_d::setSourceQueue(flitBuffer_d *srcQueue)
{
	link_srcQueue = srcQueue;
}

void NetworkLink_d::wakeup()
{
	if(link_srcQueue->isReady())
	{
		flit_d *t_flit = link_srcQueue->getTopFlit();
		t_flit->set_time(g_eventQueue_ptr->getTime() + m_latency);
        t_flit->advance_stage(I_);
		linkBuffer->insert(t_flit);
		g_eventQueue_ptr->scheduleEvent(link_consumer, m_latency);
		m_link_utilized++;
		m_vc_load[t_flit->get_vc()]++;
		
        /*
         * Check whether the response message is one of the following types:
         * 
         * CoherenceResponseType:BIC_READ_ACK ;; the responsed/read data message from buffer to accelerator
         * CacheRequestType:BIC_WRITE ;; the request/write data message from accelerator to buffer         
         * 
         * CoherenceRequestType:BIC_INTRANS_DATA ;; the read data moved from cache to buffer 
         * CoherenceRequestType:BIC_OUTTRANS_DATA ;; the data moved from buffer to cache
         *
         * CoherenceResponseType:BIC_MEMORY_DATA_COPY ;; read data from memory controller to cache
         * CoherenceResponseType:BIC_MEMORY_DATA ;; read data from memory controller to buffer
         *
         * CoherenceRequestType:BIC_OUTTRANS_DATA ;; the data moved from cache to memory controller
         *
         * if the flit belongs to one of the above types, then we consider the flit in stream data
         * */
       
        MsgPtr msg_ptr = t_flit->get_msg_ptr();
        RequestMsg *request_msg_ptr = dynamic_cast<RequestMsg*>(msg_ptr.ref());
        ResponseMsg *response_msg_ptr = dynamic_cast<ResponseMsg*>(msg_ptr.ref());
        CacheMsg *cache_msg_ptr = dynamic_cast<CacheMsg*>(msg_ptr.ref());

        if (request_msg_ptr != NULL)
        {
            /*
            std::cout << "*****************************************" << std::endl;
            std::cout << g_eventQueue_ptr->getTime()  << " : find a request message " << request_msg_ptr->m_Type 
                << " : in NetworkLink_d.C" << std::endl;    
            std::cout << "*****************************************" << std::endl;*/
            assert(response_msg_ptr == NULL);
            assert(cache_msg_ptr == NULL);
            if ( request_msg_ptr->m_Type == CoherenceRequestType_BIC_INTRANS_DATA
                    || request_msg_ptr->m_Type == CoherenceRequestType_BIC_OUTTRANS_DATA )
            {
/*                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;
                std::cout << "find a stream request message in NetworkLink_d.C" << std::endl;    
                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;*/

		        m_streamlink_utilized++;
                m_vc_streamload[t_flit->get_vc()]++;
            }
        }

        if (response_msg_ptr != NULL)
        {
/*            std::cout << "*****************************************" << std::endl;
            std::cout << g_eventQueue_ptr->getTime() << " : find a response message " << response_msg_ptr->m_Type 
                << " : in NetworkLink_d.C" << std::endl;    
            std::cout << "*****************************************" << std::endl;*/

            assert(request_msg_ptr == NULL);
            assert(cache_msg_ptr == NULL);

            if ( response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA_COPY
                    || response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA
                    || response_msg_ptr->m_Type == CoherenceResponseType_BIC_READ_ACK)
            {
/*                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;
                std::cout << "find a stream response message in NetworkLink_d.C" << std::endl;    
                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;*/

		        m_streamlink_utilized++;
                m_vc_streamload[t_flit->get_vc()]++;
            }
        }

        if (cache_msg_ptr != NULL)
        {
/*            std::cout << "*****************************************" << std::endl;
            std::cout << g_eventQueue_ptr->getTime() << " : find a cache message " << cache_msg_ptr->m_Type 
                << " : in NetworkLink_d.C" << std::endl;    
            std::cout << "*****************************************" << std::endl;*/

            assert(request_msg_ptr == NULL);
            assert(response_msg_ptr == NULL);

            if ( cache_msg_ptr->m_Type == CacheRequestType_BIC_WRITE)
            {
/*                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;
                std::cout << "find a stream cache message in NetworkLink_d.C" << std::endl;    
                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;*/

		        m_streamlink_utilized++;
                m_vc_streamload[t_flit->get_vc()]++;
            }
        }
	}
}

Vector<int> NetworkLink_d::getVcLoad()
{
	return m_vc_load;
}

Vector<int> NetworkLink_d::getVcStreamLoad()
{
    return m_vc_streamload;
}

int NetworkLink_d::getLinkUtilization()
{
	return m_link_utilized;
}

void NetworkLink_d::printStats(ostream& out)
{
    out << "NetworkLink: " << m_id << endl;
    out << "m_link_utilized: " << m_link_utilized << endl;
    out << "m_flit_width: " << m_flit_width << endl;
    return;
}

int NetworkLink_d::getStreamLinkUtilization()
{
	return m_streamlink_utilized;
}
