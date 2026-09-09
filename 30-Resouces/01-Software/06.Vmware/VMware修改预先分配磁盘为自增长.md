---
title: VMware修改预先分配磁盘为自增长
updated: 2026-06-06T00:32
created: 2020-10-26T12:44:12
---

cd /d "D:\Program Files (x86)\VMware\VMware Workstation"
vmware-vdiskmanager -r "F:\PLM_TEST02\PLM_TEST02.vmdk" -t 0 "F:\PLM_TEST02\PLM_TEST02-1.vmdk"
后者不要提前创建

然后将生成的磁盘添加到虚拟机（添加硬盘，从现有文件添加），移除原来的即可。
