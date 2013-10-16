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
 * NetworkHeader.h
 *
 * Niket Agarwal, Princeton University
 *
 * */

#ifndef NETWORK_HEADER_H
#define NETWORK_HEADER_H

#include "Global.h"
#include "NodeID.h"

using namespace std;
using namespace __gnu_cxx;

enum flit_type {HEAD_, BODY_, TAIL_, HEAD_TAIL_, NUM_FLIT_TYPE_};
enum VC_state_type {IDLE_, VC_AB_, ACTIVE_, NUM_VC_STATE_TYPE_};
enum flit_stage {I_, VA_, SA_, ST_, LT_, NUM_FLIT_STAGE_};
//Mishali: to support more than one topology
enum topology_type {MESH, HIERARCHICAL_SWITCH, NUM_TOP};
#define NETCONFIG_DEFAULTS "netconfig.defaults"
// Chunyue: Be careful: actually, the definition of "virtual networks" has been used by Garnet/Ruby to indicate the virtual networks for different level, therefore, in the code, the "virtual class" means the real virtual network, and the virtual network in the code means the "sub virtual network" in a virtual network                                              
#define NUMBER_OF_VIRTUAL_CLASS 3 // 0: full adaptivae vn, 1: low level of deadlock vn, 2: high level of deadlock vn        
#define INFINITE_ 10000

enum outPortMap {THERE=0,NORTH=1,SOUTH=2,EAST=3,WEST=4,RF=5,BASE=6};
#define MAXPORT 8//Chunyue
#define DIR_PER_ROUTER 4
//By Chunyue: in order to use adaptive routing
//#define ADAPTIVE_ROUTING
#endif

