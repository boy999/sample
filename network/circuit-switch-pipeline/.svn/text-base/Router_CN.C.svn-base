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
 * Router_CN.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "Router_CN.h"
//#include "GarnetNetwork_d.h"
#include "CircuitNetwork.h"
#include "NetworkLink_CN.h"
//#include "CreditLink_d.h"
#include "InputUnit_CN.h"
#include "OutputUnit_CN.h"
#include "RoutingUnit_CN.h"
//#include "VCallocator_d.h"
//#include "SWallocator_d.h"
#include "Switch_CN.h"

Router_CN::Router_CN(int id, CircuitNetwork *network_ptr)
{
	m_id = id;
	m_network_ptr = network_ptr;
	m_virtual_networks = NUMBER_OF_VIRTUAL_NETWORKS;

//  m_vc_per_vnet = NetworkConfig::getVCsPerClass();
//	m_num_vcs = m_virtual_networks*m_vc_per_vnet;
//	m_flit_width = NetworkConfig::getFlitSize();

//    if (m_network_ptr->m_id == 1)
    m_routing_unit = new RoutingUnit_CN(this);
//	m_vc_alloc = new VCallocator_d(this);
//	m_sw_alloc = new SWallocator_d(this);
    m_switch = new Switch_CN(this);

	m_input_unit.clear();
	m_output_unit.clear();

	buf_read_count = 0;
	buf_write_count = 0;
	crossbar_count = 0;
	vc_local_arbit_count = 0;
	vc_global_arbit_count = 0;
	sw_local_arbit_count = 0;
	sw_global_arbit_count = 0;
}

Router_CN::~Router_CN()
{
	m_input_unit.deletePointers();
	m_output_unit.deletePointers();
	delete m_routing_unit;
//	delete m_vc_alloc;
//	delete m_sw_alloc;
	delete m_switch;
}

void Router_CN::init()
{
//	m_vc_alloc->init();
//	m_sw_alloc->init();
    int m_num_inports = get_num_inports();
    int m_num_outports = get_num_outports();
    m_port_connect.setSize(m_num_outports);
    m_port_connect_pair.setSize(m_num_outports);

    for(int i = 0; i < m_num_outports; i++)
    {
        m_port_connect[i].setSize(m_num_inports);
        m_port_connect_pair[i].setSize(m_num_inports);

        for(int j = 0; j < m_num_inports; j++)
        {
            m_port_connect[i][j] = false; // [outport][inport]
            m_port_connect_pair[i][j] = make_pair (-1,-1); // [outport][inport]
        }
    }       
    
    for(int i = 0; i < m_output_unit.size(); i++)
    {
        if(m_output_unit[i]->m_portType == PortType_Eject)
        {
            m_output_unit[i]->m_out_buffer.setSize(m_output_unit[i]->m_router->get_num_inports());
            for(int j = 0; j < m_output_unit[i]->m_router->get_num_inports(); j++)
            {
               m_output_unit[i]->m_out_buffer[j] = new flitBuffer_CN();
            }
        }
        else
        {
            /*
            m_output_unit[i]->m_out_buffer.setSize(1);
            for(int j = 0; j < 1; j++)
            {
               m_output_unit[j]->m_out_buffer[j] = new flitBuffer_CN();
            }
            */
        }
    }

	m_switch->init();
}

//void Router_CN::addInPort(NetworkLink_CN *in_link, CreditLink_d *credit_link)
//void Router_CN::addInPort(NetworkLink_CN *in_link)
void Router_CN::addInPort(NetworkLink_CN *in_link, PortType portType)
{
	int port_num = m_input_unit.size();
	InputUnit_CN *input_unit = new InputUnit_CN(port_num, this);

    InPortTypes.insertAtBottom(portType);
	input_unit->set_in_link(in_link);
//	input_unit->set_credit_link(credit_link);
	//in_link->setLinkConsumer(input_unit);
	in_link->setLinkConsumer(m_switch);
    in_link->setDestPortNum(port_num);
    in_link->setDestRouter(this);
//	credit_link->setSourceQueue(input_unit->getCreditQueue());
	
	m_input_unit.insertAtBottom(input_unit);
}

//void Router_CN::addOutPort(NetworkLink_CN *out_link, const NetDest& routing_table_entry, int link_weight, CreditLink_d *credit_link)
//void Router_CN::addOutPort(NetworkLink_CN *out_link, const NetDest& routing_table_entry, int link_weight)
void Router_CN::addOutPort(NetworkLink_CN *out_link, const NetDest& routing_table_entry, int link_weight, PortType portType)
{
	int port_num = m_output_unit.size();
	OutputUnit_CN *output_unit = new OutputUnit_CN(port_num, this, portType);

    OutPortTypes.insertAtBottom(portType);	
	output_unit->set_out_link(out_link);
//	output_unit->set_credit_link(credit_link);
//	credit_link->setLinkConsumer(output_unit);
	out_link->setSourceQueue(output_unit->getOutQueue());
    if (portType == PortType_Eject)
    {
        out_link->setEjectOutputUnit(output_unit);
    }
	out_link->setSrcPortNum(port_num);
	out_link->setSrcRouter(this);
	
	m_output_unit.insertAtBottom(output_unit);

	m_routing_unit->addRoute(routing_table_entry);
	m_routing_unit->addWeight(link_weight);
}

void Router_CN::route_req(flit_CN *t_flit, InputUnit_CN *in_unit, int invc)
{
	//m_routing_unit->RC_stage(t_flit, in_unit, invc);
}
/*
void Router_CN::vcarb_req()
{
	g_eventQueue_ptr->scheduleEvent(m_vc_alloc, 1);
}
void Router_CN::swarb_req()
{
	g_eventQueue_ptr->scheduleEvent(m_sw_alloc, 1);
}
void Router_CN::update_incredit(int in_port, int in_vc, int credit)
{
	m_input_unit[in_port]->update_credit(in_vc, credit);
}
*/
void Router_CN::update_sw_winner(int inport, flit_CN *t_flit)
{
    DEBUG_MSG(NETWORK_COMP, MedPrio, "In Router_CN : " + int_to_string(m_id));
    m_switch->update_sw_winner(inport, t_flit);
	g_eventQueue_ptr->scheduleEvent(m_switch, 1);
}

void Router_CN::calculate_performance_numbers()
{
    buf_read_count = 0.0;
    buf_write_count = 0.0;
	for(int i = 0; i < m_input_unit.size(); i++)
	{
		buf_read_count += m_input_unit[i]->get_in_link()->get_buf_read_count();
		buf_write_count += m_input_unit[i]->get_in_link()->get_buf_write_count();
	}
	crossbar_count = m_switch->get_crossbar_count();
	//vc_local_arbit_count = m_vc_alloc->get_local_arbit_count();
	//vc_global_arbit_count = m_vc_alloc->get_global_arbit_count();
	//sw_local_arbit_count = m_sw_alloc->get_local_arbit_count();
	//sw_global_arbit_count = m_sw_alloc->get_global_arbit_count();
}

void Router_CN::printConfig(ostream& out)
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

