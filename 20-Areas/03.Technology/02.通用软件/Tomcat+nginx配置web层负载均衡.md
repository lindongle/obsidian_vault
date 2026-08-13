---
title: Tomcat+nginx配置web层负载均衡
updated: 2026-06-06T10:08
created: 2023-05-13T11:29:52
---

Tomcat1端口设置为8081；
Tomcat2端口设置为8082；
将nginx复制到其中一台服务器或单独服务器，修改config文件如下：
![image1](1a8cd7d3835d476aa3870219d064e37e.png)
![image2](bafae8ada8a64932a3cb59e64c51acc6.png)

[nginx.conf](6a8429a67eeb490d9173bcdffb8c8f23.conf)
（1）启动 nginx-start.bat
\#进入到当前目录
cd %~dp0
\#启动nginx
start nginx

（2）停止 nginx-stop.bat
\#进入到当前目录
cd %~dp0
\#停止nginx,-s后面 加 quit表示有序退出， 加上stop表示直接退出
nginx.exe -s stop

（2）重启：nginx-reload.bat
\#进入到当前目录
cd %~dp0
\#重载nginx
nginx.exe -s reload
————————————————
版权声明：本文为CSDN博主「slgd」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/herui151/article/details/120258458
[NginxStart.bat](a0ad1059292a4c03bfde0109c5453186.bat)

[NginxReload.bat](aba20f394bcf478fbe4fb96a3ea421bd.bat)

[NginxStop.bat](bbdf85bc4fe840449b41416683746858.bat)

