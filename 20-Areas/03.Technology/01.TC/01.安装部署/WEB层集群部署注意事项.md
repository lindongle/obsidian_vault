---
title: WEB层集群部署注意事项
updated: 2026-06-06T10:08
created: 2019-03-22T21:05:32
tags:
  - TC安装部署
---

1、原web层上配置weblogic，添加新域（尽量不要使用原来的域加入集群），添加新域后，将tc.war重新部署到新域中。域控制端（代理端），三个都勾上。
![image1](7cf9f4bee3b14d0cb69ee346c2329a4e.png)

2、添加另一台web层，因之前已经打过补丁，则需要先运行补丁介质，倒着安装web层服务端。
3、TEM安装J2EE时报错，在许可证服务器上打开端口28000，必须设置license的环境变量。但一直连不上。必须关闭防火墙才行。。
ERROR: UPS_CL_connect returned error -15 : Cannot connect to license server system. command_exit=-15

4.另一台服务器，安装web层时，同时勾选配置管理、配置管理结构管理支持、更改管理、客户端，否则生成客户端缓存一直卡死。
5、安装完后修改FSC主配置文件，添加新web层的传输卷信息。

控制服务器上要安装JDK，并设置JAVA_HOME环境变量。到JDK的bin目录。

==---安装节点管理器服务，运行批处理路径“D:\PLM\Oracle\Middleware\wlserver_12.1\server\bin”下批处理文件installNodeMgrSvc.cmd文件，安装节点管理器服务==
==--不用直接安装，得设置一些环境变量==
==直接命令启动D:\Oracle\Middleware\Oracle_Home\user_projects\domains\base_domain\bin\startNodeManager.cmd 命令窗口运行即可==

1.  ==服务启动后，调整路径D:\PLM\Oracle\Middleware\wlserver_12.1\common\nodemanager下，配置文件信息==
==---D:\Oracle\Middleware\Oracle_Home\user_projects\domains\base_domain\nodemanager\nodemanager.properties==

25\. 输入命令：D:\PLM\Oracle\Middleware\user_projects\domains\TCCluster\bin\\ startManagedWebLogic.cmd TCAPP01 [http://10.0.1.146:7002将受管服务器注册到管理服务器中](http://10.0.1.146:7002将受管服务器注册到管理服务器中)
---中的服务名必须注意大小写区分，跟weblogic控制台中看到的要一致。
另外中间的服务名是受控端服务名，后面的IP地址和端口为，控制端的IP及控制管理服务的端口

启动受控节点管理器报错：
Caused By: java.io.IOException: \[DeploymentService:290066\]Error occurred while downloading files from Administration Server for deployment request "4,313,986,827,390". Underlying error is: "HttpResponseCode: 500 type: text/html; charset=UTF-8"
解决：将主控服务器的D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmwebcluster\security\SerializedSystemIni.dat覆盖到受控端对应位置即可。
