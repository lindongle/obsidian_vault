---
title: weblogic集群部署
updated: 2026-06-06T10:08
created: 2019-09-30T08:59:11
tags:
  - TC安装部署
---

weblogic集群部署
2019年9月30日
8:59
![image1](e4f6555eb278483896489f73675c35c3.png)

1、配置weblogic的集群环境
1）至少3台服务器，最好四台
一台AdminServer 一台代理 两台weblogic服务实例（WebA和B）用来部署应用
<https://blog.csdn.net/blvyoucan/article/details/78507100>
<http://wiki.smartbi.com.cn/pages/viewpage.action?pageId=35750063>
按以下操作部署
2、部署PoolManager的集群（treecache）
如PoolManager有四台PoolA/B/C/D
则按照以下配置，让PoolA/B两台跟着WebA走，PoolC/D 两台跟着WebB走。
[[多pool池配置]]
