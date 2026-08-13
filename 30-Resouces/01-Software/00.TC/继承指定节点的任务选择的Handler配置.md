---
title: 继承指定节点的任务选择的Handler配置
updated: 2026-06-06T10:08
created: 2019-12-06T22:15:31
tags:
  - TC
---

## <span style='color:#2E75B5'>继承指定节点的任务选择的Handler配置 </span>

![image1](dbd7f1234a08448b8b216b0a22dace8d.gif)
«span style='color:white'»**作者：王欣 审校：陈泓希  **
«/span»
**适用版本：TC11**
<span style='color:#3F3E3F'>如果一个流程中有时需要批准有时不需要。一般情况下我们会在批准节点之前加【“条件”任务】，但在实际业务中可能会出现流程走到该节点时提醒发起人进行重新选人，发起人有时可能忘记，比较麻烦，这时我们可以做如下操作来实现。</span>

<span style='background:#59C3F9'>1</span>
<span style='color:black'>流程配置如图一所示，配置两个【“条件”任务】；</span>

![image2](de99587007c64001949e7903cd59c2e0.png)

<span style='background:#59C3F9'>2</span>
<span style='color:black'>配置图二所示Handler，可以实现让后面的【“条件”任务】自动继承第一个【“条件”任务】的选择，这样就避免了到该节点进行二次选人。</span>

![image3](25644ef829424a4baa2f6bfcc8b1f990.png)

![image4](b80607fe533049c289e1508b98222f6f.jpg)
![image5](04fdb99832544a6298486dfa2a0c2eaf.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image6](a4ad1dc63a20474ca48085a1fef796dd.png)
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
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655042401&idx=5&sn=f9cab3ac0b040f9deb4adbb8e2858437&chksm=815421c9b623a8dfb4f71136943f3cb22b5df04c8026a78e2f27b4c6db5eec78214c51cbce8f&mpshare=1&scene=1&srcid=1206K7sZLoqKTZ8K2kyRBma9&sharer_sharetime=1575641727780&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655042401&idx=5&sn=f9cab3ac0b040f9deb4adbb8e2858437&chksm=815421c9b623a8dfb4f71136943f3cb22b5df04c8026a78e2f27b4c6db5eec78214c51cbce8f&mpshare=1&scene=1&srcid=1206K7sZLoqKTZ8K2kyRBma9&sharer_sharetime=1575641727780&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
