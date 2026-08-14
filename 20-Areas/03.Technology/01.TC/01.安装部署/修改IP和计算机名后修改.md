---
title: 修改IP和计算机名后修改
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

1.  修改环境变量
SPLM_LICENSE_SERVER=28000@172.1.10.32
2.  修改D:\Siemens\tcdata\tc_profilevars.bat文件中的IP或主机名信息。
![image1](e6a473450ecd45619234cebe1f2144ac.png)
3.  修改D:\Siemens\tcdata\tnsnames.ora中的IP或主机名
![image2](dd4351655d6744c6ab459d5a4caa95c4.png)
4.  修改oracle的连接配置文件D:\app\plmadm\product\11.2.0\dbhome_1\NETWORK\ADMIN\listener.ora和D:\app\plmadm\product\11.2.0\dbhome_1\NETWORK\ADMIN\tnsnames.ora中的IP和主机名
![image3](58432ad631254d089084d3373bfa2002.png)
5.  修改tcdata下的数据库相关文件：
重新命名%TC_DATA%下的文件pom_schema\_\<database server host name\>\_\<oracle sid\>
重新命名%TC_DATA%下的文件populate_new_db\_\<database server host name\>\_\<oracle sid\>\_V11000.2
重新命名%TC_DATA%下的文件populate_new_db\_\<database server host name\>\_\<oracle sid\>\_ V11000.2.USE
![image4](39a8da4a0d5048e6825822c94ea76126.png)
6.  修改数据库卷信息的主机名。表pimanvolume
![image5](89ca801bfc334fb2b5ff2e4581ea5a9b.png)
7.  使用oracle的Net Configuration Assistant重新配置监听和网络配置。
8.  backup_xmlinfo 修改fmsmaster文件
