---
title: Bad Gateway
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

<http://gtac2:7001/tc/micro/svc_registry/ping>
![image1](a6b0706c4e5c49cb940f638596d74f2c.png)
Bad Gateway

The TC.WAR file in INSWEB defaults to a MICROSERVICE_ADDRESS of [http://localhost:9090](http://localhost:9090). If the Process Manager/Microservices are not hosted on the same machine as the web tier, this URL would need to be updated to reflect the correct server. In this example, the web tier is hosted on GTAC2 and the Process Manager/Microservices are hosted on GTAC1, so the correct MICROSERVICE_ADDRESS would be[http://gtac1:9090](http://gtac1:9090).
![image2](0e7209678c404890add57cf8e342fa1a.png)
«span style='color:#2D373C'»Image of the Context Parameters in INSWEB for the TC.WAR file. The MICROSERVICE_ADDRESS is showing the URL as [http://localhost:9090«/span](http://localhost:9090«/span)»

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8764438>\>*

