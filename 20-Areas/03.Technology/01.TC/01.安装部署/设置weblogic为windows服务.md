---
title: 设置weblogic为windows服务
updated: 2026-06-06T10:05
created: 2018-10-17T13:18:24
tags:
  - TC安装部署
---

添加服务：
1、修改文件：
D:\Oracle\Middleware\Oracle_Home\wlserver\server\bin\installSvc.cmd文件，
在注释内容下面添加：
SET SERVER_NAME=WebLogicServer12C
SET MW_HOME=D:\Oracle\Middleware\Oracle_Home
SET WLS_USER=weblogic
SET WLS_PW=weblogic123
set DOMAIN_NAME=base_domain
set SERVER_NAME=AdminServer
set USERDOMAIN_HOME=D:\Oracle\Middleware\Oracle_Home\user_projects\domains\base_domain
set DOMAIN_HOME=D:\Oracle\Middleware\Oracle_Home\user_projects\domains\base_domain
set JAVA_OPTIONS=%JAVA_OPTIONS% -Dfile.encoding=utf-8
set MEM_ARGS=-Xms512m -Xmx1024m
![image1](e81e395b5d6f472e92ceaf7dfe233154.png)
2、管理员身份运行cmd。
输入cd /d D:\Oracle\Middleware\Oracle_Home\wlserver\server\bin
再输入installSvc.cmd
服务安装完成。服务名为wlsvc base_domain_AdminServer
移除服务：
1、修改文件
D:\Oracle\Middleware\Oracle_Home\wlserver\server\bin\uninstallSvc.cmd
添加：
set MW_HOME=D:\Oracle\Middleware\Oracle_Home
set WL_HOME=%MW_HOME%\wlserver

set DOMAIN_NAME=base_domain
set SERVER_NAME=AdminServer
![image2](14f392e286e9461fa9eb58ced0d60ba9.png)
2、管理员身份运行cmd。
输入cd /d D:\Oracle\Middleware\Oracle_Home\wlserver\server\bin
再输入uninstallSvc.cmd

