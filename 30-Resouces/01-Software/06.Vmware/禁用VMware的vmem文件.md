---
title: 禁用VMware的vmem文件
updated: 2026-06-06T00:32
created: 2018-12-07T00:26:23
---

禁用VMware的vmem文件
2018年12月7日
0:26

禁用VMware的vmem文件
新建一个虚拟机，VMWare会默认为其创建一个虚拟内存文件\*.VMEM, 这个文件会影响系统的磁盘性能，所以最好关闭它。

该当是找到\*.vmx文件，在文件最后加入一行 mainMem.useNamedFile=FALSE, 重新启动虚拟机，虚拟内存文件就没有了。
