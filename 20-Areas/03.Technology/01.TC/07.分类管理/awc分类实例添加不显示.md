---
title: awc分类实例添加不显示
updated: 2026-06-05T23:52
created: 2023-11-15T18:29:40
---

1.  确认分类安装完成；
2.  分类管理节点添加新的分类，需要执行重建视图，再去添加实例，添加后，需重新登录客户端；smlutility -create_indexing_views -u=infodba -p=Luster2023 -g=dba
3.  如果未重建视图，直接进行实列添加，需重建视图后，再执行下索引重建；
D:\Siemens\Teamcenter14\TcFTSIndexer\bin\runTcFTSIndexer -task=objdata:index
