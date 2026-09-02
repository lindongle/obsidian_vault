---
title: AWC4.X开发学习之（3）——表格属性的图标渲染“propertyRendererTemplate...
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:08:53
tags:
  - TC
---

## AWC4.X开发学习之（3）——表格属性的图标渲染“propertyRendererTemplates”的配置 
![image1](14bd8573e417462982fcdf8d03304cb9.gif)
  最近在翻阅AWC的邮件列表时，发现了关于propertyRendererTemplates的相关讨论邮件，propertyRendererTemplates是AWC4.2加入的新功能，其主要适用于配置表格控件的属性需要进行特别的渲染时进行的配置。在OOTB的stage\components\activeworkspace\repo\kit\tc-aw-framework\module.json文件中提供了很多系统配置的例子，主要有是三个“对象发布状态”（两个）“对象流程状态”，“对象签出状态”。
![image2](adc4dcfe619849058e2228d0b722ec7d.jpg)
关于propertyRendererTemplates下各个节点的功能介绍如下：
![image3](919a625169fa4ded81901e41fdffa1bc.jpg)
![image4](f77b722aca9a44bb816f7b7a8918218c.jpg)
1、针对“客户化状态”的的添加  

当项目定义了客户化的发布状态的特有图标，需要在AW端显示客户化的状态图标。在AW端主要涉及两个方面的内容：  

（1）对象Cell中的indicators状态图标显示
本公众号的文章《AWC4.X开发学习之（2）——indicators与typeProperties的配置学习》下图  

![image5](a83becfcaa7746c6aa564ed58bec609f.png)
（2）在表格控件中显示状态图标，主要通过propertyRendererTemplates的配置方式进行配置，主要涉及的配置在stage\components\activeworkspace\repo\kit\tc-aw-framework\module.json中，的“release_status_template”模板文件，指向自定义的html文件修改下图标出的配置文件
![image6](e04a94035fe1412aad4074605606cf83.png)
![image7](e436be4aa37e453293821bb0797189d7.jpg)
2、对于在table中的属性，通过propertyRendererTemplates的配置，可以实现属性显示字段的渲染。
![image8](7e1f619245604e1e8cabb25b5a16033e.jpg)
例如给文字加背景颜色（如下图）
![image9](f3730be689b7444b978f74fabd99530d.jpg)
![image10](af658f9a51024e04ab499e5e9796ca9e.jpg)
3、XRT中的属性渲染配置暂不支持
XRT中的标准属性在不支持类似的配置，PD计划会在后期的版本中推出。  

![image11](1b8fab787c174baa842ce735805a547b.png)

但是一个可以替代的方式是，可以通过在XRT中插入\<htmlPanel\>的方式解决此问题(html编写自己的代码逻辑)。  

