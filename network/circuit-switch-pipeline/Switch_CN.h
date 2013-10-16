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
 * Switch_CN.h
 *
 * Niket Agarwal, Princeton University
 *
 * */

#ifndef SWITCH_CN_H
#define SWITCH_CN_H

#include "NetworkHeader.h"
#include "Consumer.h"
#include "flitBuffer_CN.h"

class Router_CN;
class OutputUnit_CN;

class Switch_CN : public Consumer {
public:
	Switch_CN(Router_CN *router);	
	~Switch_CN();
	void wakeup();
	void init();
	void check_for_wakeup();
  	void print(ostream& out) const {};
	inline void update_sw_winner(int inport, flit_CN *t_flit)
	{
        DEBUG_MSG(NETWORK_COMP, MedPrio, "executing");
        DEBUG_EXPR(NETWORK_COMP, MedPrio, inport)
        DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_msg_ptr());
       		m_switch_buffer[inport]->insert(t_flit);
	}
	inline double get_crossbar_count()
	{
		return m_crossbar_activity;
	}


private:
	int m_num_vcs;
	int m_num_inports;
	double m_crossbar_activity;
	Router_CN *m_router;
	Vector<flitBuffer_CN *> m_switch_buffer;
	Vector<OutputUnit_CN *> m_output_unit;
}; 

#endif
