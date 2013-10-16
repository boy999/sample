#ifndef RUBY_SIMICS_NETWORK_PORT_INTERFACE
#define RUBY_SIMICS_NETWORK_PORT_INTERFACE

typedef struct SimicsNetworkPortInterface_t
{
        int (*GetSimicsPortCount)();
	void (*BindDeviceToPort)(int portID, int deviceID);
	void (*SendMessageOnDevice)(int source, int target, const void* buffer, int length);
        void (*SendMessageOnPort)(int source, int target, const void* buffer, int length);
	void (*RegisterRecvHandlerOnDevice)(int device, void (*handler)(void*, int, int, const char*, int), void* data);
        void (*RegisterRecvHandlerOnPort)(int portID, void (*handler)(void*, int, int, const char*, int), void* data);
}SimicsNetworkPortInterface;

#endif
