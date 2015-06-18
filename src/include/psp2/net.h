#ifndef _PSP2_NET
#define _PSP2_NET

/* defines */

#define PSP2_NET_DUMP_PEEK      0x00000010
#define PSP2_NET_DUMP_DONTWAIT  0x00000020
#define PSP2_NET_DUMP_OVERFLOW  0x00000040
#define PSP2_NET_DUMP_ABORT_FLAG_PRESERVATION  0x00000001

#define PSP2_NET_EPOLLIN         0x00000001
#define PSP2_NET_EPOLLOUT        0x00000002
#define PSP2_NET_EPOLLERR        0x00000008
#define PSP2_NET_EPOLLHUP        0x00000010
#define PSP2_NET_EPOLLDESCID     0x00010000

#define PSP2_NET_EPOLL_CTL_ADD   1
#define PSP2_NET_EPOLL_CTL_MOD   2
#define PSP2_NET_EPOLL_CTL_DEL   3

#define PSP2_NET_EPOLL_ABORT_FLAG_PRESERVATION   0x00000001

#define PSP2_NET_ERROR_EPERM                     0x80410101
#define PSP2_NET_ERROR_ENOENT                    0x80410102
#define PSP2_NET_ERROR_ESRCH                     0x80410103
#define PSP2_NET_ERROR_EINTR                     0x80410104
#define PSP2_NET_ERROR_EIO                       0x80410105
#define PSP2_NET_ERROR_ENXIO                     0x80410106
#define PSP2_NET_ERROR_E2BIG                     0x80410107
#define PSP2_NET_ERROR_ENOEXEC                   0x80410108
#define PSP2_NET_ERROR_EBADF                     0x80410109
#define PSP2_NET_ERROR_ECHILD                    0x8041010A
#define PSP2_NET_ERROR_EDEADLK                   0x8041010B
#define PSP2_NET_ERROR_ENOMEM                    0x8041010C
#define PSP2_NET_ERROR_EACCES                    0x8041010D
#define PSP2_NET_ERROR_EFAULT                    0x8041010E
#define PSP2_NET_ERROR_ENOTBLK                   0x8041010F
#define PSP2_NET_ERROR_EBUSY                     0x80410110
#define PSP2_NET_ERROR_EEXIST                    0x80410111
#define PSP2_NET_ERROR_EXDEV                     0x80410112
#define PSP2_NET_ERROR_ENODEV                    0x80410113
#define PSP2_NET_ERROR_ENOTDIR                   0x80410114
#define PSP2_NET_ERROR_EISDIR                    0x80410115
#define PSP2_NET_ERROR_EINVAL                    0x80410116
#define PSP2_NET_ERROR_ENFILE                    0x80410117
#define PSP2_NET_ERROR_EMFILE                    0x80410118
#define PSP2_NET_ERROR_ENOTTY                    0x80410119
#define PSP2_NET_ERROR_ETXTBSY                   0x8041011A
#define PSP2_NET_ERROR_EFBIG                     0x8041011B
#define PSP2_NET_ERROR_ENOSPC                    0x8041011C
#define PSP2_NET_ERROR_ESPIPE                    0x8041011D
#define PSP2_NET_ERROR_EROFS                     0x8041011E
#define PSP2_NET_ERROR_EMLINK                    0x8041011F
#define PSP2_NET_ERROR_EPIPE                     0x80410120
#define PSP2_NET_ERROR_EDOM                      0x80410121
#define PSP2_NET_ERROR_ERANGE                    0x80410122
#define PSP2_NET_ERROR_EAGAIN                    0x80410123
#define PSP2_NET_ERROR_EWOULDBLOCK               0x80410123
#define PSP2_NET_ERROR_EINPROGRESS               0x80410124
#define PSP2_NET_ERROR_EALREADY                  0x80410125
#define PSP2_NET_ERROR_ENOTSOCK                  0x80410126
#define PSP2_NET_ERROR_EDESTADDRREQ              0x80410127
#define PSP2_NET_ERROR_EMSGSIZE                  0x80410128
#define PSP2_NET_ERROR_EPROTOTYPE                0x80410129
#define PSP2_NET_ERROR_ENOPROTOOPT               0x8041012A
#define PSP2_NET_ERROR_EPROTONOSUPPORT           0x8041012B
#define PSP2_NET_ERROR_ESOCKTNOSUPPORT           0x8041012C
#define PSP2_NET_ERROR_EOPNOTSUPP                0x8041012D
#define PSP2_NET_ERROR_EPFNOSUPPORT              0x8041012E
#define PSP2_NET_ERROR_EAFNOSUPPORT              0x8041012F
#define PSP2_NET_ERROR_EADDRINUSE                0x80410130
#define PSP2_NET_ERROR_EADDRNOTAVAIL             0x80410131
#define PSP2_NET_ERROR_ENETDOWN                  0x80410132
#define PSP2_NET_ERROR_ENETUNREACH               0x80410133
#define PSP2_NET_ERROR_ENETRESET                 0x80410134
#define PSP2_NET_ERROR_ECONNABORTED              0x80410135
#define PSP2_NET_ERROR_ECONNRESET                0x80410136
#define PSP2_NET_ERROR_ENOBUFS                   0x80410137
#define PSP2_NET_ERROR_EISCONN                   0x80410138
#define PSP2_NET_ERROR_ENOTCONN                  0x80410139
#define PSP2_NET_ERROR_ESHUTDOWN                 0x8041013A
#define PSP2_NET_ERROR_ETOOMANYREFS              0x8041013B
#define PSP2_NET_ERROR_ETIMEDOUT                 0x8041013C
#define PSP2_NET_ERROR_ECONNREFUSED              0x8041013D
#define PSP2_NET_ERROR_ELOOP                     0x8041013E
#define PSP2_NET_ERROR_ENAMETOOLONG              0x8041013F
#define PSP2_NET_ERROR_EHOSTDOWN                 0x80410140
#define PSP2_NET_ERROR_EHOSTUNREACH              0x80410141
#define PSP2_NET_ERROR_ENOTEMPTY                 0x80410142
#define PSP2_NET_ERROR_EPROCLIM                  0x80410143
#define PSP2_NET_ERROR_EUSERS                    0x80410144
#define PSP2_NET_ERROR_EDQUOT                    0x80410145
#define PSP2_NET_ERROR_ESTALE                    0x80410146
#define PSP2_NET_ERROR_EREMOTE                   0x80410147
#define PSP2_NET_ERROR_EBADRPC                   0x80410148
#define PSP2_NET_ERROR_ERPCMISMATCH              0x80410149
#define PSP2_NET_ERROR_EPROGUNAVAIL              0x8041014A
#define PSP2_NET_ERROR_EPROGMISMATCH             0x8041014B
#define PSP2_NET_ERROR_EPROCUNAVAIL              0x8041014C
#define PSP2_NET_ERROR_ENOLCK                    0x8041014D
#define PSP2_NET_ERROR_ENOSYS                    0x8041014E
#define PSP2_NET_ERROR_EFTYPE                    0x8041014F
#define PSP2_NET_ERROR_EAUTH                     0x80410150
#define PSP2_NET_ERROR_ENEEDAUTH                 0x80410151
#define PSP2_NET_ERROR_EIDRM                     0x80410152
#define PSP2_NET_ERROR_ENOMS                     0x80410153
#define PSP2_NET_ERROR_EOVERFLOW                 0x80410154
#define PSP2_NET_ERROR_EILSEQ                    0x80410155
#define PSP2_NET_ERROR_ENOTSUP                   0x80410156
#define PSP2_NET_ERROR_ECANCELED                 0x80410157
#define PSP2_NET_ERROR_EBADMSG                   0x80410158
#define PSP2_NET_ERROR_ENODATA                   0x80410159
#define PSP2_NET_ERROR_ENOSR                     0x8041015A
#define PSP2_NET_ERROR_ENOSTR                    0x8041015B
#define PSP2_NET_ERROR_ETIME                     0x8041015C
#define PSP2_NET_ERROR_EADHOC                    0x804101A0
#define PSP2_NET_ERROR_EDISABLEDIF               0x804101A1
#define PSP2_NET_ERROR_ERESUME                   0x804101A2
#define PSP2_NET_ERROR_ENOTINIT                  0x804101C8
#define PSP2_NET_ERROR_ENOLIBMEM                 0x804101C9
#define PSP2_NET_ERROR_ERESERVED202              0x804101CA
#define PSP2_NET_ERROR_ECALLBACK                 0x804101CB
#define PSP2_NET_ERROR_EINTERNAL                 0x804101CC
#define PSP2_NET_ERROR_ERETURN                   0x804101CD
#define PSP2_NET_ERROR_RESOLVER_EINTERNAL        0x804101DC
#define PSP2_NET_ERROR_RESOLVER_EBUSY            0x804101DD
#define PSP2_NET_ERROR_RESOLVER_ENOSPACE         0x804101DE
#define PSP2_NET_ERROR_RESOLVER_EPACKET          0x804101DF
#define PSP2_NET_ERROR_RESOLVER_ERESERVED224     0x804101E0
#define PSP2_NET_ERROR_RESOLVER_ENODNS           0x804101E1
#define PSP2_NET_ERROR_RESOLVER_ETIMEDOUT        0x804101E2
#define PSP2_NET_ERROR_RESOLVER_ENOSUPPORT       0x804101E3
#define PSP2_NET_ERROR_RESOLVER_EFORMAT          0x804101E4
#define PSP2_NET_ERROR_RESOLVER_ESERVERFAILURE   0x804101E5
#define PSP2_NET_ERROR_RESOLVER_ENOHOST          0x804101E6
#define PSP2_NET_ERROR_RESOLVER_ENOTIMPLEMENTED  0x804101E7
#define PSP2_NET_ERROR_RESOLVER_ESERVERREFUSED   0x804101E8
#define PSP2_NET_ERROR_RESOLVER_ENORECORD        0x804101E9
#define PSP2_NET_ERROR_RESOLVER_EALIGNMENT       0x804101EA



#define PSP2_NET_EPERM           1
#define PSP2_NET_ENOENT          2
#define PSP2_NET_ESRCH           3
#define PSP2_NET_EINTR           4
#define PSP2_NET_EIO             5
#define PSP2_NET_ENXIO           6
#define PSP2_NET_E2BIG           7
#define PSP2_NET_ENOEXEC         8
#define PSP2_NET_EBADF           9
#define PSP2_NET_ECHILD          10
#define PSP2_NET_EDEADLK         11
#define PSP2_NET_ENOMEM          12
#define PSP2_NET_EACCES          13
#define PSP2_NET_EFAULT          14
#define PSP2_NET_ENOTBLK         15
#define PSP2_NET_EBUSY           16
#define PSP2_NET_EEXIST          17
#define PSP2_NET_EXDEV           18
#define PSP2_NET_ENODEV          19
#define PSP2_NET_ENOTDIR         20
#define PSP2_NET_EISDIR          21
#define PSP2_NET_EINVAL          22
#define PSP2_NET_ENFILE          23
#define PSP2_NET_EMFILE          24
#define PSP2_NET_ENOTTY          25
#define PSP2_NET_ETXTBSY         26
#define PSP2_NET_EFBIG           27
#define PSP2_NET_ENOSPC          28
#define PSP2_NET_ESPIPE          29
#define PSP2_NET_EROFS           30
#define PSP2_NET_EMLINK          31
#define PSP2_NET_EPIPE           32
#define PSP2_NET_EDOM            33
#define PSP2_NET_ERANGE          34
#define PSP2_NET_EAGAIN          35
#define PSP2_NET_EWOULDBLOCK     PSP2_NET_EAGAIN
#define PSP2_NET_EINPROGRESS     36
#define PSP2_NET_EALREADY        37
#define PSP2_NET_ENOTSOCK        38
#define PSP2_NET_EDESTADDRREQ    39
#define PSP2_NET_EMSGSIZE        40
#define PSP2_NET_EPROTOTYPE      41
#define PSP2_NET_ENOPROTOOPT     42
#define PSP2_NET_EPROTONOSUPPORT 43
#define PSP2_NET_ESOCKTNOSUPPORT 44
#define PSP2_NET_EOPNOTSUPP      45
#define PSP2_NET_EPFNOSUPPORT    46
#define PSP2_NET_EAFNOSUPPORT    47
#define PSP2_NET_EADDRINUSE      48
#define PSP2_NET_EADDRNOTAVAIL   49
#define PSP2_NET_ENETDOWN        50
#define PSP2_NET_ENETUNREACH     51
#define PSP2_NET_ENETRESET       52
#define PSP2_NET_ECONNABORTED    53
#define PSP2_NET_ECONNRESET      54
#define PSP2_NET_ENOBUFS         55
#define PSP2_NET_EISCONN         56
#define PSP2_NET_ENOTCONN        57
#define PSP2_NET_ESHUTDOWN       58
#define PSP2_NET_ETOOMANYREFS    59
#define PSP2_NET_ETIMEDOUT       60
#define PSP2_NET_ECONNREFUSED    61
#define PSP2_NET_ELOOP           62
#define PSP2_NET_ENAMETOOLONG    63
#define PSP2_NET_EHOSTDOWN       64
#define PSP2_NET_EHOSTUNREACH    65
#define PSP2_NET_ENOTEMPTY       66
#define PSP2_NET_EPROCLIM        67
#define PSP2_NET_EUSERS          68
#define PSP2_NET_EDQUOT          69
#define PSP2_NET_ESTALE          70
#define PSP2_NET_EREMOTE         71
#define PSP2_NET_EBADRPC         72
#define PSP2_NET_ERPCMISMATCH    73
#define PSP2_NET_EPROGUNAVAIL    74
#define PSP2_NET_EPROGMISMATCH   75
#define PSP2_NET_EPROCUNAVAIL    76
#define PSP2_NET_ENOLCK          77
#define PSP2_NET_ENOSYS          78
#define PSP2_NET_EFTYPE          79
#define PSP2_NET_EAUTH           80
#define PSP2_NET_ENEEDAUTH       81
#define PSP2_NET_EIDRM           82
#define PSP2_NET_ENOMSG          83
#define PSP2_NET_EOVERFLOW       84
#define PSP2_NET_EILSEQ          85
#define PSP2_NET_ENOTSUP         86
#define PSP2_NET_ECANCELED       87
#define PSP2_NET_EBADMSG         88
#define PSP2_NET_ENODATA         89
#define PSP2_NET_ENOSR           90
#define PSP2_NET_ENOSTR          91
#define PSP2_NET_ETIME           92
#define PSP2_NET_EADHOC          160
#define PSP2_NET_EDISABLEDIF     161
#define PSP2_NET_ERESUME         162


#define PSP2_NET_ENOTINIT                           200
#define PSP2_NET_ENOLIBMEM                          201
#define PSP2_NET_ETLS                               202
#define PSP2_NET_ECALLBACK                          203
#define PSP2_NET_EINTERNAL                          204
#define PSP2_NET_ERETURN                            205


#define PSP2_NET_RESOLVER_EINTERNAL                 220
#define PSP2_NET_RESOLVER_EBUSY                     221
#define PSP2_NET_RESOLVER_ENOSPACE                  222
#define PSP2_NET_RESOLVER_EPACKET                   223
#define PSP2_NET_RESOLVER_ERESERVED224              224
#define PSP2_NET_RESOLVER_ENODNS                    225
#define PSP2_NET_RESOLVER_ETIMEDOUT                 226
#define PSP2_NET_RESOLVER_ENOSUPPORT                227
#define PSP2_NET_RESOLVER_EFORMAT                   228
#define PSP2_NET_RESOLVER_ESERVERFAILURE            229
#define PSP2_NET_RESOLVER_ENOHOST                   230
#define PSP2_NET_RESOLVER_ENOTIMPLEMENTED           231
#define PSP2_NET_RESOLVER_ESERVERREFUSED            232
#define PSP2_NET_RESOLVER_ENORECORD                 233
#define PSP2_NET_RESOLVER_EALIGNMENT                234

#define PSP2_NET_SOCKINFO_STATE_UNKNOWN      0
#define PSP2_NET_SOCKINFO_STATE_CLOSED       1
#define PSP2_NET_SOCKINFO_STATE_OPENED       2
#define PSP2_NET_SOCKINFO_STATE_LISTEN       3
#define PSP2_NET_SOCKINFO_STATE_SYN_SENT     4
#define PSP2_NET_SOCKINFO_STATE_SYN_RECEIVED 5
#define PSP2_NET_SOCKINFO_STATE_ESTABLISHED  6
#define PSP2_NET_SOCKINFO_STATE_FIN_WAIT_1   7
#define PSP2_NET_SOCKINFO_STATE_FIN_WAIT_2   8
#define PSP2_NET_SOCKINFO_STATE_CLOSE_WAIT   9
#define PSP2_NET_SOCKINFO_STATE_CLOSING      10
#define PSP2_NET_SOCKINFO_STATE_LAST_ACK     11
#define PSP2_NET_SOCKINFO_STATE_TIME_WAIT    12
#define PSP2_NET_SOCKINFO_F_SELF             0x00000001
#define PSP2_NET_SOCKINFO_F_KERNEL           0x00000002
#define PSP2_NET_SOCKINFO_F_OTHERS           0x00000004
#define PSP2_NET_SOCKINFO_F_RECV_WAIT        0x00010000
#define PSP2_NET_SOCKINFO_F_SEND_WAIT        0x00020000
#define PSP2_NET_SOCKINFO_F_RECV_EWAIT       0x00040000
#define PSP2_NET_SOCKINFO_F_SEND_EWAIT       0x00080000
#define PSP2_NET_SOCKINFO_F_WAKEUP_SIGNAL    0x00100000
#define PSP2_NET_SOCKINFO_F_ALL              0x001F0007

#define PSP2_NET_ID_SOCKET_MIN      0
#define PSP2_NET_ID_SOCKET_MAX      1023

#define PSP2_NET_EMULATION_FLAG_ETH0        0x00000001
#define PSP2_NET_EMULATION_FLAG_WLAN0       0x00000002
#define PSP2_NET_DEBUG_NAME_LEN_MAX 31

#define PSP2_NET_RESOLVER_PORT             53
#define PSP2_NET_RESOLVER_HOSTNAME_LEN_MAX 255

#define PSP2_NET_RESOLVER_ASYNC                          0x00000001
#define PSP2_NET_RESOLVER_START_NTOA_DISABLE_IPADDRESS   0x00010000

#define PSP2_NET_RESOLVER_ABORT_FLAG_NTOA_PRESERVATION   0x00000001
#define PSP2_NET_RESOLVER_ABORT_FLAG_ATON_PRESERVATION   0x00000002

#define PSP2_NET_IPPROTO_IP            0
#define PSP2_NET_IPPROTO_ICMP          1
#define PSP2_NET_IPPROTO_IGMP          2
#define PSP2_NET_IPPROTO_TCP           6
#define PSP2_NET_IPPROTO_UDP           17
#define PSP2_NET_SOL_SOCKET            0xffff

#define PSP2_NET_IP_HDRINCL            2
#define PSP2_NET_IP_TOS                3
#define PSP2_NET_IP_TTL                4
#define PSP2_NET_IP_MULTICAST_IF       9
#define PSP2_NET_IP_MULTICAST_TTL      10
#define PSP2_NET_IP_MULTICAST_LOOP     11
#define PSP2_NET_IP_ADD_MEMBERSHIP     12
#define PSP2_NET_IP_DROP_MEMBERSHIP    13
#define PSP2_NET_IP_TTLCHK             23
#define PSP2_NET_IP_MAXTTL             24

#define PSP2_NET_TCP_NODELAY           1
#define PSP2_NET_TCP_MAXSEG            2
#define PSP2_NET_TCP_MSS_TO_ADVERTISE  3

#define PSP2_NET_SO_REUSEADDR          0x00000004
#define PSP2_NET_SO_KEEPALIVE          0x00000008
#define PSP2_NET_SO_BROADCAST          0x00000020
#define PSP2_NET_SO_LINGER             0x00000080
#define PSP2_NET_SO_OOBINLINE          0x00000100
#define PSP2_NET_SO_REUSEPORT          0x00000200
#define PSP2_NET_SO_ONESBCAST          0x00000800
#define PSP2_NET_SO_USECRYPTO          0x00001000
#define PSP2_NET_SO_USESIGNATURE       0x00002000
#define PSP2_NET_SO_SNDBUF             0x1001
#define PSP2_NET_SO_RCVBUF             0x1002
#define PSP2_NET_SO_SNDLOWAT           0x1003
#define PSP2_NET_SO_RCVLOWAT           0x1004
#define PSP2_NET_SO_SNDTIMEO           0x1005
#define PSP2_NET_SO_RCVTIMEO           0x1006
#define PSP2_NET_SO_ERROR              0x1007
#define PSP2_NET_SO_TYPE               0x1008
#define PSP2_NET_SO_NBIO               0x1100
#define PSP2_NET_SO_TPPOLICY           0x1101
#define PSP2_NET_SO_NAME               0x1102

#define PSP2_NET_SOCK_STREAM           1
#define PSP2_NET_SOCK_DGRAM            2
#define PSP2_NET_SOCK_RAW              3
#define PSP2_NET_SOCK_DGRAM_P2P        6
#define PSP2_NET_SOCK_STREAM_P2P       10

#define PSP2_NET_ADHOC_PORT            3658

#define PSP2_NET_AF_INET               2

#define PSP2_NET_MSG_PEEK            0x00000002
#define PSP2_NET_MSG_WAITALL         0x00000040
#define PSP2_NET_MSG_DONTWAIT        0x00000080
#define PSP2_NET_MSG_USECRYPTO       0x00000400
#define PSP2_NET_MSG_USESIGNATURE    0x00000800

#define PSP2_NET_SHUT_RD             0
#define PSP2_NET_SHUT_WR             1
#define PSP2_NET_SHUT_RDWR           2

#define PSP2_NET_SOCKET_ABORT_FLAG_RCV_PRESERVATION  0x00000001
#define PSP2_NET_SOCKET_ABORT_FLAG_SND_PRESERVATION  0x00000002

#define PSP2_NET_INADDR_ANY           0x00000000
#define PSP2_NET_INADDR_LOOPBACK      0x7f000001
#define PSP2_NET_INADDR_BROADCAST     0xffffffff
#define PSP2_NET_INADDR_UNSPEC_GROUP  0xe0000000
#define PSP2_NET_INADDR_AUTOIP        0xa9fe0000
#define PSP2_NET_IN_CLASSD_NET        0xf0000000
#define PSP2_NET_IN_AUTOIP_NET        0xffff0000


#define PSP2_NET_IP_DEFAULT_MULTICAST_TTL   1
#define PSP2_NET_IP_DEFAULT_MULTICAST_LOOP  1

/* callback */

typedef void *(*SceNetResolverFunctionAllocate)(
	unsigned int size,
	int rid,
	const char *name,
	void *user);
typedef void (*SceNetResolverFunctionFree)(
	void *ptr,
	int rid,
	const char *name,
	void *user);

/* struct */

typedef struct SceNetFdSet {
	unsigned int bits[32];
} SceNetFdSet;

typedef struct SceNetInAddr {
	unsigned int s_addr;
} SceNetInAddr;

typedef struct SceNetSockaddrIn {
	unsigned char sin_len;
	unsigned char sin_family;
	unsigned short int sin_port;
	SceNetInAddr sin_addr;
	unsigned short int sin_vport;
	char sin_zero[6];
} SceNetSockaddrIn;

typedef struct SceNetIpMreq {
	SceNetInAddr imr_multiaddr;
	SceNetInAddr imr_interface;
} SceNetIpMreq;

typedef struct SceNetInitParam {
	void *memory;
	int size;
	int flags;
} SceNetInitParam;

typedef struct SceNetEmulationData {
	unsigned short int drop_rate;
	unsigned short int drop_duration;
	unsigned short int pass_duration;
	unsigned short int delay_time;
	unsigned short int delay_jitter;
	unsigned short int order_rate;
	unsigned short int order_delay_time;
	unsigned short int duplication_rate;
	unsigned int bps_limit;
	unsigned short int lower_size_limit;
	unsigned short int upper_size_limit;
	unsigned int system_policy_pattern;
	unsigned int game_policy_pattern;
	unsigned short int policy_flags[64];
	unsigned char reserved[64];
} SceNetEmulationData;

typedef struct SceNetEmulationParam {
	unsigned short int version;
	unsigned short int option_number;
	unsigned short int current_version;
	unsigned short int result;
	unsigned int flags;
	unsigned int reserved1;
	SceNetEmulationData send;
	SceNetEmulationData recv;
	unsigned int seed;
	unsigned char reserved[44];
} SceNetEmulationParam;

typedef struct SceNetEtherAddr {
	unsigned char data[6];
} SceNetEtherAddr;

typedef struct SceNetDnsInfo {
	SceNetInAddr dns_addr[2];
} SceNetDnsInfo;

typedef struct SceNetEpollDataExt {
	int id;
	unsigned int u32;
} SceNetEpollDataExt;

typedef union SceNetEpollData {
	void *ptr;
	int fd;
	unsigned int u32;
	unsigned long long int u64;
	SceNetEpollDataExt ext;
} SceNetEpollData;

typedef struct SceNetEpollSystemData {
	unsigned int system[4];
} SceNetEpollSystemData;

typedef struct SceNetEpollEvent {
	unsigned int events;
	unsigned int reserved;
	SceNetEpollSystemData system;
	SceNetEpollData data;
} SceNetEpollEvent;

typedef struct SceNetResolverParam {
	SceNetResolverFunctionAllocate allocate;
	SceNetResolverFunctionFree free;
	void *user;
} SceNetResolverParam;

typedef struct SceNetLinger {
	int l_onoff;
	int l_linger;
} SceNetLinger;

typedef struct SceNetSockaddr {
	unsigned char sa_len;
	unsigned char sa_family;
	char sa_data[14];
} SceNetSockaddr;

typedef struct SceNetIovec {
	void *iov_base;
	unsigned int iov_len;
} SceNetIovec;

typedef struct SceNetMsghdr {
	void *msg_name;
	unsigned int msg_namelen;
	SceNetIovec *msg_iov;
	int msg_iovlen;
	void *msg_control;
	unsigned int msg_controllen;
	int msg_flags;
} SceNetMsghdr;

typedef struct SceNetSockInfo {
	char name[PSP2_NET_DEBUG_NAME_LEN_MAX + 1];
	int pid;
	int s;
	char socket_type;
	char policy;
	short int reserved16;
	int recv_queue_length;
	int send_queue_length;
	SceNetInAddr local_adr;
	SceNetInAddr remote_adr;
	unsigned short int local_port;
	unsigned short int remote_port;
	unsigned short int local_vport;
	unsigned short int remote_vport;
	int state;
	int flags;
	int reserved[8];
} SceNetSockInfo;

typedef struct SceNetStatisticsInfo {

	int kernel_mem_free_size;
	int kernel_mem_free_min;
	int packet_count;
	int packet_qos_count;

	int libnet_mem_free_size;
	int libnet_mem_free_min;
} SceNetStatisticsInfo;

/* prototypes */

int sceNetInit(SceNetInitParam *param);
int sceNetTerm(void);

int sceNetShowIfconfig(void);
int sceNetShowRoute(void);
int sceNetShowNetstat(void);

int sceNetEmulationSet(SceNetEmulationParam *param, int flags);
int sceNetEmulationGet(SceNetEmulationParam *param, int flags);

int sceNetResolverCreate(const char *name,SceNetResolverParam *param,int flags);
int sceNetResolverStartNtoa(int rid, const char *hostname, SceNetInAddr *addr, int timeout, int retry, int flags);
int sceNetResolverStartAton(int rid, const SceNetInAddr *addr, char *hostname, int len, int timeout, int retry, int flags);
int sceNetResolverGetError(int rid, int *result);
int sceNetResolverDestroy(int rid);
int sceNetResolverAbort(int rid, int flags);

int sceNetDumpCreate(const char *name, int len, int flags);
int sceNetDumpRead(int id, void *buf, int len, int *pflags);
int sceNetDumpDestroy(int id);
int sceNetDumpAbort(int id, int flags);
int sceNetEpollCreate(const char *name, int flags);
int sceNetEpollControl(int eid, int op, int id,SceNetEpollEvent *event);
int sceNetEpollWait(int eid, SceNetEpollEvent *events, int maxevents, int timeout);
int sceNetEpollWaitCB(int eid, SceNetEpollEvent *events, int maxevents, int timeout);
int sceNetEpollDestroy(int eid);
int sceNetEpollAbort(int eid, int flags);

int sceNetEtherStrton(const char *str, SceNetEtherAddr *n);
int sceNetEtherNtostr(const SceNetEtherAddr *n, char *str, unsigned int len);
int sceNetGetMacAddress(SceNetEtherAddr *addr, int flags);

int sceNetSocket(const char *name, int domain, int type, int protocol);
int sceNetAccept(int s, SceNetSockaddr *addr, unsigned int *addrlen);
int sceNetBind(int s, const SceNetSockaddr *addr, unsigned int addrlen);
int sceNetConnect(int s, const SceNetSockaddr *name, unsigned int namelen);
int sceNetGetpeername(int s, SceNetSockaddr *name, unsigned int *namelen);
int sceNetGetsockname(int s, SceNetSockaddr *name, unsigned int *namelen);
int sceNetGetsockopt(int s, int level, int optname, void *optval, unsigned int *optlen);
int sceNetListen(int s, int backlog);
int sceNetRecv(int s, void *buf, unsigned int len, int flags);
int sceNetRecvfrom(int s, void *buf, unsigned int len, int flags, SceNetSockaddr *from, unsigned int *fromlen);
int sceNetRecvmsg(int s, SceNetMsghdr *msg, int flags);
int sceNetSend(int s, const void *msg, unsigned int len, int flags);
int sceNetSendto(int s, const void *msg, unsigned int len, int flags, const SceNetSockaddr *to, unsigned int tolen);
int sceNetSendmsg(int s, const SceNetMsghdr *msg, int flags);
int sceNetSetsockopt(int s, int level, int optname, const void *optval, unsigned int optlen);
int sceNetShutdown(int s, int how);
int sceNetSocketClose(int s);
int sceNetSocketAbort(int s, int flags);
int sceNetGetSockInfo(int s, SceNetSockInfo *info, int n, int flags);
int sceNetGetSockIdInfo(SceNetFdSet *fds, int sockinfoflags, int flags);
int sceNetGetStatisticsInfo(SceNetStatisticsInfo *info, int flags);

int sceNetSetDnsInfo(SceNetDnsInfo *info, int flags);
int sceNetClearDnsCache(int flags);

const char *sceNetInetNtop(int af,const void *src,char *dst,unsigned int size);
int sceNetInetPton(int af, const char *src, void *dst);

//TODO : create BSD aliases ?
long long unsigned int sceNetHtonll(unsigned long long int host64);
unsigned int sceNetHtonl(unsigned int host32);
unsigned short int sceNetHtons(unsigned short int host16);
unsigned long long int sceNetNtohll(unsigned long long int net64);
unsigned int sceNetNtohl(unsigned int net32);
unsigned short int sceNetNtohs(unsigned short int net16);

#endif
