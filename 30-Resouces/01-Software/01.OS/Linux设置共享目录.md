---
title: Linux设置共享目录
updated: 2026-06-06T00:27:03
created: 2026-07-05T17:04:53
---

在10.0.1.51开共享，共享给10.2.1.7
\[root@PLMResource1 ~\]# vim /etc/exports
添加以下内容：（rw,no_subtree_check,no_root_squash指可写、不检查子文件夹的权限、root用户可直接访问）
/plmdata/plmdatabackup_temp/volume_database_temp 10.2.1.7(rw,no_subtree_check,no_root_squash)
/plmdata/plmdatabackup_temp/tcdata_bmideproject_temp 10.2.1.6(rw,no_subtree_check,no_root_squash)
即将/plmdata/plmdatabackup_temp/volume_database_temp文件夹共享读写权限，不包括子目录权限给10.2.17这个远程电脑。并允许root用户可以直接访问。
3、修改host文件：将本机的主机名与IP做映射。
\[root@PLMResource1 ~\]# vim /etc/hosts
添加以下内容：
10.0.1.51 PLMResource1

查看所有共享目录：
showmount -e
