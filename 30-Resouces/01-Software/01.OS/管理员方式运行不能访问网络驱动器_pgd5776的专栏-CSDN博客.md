---
title: 管理员方式运行不能访问网络驱动器_pgd5776的专栏-CSDN博客
updated: 2026-06-06T00:24:15
created: 2026-07-05T17:04:54
---

管理员方式运行不能访问网络驱动器_pgd5776的专栏-CSDN博客
星期四, 六月 17, 2021
6:23 下午
已剪辑自: <https://blog.csdn.net/pgd5776/article/details/54710498>
原因：可能会话不同
解决方法：HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System，新建DWORD值，名字为EnableLinkedConnections，值为1。
