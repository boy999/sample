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
 * Routerunit_d.h
 *
 * Niket Agarwal, Princeton University
 * Edited by Mishali
 * Mishali: Using route computation similar to simplenoc
 * */

#ifndef ROUTING_UNIT_D_H
#define ROUTING_UNIT_D_H

#include<vector>
#include "flit_d.h"

using namespace std;

class InputUnit_d;
class Router_d;

class RoutingUnit_d {
public:
	RoutingUnit_d(Router_d *router, char* routingFile_fa, char* routingFile_df, char* extraLinkFile);
	void initializeRoutingUnit(char *file_fa, char* file_df);
	void routeCompute(flit_d *t_flit, InputUnit_d *in_unit, int invc, vector<int>& outport_fa, vector<int>& outport_df, vector<int>& output_vn_df);
	void RC_stage(flit_d *t_flit, InputUnit_d *in_unit, int invc);
 
  static int getRouteFa(int src, int dest, int meshdim)
  {
    int src_row = src/meshdim;
    int src_col = src%meshdim;
    int dest_row = dest/meshdim;
    int dest_col = dest%meshdim;
    return route_fa[src_row][src_col][dest_row][dest_col].at(0).at(0);
  }

  static bool checkFa(int src, int dest, int meshdim, int direction)
  {
    int src_row = src/meshdim;
    int src_col = src%meshdim;
    int dest_row = dest/meshdim;
    int dest_col = dest%meshdim;
    vector<vector<int> >::iterator it;
    for(it = route_fa[src_row][src_col][dest_row][dest_col].begin(); it != route_fa[src_row][src_col][dest_row][dest_col].end(); ++it)
    {
      vector<int>::iterator iit;
      for(iit = (*it).begin(); iit != (*it).end(); ++iit)
        if((*iit)%MAXPORT == direction%MAXPORT)
          return true;
    }
    return false;
  }

  static int getRouteDf(int src, int dest, int meshdim)
  {
    int src_row = src/meshdim;
    int src_col = src%meshdim;
    int dest_row = dest/meshdim;
    int dest_col = dest%meshdim;
    return route_df[src_row][src_col][dest_row][dest_col].at(0).at(0);
  }

  static bool checkDf(int src, int dest, int meshdim, int direction)
  {
    int src_row = src/meshdim;
    int src_col = src%meshdim;
    int dest_row = dest/meshdim;
    int dest_col = dest%meshdim;
    vector<vector<int> >::iterator it;
    for(it = route_df[src_row][src_col][dest_row][dest_col].begin(); it != route_df[src_row][src_col][dest_row][dest_col].end(); ++it)
    { 
      vector<int>::iterator iit;
      for(iit = (*it).begin(); iit != (*it).end(); ++iit)
        if((*iit)%MAXPORT == direction%MAXPORT)
          return true;
    }
    return false;
  }


  // Given a router id, check whether it has an RF-I port
  bool check_router_with_rfin(int rid)
  {
    vector<int>::iterator itr;
    for(itr = router_with_rfin.begin(); itr != router_with_rfin.end(); ++itr)
      if((*itr) == rid)
        return true;
    return false;
  }

private:
	Router_d *m_router;

  static vector<vector<int> >**** route_fa;
  static vector<vector<int> >**** route_df;

	static int**** route_dist;
	static int**** route_minbw;
	static int**** switchToSurfaceOnlyProb;
	
  //above four static members used for mesh, route_vector used for hier switch
	static bool first;
	static Vector < Vector < Vector <int> > > route_vector;
  
  static vector<int> router_with_rfin;
};

#endif
