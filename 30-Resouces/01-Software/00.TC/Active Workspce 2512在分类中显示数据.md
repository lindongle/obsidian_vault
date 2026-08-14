---
author: TcConsultant
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=Mzg3NDg2NDUzOQ==&mid=2247484344&idx=1&sn=670541d2fe5e4b19bd1338c85cfef1e7&chksm=cfe5aa3a22695b3dbf9970e81437190e544afa5e7273fa96f162f6f292dd8c48ba6645e7083e&mpshare=1&scene=1&srcid=0622LsSgbpjTpnMp2wX9chKO&sharer_shareinfo=d6038ccd18709bb74ab40ea46afdf477&sharer_shareinfo_first=d6038ccd18709bb74ab40ea46afdf477#rd
saved: 2026-06-22 19:44:35
tags:
  - 分类
  - awc
  - 系统配置
id: 7e337a6c-79e5-4693-adb7-00e9ac758737
title: Active Workspce 2512在分类中显示数据
created: 2026-07-05T17:04:51
updated: 2026-06-23T08:55:58
---

公众号名称：PLM菜鸟

作者名称：TcConsultant

发布时间：2026-06-22 18:10

在RAC端维护完分类数据后，AWC默认情况下打开分类是不会显示对应数据的，只提示未找到结果

![[99-Assets/05dc786b1e2a3085162aba1d9edcf323_MD5.png]]

需要进行几点配置：

1、确保首选项ICS\_searchindex\_view\_visible和CLS\_is\_presentation\_hierarchy\_active的值都为true

2、最快的方式是使用命令直接为每个存储类创建一个搜索索引视图（对于每个类，此命令只可执行一次），TC\_CMD中执行

```sql
smlutility –create_indexing_views -u=xxx -p=xxx -g=dba
```

若要删除索引视图，执行以下命令

```sql
smlutility –delete_indexing_views -u=xxx -p=xxx -g=dba
```

命令执行完后再次进入AWC的分类，已经可以看到数据了

![[99-Assets/743c0d1d798c86d87721a66797c94748_MD5.png]]

3、除了自动创建索引视图，也可以针对性地对存储类进行手动创建，避免资源浪费

右键存储类，添加视图，类型为搜索索引视图

![[99-Assets/2c89652ff3edf44544f5b611a722b047_MD5.png]]

视图添加完成后存储类下面会多眼睛图标，在视图中可以定义分类属性的显示顺序等信息

![[99-Assets/c2d72726cae47462ddd21a08b0b1338b_MD5.png]]

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/71d4d0fe_1782128673564?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzg3NDg2NDUzOQ%3D%3D%26mid%3D2247484344%26idx%3D1%26sn%3D670541d2fe5e4b19bd1338c85cfef1e7%26chksm%3Dcfe5aa3a22695b3dbf9970e81437190e544afa5e7273fa96f162f6f292dd8c48ba6645e7083e%26mpshare%3D1%26scene%3D1%26srcid%3D0622LsSgbpjTpnMp2wX9chKO%26sharer_shareinfo%3Dd6038ccd18709bb74ab40ea46afdf477%26sharer_shareinfo_first%3Dd6038ccd18709bb74ab40ea46afdf477%23rd&s=obsidian)