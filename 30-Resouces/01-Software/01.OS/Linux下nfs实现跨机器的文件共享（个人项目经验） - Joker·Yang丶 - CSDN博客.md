---
title: Linux下nfs实现跨机器的文件共享（个人项目经验） - Joker·Yang丶 - CSDN博客
updated: 2026-06-06T00:28
created: 2018-11-16T07:11:14
---

下午
已剪辑自: <https://blog.csdn.net/millery22/article/details/50748886>
目前的项目开发过程中都是采用分布式，在上传文件的时候，文件不一定会在同一台机器中，因此就需要跨机器共享文件，在这里就简单的采用nfs实现跨机器的文件共享。
1、安装nfs和rpcbind（在centOS6之前是portmap）
 检查自己的电脑是否已经默认安装了nfs和rpcbind：
1.  \[root@unsion2 ~\]# rpm -aq \| grep nfs
2.  nfs-utils-1.2.3-54.el6.x86_64
3.  nfs4-acl-tools-0.3.3-6.el6.x86_64
4.  nfs-utils-lib-1.1.5-9.el6.x86_64
5.  \[root@unsion2 ~\]# rpm -aq \| grep rpcbind
6.  rpcbind-0.2.0-11.el6.x86_64
这表示系统已经默认安装。如果没有安装也没事，可以采用下面的命令安装（需要联网，会用虚拟机的就不多说怎么联网了）：
\[root@unsion2 ~\]# yum install nfs-utils rpcbind
2、配置nfs的配置文件和hosts文件
 创建需要共享的目录：
1.  \[root@unsion2 ~\]# cd /tmp
2.  \[root@unsion2 tmp\]# mkdir test
配置nfs的配置文件：
\[root@unsion2 ~\]# vim /etc/exports
在这个文件中添加需要输出的目录，如：
/tmp/test 192.168.56.202(rw)
/tmp/test：表示的是服务器共享输入的目录
192.168.56.202：表示可以挂在服务器目录的客户端ip
(rw)：表示该客户端对共享的文件具有读写权限
 配置hosts文件：
\[root@unsion2 ~\]# vim /etc/hosts
 在文件中添加下面这句话
 192.168.56.201 unsion2
 192.168.56.201：表示服务器本机的ip地址
 unsion2：表示服务器的机器名
3、启动nfs和rpcbind服务、检测服务状态、已经设置服务开机启动
启动服务：
3.  \[root@unsion2 ~\]# service rpcbind start
4.  \[root@unsion2 ~\]# service nfs start
测试状态：
5.  \[root@unsion2 ~\]# service rpcbind status
6.  rpcbind (pid 1063) 正在运行...
7.  \[root@unsion2 ~\]# service nfs status
8.  rpc.svcgssd 已停
9.  rpc.mountd (pid 2193)正在运行...
10.  nfsd (pid 22092208 2207 2206 2205 2204 2203 2202) 正在运行...
11.  rpc.rquotad (pid2188) 正在运行...
自动启动：
12.  \[root@unsion2 ~\]# chkconfig --list rpcbind
13.  \[root@unsion2 ~\]# chkconfig --list nfs
4、检测服务器的nfs状态
14.  \[root@unsion2etc\]# showmount -e //查看自己共享的服务
15.  Export list forunsion2:
16.  /tmp/test192.168.56.202
注意：在执行这个命令的时候如果出现错误，说明DNS不能解析当前的服务器，那就是hosts文件没有配置。
5、客户端挂载NFS中共享的目录
首先是启动nfs和rpcbind服务。
查询服务端共享的文件目录：
17.  \[root@unsion1tmp\]# showmount -e 192.168.56.201
18.  Export list for192.168.56.201:
19.  /tmp/test192.168.56.202
创建挂载目录：
20.  \[root@unsion2 ~\]# cd/tmp
21.  \[root@unsion2 tmp\]# mkdir hehe
挂载服务端的共享目录：
22.  \[root@unsion1tmp\]# mount 192.168.56.201:/tmp/test/ /tmp/hehe/
23.  mount.nfs: accessdenied by server while mounting 192.168.56.201:/tmp/ test /
看到此信息表示成功挂载。
查看挂载的状态：
24.  \[root@unsion1tmp\]# mount \| grep nfs
25.  sunrpc on/var/lib/nfs/rpc_pipefs type rpc_pipefs (rw)
26.  nfsd on/proc/fs/nfsd type nfsd (rw)
27.  192.168.56.201:/tmp/test/on /tmp/hehe type nfs (rw,vers=4,addr=192.168.56.201,clientaddr=192.168.56.202)
6、测试共享
服务器创建文件：
28.  \[root@unsion2 /\]# cd /tmp/test
29.  \[root@unsion2test\]# touch 123456
客户端查看文件：
30.  \[root@unsion1 /\]# cd /tmp/hehe
31.  \[root@unsion1hehe\]# ll
32.  总用量 0
33.  -rw-r--r--. 1 rootroot 0 2月 25 15:37 123456
到此就结束了，nfs实现文件的共享已经完成。
