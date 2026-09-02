---
title: 节点管理器启动weblogic服务
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

==左侧选择计算机，在节点管理中Type选择Plain（普通），修改完需要重启weblogic的adminserver服务。==
![image1](157f5cd611c945eaa94a26982935f96b.png)

![image2](0d6b10736f45449d97192bad7892a5db.png)
修改配置文件：
D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb\nodemanager\nodemanager.properties
![image3](792a2cc61404476d9cce28bea926b02a.png)

确保计算机-监视中状态为可访问。
![image4](0a5883e84ece48b8839dd37051048838.png)

启动D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb\bin\startNodeManager.cmd
![image5](41f8012b0f6c4f4aa68ead826564ef44.png)

选择某个节点服务：
在启动服务中填写以下参数：（如果不配置，负载均衡不起作用）
![image6](135f4cdcb9974280a0a730a1f9f1af97.png)

![image7](16bce7d54bff4533ad443a8c607aa05e.png)

![image8](e4b260ef8f8242f09f605402686e5216.png)

可以运行D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb\bin\installNodeMgrSvc.cmd
将节点管理器注册为windows服务。（尽量不用使用这个服务，不容易看到报错原因）
![image9](a2c4904db845478bbdd4a7d459626114.png)

启动节点失败：
\<2019-3-26 上午12时31分15秒 CST\> \<WARNING\> \<Processing for domain 'plmweb' failed due to configuration error: \[The domain 'plmweb' at 'null' was not registered in the nodemanager.domains file and dynamic domain registration is not supported. Please register the domain in the nodemanager.domains file.\]\>

将节点1的域名，添加到节点二的D:\Oracle\Middleware\Oracle_Home\user_projects\domains\plmweb02\nodemanager\nodemanager.domains文件中（安装时尽量保持两个节点的域名一样。）
![image10](5179826275cb42c080d87c977b0ab2ad.png)

