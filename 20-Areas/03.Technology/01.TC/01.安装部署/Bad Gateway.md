---
title: Bad Gateway
updated: 2026-06-22T09:03:52
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

<http://gtac2:7001/tc/micro/svc_registry/ping>
![image1](a6b0706c4e5c49cb940f638596d74f2c.png)
Bad Gateway

<span style='background:white'>The TC.WAR file in INSWEB defaults to a MICROSERVICE_ADDRESS of </span>[<span style='background:white'>http://localhost:9090</span>](http://localhost:9090)<span style='background:white'>. If the Process Manager/Microservices are not hosted on the same machine as the web tier, this URL would need to be updated to reflect the correct server. In this example, the web tier is hosted on GTAC2 and the Process Manager/Microservices are hosted on GTAC1, so the correct MICROSERVICE_ADDRESS would be</span>[<span style='font-weight:bold;background:white'>http://gtac1:9090</span>](http://gtac1:9090)<span style='background:white'>.</span>
![image2](0e7209678c404890add57cf8e342fa1a.png)
«span style='color:#2D373C'»Image of the Context Parameters in INSWEB for the TC.WAR file. The MICROSERVICE_ADDRESS is showing the URL as [http://localhost:9090«/span](http://localhost:9090«/span)»

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8764438>\>*

