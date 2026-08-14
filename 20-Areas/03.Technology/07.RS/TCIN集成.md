---
title: TCIN集成
updated: 2026-06-06T10:08:51
created: 2026-07-05T17:04:51
---

1、必须先安装TCIN环境，且Rulestream要跟TCIN安装在同一个客户端上。可以从Rulestream中启动NX。通过NX Spec对象建立关系。在Rulestream中配置NX与Rulestream的Mapping关系。
2、ETO零组件模板必须放在TC中管理。在设置中添加TC的模板到Rulestream中，启动是可以选择模板及加载的版本规则。
3、只会对标识了ETO零件和ETO组件的对象进行克隆或修改，对标准零件和标准组件（RSStandard设置为true）只引用。如果没有创建Teamcenter Item spec，则会认为是标准零件
4、ETO零件必须通过调用ETO模板进行克隆创建，只调用不修改模板。模板中不要有多个版本，否则会一直调用第一个版本。
5、TCIN集成支持动态装配。 动态装配是由Rulestream Engineer在运行时动态装配的，而不是在设计时被扫描到Architect中的模板装配。 通常，动态装配体从顶层（空的或其他形式的）装配体开始，通常以参考几何体（如平面和轴）为起点。

6、支持零件族的集成。
7、支持调用本地种子文件模板创建或更新零件图及二维工程图。装配不能直接创建，但可以调用Rulestream中已有的零件和装配。
![image1](1c97af403dca425f8d4e40557d3c05c6.png)

![image2](a2712bb21214432886d83588beca2ace.png)

![image3](36556aea11604b9d964cb9ae81cae6d4.png)

