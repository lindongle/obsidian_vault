---
title: AWC负载均衡
updated: 2026-06-06T10:09
created: 2021-07-15T21:28:17
tags:
  - TC安装部署
---

![image1](b1a1ec3e732f4b82b229711a0a889c88.png)

![image2](5f21d2a53ec14fdfa914df5dc05113b1.png)

![image3](5e5fe13b5fd34e2b916dd139753ffef7.png)
负载均衡Active Workspace组件提供故障转移支持。当发生硬件或连接故障时，可以在不停机的情况下维护硬件。需要在两个不同的物理计算机上部署Active Workspace网关，需要第三方负载平衡器配置。在安装过程中，应配置网关以寻址两个不同物理计算机上的至少两个微服务调度程序。GraphQL service1服务可能不太担心故障转移，仅将其安装在一台计算机上。Declarative Artifact Service仅用于使用UI Builder进行用户界面开发，可以选择仅在开发环境中根据需要部署它。文件存储库服务是一项基本服务，应至少部署在两个不同的物理机上以支持故障转移。在所有情况下，微服务都可以部署在更多计算机上，以实现更大的可伸缩性。任何将大量使用的服务都可能需要拥有两个以上的实例。

SOLUTION The F5 load balancer needs to support session affinity based upon the cookie (JSessionID). AW Gateway deployed with docker It should NOT be part of the swarm used by MSF if its multiple system (master & workers). The only valid case of being in the swarm is a trivial swarm with just a master.
AW Gateway should be on the web tier. This is ideally the same as the TC web tier.
The MSF deployment should be on the same tier/system as the Teamcenter pool manager. AW Gateway can reference the TC web tier via the load balancer.
There are 2 options here: If TC web tier is using a clustered J2EE (.net has equivalent), then it doesn't matter which TC web tier is used. There is no need for any session affinity in this case.
If TC web tier is NOT clustered, then you need to support session affinity based upon the cookie again.

<https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8515667?pid=sc%3Asearch&pid_context=microservices%20Load%20balancing&index=content-external&audience=external>

微服务框架及微服务主节点、awc客户端网关放到web层；主节点指向两台pool上的微服务的调度服务和文件存储服务。
微服务进程节点分别配置到2个pool服务器，微服务其他三个服务器分别2个pool节点。
或AWC网关装两个放到两个pool上，web层装微服务主节点
<span style='color:#FA0000'>AWC网关放到web层，Pool1上微服务主节点，Pool2上微服务工作节点。AWC Client Builder放Pool1或tcdata上。</span>
