---
title: BOM结构管理器中单位转换
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

BOM结构管理器中单位转换
2019年7月10日
0:42

## Teamcenter 技术技巧 
***1. 如何在结构管理器中使用单位转换***
你可以在结构管理器中调出数量编辑窗口，根据用户选择的单位设置BOM行数量的值
方法
1\. 创建一个XML文件，并且指定单位转换的规则，文件格式如下 \<?xml version="1.0" encoding="utf-8"?\>
\<UOMConversionTable\>
\<Formula from_uom="kg" to_uom="gm" multiplier="1000"/\>
\<Formula from_uom="km" to_uom="m" multiplier="1000"/\>
\</UOMConversionTable\>
2\. 创建一个文本数据集，并导入上一步的XML文件
3\. 在BMIDE中设置全局变量Fnd0PSEQtyConversionDSName, 值与第二步中数据集名称一致
4\. 在BMIDE中设置全局变量Fnd0PSEEnableQtyConversionUOM为TRUE
5\. 模板部署成功后，双击BOM行数量区域显示如下对话框
![image1](7c47721f51044063ade2922e7cc93625.png)
Fnd0PSEEnableQtyConversionUOM
Enables the edit quantity feature in the Structure Manager. Use this when you want to
specify a quantity for a structure line in a user-defined unit of measure. To enable
the feature, set the value to true. The default value is false.
You must specify the dataset containing the rule file in the Fnd0PSEQtyConversionDSName
global constant.
This constant is provided by the foundation template file.
• Fnd0PSEQtyConversionDSName
Specifies the dataset containing the XML rule file. Use this when you want to specify
a quantity for a structure line in a user-defined unit of measure in the Structure
Manager. The default value is ConversionTable.
To enable this feature, you must set the Fnd0PSEEnableQtyConversionUOM global constant
to true.
This constant is provided by the foundation template file.

***2. 无法保存SolidEdge装配至Teamcenter***
问题
系统中已经定义了ACL规则，使访问者对SolidEdge有关的数据集（SE Assembly, SE Part, SE Draft, Direct Model）有写的权限，但是用户保存SolidEdge装配时仍提示权限的错误
对对象“SE_Attr0”（类 SE_Assembly_Attr0 (Form)）的“写”访问被拒绝
解决方法
用户对 ”SE Assembly” 命名引用中SE_Assembly_Attr0类型的表单没有写入权限，可以通过下面的首选项，将ACL规则应用到SE_Assembly_Attr0表单上
2018-5-11
TC_object_type_delegate
定义值
SE_Assembly_Attr0:Dataset
注意：Teamcenter安装后不会创建该首选项，需要用户手动创建

阅读
分享 在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image2](1e1bb7bfdd7d49dcac0517c03e815a2e.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *朋友将在看一看看到 *
确定
写下你的想法...
取消
#### *发布到看一看 *
确定
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
即将打开一个新页面
[取消](javascript:void(0);) [允许](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882239&idx=1&sn=e624ed851a7233cb70ba8d00795fd494&chksm=82cc5fcfb5bbd6d9884f19ea1d6728264d1cdc75e984760ff4f36528800c98657a1e7568e894&mpshare=1&scene=1&srcid=#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882239&idx=1&sn=e624ed851a7233cb70ba8d00795fd494&chksm=82cc5fcfb5bbd6d9884f19ea1d6728264d1cdc75e984760ff4f36528800c98657a1e7568e894&mpshare=1&scene=1&srcid=#rd)
