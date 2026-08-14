---
author: 风岭
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzY4NTMwNzg2OA==&mid=2247483751&idx=1&sn=851aa271e41203e19c7fd8271375944f&chksm=f289af0c19beaf3fb771abe94602d1a4567465f70035906fd9565ed41353acb772111725fee3&mpshare=1&scene=1&srcid=0617SI5LYge11mbnZFYUgRO2&sharer_shareinfo=dd8ea98797c11c912ff5d76b485418ed&sharer_shareinfo_first=dd8ea98797c11c912ff5d76b485418ed#rd
saved: 2026-06-17 12:16:39
tags:
  - TC开发
  - 赞助者
id: 2a271533-6606-43c1-bcb5-055d77e9fba1
title: 1、 在担保组、担保者角色下创建担保用户
aliases:
  - 1、 在担保组、担保者角色下创建担保用户
linter-yaml-title-alias: 1、 在担保组、担保者角色下创建担保用户
created: 2026-07-05T17:04:52
updated: 2026-06-18T10:58:30
---

公众号名称：PLM云迹

作者名称：风岭

发布时间：2026-05-18 14:55

Teamcenter的客户化开发分为ITK（TC封装的底层开发）服务端的C++\\C开发、RCP（Eclipse插件）胖客户端的JAVA开发、SOA（**面向服务的体系结构）**web服务开发，随着TC逐渐转向Active Workspace Client（AWC）web端，还有很多WEB端的JS、**React/AngularJS等技术。**

![[99-Assets/7c973da7ec4a3ecd1a0663e988987af3_MD5.png]]

Teamcenter客户化开发有个关键问题就用户，特别对于客户端用户使用的功能，是要精准到具体用户去执行操作。例如RCP开发由于是桌面客户端程序，可以获取当前登录用户的会话，执行相关的操作。

![[99-Assets/68f037fb03f16b3a7b21fb33d4411cab_MD5.png]]

然而SOA开发一直存在一个问题，无法获取客户端的用户会话，又不能直接使用用户明文密码去登录，导致SOA开发一直存在用户操作数据的问题，很多开发人员的处理方式，一般都是通过管理员账户登录，执行程序功能，最后再用管理员程序执行转移所有权给客户端用户。操作过程相对来说比较繁琐。稍有遗漏，就会出现权限问题。

TC中组织中可以看到有一个默认的组Sponsor和角色Sponsorer，可以翻译为赞助者或者担保者。

当在TC中对某个用户启用担保模式时，如果以担保者角色登录TC，可以代替用户在系统中执行任务，拥有相同的访问权限，可以防止管理员更改或提升TC权限。

# 1、 在担保组、担保者角色下创建担保用户

![[99-Assets/9bcf608055647f4f2ee84e86054b62bc_MD5.png]]

2、在用户下设置是否可担保的。

![[99-Assets/98a911413288311073cee5f1ee256573_MD5.png]]

  

# 3、在运行担保模式前，必须在命令行下设置

set TC\_POM\_SPONSORED\_USER=u1

然后在命令行环境下运行TC命令或者登录RC客户端或者通过SOA程序运行，在此环境下，将以担保者角色用户进行登录、执行程序操作后，但是在系统内看到的仍然是u1原用户的操作记录，因而不会存在权限问题。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/43c4756a_1781669798271?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzY4NTMwNzg2OA%3D%3D%26mid%3D2247483751%26idx%3D1%26sn%3D851aa271e41203e19c7fd8271375944f%26chksm%3Df289af0c19beaf3fb771abe94602d1a4567465f70035906fd9565ed41353acb772111725fee3%26mpshare%3D1%26scene%3D1%26srcid%3D0617SI5LYge11mbnZFYUgRO2%26sharer_shareinfo%3Ddd8ea98797c11c912ff5d76b485418ed%26sharer_shareinfo_first%3Ddd8ea98797c11c912ff5d76b485418ed%23rd&s=obsidian)