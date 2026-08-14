---
title: WIAM 材料系统集成
updated: 2026-06-05T23:39:56
created: 2026-07-05T17:04:50
---

默认情况下，IMM提供了从称为WIAM的外部物料源搜索和导入物料的功能。 可以通过逻辑首选项IMM_WIAM_USED激活或禁用此功能。
Teamcenter Server Process和WIAM Server Instance之间的通信基于HTTP协议。
要从WIAM实例访问数据，无需登录。 返回的材料数据为标准VDA 231-200 XML模式格式。
材料管理器在强制性首选项中配置了有关WIAM服务器实例路径和搜索选项的所有相关信息，这些名称以IMM_WIAM \*开头\*

IMM_WIAM_USED设置false，关闭WIAM功能，在相关搜索中会屏蔽WIAM。
