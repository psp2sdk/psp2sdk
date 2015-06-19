#ifndef _PSP2_NETCTL
#define _PSP2_NETCTL

#include <psp2/net.h>

/* defines */

#define PSP2_NETCTL_INFO_CONFIG_NAME_LEN_MAX 64
#define PSP2_NETCTL_INFO_SSID_LEN_MAX        32

/* callback */

typedef void *(*SceNetCtlCallback)(
	int event_type,
	void *arg);

/* struct/union */

typedef union SceNetCtlInfo {
	char cnf_name[PSP2_NETCTL_INFO_CONFIG_NAME_LEN_MAX + 1];
	unsigned int device;
	SceNetEtherAddr ether_addr;
	unsigned int mtu;
	unsigned int link;
	SceNetEtherAddr bssid;
	char ssid[PSP2_NETCTL_INFO_SSID_NAME_LEN_MAX + 1];
	unsigned int wifi_security;
	unsigned int rssi_dbm;
	unsigned int rssi_percentage;
	unsigned int channel;
	unsigned int ip_config;
	char dhcp_hostname[256];
	char pppoe_auth_name[128];
	char ip_address[16];
	char netmask[16];
	char default_route[16];
	char primary_dns[16];
	char secondary_dns[16];
	unsigned int http_proxy_config;
	char http_proxy_server[256];
	unsigned int http_proxy_port;
} SceNetCtlInfo;


typedef struct SceNetCtlNatInfo {
	unsigned int size;
	int stun_status;
	int nat_type;
	SceNetInAddr mapped_addr;
} SceNetCtlNatInfo;

typedef struct SceNetCtlAdhocPeerInfo {
	SceNetCtlAdhocPeerInfo *next;
	SceNetInAddr inet_addr;
} SceNetCtlAdhocPeerInfo;

/* prototypes */

int sceNetCtlInit();
void sceNetCtlTerm();

int sceNetCtlCheckCallback();

int sceNetCtlInetGetResult(int eventType, int *errorCode);
int sceNetCtlAdhocGetResult(int eventType, int *errorCode);

int sceNetCtlInetGetInfo(int code, SceNetCtlInfo *info);
int sceNetCtlInetGetState(int *state);
int sceNetCtlGetNatInfo(SceNetCtlNatInfo *natinfo);

int sceNetCtlInetRegisterCallback(SceNetCtlCallback func, void *arg, int *cid);
int sceNetCtlInetUnregisterCallback(int cid);

int sceNetCtlAdhocRegisterCallback(SceNetCtlCallback func, void *arg, int *cid);
int sceNetCtlAdhocUnregisterCallback(int cid);
int sceNetCtlAdhocGetState(int *state);
int sceNetCtlAdhocDisconnect();
int sceNetCtlAdhocGetPeerList(unsigned int *buflen, void *buf);
int sceNetCtlAdhocGetInAddr(SceNetInAddr *inaddr);

#endif
