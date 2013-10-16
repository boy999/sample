//Mishali: added 08/2010

#ifdef STARFISH

#include "BroadcastUnit.h"
#include "MessageBuffer.h"
#include "NetworkConfig.h"
BroadcastUnit::BroadcastUnit(GarnetNetwork_d *net, int routers) 
{
  m_net_ptr = net;
  m_num_routers = routers;
  int clusters = routers/NetworkConfig::getClusterSize();
  broadcastBuffers.setSize(clusters);
  for (int i = 0; i < clusters; i++) {
    broadcastBuffers[i] = new MessageBuffer();
    broadcastBuffers[i]->setOrdering(false);
    broadcastBuffers[i]->setConsumer(this);
  }
  //hierarchy not needed when coalescing
  if (NetworkConfig::getSnoopScheme() == 1 && !NetworkConfig::coalesceWrites()) 
    g_eventQueue_ptr->scheduleEvent(this, 1);
}

void BroadcastUnit::wakeup()
{
  for (int i = 0; i < m_num_routers/NetworkConfig::getClusterSize(); i++) {
    if (broadcastBuffers[i]->isReady()) {
      MsgPtr msg_ptr = broadcastBuffers[i]->peekMsgPtr();
      Time current = g_eventQueue_ptr->getTime();
      Time delay = 0;
      if (!NetworkConfig::coalesceWrites()) {
	Time modval = current % (m_num_routers/NetworkConfig::getClusterSize());
	if (modval == i)
	  delay = 1; 
	else if (modval > i) 
	  delay = (m_num_routers/NetworkConfig::getClusterSize()) - modval + i + 1; 
	else
	  delay = (i - modval) + 1;
      } else { //if coalescing
	int numclusters = (m_num_routers/NetworkConfig::getClusterSize());
	Time modval = current % (numclusters/NetworkConfig::numCoalesce());
	int cluster = i % (numclusters/NetworkConfig::numCoalesce()); 
	assert(cluster < (numclusters/NetworkConfig::numCoalesce()));
	if (modval == cluster)
	  delay = 1;
	else if (modval > cluster)
	  delay = (numclusters/NetworkConfig::numCoalesce()) - modval + cluster + 1;
	else 
	  delay = (cluster - modval) + 1;
      }
      delay = delay + NetworkConfig::getBusLatency(); //to include rc bus delay
#ifdef STARFISH
      m_net_ptr->insertIntoNI(msg_ptr, delay);
#endif
      broadcastBuffers[i]->pop();
    }
  }
  if (!g_tester_done)
    g_eventQueue_ptr->scheduleEvent(this, 1);
}

void BroadcastUnit::insertIntoBuffer(MsgPtr msg, int id, Time delay)
{
  broadcastBuffers[id]->enqueue(msg, delay);
}

void BroadcastUnit::printConfig(ostream& out) const
{
  out << "Broadcast Unit ";
}

void BroadcastUnit::print(ostream& out) const
{
  out << "[Broadcast Unit]";
}

#endif
