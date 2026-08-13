---
title: Linux常用命令-网络命令 - 彳亍 - CSDN博客
updated: 2026-06-06T00:27
created: 2018-10-15T04:09:28
---

Linux常用命令-网络命令 - 彳亍 - CSDN博客
2018年10月15日
4:09

已剪辑自: <https://blog.csdn.net/lamp_yang_3533/article/details/53310844#t9>
### <span style='color:#5B9BD5'>1. 发送消息 write</span>
命令名称：write  
命令所在路径：/usr/bin/write  
执行权限：所有用户  
功能描述：给同台Linux服务器的在线用户发送消息，以Ctrl+D保存结束  
基本语法：write 用户名
- 1
- 2
- 3
- 4
- 5
**常见用法：**
write kongzi  
给指定用户kongzi发送消息，回车后输入消息内容。  
Hello World !  
This is a test !  
回车后，用Ctrl+D结束输入并进行发送。  
如果有字符输错了，可以用Ctrl+退格键进行删除。
- 1
- 2
- 3
- 4
- 5
- 6
### <span style='color:#5B9BD5'>2. 发送广播 wall</span>
命令名称：wall  
英文原意：write all  
命令所在路径：/usr/bin/wall  
执行权限：所有用户  
功能描述：给同台Linux服务器的所有在线用户发送广播消息  
基本语法：wall 广播内容
- 1
- 2
- 3
- 4
- 5
- 6
**常见用法：**
wall Hello World !  
回车，给所有在线用户（包括自己）发送广播消息 Hello World !
- 1
- 2
### <span style='color:#5B9BD5'>3. 测试网络连通性 ping</span>
命令名称：ping  
命令所在路径：/bin/ping  
执行权限：所有用户  
功能描述：测试网络是否连通  
常用选项：-c  
-c 指定发送数据包的次数  

基本语法：ping \[-选项\] IP地址或域名
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
**常见用法：**
ping 192.168.0.15  
测试本机与局域网内的其他主机192.168.0.15的连通性，默认会一直发送数据包。  
可用 Ctrl+C 强制终止当前命令。  

ping -c 3 192.168.0.15  
测试内网的连通性，只发送3次数据包。  

ping -c 3 [www.baidu.com](http://www.baidu.com)  
对外网的域名进行ping操作，可以测试本机是否连通了外网。
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
### <span style='color:#5B9BD5'>4. 查看网卡配置信息 ifconfig</span>
命令名称：ifconfig  
英文原意：interface configuration  
命令所在路径：/sbin/ifconfig  
执行权限：root  
功能描述：查看或临时配置网卡信息  

基本语法：ifconfig 网卡标识 IP地址
- 1
- 2
- 3
- 4
- 5
- 6
- 7
**说明：** ifconfig 命令主要是用来查看网卡的配置信息，因为用它来配置网卡的IP地址时，只会临时生效（Linux服务器重启后就会失效）。要想使本地网卡（eth0）的配置永久生效，需要修改其配置文件/etc/sysconfig/network-scripts/ifcfg-eth0。
**常见用法：**
ifconfig  
查看Linux服务器的网卡的相关信息。  

ifconfig eth0 192.168.0.15  
临时配置本地网卡eth0的IP地址，重启就会失效。  
eth0代表第1块本地网卡，这种配置ip的方式只能设置IP和子网掩码，估只适合内网（局域网）使用。  
如果想连通外网，还必须设置网关和DNS。
- 1
- 2
- 3
- 4
- 5
- 6
- 7
下面查看一下ifconfig的完整信息：
\[root@localhost ~\]# ifconfig  
eth0 Link encap:Ethernet HWaddr 08:00:27:4C:5B:B8  
inet addr:192.168.0.15 Bcast:192.168.0.255 Mask:255.255.255.0  
inet6 addr: fe80::a00:27ff:fe4c:5bb8/64 Scope:Link  
UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1  
RX packets:556121 errors:0 dropped:0 overruns:0 frame:0  
TX packets:42486 errors:0 dropped:0 overruns:0 carrier:0  
collisions:0 txqueuelen:1000  
RX bytes:38381703 (36.6 MiB) TX bytes:13507351 (12.8 MiB)  

lo Link encap:Local Loopback  
inet addr:127.0.0.1 Mask:255.0.0.0  
inet6 addr: ::1/128 Scope:Host  
UP LOOPBACK RUNNING MTU:65536 Metric:1  
RX packets:60 errors:0 dropped:0 overruns:0 frame:0  
TX packets:60 errors:0 dropped:0 overruns:0 carrier:0  
collisions:0 txqueuelen:0  
RX bytes:5040 (4.9 KiB) TX bytes:5040 (4.9 KiB)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
- 19
eth0 表示第1块本地网卡，它是按照数字顺序来命名的。  
如果有第2块本地网卡，就叫eth1。  
通常，我们主要会查看本地网卡的mac地址（HWaddr 08:00:27:4C:5B:B8）和IP地址（inet addr:192.168.0.15）。  

lo 表示本地回环网卡。  

如果你在查看网卡信息时，没有eth0这一项。很可能是因为本地网卡默认没有启动。  
可先修改它的配置文件：  
vi /etc/sysconfig/network-scripts/ifcfg-eth0  
加上如下代码，启动网卡：  
ONBOOT=yes  
保存退出后，运行下面的命令，重启网络服务，使网卡配置文件立即生效：  
service network restart  
再来运行ifconfig即可。
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
关于ifconfig命令，就先说到这里。后面我会详细讲述如何配置Linux服务器的IP地址。
### <span style='color:#5B9BD5'>5. 发送邮件 mail</span>
命令名称：mail  
命令所在路径：/bin/mail  
执行权限：所有用户  
功能描述：查看或发送邮件（Ctrl+D 执行发送）  
基本语法：mail 用户名
- 1
- 2
- 3
- 4
- 5
mail 命令可以给所有用户（包括自己）发送电子邮件，不管用户当前是否在线。
如果你的linux系统中没有mail命令，可使用下面的命令进行安装：
yum -y install mailx
- 1
**示例1：** 给root用户自身发送邮件
\[root@localhost ~\]# mail root  
Subject: Test  
Hello world !  
This is a simple test !
- 1
- 2
- 3
- 4
输完邮件主题和内容后，回车，按Ctrl+D进行发送即可。
**示例2：** 查看电子邮件
直接输入mail命令查看邮件列表，会进入邮件交互模式：
\[root@localhost ~\]# mail  
Heirloom Mail version 12.4 7/29/08. Type ? for help.  
"/var/spool/mail/root": 2 messages 2 new  
\>N 1 <www-data@localhost.l> Wed Nov 2 13:16 16/704 "\*\*\* SECURITY information for localhost.localdomain \*\*\*"  
N 2 root Mon Nov 21 20:29 19/631 "Test"  
&
- 1
- 2
- 3
- 4
- 5
- 6
/var/spool/mail/root 表示邮件的保存位置，N 表示邮件未读。后面依次是邮件编号、发件人、发送时间和邮件的主题。
在交互模式下，输入 ? 或者 help，可以查看帮助信息。
输入对应的邮件编号，可以查看邮件的具体内容。如下：
& 2  
Message 2:  
From <root@localhost.localdomain> Mon Nov 21 20:29:22 2016  
Return-Path: [\<root@localhost.localdomain](mailto:%3croot@localhost.localdomain)\>  
X-Original-To: root  
Delivered-To: <root@localhost.localdomain>  
Date: Mon, 21 Nov 2016 20:29:21 +0800  
To: <root@localhost.localdomain>  
Subject: Test  
User-Agent: Heirloom mailx 12.4 7/29/08  
Content-Type: text/plain; charset=us-ascii  
From: <root@localhost.localdomain> (root)  
Status: R  

Hello world !  
This is a simple test !  

&
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
输入 h ，可返回邮件列表。如下：
& h  
N 1 <www-data@localhost.l> Wed Nov 2 13:16 16/704 "\*\*\* SECURITY information for localhost.localdomain \*\*\*"  
\> 2 root Mon Nov 21 20:29 19/631 "Test"  
&
- 1
- 2
- 3
- 4
输入 d 邮件编号，可删除对应的邮件。
输入 q ，可退出邮件交互模式，回到正常的界面。
**注意：** 系统会给root用户发送一些重要的邮件，比如日志信息、报错信息等，root用户应定期用 mail 命令查看自己的邮箱。
### <span style='color:#5B9BD5'>6. 列出所有的用户登录信息 last</span>
命令名称：last  
命令所在路径：/usr/bin/last  
执行权限：所有用户  
功能描述：列出目前与过去登入系统的用户登录信息和系统重启信息
- 1
- 2
- 3
- 4
只要用户登录过系统或系统重启过，就会产生一条记录。last 是linux系统中非常重要的一个命令。
\[root@localhost ~\]# last  
root pts/0 192.168.1.105 Mon Nov 21 20:15 still logged in  
root tty1 Mon Nov 21 20:07 still logged in  
reboot system boot 2.6.32-504.el6.i Mon Nov 21 20:05 - 21:35 (01:29)  
kongzi pts/1 192.168.0.5 Thu Nov 17 00:05 - down (01:35)  
root pts/0 192.168.0.5 Thu Nov 17 00:05 - down (01:36)  
kongzi pts/1 192.168.0.5 Wed Nov 16 12:16 - 00:02 (11:46)  
root pts/1 192.168.0.5 Wed Nov 16 12:13 - 12:13 (00:00)  
root pts/0 192.168.0.5 Wed Nov 16 11:59 - 00:02 (12:03)  
root pts/0 192.168.0.5 Tue Nov 15 06:14 - 08:32 (1+02:17)  
root pts/0 192.168.0.5 Sun Nov 13 14:39 - 08:50 (18:11)  
root tty1 Sun Nov 13 14:38 - down (3+11:03)  
reboot system boot 2.6.32-504.el6.i Sun Nov 13 14:37 - 01:41 (3+11:04)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
### <span style='color:#5B9BD5'>7. 查看用户最后一次登录信息 lastlog</span>
命令名称：lastlog  
命令所在路径：/usr/bin/lastlog  
执行权限：所有用户  
功能描述：查看用户最后一次的登录信息
- 1
- 2
- 3
- 4
**常见用法：**
lastlog  
查看所有用户（包括系统用户）的最后一次登录信息。  

lastlog -u 0  
查看指定用户root的最后一次登录信息。  
-u 选项后跟的是用户的id（也就是uid），root用户的uid为0。
- 1
- 2
- 3
- 4
- 5
- 6
### <span style='color:#5B9BD5'>8. 路由追踪 traceroute</span>
命令名称：traceroute  
命令所在路径：/bin/traceroute  
执行权限：所有用户  
功能描述：显示到达某个主机所经过的所有路径（节点）
- 1
- 2
- 3
- 4
如果你的linux系统中没有traceroute命令，可用下面的方法安装：
yum -y install traceroute
- 1
**常见用法：**
traceroute [www.baidu.com](http://www.baidu.com)  
查看到达www.baidu.com的主机所经过的所有路径。
- 1
- 2
### <span style='color:#5B9BD5'>9. 查看网络相关信息 netstat</span>
命令名称：netstat  
命令所在路径：/bin/netstat  
执行权限：所有用户  
功能描述：查看网络相关信息  
常用选项：-tlunpra  
-t 显示通过TCP协议建立的网络连接  
-u 显示通过UDP协议运行的进程  
-l 显示进程的监听信息  
-n 显示用数字形式表示的IP地址和端口号  
-p 显示进程的ID和进程的名称  
-r 显示路由表  
-a 显示所有的网络连接和进程信息  

基本语法：netstat \[-选项\]
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
**常见用法：**
netstat -tlun  
查看本机占用的端口。  
（TCP协议的进程会时刻监听端口，而UDP协议的进程无需监听端口，它可以直接接收客户端发送的数据，类似接收短信。）  

netstat -tlunp  
查看本机占用的端口，并显示对应的进程号（也叫进程ID）和进程名称。  

netstat -an  
查看所有的网络服务占用的端口（包括已经建立的连接信息）和系统程序的相关信息。  

netstat -ant  
查看使用TCP协议的网络服务占用的端口（包括已经建立的连接信息）。  
如果存在已经建立的TCP连接，会明确显示服务器端和客户端的ip地址和端口号。  
服务器端的IP地址，就是本地Linux服务器的IP；特定服务占用的目标端口是固定的。  
客户端的IP地址，就是外来的发起通信请求的客户机IP；客户机发起通信请求的端口是随机的。  

netstat -rn  
查看本机的路由表。  
最后一行信息的Gateway列的值就是Linux服务器当前的默认网关。
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
- 19
### <span style='color:#5B9BD5'>10. 配置网络 setup</span>
命令名称：setup  
命令所在路径：/usr/sbin/setup  
执行权限：root  
功能描述：配置网络  
基本语法：setup
- 1
- 2
- 3
- 4
- 5
setup 命令是 redhat 系列的linux系统（如CentOS）中专有的命令工具。
如果你的CentOS系统中没有setup命令，可参考我的另外一篇博客 <http://blog.csdn.net/lamp_yang_3533/article/details/53274868> 来安装setup工具及其配套的组件。
使用 setup 命令来配置网络，会出现一个图形化的界面，操作起来非常方便。而且它支持的功能更多，除了网络配置外，还支持防火墙配置、系统服务和验证配置。
可以使用 setup 命令，来对网络配置中的IP地址、子网掩码、默认网关、DNS服务器进行设置。当然，你也可以使用DHCP（将该项的值设置为 \* 即可）来自动获取IP、子网掩码和网关，前提是你家的路由器已经开启了DHCP服务（通常，路由器的DHCP服务都是默认开启的）。
使用 setup 命令修改了网络配置后，需要重启网络服务，使修改立即生效。命令如下：
service network restart
- 1
使用 setup 命令保存的网络配置，会永久生效。
### <span style='color:#5B9BD5'>11. 挂载 mount</span>
命令名称：mount  
命令所在路径：/bin/mount  
执行权限：所有用户  
功能描述：执行挂载操作  
常用选项：-at  
-a 依据配置文件/etc/fstab的内容，自动挂载所有可读取设备  
-t 指定可读取设备的文件系统  

基本语法：mount \[-t 文件系统\] 设备文件名 挂载点
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
挂载就是将可读取设备连接到事先创建好的挂载点（即空目录）。
linux系统中所有的可读取设备（硬盘、光盘、U盘、软盘、移动硬盘等）都必须挂载之后才可以使用，系统硬盘分区是Linux系统开机自动挂载的，其它的可读取设备则需要手动挂载。
所有的可读取设备都有一个设备文件名，挂载指的就是将设备文件名和挂载点（即空目录）连接起来。
**常见用法：**
mount  
查询Linux系统中已经挂载的设备文件名、挂载点、文件系统  

mount -t iso9660 /dev/sr0 /mnt/cdrom  
将光驱中的光盘挂载到挂载点/mnt/cdrom，同时手动指定光盘的文件系统。  

mount /dev/sr0 /mnt/cdrom  
将光驱中的光盘挂载到挂载点/mnt/cdrom。  
由于linux系统可以自动识别光盘的文件系统，故不用手动指定。  

mount -a  
依据配置文件/etc/fstab的内容，自动挂载所有可读取设备。
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
关于Linux系统中如何挂载和使用光盘，可参考： <http://blog.csdn.net/lamp_yang_3533/article/details/53284290>
