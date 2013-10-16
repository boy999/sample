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
 * flitBuffer_CN.C
 *
 * Niket Agarwal, Princeton University
 *
 * */

#include "flitBuffer_CN.h"

flitBuffer_CN::flitBuffer_CN()
{
	max_size = INFINITE_;
}

flitBuffer_CN::flitBuffer_CN(int maximum_size)
{
	max_size = maximum_size;
}

bool flitBuffer_CN::isEmpty()
{
	return (m_buffer.size() == 0);
}

bool flitBuffer_CN::isReady()
{
    if(g_eventQueue_ptr->getTime() > 54900)
    {
        DEBUG_MSG(NETWORK_COMP, MedPrio, "m_buffer.size() = " + int_to_string(m_buffer.size()));
    }
	if(m_buffer.size() != 0 )
	{
		flit_CN *t_flit = m_buffer.peekMin();
        if(g_eventQueue_ptr->getTime() > 54900)
        {
            DEBUG_EXPR(NETWORK_COMP, MedPrio, t_flit->get_time());
            DEBUG_MSG(NETWORK_COMP, MedPrio, g_eventQueue_ptr->getTime());
        }
		if(t_flit->get_time() <= g_eventQueue_ptr->getTime())
			return true;
	}
	return false;	
}

bool flitBuffer_CN::isReadyForNext()
{ 
	if(m_buffer.size() != 0 )
	{
		flit_CN *t_flit = m_buffer.peekMin();
		if(t_flit->get_time() <= (g_eventQueue_ptr->getTime() + 1))
			return true;
	}
	return false;	
}

void flitBuffer_CN::print(ostream& out) const
{
	out << "[flitBuffer: ";
	out << m_buffer.size() << "] " << endl;
    flit_CN * t_flit = m_buffer.peekMin();
    out << "flit in peekMin() is :" << endl;
    out << t_flit->get_msg_ptr() << endl;
    out << "flits in the m_buffer are :" << endl;
	for (int i = 0; i < m_buffer.size(); i++)
    {
       out << m_buffer.peekElement(i+1)->get_msg_ptr() << endl;
    }
}

bool flitBuffer_CN::isFull() 
{
	return (m_buffer.size() >= max_size);
}

void flitBuffer_CN::setMaxSize(int maximum)
{
	max_size = maximum;
}
