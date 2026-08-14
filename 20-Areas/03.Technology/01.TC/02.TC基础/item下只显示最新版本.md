---
title: item下只显示最新版本
updated: 2026-08-13T11:12:51
created: 2026-07-05T17:04:40
---

![image1](80691225d4584a63b562a5264d0a59e4.png)

首选项设置，不继承，需每个类型配置，每个类型配置以下3个首选项。必须在\*defaultChild\*property\*中增加displayable_revisions，去除revision_list
\<preference name="Y2_RawMaterial_rev_display_all" type="String" array="false" disabled="false" protectionScope="Site" envEnabled="false"\>
\<preference_description\>This is an internal preference.\</preference_description\>
\<context name="Teamcenter"\>
\<value\>false\</value\>
\</context\>
\</preference\>
\<preference name="Y2_RawMaterial_rev_display_order" type="String" array="false" disabled="false" protectionScope="Site" envEnabled="false"\>
\<preference_description\>This is an internal preference.\</preference_description\>
\<context name="Teamcenter"\>
\<value\>0\</value\>
\</context\>
\</preference\>
\<preference name="Y2_RawMaterial_rev_display_rule" type="String" array="false" disabled="false" protectionScope="Site" envEnabled="false"\>
\<preference_description\>This is an internal preference.\</preference_description\>
\<context name="Teamcenter"\>
\<value\>4: :Latest Working:1\</value\>
\</context\>
\</preference\>
