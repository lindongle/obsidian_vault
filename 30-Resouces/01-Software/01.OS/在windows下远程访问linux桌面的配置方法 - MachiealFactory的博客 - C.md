---
title: 在windows下远程访问linux桌面的配置方法 - MachiealFactory的博客 - C...
updated: 2026-06-06T10:05
created: 2018-10-15T23:09:25
---

在windows下远程访问linux桌面的配置方法 - MachiealFactory的博客 - CSDN博客
星期一, 十月 15, 2018
3:09 下午
已剪辑自: <https://blog.csdn.net/xiaominggunchuqu/article/details/78971992>
版权声明：本文为博主原创文章，未经博主允许不得转载。 <https://blog.csdn.net/xiaominggunchuqu/article/details/78971992>
windows远程访问linux桌面的配置方法：
1、需要给linux安装一个工具：xrdp工具
yum install xrdp  
yum install tigervnc-server  
service xrdp start  

（Ubuntu 命令是：sudo apt-get install xrdp）
- 1
- 2
- 3
- 4
- 5
以上三个命令执行完毕安装完成，服务也已经启动。
2、打开windows远程窗口  
输入linux主机IP，点击确定。  

![image1](01870cb317624a0a8d48255ab1c875cc.png)
接下来是输入用户名密码；  

![image2](7fd191c47fb94b938a1479ed6e96777c.png)
建立连接。
完美访问。。。。。
