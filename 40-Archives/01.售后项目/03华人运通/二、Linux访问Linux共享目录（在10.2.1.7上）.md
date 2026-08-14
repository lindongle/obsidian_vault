---
title: 二、Linux访问Linux共享目录（在10.2.1.7上）
updated: 2026-06-13T17:15:52
created: 2026-07-05T17:04:57
---

1、启动rpcbind和nfs服务，并设置开机启动。
\[infodba@PLMResource1 Desktop\]\$ su - root
Password:
\[root@PLMResource1 ~\]# service rpcbind start
\[root@PLMResource1 ~\]# service nfs start
\[root@PLMResource1 ~\]# setup
2、创建挂载共享的文件夹。
/plmdata/plmdatabackup_temp/volume_database
3、将共享目录挂载到2中已创建的本地文件夹
\[root@PLMResource1 ~\]# mount -t nfs 10.0.1.51:/plmdata/plmdatabackup_temp/volume_database_temp /plmdata/plmdatabackup_temp/volume_database
4、将挂载的文件夹的权限转交给infodba账户
\[root@PLMResource1 ~\]# chown infodba /plmdata/plmdatabackup_temp/volume_database
5、设置开机挂载共享目录
\[root@PLMResource1 ~\]# vi /etc/fstab
打开的文件中，添加以下内容，保存退出。
10.0.1.51:/plmdata/plmdatabackup_temp/volume_database_temp /plmdata/plmdatabackup_temp/volume_database nfs defaults 0 0
