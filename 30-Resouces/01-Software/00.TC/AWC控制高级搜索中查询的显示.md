---
author: PLM之友
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzkwNTI5MDY0OQ==&mid=2247487952&idx=1&sn=9e455c6fc4cbaef4d9743f9dce437966&chksm=c1e06012a18605678f7d6ef6eb09157284a34e53efc6280112a03bb096349531e28eb94ca206&mpshare=1&scene=1&srcid=10250wU41UoHqCblOKwkCp2E&sharer_shareinfo=67c82c307285a165358d51f0ce6112f0&sharer_shareinfo_first=67c82c307285a165358d51f0ce6112f0#rd
Created: 2026-10-25 14:05:58
tags:
  - 笔记同步助手
id: ac80829b-2848-47f0-a3d0-aa4bd1110c57
created: 2026-10-26T13:28:42
updated: 2026-10-26T13:28:45
---

公众号名称：PLM之友

作者名称：PLM之友

发布时间：2026-10-25 11:31

在 **Teamcenter Active Workspace Client（AWC）** 中，控制**高级搜索（Advanced Search）**里**查询（Saved Queries）**的可见性，主要有三种实现方式。本文按「推荐程度」逐一拆解配置步骤、作用域与适用场景，并给出按需求选型的一张对照表，方便一线实施直接照做。

方法一：首选项白名单（推荐）

AWCsearchsavedquerieslist

这是**最常用、最轻量**的方法：通过首选项显式指定 AWC 高级搜索中**只显示哪些查询**，未列出的查询自然从下拉列表里消失，无需动权限模型。

配置步骤

**1**

登录 **Teamcenter Rich Client** 或 AWC 管理端

**2**

打开 **首选项管理器**（Preferences Manager）

**3**

搜索首选项：AWC\_search\_saved\_queries\_list

**4**

在该首选项中，**仅列出希望用户看到的保存查询名称**

**5**

未列出的查询将**不会出现在** AWC 高级搜索下拉列表中

> ![[99-Assets/9c565cba65db7e7f487953befb487700_MD5.png]]

> ![[99-Assets/d72e6231beb508b220f77cb8d4104667_MD5.png]]

✦ 提示

不需要将该首选项额外加到 **AWC\_StartupPreferences** 中。

作用域（Scope）控制

| 作用域 | 效果 |
| --- | --- |
| Site | 整个站点所有用户生效 |
| Group | 仅特定组的用户生效 |
| Role | 仅特定角色的用户生效 |
| User | 仅特定用户生效 |

方法二：ACL 权限管控

ACCESS CONTROL LIST

通过 **ACL（访问控制列表）**可以从**权限层面**控制用户是否能看到某些查询定义，适合需要精细区分的场景。

配置步骤

**1**

打开 **Query Builder**（查询构建器）

**2**

找到需要隐藏的**保存查询**

**3**

右键点击该查询 → 选择 **管理访问权限**

**4**

配置 ACL 规则，**取消**特定用户/组的 **READ 权限**

**5**

没有 READ 权限的用户将无法在高级搜索中看到该查询

优势

**精细化权限控制**

**支持按用户、组、角色、项目等多维度控制**

方法三：隐藏整个高级搜索

AWAdvancedSearch\_Visibility

如果需要**完全隐藏高级搜索功能**（而不仅仅是隐藏部分查询），可以使用

**AW\_Advanced\_Search\_Visibility**首选项，从入口层面关掉整个模块。

配置方式

| 值 | 效果 |
| --- | --- |
| true（默认） | 显示高级搜索链接和选项卡 |
| false | 隐藏高级搜索入口 |

按组控制

将 **Protection Scope** 从 Site 修改为 Group，即可实现**不同组的用户看到不同的高级搜索界面**。

推荐实施方案

WHICH ONE TO USE

根据**需求场景**选择对应方案，下面是常见诉求与推荐方法的对照：

| 需求场景 | 推荐方法 |
| --- | --- |
| 只展示部分查询给所有用户 | AWC\_search\_saved\_queries\_list<br>（Site 级别） |
| 不同用户组看到不同查询 | AWC\_search\_saved\_queries\_list<br>（Group/Role 级别）+ ACL |
| 完全禁止某些用户使用高级搜索 | AW\_Advanced\_Search\_Visibility = false |
| 精细化权限控制特定查询 | ACL 访问控制列表 |

  

> 既然看到这里了，如果觉得有用，随手点个赞、在看、转发三连吧。
> **点赞**
> **在看**
> **转发**
> THANKS FOR READING

本文标签 · TAGS

#Teamcenter #AWC #PLM #高级搜索 #权限管控 #Saved Queries

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/b0fdf37a_1792908352249?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzkwNTI5MDY0OQ%3D%3D%26mid%3D2247487952%26idx%3D1%26sn%3D9e455c6fc4cbaef4d9743f9dce437966%26chksm%3Dc1e06012a18605678f7d6ef6eb09157284a34e53efc6280112a03bb096349531e28eb94ca206%26mpshare%3D1%26scene%3D1%26srcid%3D10250wU41UoHqCblOKwkCp2E%26sharer_shareinfo%3D67c82c307285a165358d51f0ce6112f0%26sharer_shareinfo_first%3D67c82c307285a165358d51f0ce6112f0%23rd&s=obsidian)