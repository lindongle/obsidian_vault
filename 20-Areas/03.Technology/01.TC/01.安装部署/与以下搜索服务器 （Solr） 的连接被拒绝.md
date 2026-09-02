---
title: 与以下搜索服务器 （Solr） 的连接被拒绝
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

以下搜索服务器 (Solr) 的连接被拒：
<http://TCQAS:8983/solr/collection1/tcfts>

根据环境的不同，活动工作区可能需要具有 URL 的完全限定域名 （FQDN）。
在 Teamcenter RAC 或 Active Workspace 首选项管理器中搜索首选项AWS_FullTextSearch_Solr_URL。
[Http://Server02:8983/solr/collection1/tcfts](Http://Server02:8983/solr/collection1/tcfts)
修改此设置以使服务器的 FQDN 类似于以下示例，但将是服务器名称和 FQDN：
在此示例中，它将如下所示：
[Http://Server02.siemens.com:8983/solr/collection1/tcfts](Http://Server02.siemens.com:8983/solr/collection1/tcfts)
现在应该从活动工作区正确启动。

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8685703>\>*

