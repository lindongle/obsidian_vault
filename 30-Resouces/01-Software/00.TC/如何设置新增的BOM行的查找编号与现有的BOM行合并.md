---
title: 如何设置新增的BOM行的查找编号与现有的BOM行合并
updated: 2026-06-06T10:08
created: 2020-09-15T07:58:57
tags:
  - TC
---

如何设置新增的BOM行的查找编号与现有的BOM行合并
2020年9月15日
7:58
## <span style='color:#2E75B5'>如何设置新增的BOM行的查找编号与现有的BOM行合并 </span>
收录于话题
![image1](f0dbd6bdc0e84e96a19db2557cc56fda.gif)
<span style='font-weight: bold;background:#59C3F9'>作者：马正兴 审校：史道胜</span>
**适用版本：TC所有版本**

<span style='color:#2B2B2B;text-align:center'>用户在为总成添加子件时为方便辨别各总成之间的分布关系，需要有统一的查找编号来辨别，但是系统默认的是新增零件的查找编号会依次增加（不管相同不相同），那么该如何设置新增相同零部件的与现有的零部件合并呢？</span>
**具体操作步骤**  
**  
  **

![image2](60d7fe50a1f74472a0ba13ccd0b3c115.png)
首先找到ps_new_seqno_mode,将系统默认的值new修改为existing，如图1、2所示
![image3](6e3f007541094e20a908a70024930d53.jpg)
**图1**
![image4](a3df1284679d49b2afaabf303ff3380c.png)
**图2**  

![image2](60d7fe50a1f74472a0ba13ccd0b3c115.png)
在修改完之后，我们再去总成下方添加零部件的时候就可以发现原先添加相同零部件会新增一行，而现在变成了合并零部件，如图3是首选项为new时的结果，如图4则是修改为existing实现的效果
![image5](162722caee5741bd86b0516f2cacd6a4.png)
**图3**
![image6](8e718a1033874ac5a4d6841578af4760.png)
**图4**  

**关注我们**  

![image7](1879dd87915f4a37aeab77ad058d67ac.png)
![image8](257eb567a97e4580a39d07f0377509c5.jpg)
预览时标签不可点
阅读
分享
赞 在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image9](985d75a8a7434b408f3a14babfb3e410.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
如何设置新增的BOM行的查找编号与现有的BOM行合并
最多200字，当前共字
发送中
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

[\<From: https://mp.weixin.qq.com/s/eNilr4ni5n_5193jY0-hZg\>](https://mp.weixin.qq.com/s/eNilr4ni5n_5193jY0-hZg)
