---
title: Windows Server 2019 安装 .net framework 3.5安装失败 - wo...
updated: 2026-06-06T00:23:00
created: 2026-07-05T17:04:53
---

Windows Server 2019 安装 .net framework 3.5安装失败 - woiyyyy的专栏 - CSDN博客
星期三, 七月 31, 2019
5:18 下午
已剪辑自: <https://blog.csdn.net/woiyyyy/article/details/89950446>

安装报错 0x800F0954问题

1.打开注册表：cmd+r 输入regedit，确定；
2.找到路径HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU，其中UseWUServer默认值为1，改成0；
3.打开服务列表，重启Windows Update service；
此时可以正常安装.net framework 3.5；
4将第二步的修改还原，并重启Windows Update service。

两次修改注册表一定要记得重启服务，不然不生效！
服务在“计算机管理-服务和应用程序-服务” 中查找！
