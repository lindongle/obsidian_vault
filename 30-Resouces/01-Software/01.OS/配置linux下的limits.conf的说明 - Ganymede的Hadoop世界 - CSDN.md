---
title: 配置linux下的limits.conf的说明 - Ganymede的Hadoop世界 - CSDN...
updated: 2026-06-06T00:27
created: 2018-10-14T07:22:59
---

下午
已剪辑自: <https://blog.csdn.net/kwu_ganymede/article/details/78161739>

配置文件路径
vim /etc/security/limits.conf  

针对所有用户生效的配置
\* soft nofile 65536  
\* hard nofile 65536  
\* soft nproc 65536  
\* hard nproc 65536  

针对指定用户生效的配置  

presto soft nproc 65536  
presto hard nproc 65536  
presto soft nofile 65536  
presto hard nofile 65536  
presto soft memlock unlimited  
presto hard memlock unlimited  

配置项说明如下：
core - 限制内核文件的大小  
date - 最大数据大小  
fsize - 最大文件大小  
memlock - 最大锁定内存地址空间  
nofile - 打开文件的最大数目  
rss - 最大持久设置大小  
stack - 最大栈大小  
cpu - 以分钟为单位的最多 CPU 时间  
noproc - 进程的最大数目  
as - 地址空间限制  
maxlogins - 此用户允许登录的最大数目  

