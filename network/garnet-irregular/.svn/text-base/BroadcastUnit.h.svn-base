#ifndef BROADCAST_UNIT
#define BROADCAST_UNIT


#include "NetworkHeader.h"
#include "GarnetNetwork_d.h"
#include "Vector.h"
#include "Consumer.h"
#include "Message.h"


class NetworkMessage;
class MessageBuffer;
class GarnetNetwork_d;

class BroadcastUnit : public Consumer {
  GarnetNetwork_d *m_net_ptr;
  Vector<MessageBuffer *> broadcastBuffers;
  Time cycleCheck;
  int m_num_routers;
 public:
  BroadcastUnit(GarnetNetwork_d* net, int routers);
  void wakeup();
  void printConfig(ostream &out) const;
  void print(ostream &out) const;
  void insertIntoBuffer(MsgPtr msg, int id, Time delay);
};

#endif
