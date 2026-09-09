---
author: 风岭
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzY4NTMwNzg2OA==&mid=2247483811&idx=1&sn=6f0f4027bd5596dff98e6b7051e640a5&chksm=f2f80de886438c1b1e89473c0d4b6dc4ac97a8b02dabbb474bb4f4cb16b4423478e822fe0eba&mpshare=1&scene=1&srcid=0615GGN3QABwCpLZG33lehXm&sharer_shareinfo=3fc6773798a31111f8fda33eee46cae3&sharer_shareinfo_first=3fc6773798a31111f8fda33eee46cae3#rd
saved: 2026-06-15 18:48:28
tags:
  - 数据库
  - TC
  - TC基础
id: 6e73bcca-2e63-44cb-b9fa-9bfae43628c0
title: 1、说明
aliases: [1、说明]
linter-yaml-title-alias: 1、说明
created: 2026-06-16T10:20:52+08:00
updated: 2026-06-16T10:26:10+08:00
---
[[数据库语句]]
公众号名称：PLM云迹

作者名称：风岭

发布时间：2026-05-24 13:31

# 1、说明

背景说明：

用户在前期使用TC系统时，由于管理及使用过程中的不规范，产生了很多编码和类型错误的历史数据，系统实施过程中，为了规范历史数据，需要对此类数据进行梳理，并按新规范导入数据，此时需要对系统内存在的不规范数据进行批量处理，主要方式是统一对历史数据ID中增加标识，一方面避免编号重复，影响数据导入，另一方面标记系统内不规范的历史数据，方便统计汇总，最后可以方便后期对数据文件的迁移和批量处理。

在创建一个item 对象，生成item\_id时，系统会检查item\_id的唯一性，系统内item\_id是不允许重复的。修改item\_id对使用TC的用户来说并不陌生，特别是对于未发布的item类对象，可以通过编辑Item属性，修改item\_id属性。

本文主要描述的是，如何通过后台数据库批量修改item\_id属性，同时保证item\_id在系统内的唯一性，对于处理历史数据问题有一定的帮助。

# 2、存储item\_id的数据库表

修改item\_id前，先认识一下tc数据库中是如何存储item\_id的。

通过存储类确定数据库表

tc数据库表的命名规则一般是在存储类前增加字母“p”，如：item存储类为item，对应的数据库表名称为pitem。

存储类可以在BMIDE中，通过业务对象查看对应的存储类。

![[99-Assets/0cd7ffeba274497b4a835a483c0447f3_MD5.png]]

一条数据再数据库中存储在不同表中，如对于一个item对象，属性分别存储在表：pitem、pworkspaceobject、ppom\_application\_object、ppom\_object

一般的原则是，子类对象中的属性，分别存储在子类对应存储类、父类存储类及父类的上级存储类中

![[99-Assets/71ea504316e13233308222b891418b9c_MD5.png]]

# 3、查看并修改PITEM表

通常存储item信息的数据库表是pitem，item\_id属性也是该表的一个字段pitem\_id。通过查询语句：Select \* from pitem;可以查看PITEM表中的信息，包括item\_id。

![[99-Assets/d5d2c2e47987ee16e0b3eb960b1f229d_MD5.png]]

此时如果要修改item\_id，修改pitem\_id字段值即可。

update pitem set pitem\_id=pitem\_id||'\_gz' where pitem\_id like 'M/\_%'escape'/';

![[99-Assets/4045a4186d4a3a289a150c66e953ca42_MD5.png]]

提交更改后，item\_id属性将完成修改。

通过系统内的查询也可以查找到对应新item\_id的对象。

![[99-Assets/8a860fb5f81c82e371bc44052eff6550_MD5.png]]

但此时存在一个问题，使用旧的item\_id新建对象时，提示违反唯一性规则。

![[99-Assets/104d6036ece988ca80840e5a77f78067_MD5.png]]

# 4、查看并修改POM\_KEY表

在数据库中管理字段唯一性的数据库表pom\_key，其中存储了类型及唯一性字段值。存储了ITEM及对应item\_id。如表：

![[99-Assets/54c529157c97eeb12c96397c05b7c437_MD5.png]]

需同时修改该表中对应的唯一字段值

update pom\_key set key\_value=key\_value ||'\_gz' where key\_value like 'M/\_%'escape'/';

![[99-Assets/58949afddac269fa41cc7f1f371c9874_MD5.png]]

此时再使用旧的item\_id创建对象时，不会出现违反item\_id唯一的提示。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/85dc64ad_1781520505823?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzY4NTMwNzg2OA%3D%3D%26mid%3D2247483811%26idx%3D1%26sn%3D6f0f4027bd5596dff98e6b7051e640a5%26chksm%3Df2f80de886438c1b1e89473c0d4b6dc4ac97a8b02dabbb474bb4f4cb16b4423478e822fe0eba%26mpshare%3D1%26scene%3D1%26srcid%3D0615GGN3QABwCpLZG33lehXm%26sharer_shareinfo%3D3fc6773798a31111f8fda33eee46cae3%26sharer_shareinfo_first%3D3fc6773798a31111f8fda33eee46cae3%23rd&s=obsidian)