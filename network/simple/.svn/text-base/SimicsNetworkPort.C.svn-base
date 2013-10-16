//BEGIN edit by Mike, 12/22/10

#include "interface.h"
#include <iostream>
#include <cstdio>
#include <map>
#include <cassert>
#include "AbstractChip.h"
#include "SimicsNetworkPort.h"
#include "SimicsPortMessage.h"
#include "MessageBuffer.h"
#include "MachineID.h"

extern "C"
{
	#include "SimicsNetworkPortInterface.h"
}
#ifdef SIM_NET_PORTS
Network* currentNetwork;
std::vector<SimicsNetworkPort*> portSet;
std::map<int, int> deviceToPortMap;
int SimicsNetworkPort::nextID = 0;
std::map<int, SimicsNetworkPort::SNPMsg*> SimicsNetworkPort::msgSet;
std::stack<SimicsNetworkPort::SNPMsg*> SimicsNetworkPort::msgPool;
class EndOfLineMessageDeliverStruct
{
public:
	SimicsNetworkPort* snp;
	char* buffer;
	size_t size;
	int destinationID;
	int source;
};
void SimicsNetworkPort::EndOfLineMessageDeliver(void* a)
{
	EndOfLineMessageDeliverStruct* eol = (EndOfLineMessageDeliverStruct*)a;
	if(eol->snp->deviceListeners.find(eol->destinationID) != eol->snp->deviceListeners.end())
	{
		std::vector<void (*)(void*, int, int, const char*, int)>& listeners = eol->snp->deviceListeners[eol->destinationID];
		std::vector<void*>& args = eol->snp->deviceData[eol->destinationID];
		assert(deviceToPortMap.find(eol->destinationID) != deviceToPortMap.end());
		assert(deviceToPortMap.find(eol->source) != deviceToPortMap.end());
		for(size_t i = 0; i < listeners.size(); i++)
		{
			assert(listeners[i]);
			listeners[i](args[i], eol->source, eol->destinationID, eol->buffer, eol->size);
		}
	}
	delete [] eol->buffer;
	delete eol;
}
#endif
SimicsNetworkPort* GetSimicsPort(int nodeID)
{
#ifdef SIM_NET_PORTS
	if(!(nodeID >= 0 && nodeID < SimicsNetworkPortInterface_GetSimicsPortCount()))
	{
		std::cout << nodeID << " is not a simics port" << std::endl;
		assert(nodeID >= 0 && nodeID < SimicsNetworkPortInterface_GetSimicsPortCount());
	}
	assert(portSet[nodeID]);
	return portSet[nodeID];
#else 
	DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
	ASSERT(0);
	return NULL;
#endif
}
int SimicsNetworkPortInterface_GetSimicsPortCount()
{
#ifdef SIM_NET_PORTS
	return RubyConfig::numberOfSimicsNetworkPort();
#else
        DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
        ASSERT(0);
	return 0;
#endif
}
void SimicsNetworkPortInterface_BindDeviceToPort(int portID, int deviceID)
{
#ifdef SIM_NET_PORTS
	assert(deviceID >= 0);
	assert(deviceToPortMap.find(deviceID) == deviceToPortMap.end());
	assert(GetSimicsPort(portID) != NULL);
	deviceToPortMap[deviceID] = portID;
#else
        DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
        ASSERT(0);
#endif
}
void SimicsNetworkPortInterface_SendMessageOnPort(int source, int target, const void* buffer, int length)
{
#ifdef SIM_NET_PORTS
	GetSimicsPort(source)->SendPortMessage((const char*)buffer, length, target);
#else
        DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
        ASSERT(0);
#endif
}
void SimicsNetworkPortInterface_SendMessageOnDevice(int source, int target, const void* buffer, int length)
{
#ifdef SIM_NET_PORTS
	if(deviceToPortMap.find(target) == deviceToPortMap.end())
	{
		std::cout << "Could not find " << target << std::endl;
		assert(deviceToPortMap.find(target) != deviceToPortMap.end());
	}
std::cout << "Emitting message from " << source << " to " << target << " with size " << length << std::endl;
	GetSimicsPort(deviceToPortMap[source])->SendDeviceMessage(source, (const char*)buffer, length, target);
#else
        DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
        ASSERT(0);
#endif
}
void SimicsNetworkPortInterface_RegisterRecvHandlerOnPort(int portID, void (*handler)(void*, int, int, const char*, int), void* data)
{
#ifdef SIM_NET_PORTS
	GetSimicsPort(portID)->RegisterPortMessageHandler(handler, data);
#else
        DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
        ASSERT(0);
#endif
}
void SimicsNetworkPortInterface_RegisterRecvHandlerOnDevice(int deviceID, void (*handler)(void*, int, int, const char*, int), void* data)
{
#ifdef SIM_NET_PORTS
	assert(deviceToPortMap.find(deviceID) != deviceToPortMap.end());
	GetSimicsPort(deviceToPortMap[deviceID])->RegisterDeviceMessageHandler(deviceID, handler, data);
#else
        DEBUG_OUT("System was not compiled with SIM_NET_PORTS\n");
        ASSERT(0);
#endif
}
extern "C" void InitializeSimicsNetworkPortInterface(SimicsNetworkPortInterface* smpi)
{
	smpi->BindDeviceToPort = SimicsNetworkPortInterface_BindDeviceToPort;
	smpi->SendMessageOnDevice = SimicsNetworkPortInterface_SendMessageOnDevice;
	smpi->SendMessageOnPort = SimicsNetworkPortInterface_SendMessageOnPort;
	smpi->GetSimicsPortCount = SimicsNetworkPortInterface_GetSimicsPortCount;
	smpi->RegisterRecvHandlerOnDevice = SimicsNetworkPortInterface_RegisterRecvHandlerOnDevice;
        smpi->RegisterRecvHandlerOnPort = SimicsNetworkPortInterface_RegisterRecvHandlerOnPort;
}
#ifdef SIM_NET_PORTS
SimicsNetworkPort::SimicsNetworkPort(const AbstractChip* c, int i)
{
	while(i >= (int)portSet.size())
	{
		portSet.push_back(NULL);
	}
	portSet[i] = this;
	chipPtr = c;
	net = c->getNetwork();
	port = i;
	name = "";
}
void SimicsNetworkPort::print(std::ostream& outs) const
{

}
void SimicsNetworkPort::SendPortMessage(const char* buffer, int length, int destinationID)
{
	assert(buffer);
	assert(length > 0);
	SNPMsg* m;
	m = new SNPMsg();
	m->id = nextID++;
	m->refCount = 1;
	m->src = port;
	m->dst = -1;	
	for(int i = 0; i < length; i++)
	{
		m->msg.push_back(buffer[i]);
	}
	assert(msgSet.find(m->id) == msgSet.end());
	msgSet[m->id] = m;
	//calc Msg
	SimicsPortMessage spm;
	spm.msgHandle = m->id;
	MachineID target;
	target.type = MachineType_SimicsNetworkPort;
	target.num = destinationID;
	spm.dest.add(target);
	spm.length = length;
	//send
	//std::cout << "[SimicsNetworkPort] Sending " << m->id << " on " << port << " toward " << destinationID << std::endl;
	chipPtr->m_SimicsNetworkPort_mandatoryQueue_vec[port]->enqueue(spm, 1);
}
void SimicsNetworkPort::SendDeviceMessage(int source, const char* buffer, int length, int destinationID)
{
	assert(buffer);
	assert(length > 0);
	assert(deviceToPortMap.find(source) != deviceToPortMap.end());
	assert(deviceToPortMap.find(destinationID) != deviceToPortMap.end());
	assert(deviceToPortMap[source] == port);
	int destinationPortID = deviceToPortMap[destinationID];
	if(destinationPortID == port)
	{
		EndOfLineMessageDeliverStruct* eol = new EndOfLineMessageDeliverStruct();
		eol->snp = this;
		eol->source = source;
		eol->destinationID = destinationID;
		eol->size = length;
		eol->buffer = new char[length];
		memcpy(eol->buffer, buffer, length);
		SIMICS_get_opal_interface()->scheduleCB(EndOfLineMessageDeliver, eol, 0);
//		SIM_time_post_cycle(SIM_proc_no_2_ptr(0), 1, Sim_Sync_Machine, EndOfLineMessageDeliver, eol);
		return;	
	}
	SNPMsg* m;
	m = new SNPMsg();
	m->id = nextID++;
	m->refCount = 1;
	m->src = source;
	m->dst = destinationID;
	for(int i = 0; i < length; i++)
	{
		m->msg.push_back(buffer[i]);
	}
	assert(msgSet.find(m->id) == msgSet.end());
	msgSet[m->id] = m;
	//calc Msg
	SimicsPortMessage spm;
	spm.msgHandle = m->id;
	MachineID target;
	target.type = MachineType_SimicsNetworkPort;
	target.num = destinationPortID;
	spm.dest.add(target);
	spm.length = length;
	//send
	//std::cout << "[SimicsNetworkPort] Sending " << m->id << " on " << port << " toward " << destinationID << std::endl;
	chipPtr->m_SimicsNetworkPort_mandatoryQueue_vec[port]->enqueue(spm, 1);
}
void SimicsNetworkPort::HandleMessage(int handle)
{
//	std::cout << "[SNP] Recieving " << handle << " on " << port << std::endl;
	if(msgSet.find(handle) != msgSet.end())
	{
		SNPMsg* m = msgSet[handle];
		msgSet.erase(handle);
		int srcPort = m->src;
//		std::cout << "[SNP] Recieving " << handle << " on " << port << " from " << m->src << std::endl;
		if(deviceListeners.find(m->dst) != deviceListeners.end())
		{
			std::vector<void (*)(void*, int, int, const char*, int)>& listeners = deviceListeners[m->dst];
			std::vector<void*>& args = deviceData[m->dst];
std::cout <<"Handling message from " << m->src << " to " << m->dst << " with length " << m->msg.size() << std::endl;
			assert(deviceToPortMap.find(m->dst) != deviceToPortMap.end());
			assert(deviceToPortMap.find(m->src) != deviceToPortMap.end());
			for(size_t i = 0; i < listeners.size(); i++)
			{
				assert(listeners[i]);
				listeners[i](args[i], m->src, m->dst, &(m->msg[0]), (int)(m->msg.size()));
			}
			srcPort = deviceToPortMap[m->src];
		}
	        for(size_t i = 0; i < portData.size(); i++)
	        {
			std::cout << "Dispatching to port" << std::endl;
			assert(portListeners[i]);
	                portListeners[i](portData[i], srcPort, port, &(m->msg[0]), (int)(m->msg.size()));
	        }
		delete m;
	}
	else
	{
//		std::cout << "[SNP] Message being rejected: " << handle << " on " << port << std::endl;
	}
}
void SimicsNetworkPort::RegisterPortMessageHandler(void (*handler)(void*, int, int, const char*, int), void* data)
{
	assert(handler);
	portData.push_back(data);
	portListeners.push_back(handler);
}
void SimicsNetworkPort::RegisterDeviceMessageHandler(int device, void (*handler)(void*, int, int, const char*, int), void* data)
{
	assert(handler);
	assert(deviceToPortMap.find(device) != deviceToPortMap.end());
	assert(deviceToPortMap[device] == port);
	deviceData[device].push_back(data);
	deviceListeners[device].push_back(handler);
}
void SimicsNetworkPort::IncrementRef(int handle)
{
}
void SimicsNetworkPort::DecrementRef(int handle)
{
}
#endif
