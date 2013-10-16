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
 * NetworkLink_CN.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "NetworkLink_CN.h"
#include "NetworkConfig.h"
#include "GarnetNetwork_d.h"
//#include "SetupNetwork.h"
#include "OutputUnit_CN.h"
#include "RequestMsg.h"
#include "ResponseMsg.h"
#include "CacheMsg.h"

NetworkLink_CN::NetworkLink_CN(int id)
{
	m_id = id;
	m_latency = 1;
//#ifdef CS_NOC
//    m_flit_width = NetworkConfig::getFlitSize() * NetworkConfig::getVCsPerClass();
//#else
	m_flit_width = NetworkConfig::getFlitSize();
//#endif

	//linkBuffer = new flitBuffer_CN();
	m_link_utilized = 0;
    m_num_buffer_writes = 0.0;
    m_num_buffer_reads = 0.0;
//#ifdef CS_NOC
    //In CS_NOC, we assume the number of VC is 1
//    m_vc_load.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//	m_vc_streamload.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//#else
//    m_vc_load.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
    m_vc_load.setSize(1 * NUMBER_OF_VIRTUAL_NETWORKS);
//	m_vc_streamload.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
	m_vc_streamload.setSize(1 * NUMBER_OF_VIRTUAL_NETWORKS);
//#endif //CS_NOC

//#ifdef CS_NOC
//	for(int i = 0; i < 1*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#else
//	for(int i = 0; i < NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS; i++)
	for(int i = 0; i < 1 * NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#endif //CS_NOC
    {        
		m_vc_load[i] = 0;
		m_vc_streamload[i] = 0;
    }
    m_dest_router = NULL;
    m_dest_intf = NULL;
    m_output_unit = NULL;
}

//NetworkLink_CN::NetworkLink_CN(int id, int link_latency, GarnetNetwork_d *net_ptr, LinkType type, int machID, int src, int dest)
NetworkLink_CN::NetworkLink_CN(int id, int link_latency, CircuitNetwork *net_ptr, LinkType type, int machID, int src, int dest)
{
    m_num_buffer_writes = 0.0;
    m_num_buffer_reads = 0.0;

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
    if (type == LinkType_Out)
    {
        //Here we only deal with local outlink
        isLocalLink = true;
    }
    else
    {
        isLocalLink = false;
        
//        if (type == LinkType_In)
//        {
            linkBuffer.setSize(1);
            for(int i = 0; i < linkBuffer.size(); i++)
            {
                linkBuffer[i] = new flitBuffer_CN();
            }       

            link_srcQueue.setSize(1);
            for(int i = 0; i < link_srcQueue.size(); i++)
            {
                link_srcQueue[i] = new flitBuffer_CN();
            }
//        }
    }

	m_net_ptr = net_ptr;
	m_id = id;
	m_latency = link_latency;
	//linkBuffer = new flitBuffer_CN();
	m_link_utilized = 0;
	m_streamlink_utilized = 0;

//#ifdef CS_NOC
//	m_vc_load.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//	m_vc_streamload.setSize(1*NUMBER_OF_VIRTUAL_NETWORKS);
//#else
//	m_vc_load.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
	m_vc_load.setSize(1 * NUMBER_OF_VIRTUAL_NETWORKS);
//	m_vc_streamload.setSize(NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS);
	m_vc_streamload.setSize(1 * NUMBER_OF_VIRTUAL_NETWORKS);
//#endif

//#ifdef CS_NOC
//	for(int i = 0; i < 1*NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#else
//	for(int i = 0; i < NetworkConfig::getVCsPerClass()*NUMBER_OF_VIRTUAL_NETWORKS; i++)
	for(int i = 0; i < 1 * NUMBER_OF_VIRTUAL_NETWORKS; i++)
//#endif        
    {
		m_vc_load[i] = 0;
		m_vc_streamload[i] = 0;
    }
 
    m_dest_router = NULL;
    m_dest_intf = NULL;
   
}

void NetworkLink_CN::init(Router_CN * srcRouter)
{
    if (isLocalLink)
    {
        assert(m_output_unit != NULL);

        linkBuffer.setSize(srcRouter->get_num_inports());
        for(int i = 0; i < linkBuffer.size(); i++)
        {
            linkBuffer[i] = new flitBuffer_CN();
        }
        
        Vector<flitBuffer_CN *> srcQueue = m_output_unit->getOutQueue();
        link_srcQueue.setSize(srcRouter->get_num_inports());
        assert(link_srcQueue.size() == srcQueue.size()
                     && "link_srcQueue.size() != srcQueue.size() !!");
        for(int i = 0; i < link_srcQueue.size(); i++)
        {
            //link_srcQueue[i] = new flitBuffer_CN();
            link_srcQueue[i] = srcQueue[i];
        }
    }
    else
    {
/*
        if (m_link_type != LinkType_In)       
        {
            linkBuffer.setSize(1);
            for(int i = 0; i < linkBuffer.size(); i++)
            {
                linkBuffer[i] = new flitBuffer_CN();
            }       

            link_srcQueue.setSize(1);
            for(int i = 0; i < link_srcQueue.size(); i++)
            {
                link_srcQueue[i] = new flitBuffer_CN();
            }
        }
*/        
    }
}

NetworkLink_CN::~NetworkLink_CN()
{
    for (int i = 0; i < linkBuffer.size(); i++)
    {
        delete linkBuffer[i];
    }
	//delete linkBuffer;
}

void NetworkLink_CN::setLinkConsumer(Consumer *consumer)
{
	link_consumer = consumer;
}

void NetworkLink_CN::setSourceQueue(Vector<flitBuffer_CN *> srcQueue)
{
//    cerr << "link_srcQueue.size() = " <<  link_srcQueue.size() << endl;
//    cerr << "srcQueue.size() = " << srcQueue.size() << endl;
    assert(link_srcQueue.size() == srcQueue.size()
            && "link_srcQueue.size() != srcQueue.size() !!");

	for(int i = 0; i < srcQueue.size(); i++)
    {
        link_srcQueue[i] = srcQueue[i];
    }
}

void NetworkLink_CN::wakeup()
{
    //Here I modify the codes
    //Assume each NetworkLink_CN that connected to the NetworkInterface_CN has multiple link_srcQueues 
    //each link_srcQueue corresponds to one other port in the switch ( excluding the local port )
    if (m_dest_intf != NULL && g_eventQueue_ptr->getTime() > DEBUG_START_TIME)
    {

        // assert(0 && "m_dest_intf networklink_cn wakeup!!");
        DEBUG_EXPR(NETWORK_COMP, MedPrio, g_eventQueue_ptr->getTime());
        DEBUG_MSG(NETWORK_COMP, MedPrio, "m_dest_intf: " + int_to_string(m_dest_intf->get_id()) + " executing!");
        DEBUG_MSG(NETWORK_COMP, MedPrio, "link_srcQueue.size() = " + int_to_string(link_srcQueue.size()));
        for(int index = 0; index < link_srcQueue.size(); index++)
        {
            if(link_srcQueue[index]->isReady())
            {
                 DEBUG_MSG(NETWORK_COMP, MedPrio, "########Debuging inNetLink of NI: " + int_to_string(m_id) + " -------- NetworkLink_CN: link_srcQueue_index: " + int_to_string(index));
                 DEBUG_EXPR(NETWORK_COMP, MedPrio, *(link_srcQueue[index]));
            }
//            DEBUG_MSG(NETWORK_COMP, MedPrio, "########Debuging inNetLink of NI: " + int_to_string(m_id) + " -------- NetworkLink_CN: link_srcQueue_index: " + int_to_string(index));
            DEBUG_MSG(NETWORK_COMP, MedPrio, "link_srcQueue[" + int_to_string(index) + "] 's size =  " + int_to_string( link_srcQueue[index]->numElements() ));

            if(m_dest_intf != NULL && m_dest_intf->get_id() == 36 && g_eventQueue_ptr->getTime() > DEBUG_START_TIME)
            {
                DEBUG_MSG(NETWORK_COMP, MedPrio, "link_srcQueue[index] 's size =  " + int_to_string( link_srcQueue[index]->numElements() ));
                if( link_srcQueue[index]->numElements() > 0 )
                {
                    flit_CN *t_flit = link_srcQueue[index]->peekTopFlit();
                    DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_time());
                    DEBUG_MSG(NETWORK_COMP, MedPrio, g_eventQueue_ptr->getTime());
                    DEBUG_EXPR(NETWORK_COMP, MedPrio, *(link_srcQueue[index]));
                }
            }
        }

    }

    for(int index = 0; index < link_srcQueue.size(); index++)
    {
        if(link_srcQueue[index]->isReady())
        {
            if(m_dest_intf != NULL)
            {
            //    assert(0 && "m_dest_intf != NULL && link_srcQueue is ready!!");
            }
            if(m_dest_intf != NULL && m_dest_intf->get_id() == 36 && g_eventQueue_ptr->getTime() > DEBUG_START_TIME)
            {
                DEBUG_MSG(NETWORK_COMP, MedPrio, "#################Debuging inNetLink of NI 36 -------- NetworkLink_CN: link_srcQueue_index: " + int_to_string(index));
                DEBUG_EXPR(NETWORK_COMP, MedPrio, *(link_srcQueue[index]));
            }

            flit_CN *t_flit = link_srcQueue[index]->getTopFlit();
            DEBUG_MSG(NETWORK_COMP, MedPrio, "executing");
            DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_msg_ptr());
            t_flit->set_time(g_eventQueue_ptr->getTime() + m_latency);

            if (m_dest_router != NULL)
            {
                if ( m_dest_intf != NULL)
                {
                    //cerr << "m_dest_router : " << m_dest_router->get_id() << endl;
                    //cerr << "m_dest_intf : " << m_dest_intf->get_id() << endl;
                }
                assert(m_dest_intf == NULL);
//                cerr << "m_dest_router = " << m_dest_router->get_id() << endl;
                int outport;
                //cout << "NetworkLink_CN: Before get_num_outports() : " << m_dest_router->get_id()  << endl;
                if (m_dest_router->get_net_ptr()->m_id == 0)
                {

                    for(outport = 0; outport < m_dest_router->get_num_outports(); outport++) 
                    {                
                        if(m_dest_router->m_port_connect[outport][m_dest_portNum])
                        {
                            //cout << "t_flit->m_destID: " << t_flit->m_destID << endl;
                            //cout << "connect_pair.second: " << m_dest_router->m_port_connect_pair[outport][m_dest_portNum].second << endl;
                            //cout << "t_flit->m_srcNetIntfID: " << t_flit->m_srcNetIntfID << endl;
                            //cout << "connect_pair.first: " << m_dest_router->m_port_connect_pair[outport][m_dest_portNum].first << endl;
                            if (t_flit->m_destID == m_dest_router->m_port_connect_pair[outport][m_dest_portNum].second
                                    && t_flit->m_srcNetIntfID == m_dest_router->m_port_connect_pair[outport][m_dest_portNum].first)
                                break;
                        }
                    }
                    //cout << "NetworkLink_CN: After get_num_outports() : " << m_dest_router->get_id() << endl;
                    //cout << "NetworkLink_CN: m_port_connect: Outport : " <<  outport << " , Inport : " << m_dest_portNum << endl;
                    if(outport == m_dest_router->get_num_outports())
                    {
                        cerr << g_eventQueue_ptr->getTime() << " : " << endl;
                        cerr << "CS_NOC is : " << m_net_ptr->m_id << endl;
                        cerr << "t_flit->m_srcNetIntfID: " << t_flit->m_srcNetIntfID << endl;
                        cerr << "t_flit->m_destID: " << t_flit->m_destID << endl;
                        cerr << "circuit_path status is : " << m_net_ptr->m_circuit_paths[t_flit->m_srcNetIntfID][t_flit->m_destID] 
                            << endl;
                        //m_net_ptr->get_gnet_d()->m_setupnet_ptr->printCircuitMap();
                        m_net_ptr->get_gnet_d()->printCircuitMap();
                        assert(0 && "flits are scheduled, but circuit has not been built yet");
                    }

                }
                else
                {
                    outport = m_dest_router->m_routing_unit->routeCompute(t_flit); 
                }

                t_flit->advance_stage(ST_);
                t_flit->set_outport(outport);

                m_dest_router->update_sw_winner(m_dest_portNum, t_flit);
            }
            else
            {
                assert(m_dest_intf != NULL);
                //cout << "NetworkLink_CN: before schedule link_consumer : " << m_dest_intf->get_id()  << endl;
                DEBUG_MSG(NETWORK_COMP, MedPrio, "m_dest_intf executing");
                DEBUG_EXPR(NETWORK_COMP, MedPrio, "m_dest_intf = " + int_to_string(m_dest_intf->get_id()));
                DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_msg_ptr());
                t_flit->advance_stage(I_);
                linkBuffer[index]->insert(t_flit);
                g_eventQueue_ptr->scheduleEvent(link_consumer, m_latency);
                //cout << "NetworkLink_CN: after schedule link_consumer : " << m_dest_intf->get_id()  << endl;
            }
            //linkBuffer->insert(t_flit);
            //the link_consumer should wake up m_switch
            //g_eventQueue_ptr->scheduleEvent(link_consumer, m_latency);
            m_link_utilized++;
            m_vc_load[t_flit->get_vc()]++;

            m_num_buffer_reads++;
            m_num_buffer_writes++;

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
                   << " : in NetworkLink_CN.C" << std::endl;    
                   std::cout << "*****************************************" << std::endl;*/
                assert(response_msg_ptr == NULL);
                assert(cache_msg_ptr == NULL);
                if ( request_msg_ptr->m_Type == CoherenceRequestType_BIC_INTRANS_DATA
                        || request_msg_ptr->m_Type == CoherenceRequestType_BIC_OUTTRANS_DATA )
                {
                    /*                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;
                                      std::cout << "find a stream request message in NetworkLink_CN.C" << std::endl;    
                                      std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;*/

                    m_streamlink_utilized++;
                    m_vc_streamload[t_flit->get_vc()]++;
                }
            }

            if (response_msg_ptr != NULL)
            {
                /*            std::cout << "*****************************************" << std::endl;
                              std::cout << g_eventQueue_ptr->getTime() << " : find a response message " << response_msg_ptr->m_Type 
                              << " : in NetworkLink_CN.C" << std::endl;    
                              std::cout << "*****************************************" << std::endl;*/

                assert(request_msg_ptr == NULL);
                assert(cache_msg_ptr == NULL);

                if ( response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA_COPY
                        || response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA
                        || response_msg_ptr->m_Type == CoherenceResponseType_BIC_READ_ACK)
                {
                    /*                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;
                                      std::cout << "find a stream response message in NetworkLink_CN.C" << std::endl;    
                                      std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;*/

                    m_streamlink_utilized++;
                    m_vc_streamload[t_flit->get_vc()]++;
                }
            }

            if (cache_msg_ptr != NULL)
            {
                /*            std::cout << "*****************************************" << std::endl;
                              std::cout << g_eventQueue_ptr->getTime() << " : find a cache message " << cache_msg_ptr->m_Type 
                              << " : in NetworkLink_CN.C" << std::endl;    
                              std::cout << "*****************************************" << std::endl;*/

                assert(request_msg_ptr == NULL);
                assert(response_msg_ptr == NULL);

                if ( cache_msg_ptr->m_Type == CacheRequestType_BIC_WRITE)
                {
                    /*                std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;
                                      std::cout << "find a stream cache message in NetworkLink_CN.C" << std::endl;    
                                      std::cout << "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS" << std::endl;*/

                    m_streamlink_utilized++;
                    m_vc_streamload[t_flit->get_vc()]++;
                }
            }
        }
    }
}

Vector<int> NetworkLink_CN::getVcLoad()
{
	return m_vc_load;
}

Vector<int> NetworkLink_CN::getVcStreamLoad()
{
    return m_vc_streamload;
}

int NetworkLink_CN::getLinkUtilization()
{
	return m_link_utilized;
}

int NetworkLink_CN::getStreamLinkUtilization()
{
	return m_streamlink_utilized;
}
