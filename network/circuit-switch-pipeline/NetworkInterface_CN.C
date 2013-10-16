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
 * NetworkInterface_CN.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "NetworkInterface_CN.h"
#include "MessageBuffer.h"
#include "flitBuffer_CN.h"	
#include "NetworkMessage.h"

NetworkInterface_CN::NetworkInterface_CN(int id, int virtual_networks, CircuitNetwork *network_ptr)
{
	m_id = id;	
	m_net_ptr = network_ptr;
	m_virtual_networks  = virtual_networks;
//#ifdef CS_NOC
//    std::cerr << "CS_NOC m_vc_per_vnet = 1" << endl;
//    std::cout << "CS_NOC m_vc_per_vnet = 1" << endl;
//    m_vc_per_vnet = 1;
//#else
//    m_vc_per_vnet = NetworkConfig::getVCsPerClass();
    m_vc_per_vnet = 1;
//#endif
	m_num_vcs = m_vc_per_vnet*m_virtual_networks;

//	m_vc_round_robin = 0;
//	m_ni_buffers.setSize(m_num_vcs);
//	m_ni_enqueue_time.setSize(m_num_vcs);
	inNode_ptr.setSize(m_virtual_networks);
	outNode_ptr.setSize(m_virtual_networks);
	creditQueue = new flitBuffer_CN(); 
    m_ni_buffers = new flitBuffer_CN();
    
//	for(int i =0; i < m_num_vcs; i++)
//	{
//		m_ni_buffers[i] = new flitBuffer_CN(); // instantiating the NI flit buffers
//		m_ni_enqueue_time[i] = INFINITE_;
//	}
//	 m_vc_allocator.setSize(m_virtual_networks); // 1 allocator per virtual net
//	 for(int i = 0; i < m_virtual_networks; i++)
//	 {
//		 m_vc_allocator[i] = 0;
//	 }
		
//	 for(int i = 0; i < m_num_vcs; i++)
//	 {
//	 	m_out_vc_state.insertAtBottom(new OutVcState_d(i));
//		m_out_vc_state[i]->setState(IDLE_, g_eventQueue_ptr->getTime());
//	 }
    m_out_state = new OutVcState_CN(0);
    m_out_state->setState(IDLE_, g_eventQueue_ptr->getTime());	 
}

NetworkInterface_CN::~NetworkInterface_CN()
{
//	m_out_vc_state.deletePointers();
    delete m_out_state;	
//	m_ni_buffers.deletePointers();
	delete m_ni_buffers;
	delete creditQueue;
	delete outSrcQueue;
}

//void NetworkInterface_CN::addInPort(NetworkLink_CN *in_link, CreditLink_d *credit_link)
void NetworkInterface_CN::addInPort(NetworkLink_CN *in_link, Router_CN *in_router)
{
    m_router = in_router;
	inNetLink = in_link;
	in_link->setLinkConsumer(this);
    in_link->setDestNetIntf(this);
//	m_ni_credit_link = credit_link;
//	credit_link->setSourceQueue(creditQueue);
}

//void NetworkInterface_CN::addOutPort(NetworkLink_CN *out_link, CreditLink_d *credit_link)
void NetworkInterface_CN::addOutPort(NetworkLink_CN *out_link, Router_CN *out_router)
{
//	m_credit_link = credit_link;
//	credit_link->setLinkConsumer(this);

    m_router = out_router;
	outNetLink = out_link;
	outSrcQueue = new flitBuffer_CN();
    Vector<flitBuffer_CN *> outSrcQueueVec;
    outSrcQueueVec.insertAtBottom(outSrcQueue);
	out_link->setSourceQueue(outSrcQueueVec);
}

void NetworkInterface_CN::addNode(Vector<MessageBuffer*>& in,  Vector<MessageBuffer*>& out)
{
	ASSERT(in.size() == m_virtual_networks);
	inNode_ptr = in;
	outNode_ptr = out;
	for (int j = 0; j < m_virtual_networks; j++)
	{
		inNode_ptr[j]->setConsumer(this);  // So that protocol injects messages into the NI
	}
}

bool NetworkInterface_CN::flitisizeMessage(MsgPtr msg_ptr, int vnet)
{
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
		//int vc = calculateVC(vnet); // this will return a free output virtual channel
		//if(vc == -1)
        if(!m_out_state->isInState(IDLE_, g_eventQueue_ptr->getTime()))
		{
			return false ;
		}	
		MsgPtr new_msg_ptr = *(msg_ptr.ref());
		NodeID destID = dest_nodes[ctr];	

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
        //cout << "NetworkInterface_CN before m_ni_buffers->insert : " <<  m_id << endl;
        DEBUG_MSG(NETWORK_COMP, MedPrio, "flitisizeMessage");
        DEBUG_EXPR(NETWORK_COMP, MedPrio, new_msg_ptr);
        DEBUG_EXPR(NETWORK_COMP, MedPrio, vnet);
        DEBUG_EXPR(NETWORK_COMP, MedPrio, num_flits);

		for(int i = 0; i < num_flits; i++)
		{
			m_net_ptr->increment_injected_flits();
            int vc = 0; //there is no vc
			//flit_CN *fl = new flit_CN(i, vc, vnet, num_flits, new_msg_ptr);
			flit_CN *fl = new flit_CN(i, vc, vnet, num_flits, new_msg_ptr, (int)m_id, (int)destID);
            fl->m_srcNetIntfID = m_id;            
            fl->m_destID = destID;           
            fl->advance_stage(I_);
			fl->set_delay(g_eventQueue_ptr->getTime() - (msg_ptr.ref())->getTime());
			//m_ni_buffers[vc]->insert(fl);
			m_ni_buffers->insert(fl);
		}
        //m_net_ptr->m_cirpath_msgs[m_id][destID] += 1; 
        DEBUG_EXPR(NETWORK_COMP, MedPrio, m_ni_buffers->numElements());
        //cout << "NetworkInterface_CN after m_ni_buffers->insert : " << m_id << endl;
		//m_ni_enqueue_time[vc] = g_eventQueue_ptr->getTime();
		//m_out_vc_state[vc]->setState(ACTIVE_, g_eventQueue_ptr->getTime()); 
		m_out_state->setState(ACTIVE_, g_eventQueue_ptr->getTime()); 
	}
    //cout << "NetworkInterface_CN flitisize finishes" << endl;
	return true ;
}

// Looking for a free output vc
//int NetworkInterface_CN::calculateVC(int vnet)
//{
//	for(int i = 0; i < m_vc_per_vnet; i++)
//	{
//		int delta = m_vc_allocator[vnet];
//		m_vc_allocator[vnet]++;
//		if(m_vc_allocator[vnet] == m_vc_per_vnet)
//			m_vc_allocator[vnet] = 0;
//	
//		if(m_out_vc_state[(vnet*m_vc_per_vnet) + delta]->isInState(IDLE_, g_eventQueue_ptr->getTime()))
//		{
//			return ((vnet*m_vc_per_vnet) + delta);
//		}
//	}
//	return -1;
//}

/*
 * The NI wakeup checks whether there are any ready messages in the protocol buffer. If yes, 
 * it picks that up, flitisizes it into a number of flits and puts it into an output buffer 
 * and schedules the output link. On a wakeup it also checks whether there are flits in the 
 * input link. If yes, it picks them up and if the flit is a tail, the NI inserts the 
 * corresponding message into the protocol buffer. It also checks for credits being sent 
 * by the downstream router.
 */

void NetworkInterface_CN::wakeup()
{
	DEBUG_EXPR(NETWORK_COMP, MedPrio, m_id);	
	DEBUG_MSG(NETWORK_COMP, MedPrio, "NI WOKE UP");	
	DEBUG_EXPR(NETWORK_COMP, MedPrio, g_eventQueue_ptr->getTime());	
	MsgPtr msg_ptr;
    //cout << "NetworkInterface_CN wakeup before flitisizeMessage " << m_id << endl;
	//Checking for messages coming from the protocol	
	for (int vnet = 0; vnet < m_virtual_networks; vnet++) // can pick up a message/cycle for each virtual net
	{	
		while(inNode_ptr[vnet]->isReady()) // Is there a message waiting
		{
			msg_ptr = inNode_ptr[vnet]->peekMsgPtr();
            DEBUG_MSG(NETWORK_COMP, MedPrio, "enter CSNOC_NI : " + int_to_string(m_id) 
                    + " ; vnet : " + int_to_string(vnet));
            DEBUG_EXPR(NETWORK_COMP, MedPrio, msg_ptr);
			if(flitisizeMessage(msg_ptr, vnet))
			{
                DEBUG_MSG(NETWORK_COMP, MedPrio, "flitisizeMsg succeed!");
				inNode_ptr[vnet]->pop();
                if (inNode_ptr[vnet]->isReady())
                {
                    MsgPtr msg_ptr = inNode_ptr[vnet]->peekMsgPtr();
                    DEBUG_MSG(NETWORK_COMP, MedPrio, "next msg ready in vnet : " + int_to_string(vnet));
                    DEBUG_EXPR(NETWORK_COMP, MedPrio, msg_ptr);
                }
                else
                {
                    DEBUG_MSG(NETWORK_COMP, MedPrio, "no msg is ready in vnet : " + int_to_string(vnet));
                }

			}
			else 
			{
                DEBUG_MSG(NETWORK_COMP, MedPrio, "flitisizeMsg failed!");
				MsgPtr msg_ptr = inNode_ptr[vnet]->peekMsgPtr();
                DEBUG_MSG(NETWORK_COMP, MedPrio, "next msg ready in vnet : " + int_to_string(vnet));
                DEBUG_EXPR(NETWORK_COMP, MedPrio, msg_ptr);
                break;
			}	
		}
	}	
	
    //cout << "NetworkInterface_CN wakeup after flitisizeMessage " << m_id << endl;
	scheduleOutputLink(); 
    //cout << "NetworkInterface_CN wakeup after scheduleOutputLink " << m_id << endl;
	checkReschedule();  
    //cout << "NetworkInterface_CN wakeup after checkReschedule " << m_id << endl;

/*********** Picking messages destined for this NI **********/
	if(inNetLink->isReady())
	{
        //add for debug
        //if(m_id == 17 && g_eventQueue_ptr->getTime() > DEBUG_START_TIME && g_eventQueue_ptr->getTime() < 467000)
        Vector<flitBuffer_CN *> linkBuffer = inNetLink->get_linkBuffer();
        if(m_id == 36 && g_eventQueue_ptr->getTime() > DEBUG_START_TIME )
        {   
            DEBUG_MSG(NETWORK_COMP, MedPrio, "#################Debuging inNetLink of NI 36 ------- NetworkInterface_CN");

            for (int numLinkBuf = 0; numLinkBuf < linkBuffer.size(); numLinkBuf++)
            {
                if (linkBuffer[numLinkBuf]->isReady())
                {
                    DEBUG_EXPR(NETWORK_COMP, MedPrio, *(linkBuffer[numLinkBuf]));
                }
            }
        }

        for (int numLinkBuf = 0; numLinkBuf < linkBuffer.size(); numLinkBuf++)
        {
            if (!linkBuffer[numLinkBuf]->isReady())
            {
                continue;
            }
            flit_CN *t_flit = linkBuffer[numLinkBuf]->getTopFlit();
            bool free_signal = false;
            DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_msg_ptr());
            DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_type());
            if(t_flit->get_type() == TAIL_ || t_flit->get_type() == HEAD_TAIL_)
            {
                free_signal = true;
                if(!NetworkConfig::isNetworkTesting()) // When we are doing network only testing, the messages do not have to be buffered into the message buffers
                {
                    //cout << "message goes through CS NOC to NI : " << m_id << endl;
                    MsgPtr t_msg_ptr = t_flit->get_msg_ptr();
                    DEBUG_MSG(NETWORK_COMP, MedPrio, "exit CSNOC_NI");
                    DEBUG_EXPR(NETWORK_COMP, MedPrio, t_msg_ptr);
                    NetworkMessage *t_net_msg_ptr = dynamic_cast<NetworkMessage*>(t_msg_ptr.ref());
                    NetDest t_net_msg_dest = t_net_msg_ptr->getInternalDestination();
                    Vector<NodeID> t_dest_nodes = t_net_msg_dest.getAllDest(); // gets all the destinations associated with this message.
                    assert(t_dest_nodes.size() == 1) ;
                    NodeID t_destNode = t_dest_nodes[0];

                    //cout << "message's dest node is " << t_destNode << endl;
                    outNode_ptr[t_flit->get_vnet()]->enqueue(t_flit->get_msg_ptr(), 1); // enqueueing for protocol buffer. This is not required when doing network only testing
                    m_net_ptr->m_cirpath_msgs[t_flit->m_srcNetIntfID][t_flit->m_destID] -= 1;
                }	
            }
            //		flit_CN *credit_flit = new flit_CN(t_flit->get_vc(), free_signal); // Simply send a credit back since we are not buddering this flit in the NI
            //		creditQueue->insert(credit_flit);
            //		g_eventQueue_ptr->scheduleEvent(m_ni_credit_link, 1);

            m_net_ptr->increment_recieved_flits();
            int network_delay = g_eventQueue_ptr->getTime() - t_flit->get_enqueue_time();
            int network_delay_I = t_flit->get_delay_I();
            int network_delay_VA = t_flit->get_delay_VA();
            int network_delay_SA = t_flit->get_delay_SA();
            int network_delay_ST = t_flit->get_delay_ST();
            int network_delay_LT = t_flit->get_delay_LT();

            int queueing_delay = t_flit->get_delay();
            m_net_ptr->increment_network_latency(network_delay);
            m_net_ptr->increment_network_latency_I(network_delay_I);
            m_net_ptr->increment_network_latency_VA(network_delay_VA);
            m_net_ptr->increment_network_latency_SA(network_delay_SA);
            m_net_ptr->increment_network_latency_ST(network_delay_ST);
            m_net_ptr->increment_network_latency_LT(network_delay_LT);
            m_net_ptr->increment_queueing_latency(queueing_delay);
            delete t_flit;
        }
    }

    //cout << "NetworkInterface_CN wakeup after pinking messages " << m_id << endl;

	 /****************** Checking for credit link *******/

//	 if(m_credit_link->isReady())
//	 {
//	 	flit_CN *t_flit = m_credit_link->consumeLink();	
//		m_out_vc_state[t_flit->get_vc()]->increment_credit();
//		if(t_flit->is_free_signal())
//		{
//			m_out_vc_state[t_flit->get_vc()]->setState(IDLE_, g_eventQueue_ptr->getTime()); 
//		}
//		delete t_flit;	
//	 }
}

// This function look at the NI buffers and if some buffer has flits which are ready to traverse the link in the next cycle and also the downstream output vc associated with this flit has buffers left, the link is scheduled for the next cycle

void NetworkInterface_CN::scheduleOutputLink()
{
//	int vc = m_vc_round_robin;
//	m_vc_round_robin++;
//	if(m_vc_round_robin == m_num_vcs)
//		m_vc_round_robin = 0;

//	for(int i = 0; i < m_num_vcs; i++)
//	{
//		vc++;
//		if(vc == m_num_vcs)
//			vc = 0;
//		if(m_ni_buffers[vc]->isReady() && m_out_vc_state[vc]->has_credits())  // models buffer backpressure
		if(m_ni_buffers->isReady())
		{
//			bool is_candidate_vc = true;
//			int t_vnet = get_vnet(vc);
//			int vc_base = t_vnet * m_vc_per_vnet;

//			if(m_net_ptr->isVNetOrdered(t_vnet))
//			{
//				for (int vc_offset = 0; vc_offset < m_vc_per_vnet; vc_offset++)
//				{
//					int t_vc = vc_base + vc_offset;
//					if(m_ni_buffers[t_vc]->isReady())
//					{
//						if(m_ni_enqueue_time[t_vc] < m_ni_enqueue_time[vc])
//						{
//							is_candidate_vc = false;
//							break;
//						}
//					}
//				}
//			}
//			if(!is_candidate_vc)
//				continue;

//			m_out_vc_state[vc]->decrement_credit();
//			flit_CN *t_flit = m_ni_buffers[vc]->getTopFlit();	// Just removing the flit
			flit_CN *t_flit = m_ni_buffers->getTopFlit();	// Just removing the flit
			t_flit->set_time(g_eventQueue_ptr->getTime() + 1);
            DEBUG_MSG(NETWORK_COMP, MedPrio, "scheduleOutputLink execute on NI : " + int_to_string(m_id));
            DEBUG_EXPR(NETWORK_COMP, MedPrio, (t_flit->get_msg_ptr()));
			outSrcQueue->insert(t_flit);
			g_eventQueue_ptr->scheduleEvent(outNetLink, 1); // schedule the out link

			if(t_flit->get_type() == TAIL_ || t_flit->get_type() == HEAD_TAIL_)
			{
//				m_ni_enqueue_time[vc] = INFINITE_;
                DEBUG_MSG(NETWORK_COMP, MedPrio, "************Flit Tail go through NI : " + int_to_string(m_id));
                DEBUG_EXPR(NETWORK_COMP, MedPrio, g_eventQueue_ptr->getTime());                               
                m_out_state->setState(IDLE_, g_eventQueue_ptr->getTime());
			}	
			return;
		}
//	}
}

int NetworkInterface_CN::get_vnet(int vc)
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

void NetworkInterface_CN::checkReschedule()
{
	for(int vnet = 0; vnet < m_virtual_networks; vnet++)
	{
		if(inNode_ptr[vnet]->isReady()) // Is there a message waiting
		{
            MsgPtr msg_ptr = inNode_ptr[vnet]->peekMsgPtr();
            DEBUG_MSG(NETWORK_COMP, MedPrio, "reschedule this CSNOC_NI !! inNode_ptr is ready in vnet : " 
                    + int_to_string(vnet));
            DEBUG_EXPR(NETWORK_COMP, MedPrio, msg_ptr);
			g_eventQueue_ptr->scheduleEvent(this, 1);
            return;
        }
    }

    if( m_ni_buffers->isReadyForNext() )
    {
        flit_CN *t_flit = m_ni_buffers->peekTopFlit();
        DEBUG_MSG(NETWORK_COMP, MedPrio, "reschedule this CSNOC_NI !! m_ni_buffers is ready");
        DEBUG_EXPR(NETWORK_COMP, MedPrio, (t_flit->get_msg_ptr()));
        g_eventQueue_ptr->scheduleEvent(this, 1);
        return;
    }


//	for(int vc = 0; vc < m_num_vcs; vc++)
//	{
//		if(m_ni_buffers[vc]->isReadyForNext())
//		{
//			g_eventQueue_ptr->scheduleEvent(this, 1);
//			return;
//		}
//	}
}

void NetworkInterface_CN::printConfig(ostream& out) const
{
	out << "[Network Interface " << m_id << "] - ";
	out << "[inLink " << inNetLink->get_id() << "] - ";
	out << "[outLink " << outNetLink->get_id() << "]" << endl;
}

void NetworkInterface_CN::print(ostream& out) const
{
	out << "[Network Interface]";
}
