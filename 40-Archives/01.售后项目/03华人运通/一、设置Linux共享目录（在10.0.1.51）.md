---
title: 一、设置Linux共享目录（在10.0.1.51）
updated: 2026-06-06T10:08:57
created: 2026-07-05T17:04:57
---

设置10.0.1.51（备份服务器）共享
1、检查是否安装rpcbind和nfs
\[infodba@PLMResource1 plmdatabackup\]\$ rpm -aq \| grep nfs
nfs-utils-1.2.3-78.el6.x86_64
nfs-utils-lib-1.1.5-13.el6.x86_64
nfs4-acl-tools-0.3.3-8.el6.x86_64
nfs-utils-1.2.3-75.el6.x86_64
\[infodba@PLMResource1 plmdatabackup\]\$ rpm -aq \| grep rpcbind
rpcbind-0.2.0-13.el6.x86_64
\[infodba@PLMResource1 plmdatabackup\]\$ vi /etc/hosts
\[infodba@PLMResource1 plmdatabackup\]\$ vim /etc/exports
2、切换root用户，修改共享配置文件：
\[infodba@PLMResource1 plmdatabackup\]\$ su - root
Password:
\[root@PLMResource1 ~\]# vim /etc/exports
输入i，进行编辑，添加以下内容：（rw,no_subtree_check,no_root_squash指可写、不检查子文件夹的权限、root用户可直接访问）
/plmdata/plmdatabackup_temp/volume_database_temp 10.2.1.7(rw,no_subtree_check,no_root_squash)
/plmdata/plmdatabackup_temp/tcdata_bmideproject_temp 10.2.1.6(rw,no_subtree_check,no_root_squash)
按ESC，输入:wq，保存退出。
3、修改host文件：
\[root@PLMResource1 ~\]# vim /etc/hosts
添加以下内容：
10.0.1.51 PLMResource1
4、启动服务：
\[root@PLMResource1 ~\]# service rpcbind start
\[root@PLMResource1 ~\]# service nfs start
Starting NFS services: \[ OK \]
Starting NFS quotas: \[ OK \]
Starting NFS mountd: \[ OK \]
Starting NFS daemon: \[ OK \]
Starting RPC idmapd: \[ OK \]
5、检查服务启动状态
\[root@PLMResource1 ~\]# service rpcbind status
rpcbind (pid 7812) is running...
\[root@PLMResource1 ~\]# service nfs status
rpc.svcgssd is stopped
rpc.mountd (pid 7950) is running...
nfsd (pid 7966 7965 7964 7963 7962 7961 7960 7959) is running...
rpc.rquotad (pid 7945) is running...
6、查看共享情况：
\[root@PLMResource1 ~\]# showmount -e
Export list for PLMResource1:
/plmdata/plmdatabackup_temp/tcdata_bmideproject_temp 10.2.1.6
/plmdata/plmdatabackup_temp/volume_database_temp 10.2.1.7
7、设置服务开机启动，按空格可以选中服务。
\[root@PLMResource1 ~\]# setup
![image1](eaa8730fd3db4f7ca41e1f79d8b3974f.png)

![image2](0e8f20e1636040abac6a9978f50d4288.png)

![image3](b7bee1cfc34c4405bcd6d2756adee858.png)

