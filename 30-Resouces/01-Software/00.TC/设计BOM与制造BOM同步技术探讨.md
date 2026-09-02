---
title: 设计BOM与制造BOM同步技术探讨
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:53
tags:
  - TC
---

## 设计BOM与制造BOM同步技术探讨 

**1 问题的提出**
 设计<u>BOM</u>与制造BOM是两种不同的产品结构视图，设计BOM在产品设计过程中产生，制造BOM是在设计BOM的基础之上经工艺过程后生成，一般是要经过人工调整的，两种BOM的组成和结构是有些差异的。由于设计变更或产品配置的原因，在产品的设计和制造过程中，设计BOM的组成和结构经常发生变化，如何保证制造BOM也随之调整，这是制造企业信息系统建设中需要解决的重大问题。
**2 问题描述**
 BOM(bill 0f material)是产品的物料清单，用来反映一个产品由哪些零部件构成以及这些零部件的构成关系。一个产品的所有零部件之间存在按层次的装配关系，可用产品结构树表示这种关系。图1是BOM的结构。图中每一个节点表示一个零部件(用自然数标识)，每一根线表示一个装配(父子)关系，线上的小号数字表示装配数量。其数学模型可以用自然数集N上的有序的三元关系R描述：

![image1](d9a29b04043e49bb82a6821a2bcddb55.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
 针对图1示例，BOM的组成和结构是集合
![image3](37b1e65bc52d48769c3ddb84186dfee1.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
上的一个确定的关系R<sub>X</sub> ，其中：
![image4](13d3685aa7f74fd9bd896ffb88dfae3e.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
![image5](c2a31b41260848d2a45a3b639c89c98d.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
**图l BOM的结构图**
 那么，设计BOM就是集合
![image6](c0ff799b08d9478f91e379548469f627.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
上的一个确定的关系R<sub>E</sub>，制造BOM也是集合
![image7](b4eed814297e4408b779a0148018a1d1.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
上的一个确定关系R<sub>M</sub>。由于制造BOM是在设计BOM的基础上，经过工艺调整后得到，则存在
![image8](8b9ca6f400464168b997ff91215ddae6.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
，否则，制造时会少某些零部件。
 本文探讨的问题是：R<sub>E</sub> 发生变化时，怎样得到相应变化的R<sub>M</sub>。
**3 技术方法**
 **3.1 差异分析**
 经过对设计BOM(R<sub>E</sub> )和制造BOM(R<sub>M</sub>)分析对比，就会发现它们在组成和结构上存在如下差异：
 1)它们的零部件的父子关系不同，如BOM结构图中的零件lO和部件4在R<sub>E</sub>中是父子关系；而在R<sub>M</sub>中可能是兄弟关系，也可反过来，从兄弟关系变成父子关系。
 2)由于实际装配的需要，在R<sub>M</sub>增加虚拟件，把R<sub>E</sub>中的一些零部件置于虚拟件之下，作为虚拟件儿子。
 3)由于生产组织的原因，在R<sub>M</sub>中要把R<sub>E</sub>处于不同层次的相同零部件进行合并。
 这些差异总是可以通过在设计BOM(R<sub>E</sub>)集合中添加或删除一系列元素后形成，制造BOM(R<sub>M</sub>)也就随之生成。下面提出一种记录它们之间的差异，实现制造BOM随设计BOM同步变化的方法，称为差异同步法。
** 3.2 差异法**
 图2是BOM(R<sub>E</sub>)和制造BOM(R<sub>M</sub>)的实例图，可以看出它们在组成和结构上发生了变化。
![image9](fd0c0b5b4c8048678f7a6ebba1fcfbde.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
**图2 BOM(R<sub>E</sub>)和BOM(R<sub>M</sub>)实例图**
 **3.2.1 记录差异**
 定义关系Rx(有序的三元组)：<sub></sub>R<sub>X</sub>={(x，y，z)∣x∈N，y∈N，z∈{+，-}}其中N是自然数集；+、-分别表添加、删除。用R<sub>X</sub>记录从设计BOM(R<sub>E</sub> )调整到制造BOM(R<sub>M</sub>)的过程，即它们之间的差异，开始R<sub>X</sub>是空集，随着调整进行，即(R<sub>E</sub>)集合上的添加、删除操作，R<sub>X</sub>中的元素也在逐渐增加。对于图2中实例图的??最终结果是：R<sub>x</sub> ={(2，5，-)，(2，6，-)，(2，91，+)，(91，5，+)，(91，6，+)，(1，16，-),(11，16，+)，(8，12，-)，(3，12，+)，(8，92，+)}
** 3.2.2 实现同步**
 由于设计变更或产品配置的原因，设计BOM(R<sub>E</sub> )发生变化，这种变化通常不会是很大，采用与上面相同的方式，用关系R<sub>y</sub>记录(R<sub>E</sub>)的变化。
 例如：R<sub>y</sub> ={(2，5，-)，(8，12，-)，(4，10，-)，(4，17，+)}按如下方法得到 R<sub>z</sub> ={(91，5，-)，(3，12，-)，(4，10，-)，(4，17，+)}
![image10](4434f434fb1043898c95b5161bb4b286.jpg)
![image2](d375e633d54842998146907611a77feb.jpg)
 用R<sub>z</sub>对制造BOM(R<sub>M</sub>)进行调整，即按R<sub>z</sub>对R<sub>M</sub>执行一系增、删操作，就可以得到随BOM(R<sub>E</sub>)同步变化的制造BOM(<sub></sub>R<sub>M</sub>)。当然，这样得到的制造BOM(<sub></sub>R<sub>M</sub>)可能还需要少许的调整，但此时，调整的工作量已经大为减少，避免了许多原来已经完成的调整工作。
**4 结束语**
 设计BOM和制造BOM同步技术的探讨，对<u>PDM</u>和<u>ERP系统</u>应用具有很大的实际意义。

预览时标签不可点
阅读
分享
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image11](d96a3bdc6fde45ddb4dd3bd1d5f85f4c.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发送到看一看 *
发送
设计BOM与制造BOM同步技术探讨
最多200字，当前共字
发送中
[留言](javascript:;)
相关阅读
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
正在加载
以上推荐为优质及原创文章

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
**微信版本过低**
当前微信版本不支持该功能，请升级至最新版本。
[我知道了](javascript:void(0);) [前往更新](javascript:void(0);)
确定删除回复吗？
[取消](javascript:;) [删除](javascript:;)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: https://mp.weixin.qq.com/s/llt6EZaDmJwMBjWFLNmXig\>](https://mp.weixin.qq.com/s/llt6EZaDmJwMBjWFLNmXig)
