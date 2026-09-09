---
title: /etc/sysctl.conf参数解释 - senlin1202的博客 - CSDN博客
updated: 2026-06-06T00:27
created: 2018-10-14T07:36:42
---

/etc/sysctl.conf参数解释 - senlin1202的博客 - CSDN博客
2018年10月14日
7:36

已剪辑自: <https://blog.csdn.net/senlin1202/article/details/50800434>
来自《深入理解Nginx模块开发与架构解析》 P9
\#表示进程（例如一个worker进程）可能同时打开的最大句柄数，直接限制最大并发连接数  
fs.file max = 999999
\#1代表允许将状态为TIME-WAIT状态的socket连接重新用于新的连接。对于服务器来说有意义，因为有大量的TIME-WAIT状态的连接  
net.ipv4.tcp_tw_reuse = 1
\#当keepalive启用时，TCP发送keepalive消息的频率。默认是2个小时。将其调小一些，可以更快的清除无用的连接  
net.ipv4.tcp_keepalive_time = 600
\#当服务器主动关闭链接时，socket保持FN-WAIT-2状态的最大时间  
net.ipv4.tcp_fin_timeout = 30
\#允许TIME-WAIT套接字数量的最大值。超过些数字，TIME-WAIT套接字将立刻被清除同时打印警告信息。默认是180000，过多的TIME-WAIT套接字会使webserver变慢  
net.ipv4.tcp_max_tw_buckets = 5000
\#当网卡接收的数据包的速度大于内核处理的速度时，会有一个队列保存这些数据包。这个参数就是这个队列的最大值。  
net.core.netdev_max_backlog = 8096
\#解决TCP的SYN攻击。与性能无关  
net.ipv4.tcp_syncookies = 1
\#三次握手建立阶段SYN请求队列的最大长度，默认是1024。设置大一些可以在繁忙时将来不及处理的请求放入队列，而不至于丢失客户端的请求  
net.ipv4.tcp_max_syn_backlog = 1024
# <span style='color:#1E4E79'>如何理解LVS中DR模型的arp请求-arp_announce和arp_ignore</span>
lvs在DR模式下需要关闭arp，设置参数的意思可以参考下文  
arp_announce和arp_ignore  
用来屏蔽arp请求，比较难理解，先看看linux核心2.6的定义：
==============================arp_announce=============================  
arp_announce - INTEGER Define different restriction levels for announcing the local source IP address from IP packets in ARP requests sent on interface:  
0 - (default) Use any local address, configured on any interface  
1 - Try to avoid local addresses that are not in the target's subnet for this interface. This mode is useful when target hosts reachable via this interface require the source IP address in ARP requests to be part of their logical network configured on the receiving interface. When we generate the request we will check all our subnets that include the target IP and will preserve the source address if it is from such subnet. If there is no such subnet we select source address according to the rules for level  
2 - Always use the best local address for this target. In this mode we ignore the source address in the IP packet and try to select local address that we prefer for talks with the target host. Such local address is selected by looking for primary IP addresses on all our subnets on the outgoing interface that include the target IP address. If no suitable local address is found we select the first local address we have on the outgoing interface or on all other interfaces, with the hope we will receive reply for our request and even sometimes no matter the source IP address we announce. The max value from conf/{all,interface}/arp_announce is used. Increasing the restriction level gives more chance for receiving answer from the resolved target while decreasing the level announces more valid sender's information.  

\#对网络接口上，本地IP地址的发出的，ARP回应，作出相应级别的限制: 确定不同程度的限制,宣布对来自本地源IP地址发出Arp请求的接口  
0 - (默认) 在任意网络接口（eth0,eth1，lo）上的任何本地地址  
1 -尽量避免不在该网络接口子网段的本地地址做出arp回应. 当发起ARP请求的源IP地址是被设置应该经由路由达到此网络接口的时候很有用.此时会检查来访IP是否为所有接口上的子网段内ip之一.如果改来访IP不属于各个网络接口上的子网段内,那么将采用级别2的方式来进行处理.  
2 - 对查询目标使用最适当的本地地址.在此模式下将忽略这个IP数据包的源地址并尝试选择与能与该地址通信的本地地址.首要是选择所有的网络接口的子网中外出访问子网中包含该目标IP地址的本地地址. 如果没有合适的地址被发现,将选择当前的发送网络接口或其他的有可能接受到该ARP回应的网络接口来进行发送.  
===========================arp_ignore============================  
arp_ignore - INTEGER Define different modes for sending replies in response to received ARP requests that resolve local target IP addresses:  
0 - (default): reply for any local target IP address, configured on any interface  
1 - reply only if the target IP address is local address configured on the incoming interface  
2 - reply only if the target IP address is local address configured on the incoming interface and both with the sender's IP address arepart from same subnet on this interface  
3 - do not reply for local addresses configured with scope host,only resolutions for global and link addresses are replied  
4-7 - reserved  
8 - do not reply for all local addresses  
The max value from conf/{all,interface}/arp_ignore is used when ARP request is received on the {interface}  
定义对目标地址为本地IP的ARP询问不同的应答模式0  
0 - (默认值): 回应任何网络接口上对任何本地IP地址的arp查询请求  
1 - 只回答目标IP地址是来访网络接口本地地址的ARP查询请求  
2 -只回答目标IP地址是来访网络接口本地地址的ARP查询请求,且来访IP必须在该网络接口的子网段内  
3 - 不回应该网络界面的arp请求，而只对设置的唯一和连接地址做出回应  
4-7 - 保留未使用  
8 -不回应所有（本地地址）的arp查询  
arp_ignore 设置为1，这个比较好理解，当别人的arp请求过来的时候，如果接收的设备上面没有这个ip，就不响应，默认是0，只要这台机器上面任何一个设备上面有这个ip，就响应arp请求，并发送mac地址应答。  
arp_announce 这个就比较难解释了，先看一段英文的：  
Assume that a linux box X has three interfaces - eth0, eth1 and eth2. Each interface has an IP address IP0, IP1 and IP2. When a local application tries to send an IP packet with IP0 through the eth2. Unfortunately, the target node’s mac address is not resolved. Thelinux box X will send the ARP request to know the mac address of the target(or the gateway). In this case what is the IP source address of the “ARP request message”? The IP0- the IP source address of the transmitting IP or IP2 - the outgoing interface? Until now(actually just 3 hours before) ARP request uses the IP address assigned to the outgoing interface(IP2 in the above example) However the linux’s behavior is a little bit different. Actually the selection of source address in ARP request is totally configurable bythe proc variable “arp_announce”  
If we want to use the IP2 not the IP0 in the ARP request, we should change the value to 1 or 2. The default value is 0 - allow IP0 is used for ARP request.  
其实就是路由器的问题，因为路由器一般是动态学习ARP包的（一般动态配置DHCP的话），当内网的机器要发送一个到外部的ip包，那么它就会请求 路由器的Mac地址，发送一个arp请求，这个arp请求里面包括了自己的ip地址和Mac地址，而linux默认是使用ip的源ip地址作为arp里面 的源ip地址，而不是使用发送设备上面的 ，这样在lvs这样的架构下，所有发送包都是同一个VIP地址，那么arp请求就会包括VIP地址和设备 Mac，而路由器收到这个arp请求就会更新自己的arp缓存，这样就会造成ip欺骗了，VIP被抢夺，所以就会有问题。  
arp缓存为什么会更新了，什么时候会更新呢，为了减少arp请求的次数，当主机接收到询问自己的arp请求的时候，就会把源ip和源Mac放入自 己的arp表里面，方便接下来的通讯。如果收到不是询问自己的包（arp是广播的，所有人都收到），就会丢掉，这样不会造成arp表里面无用数据太多导致 有用的记录被删除。  
What happens when a host receives an ARP request packet? The ARP request is received and processed by all the hosts in the network,since it is a broadcast packet. The following steps are carried out when a ARP request packet is received by a host: If the IP address to be resolved is for this host, then the ARP module sends an ARP reply packet with its Ethernet MAC address. If the IP address to be resolved is for this host, then the ARP module updates its ARP cache with the source Ethernet MAC address to source IP address mapping present in the ARP request packet. If the entry is already present in the cache, it is overwritten. If it is not present, it is added. If the IP address to be resolved is not for this host, then the ARP module discards the ARP request packet. Will a host update its ARP cache upon receiving any ARP request? A host will update its ARP cache, only if the ARP request is for its IP address. Otherwise, it will discard the ARP request. What is the disadvantage if a host updates its ARP cache upon receiving any ARP request? The host will exhaust the ARP cache with a lot of unused ARP entries, if it updates the ARP cache for any ARP request.  
如果路由器使用静态ARP表，客户端也使用静态网关ARP的话，基本就不用管这两个值了。 也看了一下vpn，用了pppoe协议，也是不需要处理arp请求的。  
查看某个设备上面绑定了多少个ip：\>ip addr show dev eth0  
绑定多个ip（临时，看操作系统不同加在不同的地方）：\>ip addr add x.x.x.x/32 dev eth0  
临时修改arp_announce和arp_ignore：  
echo 1 \> /proc/sys/net/ipv4/conf/eth0/arp_ignore  
echo 2 \> /proc/sys/net/ipv4/conf/eth0/arp_announce  
永久修改：  
if /etc/sysctl.conf is used in the system, we have this config in /etc/sysctl.conf  
net.ipv4.conf.eth0.arp_ignore = 1  
net.ipv4.conf.eth0.arp_announce = 2  
在lvs环境中，需要设定以下的参数  
echo"1"\>/proc/sys/net/ipv4/conf/all/arp_ignore  
echo"1"\>/proc/sys/net/ipv4/conf/lo/arp_ignore  
echo"2"\>/proc/sys/net/ipv4/conf/lo/arp_announce  
echo"2"\>/proc/sys/net/ipv4/conf/all/arp_announce
