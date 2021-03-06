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
 * NetworkInterface_d.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "NetworkInterface_d.h"
#include "MessageBuffer.h"
#include "flitBuffer_d.h"	
#include "NetworkMessage.h"

#include "RequestMsg.h"
#include "ResponseMsg.h"
#include "CacheMsg.h"

NetworkInterface_d::NetworkInterface_d(int id, int virtual_networks, GarnetNetwork_d *network_ptr)
{
	m_id = id;	
	m_net_ptr = network_ptr;
	m_virtual_networks  = virtual_networks;
//#ifdef CS_NOC
//    std::cerr << "CS_NOC m_vc_per_vnet = 1" << endl;
//    std::cout << "CS_NOC m_vc_per_vnet = 1" << endl;
//    m_vc_per_vnet = 1;
//#else
    m_vc_per_vnet = NetworkConfig::getVCsPerClass();
//#endif
    m_num_vcs = m_vc_per_vnet*m_virtual_networks;

    m_streaming_flit = 0;
    m_streaming_flit_nosupport = 0;
    m_num_setupreq = 0.0;
    m_num_freereq = 0.0;
    
    m_num_succ_exist_setupreq = 0.0;
    m_num_succ_new_setupreq = 0.0;
    m_num_fail_freeing_setupreq = 0.0;
    m_num_fail_conflict_setupreq = 0.0;

    m_vc_round_robin = 0;
    m_ni_buffers.setSize(m_num_vcs);
    m_ni_enqueue_time.setSize(m_num_vcs);
    inNode_ptr.setSize(m_virtual_networks);
    outNode_ptr.setSize(m_virtual_networks);
	creditQueue = new flitBuffer_d(); 

	for(int i =0; i < m_num_vcs; i++)
	{
		m_ni_buffers[i] = new flitBuffer_d(); // instantiating the NI flit buffers
		m_ni_enqueue_time[i] = INFINITE_;
	}
	 m_vc_allocator.setSize(m_virtual_networks); // 1 allocator per virtual net
	 for(int i = 0; i < m_virtual_networks; i++)
	 {
		 m_vc_allocator[i] = 0;
	 }
		
	 for(int i = 0; i < m_num_vcs; i++)
	 {
	 	m_out_vc_state.insertAtBottom(new OutVcState_d(i));
		m_out_vc_state[i]->setState(IDLE_, g_eventQueue_ptr->getTime());
	 }

     // initialize the random integer
     random_lowest = 1;
     random_highest = 10;
     random_range = (random_highest - random_lowest)+1;
}

NetworkInterface_d::~NetworkInterface_d()
{
	m_out_vc_state.deletePointers();
	m_ni_buffers.deletePointers();
	delete creditQueue;
	delete outSrcQueue;
}

void NetworkInterface_d::addInPort(NetworkLink_d *in_link, CreditLink_d *credit_link, Router_d *in_router)
{
    m_router = in_router;
	inNetLink = in_link;
	in_link->setLinkConsumer(this);
	m_ni_credit_link = credit_link;
	credit_link->setSourceQueue(creditQueue);
}

void NetworkInterface_d::addOutPort(NetworkLink_d *out_link, CreditLink_d *credit_link, Router_d * out_router)
{
    m_router = out_router;
	m_credit_link = credit_link;
	credit_link->setLinkConsumer(this);

	outNetLink = out_link;
	outSrcQueue = new flitBuffer_d();
	out_link->setSourceQueue(outSrcQueue);
}

void NetworkInterface_d::addNode(Vector<MessageBuffer*>& in,  Vector<MessageBuffer*>& out)
{
	ASSERT(in.size() == m_virtual_networks);
	inNode_ptr = in;
	outNode_ptr = out;
	for (int j = 0; j < m_virtual_networks; j++)
	{
		inNode_ptr[j]->setConsumer(this);  // So that protocol injects messages into the NI
	}
}

bool NetworkInterface_d::flitisizeMessage(MsgPtr msg_ptr, int vnet)
{
    RequestMsg *request_msg_ptr = dynamic_cast<RequestMsg*>(msg_ptr.ref());
    bool isDataMsg; //true: normal data msg; false: setup or free msg
    bool setuporfree;

    if (request_msg_ptr != NULL)
    {
        if ( request_msg_ptr->m_Type == CoherenceRequestType_CirPath1_Setup 
                || request_msg_ptr->m_Type == CoherenceRequestType_CirPath2_Setup )
        {
            isDataMsg = false;
            setuporfree = true;
        }        
        else if ( request_msg_ptr->m_Type == CoherenceRequestType_CirPath1_Free
             || request_msg_ptr->m_Type == CoherenceRequestType_CirPath2_Free )
        {
            isDataMsg = false;
            setuporfree = false;
        }
        else
        {
            isDataMsg = true;
        }     
    }
    else
    {
        isDataMsg = true;
    }

	NetworkMessage *net_msg_ptr = dynamic_cast<NetworkMessage*>(msg_ptr.ref());
	NetDest net_msg_dest = net_msg_ptr->getInternalDestination(); 
	Vector<NodeID> dest_nodes = net_msg_dest.getAllDest(); // gets all the destinations associated with this message.
//#ifdef CS_NOC
//	int num_flits = (int) ceil((double) MessageSizeType_to_int(net_msg_ptr->getMessageSize())/(NetworkConfig::getFlitSize() * NetworkConfig::getVCsPerClass()) ); // Number of flits is dependent on the link bandwidth available. This is expressed in terms of bytes/cycle or the flit size 
//#else
	int num_flits = (int) ceil((double) MessageSizeType_to_int(net_msg_ptr->getMessageSize())/NetworkConfig::getFlitSize() ); // Number of flits is dependent on the link bandwidth available. This is expressed in terms of bytes/cycle or the flit size 
//#endif
	
	for(int ctr = 0; ctr < dest_nodes.size(); ctr++) // loop because we will be converting all multicast messages into unicast messages
	{
		int vc = calculateVC(vnet); // this will return a free output virtual channel
		if(vc == -1)
		{
			return false ;
		}	
		MsgPtr new_msg_ptr = *(msg_ptr.ref());
		NodeID destID = dest_nodes[ctr];	

        //add for test
        DEBUG_EXPR(NETWORK_COMP, MedPrio, destID);
		
        NetworkMessage *new_net_msg_ptr = dynamic_cast<NetworkMessage*>(new_msg_ptr.ref());
		if(dest_nodes.size() > 1)
		{	
			NetDest personal_dest;
			for(int m = 0; m < (int) MachineType_NUM; m++)
			{
				if((destID >= MachineType_base_number((MachineType) m)) && destID < MachineType_base_number((MachineType) (m+1)))
				{	
					// calculating the NetDest associated with this destination ID
					personal_dest.clear();
					personal_dest.add((MachineID) {(MachineType) m, (destID - MachineType_base_number((MachineType) m))});
					new_net_msg_ptr->getInternalDestination() = personal_dest; 	
					break;
				}
			}
			net_msg_dest.removeNetDest(personal_dest);
			net_msg_ptr->getInternalDestination().removeNetDest(personal_dest); // removing the destination from the original message to reflect that a message with this particular destination has been flitisized and an output vc is acquired
		}

        if(!isDataMsg)
        {
            int csnoc_index = -1;
            if (setuporfree) 
            {
                int i = -1;
                if ( request_msg_ptr->m_Type == CoherenceRequestType_CirPath1_Setup )
                {
                    m_num_setupreq++;
                    i = 0;
                }
                else if ( request_msg_ptr->m_Type == CoherenceRequestType_CirPath2_Setup )
                {
                    //cerr << "setuporfree is false!!!" << endl;
                    i = 1;
                    m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] = FINISH;
                    return true;  //we don't need to setup the circuit path for CSNOC2
                }
                else
                {
                    assert(0 && "unidentified request type");
                }

                //            for (int i = 0; i < m_net_ptr->m_cirnet_ptr.size(); i++)
                //            {
                /*
                if ( m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] == BUILD 
                        || m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] == FINISH )
                {
                    // the path is being built or exists
                    m_num_succ_exist_setupreq++;
                    return true;

                    //csnoc_index = i;
                    //break;
                }
                */

                //for debug
                if(m_id == 11 && destID == 51)
                {
                    cerr << "Time = " << g_eventQueue_ptr->getTime() 
                        << "on CSNOC : " << i
                        << " : setup path from 11 to 51 : " 
                        <<  m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] << endl;
                }
                //else if ( m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] == FREE )
                if ( m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] == FREE 
                        || m_net_ptr->m_circuitnet_ptr[i]->m_circuit_preFree[m_id][destID] == true)
                {
                    //for debug
                    //if(m_id == 11 && destID == 51)
                    //{
                    //    cerr << "Time = " << g_eventQueue_ptr->getTime() << " : failure of setting up path from 11 to 51 due to freeing the exact path "  << endl;
                    //}

                    // the path is being freed
                    m_num_fail_freeing_setupreq++;
                    return false;
                }

                //assert( m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destID] == BUILD );
                assert( m_net_ptr->m_circuitnet_ptr[i]->m_circuit_preBuild[m_id][destID] == true );
                bool flag = true;

                if (i == 0)
                {
                    flag = m_net_ptr->CirNetHasNoConflict(i, (int)m_id, (int)destID, true); 
                }
                /*
                   for (int j = 0; j < m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id].size(); j++)
                   {
                   if (m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][j] == true)
                   {
                   flag = false;
                   break;
                   }                        
                   }

                   for(int j = 0; j < m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths.size(); j++)
                   {
                   if (m_net_ptr->m_cirnet_ptr[i]->m_circuit_paths[j][destID] == true)
                   {
                   flag = false;
                   break;
                   }
                   }*/
                if (flag)
                {
                    if(m_id == 11 && destID == 51)
                    {
                        cerr << "Time = " << g_eventQueue_ptr->getTime() << " : Success of setting up path from 11 to 51 due to freeing the exact path "  << endl;
                    }

                    m_num_succ_new_setupreq++;
                    csnoc_index = i;
                    //                    break;
                }
                else
                {
                    if(m_id == 11 && destID == 51)
                    {
                        cerr << "Time = " << g_eventQueue_ptr->getTime() << " : Failure of setting up path from 11 to 51 due to conflicts with the path "  << endl;
                        assert(0);
                    }
                    
                    m_num_fail_conflict_setupreq++;
                    return false;
                }
                //            }
                /*
                if ( csnoc_index == -1 )
                {
                    m_net_ptr->printCircuitMap();
                    cout << g_eventQueue_ptr->getTime() << " : failed to setup the path: src: " << m_id << ", dest: " << destID << endl;
                    assert(0 && "no free CSNOC available, all CSNOC has been used");
                }*/
            }
            else 
            {
                //if there exists streaming data that using current cir path
                //we postpone the free msg
                /*           
                             for (int i = 0; i < m_net_ptr->m_circuitnet_ptr.size(); i++)
                             {
                             if ( m_net_ptr->m_cirnet_ptr[i]->m_circuit_paths[m_id][destID] == FINISH 
                             || m_net_ptr->m_cirnet_ptr[i]->m_circuit_paths[m_id][destID] == BUILD ) 
                             {
                             csnoc_index = i;
                             break;
                             }
                             }

                             if ( csnoc_index == -1 )
                             {
                             cout << g_eventQueue_ptr->getTime() << " : failed to free the path: src: " << m_id << ", dest: " << destID << endl;
                             cout << "status of the path from src: " << m_id << ", dest " << destID;
                             cout << " is : " << m_net_ptr->m_cirnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] << endl;
                             assert( 0 && "failed to free the path" );
                             }
                             */
                assert( m_net_ptr->m_circuitnet_ptr[0]->m_circuit_preFree[m_id][destID] == true );

                if ( request_msg_ptr->m_Type == CoherenceRequestType_CirPath1_Free )
                {
                    assert( m_net_ptr->m_circuitnet_ptr[0]->m_circuit_paths[m_id][destID] == FINISH 
                            || m_net_ptr->m_circuitnet_ptr[0]->m_circuit_paths[m_id][destID] == BUILD );
                    m_num_freereq++;
                    csnoc_index = 0;
                }
                else if ( request_msg_ptr->m_Type == CoherenceRequestType_CirPath2_Free )
                {
                    assert( m_net_ptr->m_circuitnet_ptr[1]->m_circuit_paths[m_id][destID] == FINISH 
                            || m_net_ptr->m_circuitnet_ptr[1]->m_circuit_paths[m_id][destID] == BUILD );

                    m_net_ptr->m_circuitnet_ptr[1]->m_circuit_paths[m_id][destID] = NONE;
                    csnoc_index = 1;
                    return true;
                }
                else
                {
                    assert(0 && "unidentified request type");
                }

                if(m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_cirpath_msgs[m_id][destID] > 0)
                {

                    return false;
                }

            }
            for(int i = 0; i < num_flits; i++)
            {
                //cout << "NetworkInterface_SN m_id = " <<  m_id << endl;
                //flit_SN *fl = new flit_SN(i, vc, vnet, num_flits, new_msg_ptr, (int)m_id, (int)destID, csnoc_index, setuporfree);
                flit_d *fl = new flit_d(i, vc, vnet, num_flits, new_msg_ptr, (int)m_id, (int)destID, csnoc_index, setuporfree);
                fl->m_srcNetIntfId = m_id;
                fl->m_destNode = destID;
                fl->m_CSNOC_index = csnoc_index;
                fl->m_setuporfree = setuporfree;

                //cout << "NetworkInterface_SN fl->m_srcNetIntfId = " <<  fl->m_srcNetIntfId << endl;
                fl->set_delay(g_eventQueue_ptr->getTime() - (msg_ptr.ref())->getTime());
                m_ni_buffers[vc]->insert(fl);
            }

            //            m_out_vc_state[vc]->setState(VC_AB_, g_eventQueue_ptr->getTime());           
            m_out_vc_state[vc]->setState(ACTIVE_, g_eventQueue_ptr->getTime());

            cerr << "CSNOC: " << csnoc_index << " : ";
            assert((csnoc_index >=0) && (csnoc_index < m_net_ptr->m_circuitnet_ptr.size()));
            if(setuporfree)
            {
                cerr << g_eventQueue_ptr->getTime() << " : begin setup cir path between src: " << m_id << ", dest: " << destID << endl;     
                if (csnoc_index == 0)
                {
                    m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] = BUILD;
                   
                    m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_preBuild[m_id][destID] = false;
                }
                else
                    m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] = FINISH;
            }
            else
            {
                cerr << g_eventQueue_ptr->getTime() << " : begin free cir path between src: " << m_id << ", dest: " << destID << endl;
                if (csnoc_index == 0)
                {
                    if(m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] == FINISH)
                    {
                        m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] = FREE;

                        m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_preFree[m_id][destID] = false;
                    }
                    else
                    {
                        cerr << "the status of the path from src: " << m_id << " to dest: " << destID 
                            << " is " <<  m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] 
                            << endl;
                        assert(0 && "should not happen");
                        //assert(m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] == BUILD);
                    }
                }

                else
                    m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[m_id][destID] = NONE;

                //assert(0 && "Test!!!");
            }
            //assert(setuporfree == true && "test!!!!");
            //add for debug
            //cerr << "network interface SN " << endl;
            //m_ni_buffers[vc]->print(cerr);
            if(csnoc_index == 0)
            {
            //    outNetLink->request_vc_link(vc, new_net_msg_ptr->getInternalDestination(), g_eventQueue_ptr->getTime(), csnoc_index, make_pair((int)m_id, (int)destID), setuporfree); // setting an output vc request for the next hop. It is only when an output vc is acquired at the next hop that this flit will be ready to traverse the link and into the next hop
            }           
        }
        else
        {
            for(int i = 0; i < num_flits; i++)
            {
                m_net_ptr->increment_injected_flits();
                flit_d *fl = new flit_d(i, vc, vnet, num_flits, new_msg_ptr);
                fl->advance_stage(I_);
                fl->set_delay(g_eventQueue_ptr->getTime() - (msg_ptr.ref())->getTime());
                m_ni_buffers[vc]->insert(fl);
            }
            m_ni_enqueue_time[vc] = g_eventQueue_ptr->getTime();
            m_out_vc_state[vc]->setState(ACTIVE_, g_eventQueue_ptr->getTime()); 
        }
	}
	return true ;
}

// Looking for a free output vc
int NetworkInterface_d::calculateVC(int vnet)
{
	for(int i = 0; i < m_vc_per_vnet; i++)
	{
		int delta = m_vc_allocator[vnet];
		m_vc_allocator[vnet]++;
		if(m_vc_allocator[vnet] == m_vc_per_vnet)
			m_vc_allocator[vnet] = 0;
	
		if(m_out_vc_state[(vnet*m_vc_per_vnet) + delta]->isInState(IDLE_, g_eventQueue_ptr->getTime()))
		{
			return ((vnet*m_vc_per_vnet) + delta);
		}
	}
	return -1;
}

/*
 * The NI wakeup checks whether there are any ready messages in the protocol buffer. If yes, 
 * it picks that up, flitisizes it into a number of flits and puts it into an output buffer 
 * and schedules the output link. On a wakeup it also checks whether there are flits in the 
 * input link. If yes, it picks them up and if the flit is a tail, the NI inserts the 
 * corresponding message into the protocol buffer. It also checks for credits being sent 
 * by the downstream router.
 */

void NetworkInterface_d::wakeup()
{
    DEBUG_EXPR(NETWORK_COMP, MedPrio, m_id);	
    DEBUG_MSG(NETWORK_COMP, MedPrio, "NI WOKE UP");	
    DEBUG_EXPR(NETWORK_COMP, MedPrio, g_eventQueue_ptr->getTime());	

    MsgPtr msg_ptr;

    //Checking for messages coming from the protocol	
    for (int vnet = 0; vnet < m_virtual_networks; vnet++) // can pick up a message/cycle for each virtual net
    {	
        //add for debug
        if(inNode_ptr[vnet]->isReady())
        {
            DEBUG_MSG(NETWORK_COMP, MedPrio, "Yes, there is a message waiting");
        }
        else
        {
            DEBUG_MSG(NETWORK_COMP, MedPrio, "No, there is no message waiting");
        }
        while(inNode_ptr[vnet]->isReady()) // Is there a message waiting
        {
            msg_ptr = inNode_ptr[vnet]->peekMsgPtr();
            DEBUG_MSG(NETWORK_COMP, MedPrio, "enter NI");
            DEBUG_EXPR(NETWORK_COMP, MedPrio, msg_ptr);
#ifdef CS_NOC 

            int num_flits = 0;
            //the codes is used to check whether the msg's src/dest match the circuit path
            //Currently, we only send the message with one destination through the circuit switch network
            //
            // Here, we simulation the chance of percentage of circuit-switched network
            // through random number generator
            //
            //int random_integer = random_lowest+int(random_range*rand()/(RAND_MAX + 1.0));
            int random_integer = g_eventQueue_ptr->getTime() % 10;
            cerr << "random_integer = " << random_integer << endl;
            if (isStreamData(msg_ptr) && random_integer <= NetworkConfig::getCSPercent())
            {
                NetworkMessage *net_msg_ptr = dynamic_cast<NetworkMessage*>(msg_ptr.ref());
                NetDest net_msg_dest = net_msg_ptr->getInternalDestination();
                Vector<NodeID> dest_nodes = net_msg_dest.getAllDest(); // gets all the destinations associated with this message.
                //count the number of streaming flits in the NoC
                num_flits = (int) ceil((double) MessageSizeType_to_int(net_msg_ptr->getMessageSize())/NetworkConfig::getFlitSize() );

                if(dest_nodes.size() == 1)
                {
                    bool EnqueueCSNOC = false;
                    NodeID destNode = dest_nodes[0];
                    ResponseMsg *response_msg_ptr = dynamic_cast<ResponseMsg*>(msg_ptr.ref());
/*
                    if (response_msg_ptr != NULL)
                    {

                        if ( response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA_COPY 
                                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA )
                        {
                            MessageBuffer* circuitQueue = m_net_ptr->m_circuitnet_ptr[1]->getToNetQueue(m_id, 
                                    m_net_ptr->m_ordered[vnet], vnet);
                            assert(circuitQueue != NULL && "circuitQueue is NULL!!!");
                            //cout << "circuit switch enqueue: "<< endl;
                            //cout << "m_id = " << m_id << " , destNode = " << destNode << endl;
                            circuitQueue->enqueue(msg_ptr, 1);
                            m_net_ptr->m_circuitnet_ptr[1]->m_cirpath_msgs[m_id][destNode] += 1;
                            EnqueueCSNOC = true;
                            //g_eventQueue_ptr->scheduleEvent((Consumer*)m_net_ptr->m_circuitnet_ptr->m_ni_ptr_vector[m_id],1);
                            inNode_ptr[vnet]->pop();
                            m_streaming_flit += num_flits;
                            m_net_ptr->streamDataCSCount(msg_ptr, num_flits);

                            //cout << "circuit switch enqueue finishes: "<< endl;
                            continue;

                        }
                    }
*/
                    for(int i = 0; i < m_net_ptr->m_circuitnet_ptr.size(); i++)
                    {
                        if(m_net_ptr->m_circuitnet_ptr[i]->m_circuit_paths[m_id][destNode] == FINISH)
                        {
                            MessageBuffer* circuitQueue = m_net_ptr->m_circuitnet_ptr[i]->getToNetQueue(m_id, 
                                    m_net_ptr->m_ordered[vnet], vnet);
                            assert(circuitQueue != NULL && "circuitQueue is NULL!!!");
                            //cout << "circuit switch enqueue: "<< endl;
                            //cout << "m_id = " << m_id << " , destNode = " << destNode << endl;
                            circuitQueue->enqueue(msg_ptr, 1);
                            m_net_ptr->m_circuitnet_ptr[i]->m_cirpath_msgs[m_id][destNode] += 1;
                            EnqueueCSNOC = true;
                            //g_eventQueue_ptr->scheduleEvent((Consumer*)m_net_ptr->m_circuitnet_ptr->m_ni_ptr_vector[m_id],1);
                            inNode_ptr[vnet]->pop();
                            //cout << "circuit switch enqueue finishes: "<< endl;
                            break;
                        }                 
                    }
                    if (EnqueueCSNOC)
                    {
                        m_streaming_flit += num_flits;
                        m_net_ptr->streamDataCSCount(msg_ptr, num_flits);
                        continue;
                    }
                }
            }
#endif //CS_NOC            

            if(flitisizeMessage(msg_ptr, vnet))
            {
                if(isStreamData(msg_ptr))
                {
                    m_streaming_flit += num_flits;
                    m_streaming_flit_nosupport += num_flits;
                    m_net_ptr->streamDataPSCount(msg_ptr, num_flits);
                }
                inNode_ptr[vnet]->pop();
            }
            else 
            {
                break;
            }	
        }
    }	

    scheduleOutputLink(); 
    checkReschedule();  

    /*********** Picking messages destined for this NI **********/

    if(inNetLink->isReady())
    {
        flit_d *t_flit = inNetLink->consumeLink();
        int srcId, destId;
        srcId = t_flit->m_srcNetIntfId;
        destId = m_id;
        int csnoc_index = t_flit->get_csnoc_index();

        bool free_signal = false;
        if(t_flit->get_type() == TAIL_ || t_flit->get_type() == HEAD_TAIL_)
        {
            DEBUG_MSG(NETWORK_COMP, MedPrio, "exit NI");
            DEBUG_EXPR(NETWORK_COMP, MedPrio, (t_flit->get_msg_ptr()));
            free_signal = true;
            if(!NetworkConfig::isNetworkTesting()) // When we are doing network only testing, the messages do not have to be buffered into the message buffers
            {
                if(t_flit->get_vnet() != 5) // vnet 5 is used for setup circuit network, which has no consumer after exiting the packet switch network
                    outNode_ptr[t_flit->get_vnet()]->enqueue(t_flit->get_msg_ptr(), 1); // enqueueing for protocol buffer. This is not required when doing network only testing
                else
                {
                    assert(csnoc_index == 0);
                    if(t_flit->m_setuporfree)
                    {
                        int network_delay = g_eventQueue_ptr->getTime() - t_flit->get_enqueue_time();
                        int queueing_delay = t_flit->get_delay();
                        m_net_ptr->increment_setup_flits();
                        m_net_ptr->increment_setup_network_latency(network_delay);
                        m_net_ptr->increment_setup_queueing_latency(queueing_delay);
                        m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[srcId][destId] = FINISH;
                        cerr << g_eventQueue_ptr->getTime() << " : circuit path is built for src: " << srcId << " to dest: " << destId << endl;
                    }
                    else
                    {
                        int network_delay = g_eventQueue_ptr->getTime() - t_flit->get_enqueue_time();
                        int queueing_delay = t_flit->get_delay();
                        m_net_ptr->increment_free_flits();
                        m_net_ptr->increment_free_network_latency(network_delay);
                        m_net_ptr->increment_free_queueing_latency(queueing_delay);
                        if(m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[srcId][destId] == FREE)
                        {
                            m_net_ptr->m_circuitnet_ptr[csnoc_index]->m_circuit_paths[srcId][destId] = NONE;
                        }
                        cerr << g_eventQueue_ptr->getTime() << " : circuit path is freed for src: " << srcId << " to dest: " << destId << endl;
                    }
                }
            }	
            //            cerr << "CSNOC: " << csnoc_index << " : ";

        }
        flit_d *credit_flit = new flit_d(t_flit->get_vc(), free_signal); // Simply send a credit back since we are not buddering this flit in the NI
        creditQueue->insert(credit_flit);
        g_eventQueue_ptr->scheduleEvent(m_ni_credit_link, 1);

        t_flit->advance_stage(I_); // this is used to calculate the cycles spent in each stage
        m_net_ptr->increment_recieved_flits();
        int network_delay = g_eventQueue_ptr->getTime() - t_flit->get_enqueue_time();
        int queueing_delay = t_flit->get_delay();
        int network_delay_I = t_flit->get_delay_I();
        int network_delay_VA = t_flit->get_delay_VA();
        int network_delay_SA = t_flit->get_delay_SA();
        int network_delay_ST = t_flit->get_delay_ST();
        int network_delay_LT = t_flit->get_delay_LT();
        m_net_ptr->increment_network_latency(network_delay);
        m_net_ptr->increment_network_latency_I(network_delay_I);
        m_net_ptr->increment_network_latency_VA(network_delay_VA);
        m_net_ptr->increment_network_latency_SA(network_delay_SA);
        m_net_ptr->increment_network_latency_ST(network_delay_ST);
        m_net_ptr->increment_network_latency_LT(network_delay_LT);
        m_net_ptr->increment_queueing_latency(queueing_delay);
        delete t_flit;
    }

    /****************** Checking for credit link *******/

    if(m_credit_link->isReady())
    {
        flit_d *t_flit = m_credit_link->consumeLink();	
        m_out_vc_state[t_flit->get_vc()]->increment_credit();
        if(t_flit->is_free_signal())
        {
            m_out_vc_state[t_flit->get_vc()]->setState(IDLE_, g_eventQueue_ptr->getTime()); 
        }
        delete t_flit;	
    }
}

// This function look at the NI buffers and if some buffer has flits which are ready to traverse the link in the next cycle and also the downstream output vc associated with this flit has buffers left, the link is scheduled for the next cycle
bool NetworkInterface_d::isStreamData(MsgPtr msg_ptr)
{
    RequestMsg *request_msg_ptr = dynamic_cast<RequestMsg*>(msg_ptr.ref());
    ResponseMsg *response_msg_ptr = dynamic_cast<ResponseMsg*>(msg_ptr.ref());
    CacheMsg *cache_msg_ptr = dynamic_cast<CacheMsg*>(msg_ptr.ref());

    if (request_msg_ptr != NULL)
    {
        assert(response_msg_ptr == NULL);
        assert(cache_msg_ptr == NULL);
        if ( request_msg_ptr->m_Type == CoherenceRequestType_BIC_INTRANS_DATA
                || request_msg_ptr->m_Type == CoherenceRequestType_BIC_OUTTRANS_DATA 
                || request_msg_ptr->m_Type == CoherenceRequestType_BIC_READ
                || request_msg_ptr->m_Type == CoherenceRequestType_BIC_ALLOCATE
                || request_msg_ptr->m_Type == CoherenceRequestType_BIC_FREE
                || request_msg_ptr->m_Type == CoherenceRequestType_BIC_INV
                || request_msg_ptr->m_Type == CoherenceRequestType_BIC_WRITE)
        {
            return true;
            //m_streamlink_utilized++;
            //m_vc_streamload[t_flit->get_vc()]++;
        }
    }

    if (response_msg_ptr != NULL)
    {
        assert(request_msg_ptr == NULL);
        assert(cache_msg_ptr == NULL);

        if ( response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA_COPY
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_DATA
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_WRITE_ACK
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_ALLOCATE_ACK
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_FREE_ACK
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_INTRANS_ACK
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_OUTTRANS_ACK
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_OUTTRANS
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_MEMORY_ACK
                || response_msg_ptr->m_Type == CoherenceResponseType_BIC_READ_ACK )
        {
            return true;
            //m_streamlink_utilized++;
            //m_vc_streamload[t_flit->get_vc()]++;
        }
    }
/*
    if (cache_msg_ptr != NULL)
    {
        assert(request_msg_ptr == NULL);
        assert(response_msg_ptr == NULL);

        if ( cache_msg_ptr->m_Type == CacheRequestType_BIC_WRITE)
        {
            return true;
            //m_streamlink_utilized++;
            //m_vc_streamload[t_flit->get_vc()]++;
        }
    }*/
    return false;
}



void NetworkInterface_d::scheduleOutputLink()
{
	int vc = m_vc_round_robin;
	m_vc_round_robin++;
	if(m_vc_round_robin == m_num_vcs)
		m_vc_round_robin = 0;

	for(int i = 0; i < m_num_vcs; i++)
	{
		vc++;
		if(vc == m_num_vcs)
			vc = 0;
		if(m_ni_buffers[vc]->isReady() && m_out_vc_state[vc]->has_credits())  // models buffer backpressure
		{
			bool is_candidate_vc = true;
			int t_vnet = get_vnet(vc);
			int vc_base = t_vnet * m_vc_per_vnet;

			if(m_net_ptr->isVNetOrdered(t_vnet))
			{
				for (int vc_offset = 0; vc_offset < m_vc_per_vnet; vc_offset++)
				{
					int t_vc = vc_base + vc_offset;
					if(m_ni_buffers[t_vc]->isReady())
					{
						if(m_ni_enqueue_time[t_vc] < m_ni_enqueue_time[vc])
						{
							is_candidate_vc = false;
							break;
						}
					}
				}
			}
			if(!is_candidate_vc)
				continue;

			m_out_vc_state[vc]->decrement_credit();
			flit_d *t_flit = m_ni_buffers[vc]->getTopFlit();	// Just removing the flit
			t_flit->set_time(g_eventQueue_ptr->getTime() + 1); 
			outSrcQueue->insert(t_flit);
			g_eventQueue_ptr->scheduleEvent(outNetLink, 1); // schedule the out link

			if(t_flit->get_type() == TAIL_ || t_flit->get_type() == HEAD_TAIL_)
			{
				m_ni_enqueue_time[vc] = INFINITE_;
			}	
			return;
		}
	}
}

int NetworkInterface_d::get_vnet(int vc)
{
	for(int i = 0; i < NUMBER_OF_VIRTUAL_NETWORKS; i++)
	{
		if(vc >= (i*m_vc_per_vnet) && vc < ((i+1)*m_vc_per_vnet))
		{
			return i;
		}
	}
	ERROR_MSG("Could not determine vc");
	return -1;
}

void NetworkInterface_d::checkReschedule()
{
	for(int vnet = 0; vnet < m_virtual_networks; vnet++)
	{
		if(inNode_ptr[vnet]->isReady()) // Is there a message waiting
		{
			g_eventQueue_ptr->scheduleEvent(this, 1);
			return;
		}
	}	
	for(int vc = 0; vc < m_num_vcs; vc++)
	{
		if(m_ni_buffers[vc]->isReadyForNext())
		{
			g_eventQueue_ptr->scheduleEvent(this, 1);
			return;
		}
	}
}

void NetworkInterface_d::printConfig(ostream& out) const
{
	out << "[Network Interface " << m_id << "] - ";
	out << "[inLink " << inNetLink->get_id() << "] - ";
	out << "[outLink " << outNetLink->get_id() << "]" << endl;
}

void NetworkInterface_d::print(ostream& out) const
{
	out << "[Network Interface]";
}
