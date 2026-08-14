---
title: 如何在CATIA树中显示Item ID_Rev ID_Item Name
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:52
tags:
  - TC
---

## <span style='color:#2E75B5'>如何在CATIA树中显示Item ID_Rev ID_Item Name </span>
![image1](edd2d991ab934b058a5253a7144cd78e.gif)
<span style='color:white'>**作者：张浩 审校：马鑫**</span>
**系统版本：TC11**
通常当CATIA数据从Teamcenter中加载时，客户会要求在CATIA树中能显示为Item ID_Rev ID_Item Name，如图1。

![image2](228773729237483fb106121e7d038418.jpg)
**图1**
如果不做任何设定的情况下，加载到CATIA中的数据只会显示为Item ID_Rev ID，此时就不易得知对应零件的名称信息，如图2。
![image3](cc09eecb9d17437b90ee33ecf921fef1.jpg)
**图2**
为了达到客户的需求，可以通过设定首选项来实现。
![image4](b7eec373524e43c29f44e19702e4c125.png)
搜索到首选项
“CATIA_MAP_Property_PartNumber”，
添加以下值：Item.item_id、ItemRevision.item_revision_id、Item.object_name。效果如图3。
![image5](1933e1c990594eaca149ea15c2a93e82.png)
**图3**
![image4](b7eec373524e43c29f44e19702e4c125.png)
再次从Teamcenter加载CATIA数据后，在CATIA树中即显示为Item ID_Rev ID_Item Name。
![image6](9fa9b14274564cb2b64ed9ff0bb63326.jpg)
![image7](3b035938dc2d4f72a9f99a34a0610548.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image8](6114ed13edc444bd97d983c7de20364c.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
发送
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655043396&idx=5&sn=8f251ae0298fc98301d38a57e7868724&chksm=815425ecb623acfafe16e125a0c9903a04ac31d2cc4bb51cf2508c5e93183d0f1276a73be8d9&mpshare=1&scene=1&srcid=&sharer_sharetime=1572880534421&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655043396&idx=5&sn=8f251ae0298fc98301d38a57e7868724&chksm=815425ecb623acfafe16e125a0c9903a04ac31d2cc4bb51cf2508c5e93183d0f1276a73be8d9&mpshare=1&scene=1&srcid=&sharer_sharetime=1572880534421&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
