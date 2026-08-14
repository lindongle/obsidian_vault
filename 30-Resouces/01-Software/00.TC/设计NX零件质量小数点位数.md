---
title: 设计NX零件质量小数点位数
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:53
tags:
  - TC
---

设计NX零件质量小数点位数
2019年7月10日
0:50

## <span style='color:#2E75B5'>Teamcenter 技术技巧 </span>
**<u>1. 设置NX零件质量小数点位数</u>**
<span style='color:#333333'>1. 修改属性映射文件，映射“TA_Mass”到Teamcenter中Double属性“g2_PartRev_EstimateWeight”</span>
<span style='color:#333333'>{ Datasettype="UGMASTER"</span>
<span style='color:#333333'>"DB_PART_NAME": Item.object_name /write_once /description="Part Name"</span>
<span style='color:#333333'>"DB_PART_DESC": Item.object_desc /write_once /description="Part Description"</span>
<span style='color:#333333'>{ Itemtype="G2_Part"</span>
<span style='color:#333333'>"TA_Mass" :ItemRevision.g2_PartRev_EstimateWeight /master=cad</span>
<span style='color:#333333'>/description="TA_Mass"</span>
<span style='color:#333333'>}</span>
<span style='color:#333333'>}</span>
<span style='color:#333333'></span>
<span style='color:#333333'>2. 从Teamcenter打开NX，创建一个模型，在属性→权值中勾选“保存时更新数据”，保存模型分析→测量体→选择模型，勾选“关联”后点击确定。</span>
![image1](1fad7fb89d514102ba80d34b53a098be.jpg)
<span style='color:#333333'>3. 创建表达式TA_Mass=ug_setPartAttrValue("MASS",format("%0.2f",P16)), 设置TA_Mass属性保留两位小数点，点击绿色按钮确认。</span>
![image2](822b95fc1fe6443f9895a4e421ae4b6b.jpg)
«span style='color:#333333'»4. 打开属性信息，映射的属性显示如下  
«/span»
e:10.0pt;font-family:"Arial","sans-serif";color:#333333;mso-font-kerning:0pt'\>TA_Mass=ug_setPartAttrValue("MASS",format("%0.2f",P16)),
<span style='color:#333333'>设置TA_Mass属性保留两位小数点，点击绿色按钮确认。</span>
![image3](8788841543ab43ba94d8dc138e27f82f.jpg)

**<u>2. AWC通过以下首选项来确定对一个对象进行渲染的样式表</u>**
<span style='color:#333333'>首先，查找名称为AWC\_\[TYPE\].SUMMARYRENDERING的首选项定义的样式表。</span>
<span style='color:#333333'>如果不存在上面的首选项，查找名称为\[TYPE\].SUMMARYRENDERING的首选项定义的样式表。</span>
<span style='color:#333333'>如果上面的两个首选项都不存在，系统会根据以上的查找顺序查找父类对象类型\[TYPE\]定义的样式表,直到找到合适的渲染样式表。</span>

阅读
分享 在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *<span style='color:#5B9BD5'>朋友会在“发现-看一看”看到你“在看”的内容 </span>*
确定
![image4](1f7df917337546b08a7b707f4138e9a0.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *<span style='color:#5B9BD5'>朋友将在看一看看到 </span>*
确定
写下你的想法...
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
确定
最多200字，当前共字
发送中
[留言](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
即将打开一个新页面
[取消](javascript:void(0);) [允许](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649881969&idx=1&sn=4097863dcbcf9f93cb637fcd06842fb8&chksm=82cc5cc1b5bbd5d7cc91c9baaeb1ed4635ef0955e2bd802f1e1dab3704199ae77dbb78511d6d&mpshare=1&scene=1&srcid=#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649881969&idx=1&sn=4097863dcbcf9f93cb637fcd06842fb8&chksm=82cc5cc1b5bbd5d7cc91c9baaeb1ed4635ef0955e2bd802f1e1dab3704199ae77dbb78511d6d&mpshare=1&scene=1&srcid=#rd)
