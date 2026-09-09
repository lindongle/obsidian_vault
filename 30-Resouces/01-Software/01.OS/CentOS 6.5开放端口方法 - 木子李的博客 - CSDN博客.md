---
title: CentOS 6.5开放端口方法 - 木子李的博客 - CSDN博客
updated: 2026-06-06T00:28
created: 2018-10-20T01:22:23
---

CentOS 6.5开放端口方法 - 木子李的博客 - CSDN博客
星期五, 十月 19, 2018
5:22 下午

已剪辑自: <https://blog.csdn.net/lipp555/article/details/53585431?utm_source=blogxgwz3>
lsof -i tcp:80

列出所有端口

netstat -ntlp

1、开启端口（以80端口为例）

   方法一：

    /sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT 写入修改

    /etc/init.d/iptables save 保存修改

   service iptables restart 重启防火墙，修改生效

   方法二：

   vi /etc/sysconfig/iptables打开配置文件加入如下语句:

   -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT 重启防火墙，修改完成

2、关闭端口

  方法一：

    /sbin/iptables -I INPUT -p tcp --dport 80 -j DROP 写入修改

    /etc/init.d/iptables save 保存修改

   service iptables restart 重启防火墙，修改生效

   方法二：

  vi /etc/sysconfig/iptables打开配置文件加入如下语句:

   -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j DROP 重启防火墙，修改完成

3、查看端口状态

   /etc/init.d/iptables status

4.关闭防火墙
chkconfig –level 35 iptables off \#此方法源自网络，未实验，安全考虑拒绝使用此方法  

