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
 * Router_d.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "Router_d.h"
#include "GarnetNetwork_d.h"
#include "NetworkLink_d.h"
#include "CreditLink_d.h"
#include "InputUnit_d.h"
#include "OutputUnit_d.h"
#include "RoutingUnit_d.h"
#include "VCallocator_d.h"
#include "SWallocator_d.h"
#include "Switch_d.h"


Router_d::Router_d(int id, GarnetNetwork_d *network_ptr, char* routingFile_fa, char* routingFile_df, char* extraLinkFile)
{
  m_id = id;
  m_network_ptr = network_ptr;
  m_virtual_networks = NUMBER_OF_VIRTUAL_CLASS*NUMBER_OF_VIRTUAL_NETWORKS;
  m_vc_per_vnet = g_VCS_PER_CLASS;
  m_num_vcs = m_virtual_networks*m_vc_per_vnet;
  m_flit_width = g_FLIT_SIZE;
  m_routingFile_fa = routingFile_fa;
  m_routingFile_df = routingFile_df;
  m_routing_unit = new RoutingUnit_d(this,routingFile_fa, routingFile_df, extraLinkFile);
  m_vc_alloc = new VCallocator_d(this);
  m_sw_alloc = new SWallocator_d(this);
  m_switch = new Switch_d(this);

  m_input_unit.clear();
  m_output_unit.clear();

  buf_read_count = 0;
  buf_write_count = 0;
  crossbar_count = 0;
  vc_local_arbit_count = 0;
  vc_global_arbit_count = 0;
  sw_local_arbit_count = 0;
  sw_global_arbit_count = 0;

  /*
  waitingOnMe = new bool[ get_net_ptr()->getNumNodes()];
  for(int w = 0; w <  get_net_ptr()->getNumNodes(); w++)
    waitingOnMe[w] = false;
  numDeadlocks = 0;
  */
  vcStalls = 0;
  m_destLinkMap.setSize(m_network_ptr->getNumRouters());
  m_rfLinkMap.setSize(m_network_ptr->getNumRouters());
  m_dirLinkMap.setSize(DIR_PER_ROUTER);
  for (int i=0; i<m_network_ptr->getNumRouters(); i++) {
    m_destLinkMap[i]=-1;
    m_rfLinkMap[i]=-1;
  }
  for (int i=0; i<DIR_PER_ROUTER; i++)
    m_dirLinkMap[i]=-1;

}

Router_d::~Router_d()
{
	m_input_unit.deletePointers();
	m_output_unit.deletePointers();
	delete m_routing_unit;
	delete m_vc_alloc;
	delete m_sw_alloc;
	delete m_switch;
	/*
  delete [] waitingOnMe;
  */
}

void Router_d::init()
{
	m_vc_alloc->init();
	m_sw_alloc->init();
	m_switch->init();
}

void Router_d::addInPort(NetworkLink_d *in_link, CreditLink_d *credit_link, int direction)
{

	int port_num = m_input_unit.size();
	InputUnit_d *input_unit = new InputUnit_d(port_num, this);
	input_unit->set_in_link(in_link);
	input_unit->set_credit_link(credit_link);
	in_link->setLinkConsumer(input_unit);
	credit_link->setSourceQueue(input_unit->getCreditQueue());
	
	m_input_unit.insertAtBottom(input_unit);
  input_unit->setDirection(direction);
}

void Router_d::addOutPort(NetworkLink_d *out_link, const NetDest& routing_table_entry, int link_weight, CreditLink_d *credit_link)
{
	int port_num = m_output_unit.size();
	OutputUnit_d *output_unit = new OutputUnit_d(port_num, this);
	
	output_unit->set_out_link(out_link);
	output_unit->set_credit_link(credit_link);
	credit_link->setLinkConsumer(output_unit);
	out_link->setSourceQueue(output_unit->getOutQueue(), m_id);
	
	m_output_unit.insertAtBottom(output_unit);


}

void Router_d::route_req(flit_d *t_flit, InputUnit_d *in_unit, int invc)
{
	m_routing_unit->RC_stage(t_flit, in_unit, invc);
}
void Router_d::vcarb_req()
{
	g_eventQueue_ptr->scheduleEvent(m_vc_alloc, 1);
}
void Router_d::swarb_req()
{
	g_eventQueue_ptr->scheduleEvent(m_sw_alloc, 1);
}
void Router_d::update_incredit(int in_port, int in_vc, int credit)
{
	m_input_unit[in_port]->update_credit(in_vc, credit);
}
void Router_d::update_sw_winner(int inport, flit_d *t_flit)
{
	m_switch->update_sw_winner(inport, t_flit);
	g_eventQueue_ptr->scheduleEvent(m_switch, 1);
}

void Router_d::calculate_performance_numbers()
{
	for(int i = 0; i < m_input_unit.size(); i++)
	{
		buf_read_count += m_input_unit[i]->get_buf_read_count();
		buf_write_count += m_input_unit[i]->get_buf_write_count();
	}
	crossbar_count = m_switch->get_crossbar_count();
	vc_local_arbit_count = m_vc_alloc->get_local_arbit_count();
	vc_global_arbit_count = m_vc_alloc->get_global_arbit_count();
	sw_local_arbit_count = m_sw_alloc->get_local_arbit_count();
	sw_global_arbit_count = m_sw_alloc->get_global_arbit_count();
}

void Router_d::printConfig(ostream& out)
{
	out << "[Router " << m_id << "] :: " << endl;
	out << "[inLink - ";
	for(int i = 0;i < m_input_unit.size(); i++)
		out << m_input_unit[i]->get_inlink_id() << " - ";
	out << "]" << endl;
	out << "[outLink - ";
	for(int i = 0;i < m_output_unit.size(); i++)
		out << m_output_unit[i]->get_outlink_id() << " - ";
	out << "]" << endl;
}

/*
void Router_d::receiveWaitVector(int source, bool *waitVector)
{
  for (int i=0; i<m_network_ptr->getNumRouters(); i++) {
    if (waitVector[i] || i == source) {
      waitingOnMe[i]=true;
      if (i==m_id && canDetectDeadlock) {//Don't allow deadlocks to be detected when messages from
        //a prior deadlock are still in the network - partial sense.
        numDeadlocks++;
        if (numDeadlocks >= selfThreshold) {
          numDeadlocks=0;
          cerr<<"DEADLOCK DETECTED @"<< g_eventQueue_ptr->getTime()<<endl;
          m_network_ptr->setDeadlockState(true);
          totalDeadlocks++;
        }
      }
    }
  }

}

void Router_d::checkForDeadlock()
{
  //do nothing
}

void Router_d::clearWaitVector()
{
  for (int i=0; i<m_network_ptr->getNumRouters(); i++) {
    waitingOnMe[i]=false;
  }
}
void Router_d::sendWaitVector(int dest)
{
  //Mishali: do nothing
}
*/

void Router_d::updateRouterStats(int source, int dest, int bytes)
{
  m_network_ptr->updateRouterStats(source, dest, bytes);
}
