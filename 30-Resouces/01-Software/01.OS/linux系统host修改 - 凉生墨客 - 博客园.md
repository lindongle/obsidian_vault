---
title: linux系统host修改 - 凉生墨客 - 博客园
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:53
---

下午

已剪辑自: <https://www.cnblogs.com/heruiguo/p/7943006.html>
有时候我们需要修改主机的host主机名，方便管理和识别自己的服务器，修改步骤如下：
第一步：
vi /etc/hosts
![image1](d62e26eb55f844048171bea985bda5ff.png)
正常情况下，修改了第一步就可以了，如果通过hostname命令查看还是修改以前的话，执行第二步

第二步：
vi /etc/sysconfig/network
![image2](23fee93260d74fb8a89bc380813fff96.png)
把hostname设置成你要修改的名字即可

3、第三步：
重启服务器

