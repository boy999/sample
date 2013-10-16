//BEGIN edit by Mike, 12/22/10
#ifndef SIMICS_NETWORK_PORT_H
#define SIMICS_NETWORK_PORT_H

#include <string>
#include <vector>
#include <ostream>
#include <map>
#include <stack>
#include <set>
#include "Consumer.h"
#include "EventQueue.h"
#include "Network.h"
#include "NetworkMessage.h"

class AbstractChip;
class conf_object;
typedef conf_object conf_object_t;
class SimicsNetworkPort
{
#ifdef SIM_NET_PORTS
	class SNPMsg
	{
	public:
		int id;
		std::vector<char> msg;
		int src;
		int dst;
		int refCount;
		bool seen;
	};
	std::map<int, std::vector<void*> > deviceData;
	std::map<int, std::vector<void (*)(void*, int, int, const char*, int)> > deviceListeners;
	std::vector<void*> portData;
	std::vector<void (*)(void*, int, int, const char*, int)> portListeners;
	const AbstractChip* chipPtr;
	const Network* net;
	int port;
	std::string name;
	static int nextID;
	static std::map<int, SNPMsg*> msgSet;
	static std::stack<SNPMsg*> msgPool;
	static void EndOfLineMessageDeliver(void*);
public:
	SimicsNetworkPort(const AbstractChip* c, int i);
	virtual ~SimicsNetworkPort(){}
	virtual void print(std::ostream& outs) const;
	void printConfig(std::ostream& output) const { print(output); }
	void SendPortMessage(const char* buffer, int length, int destination);
	void SendDeviceMessage(int source, const char* buffer, int length, int destination);
	bool MayEmitMemoryRead(pa_t address, size_t size);
	bool MayEmitMemoryWrite(pa_t address, size_t size);
	void EmitMemoryRead(int targetCPU, int targetCache, pa_t address, size_t size);
	void EmitMemoryWrite(int targetCPU, int targetCache, pa_t address, size_t size);
	void RegisterMemoryHandler(void (*handler)(void* data, bool read, bool write, pa_t address, size_t size), void* data);
	void HandleMessage(int handle);
	void RegisterPortMessageHandler(void (*handler)(void*, int, int, const char*, int), void* data);
	void RegisterDeviceMessageHandler(int device, void (*handler)(void*, int, int, const char*, int), void* data);
	static void IncrementRef(int handle);
	static void DecrementRef(int handle);
#endif
};
SimicsNetworkPort* GetSimicsPort(int nodeID);
int SimicsNetworkPortInterface_GetSimicsPortCount();
void SimicsNetworkPortInterface_BindDeviceToPort(int portID, int deviceID);
void SimicsNetworkPortInterface_SendMessageOnPort(int source, int target, const void* buffer, int length);
void SimicsNetworkPortInterface_SendMessageOnDevice(int deviceID, int destID, const void* buffer, int length);
void SimicsNetworkPortInterface_RegisterRecvHandlerOnPort(int portID, void (*handler)(void*, int, int, const char*, int), void* data);
void SimicsNetworkPortInterface_RegisterRecvHandlerOnDevice(int deviceID, void (*handler)(void*, int, int, const char*, int), void* data);
#endif
