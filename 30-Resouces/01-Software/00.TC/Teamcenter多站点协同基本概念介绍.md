---
author: 风岭
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzY4NTMwNzg2OA==&mid=2247483881&idx=1&sn=683dddd79f4b22e307c1368fc94c46ef&chksm=f2127435a16b6553e49d0cf38df7ef6bf08bc0ea7e45b0dc5ffa5e14731981f1f78199bc1cc9&mpshare=1&scene=1&srcid=0722vnY3lLf8PQX3KMXwhj0S&sharer_shareinfo=9fab8c8fa0936ec66c268174187df6ef&sharer_shareinfo_first=9fab8c8fa0936ec66c268174187df6ef#rd
Created: 2026-07-22 07:32:11
tags:
  - 笔记同步助手
id: 64b394fc-73a4-45b7-940e-c29c3c0502e7
title: 2、多站点协同发布、对象、主对象
created: 2026-07-22T08:46:14
updated: 2026-07-22T08:53:24
---

公众号名称：PLM云迹

作者名称：风岭

发布时间：2026-06-14 21:43

1、多站点协同基础概念

![[99-Assets/f6064bf076317b50fdd78b1612f7a1de_MD5.png]]

站点（Site）

ü包含一个单一的数据库，包含访问数据库的所有用户和其他额外的非Teamcenter资源比如硬件、网络性能和在本站点运行Teamcenter所需的第三方软件程序（工具），在这里我们将每个站点理解为单一的数据库和它的用户。通常我们可以将其理解为一个Teamcenter的服务器端。

•ODS站点

多站点协同解决方案通常会使用一个叫做对象目录服务（ODS）的特殊站点。ODS站点在整个多站点协同网络中维护每一个对象的记录。ODS不存储对象，但是维护一个类似于图书馆卡片的记录，它告诉你当前哪个站点存储着它以及关于它的基本信息（可以供你查询对象使用）。

•IDSM站点

ü多站点协同的另一个重要的组件是集成分布服务管理器（IDSM）。如果ODS可以被理解为一个对象定位器，那么IDSM可以被想象为一个对象传送器。它提供了从所有站点导出对象、通过网络输送对象、导入对象到目标站点所使用的机制

# 2、多站点协同发布、对象、主对象

![[99-Assets/3325467be19ec755da23a0c04283a76b_MD5.png]]

3、多站点协同主对象、副本对象、同步对象

![[99-Assets/4a5b6c81e5670dcd1ecc53f2cc8b4d6e_MD5.png]]

4、多站点协同导入、导出对象、站点所有权

![[99-Assets/83f06111bcbfd9ff5c187506a7d5c48a_MD5.png]]

5、多站点协同获取副本对象

![[99-Assets/d182b00f562867b093b735c6ad5abcb8_MD5.png]]

6、多站点协同传递所有权

![[99-Assets/8252846a90f6a0436869a28f69f6115d_MD5.png]]

![[99-Assets/b728e57cc750d69ceb920f8f484d5606_MD5.png]]

7、多站点协同远程签出

![[99-Assets/2a4ff29f34ff948d8339258994c83ea3_MD5.png]]

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/f6ef14a3_1784676729223?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzY4NTMwNzg2OA%3D%3D%26mid%3D2247483881%26idx%3D1%26sn%3D683dddd79f4b22e307c1368fc94c46ef%26chksm%3Df2127435a16b6553e49d0cf38df7ef6bf08bc0ea7e45b0dc5ffa5e14731981f1f78199bc1cc9%26mpshare%3D1%26scene%3D1%26srcid%3D0722vnY3lLf8PQX3KMXwhj0S%26sharer_shareinfo%3D9fab8c8fa0936ec66c268174187df6ef%26sharer_shareinfo_first%3D9fab8c8fa0936ec66c268174187df6ef%23rd&s=obsidian)