---
title: 布尔值True中文字符差异显示的解决方法
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## 布尔值True中文字符差异显示的解决方法 
![image1](466c89631f4b441280e59e9251b66f4e.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：丁建新 审校：常勇«/span»
**测试版本：TC11**
![image2](94a488f324ef4201a602c1d329d38342.png)
![image3](af5c47a14ddd4147b4380faae75426a1.png)
OOTB环境下，布尔值True中文字符在My Teamcenter查看器和属性窗口中显示的值不同。
![image3](af5c47a14ddd4147b4380faae75426a1.png)

查看器中显示为是，如下图所示：
![image4](d0e7981eede348279c71c5a60f224d10.png)
**图1**
My Teamcenter查看器中显示为真，如下图所示：
![image5](482397e07a6c426db2b8d5d0229403b0.png)
**图2**
**如何也显示为是呢**
![image6](d660227ec88944d7ae50be0059c624b9.png)
在%TC_ROOT%\lang\textserver\zh_CN文件夹中 打开 tc_text_locale.xml文件。将下图所示位置的‘真’修改成‘是’。
![image7](d1f33b8ef3fa4ba49ecc0a963e0ee089.jpg)
**图3**
![image6](d660227ec88944d7ae50be0059c624b9.png)
停止 Teamcenter Server Manager 服务。
![image6](d660227ec88944d7ae50be0059c624b9.png)
删除%temp%\V\*\*\* 文件夹中的共享内存文件夹。
![image6](d660227ec88944d7ae50be0059c624b9.png)
重新启动 Teamcenter Server Manager 服务。
![image6](d660227ec88944d7ae50be0059c624b9.png)
查看器中的布尔值Ture中文字符显示为 “是”。如下图所示：
![image8](d1e8ac7b473c4a4ea382825f974fe0da.png)
**图4**
由此可以延伸，系统中的其他属性中文字符显示也可以按照上述方法进行针对性的更改。
![image9](d0ec246438794fb196136c0bd2ebf59c.jpg)
![image10](4ae22803d18d42698b91befc293a84a9.jpg)
阅读
在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image11](584e3687fd3e4ee29dc020e66fe014d9.png)
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
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655041670&idx=3&sn=fef8fc1ff9eb8aa3c1aa00985bfbbf99&chksm=8154222eb623ab3888a1a5515e5bdc0568285a9aa09dbf8ea9ef63a0b951704968fd95ab7b50&mpshare=1&scene=1&srcid=09028iXEmPsgtDOiXXwx6jbD&sharer_sharetime=1567427813147&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655041670&idx=3&sn=fef8fc1ff9eb8aa3c1aa00985bfbbf99&chksm=8154222eb623ab3888a1a5515e5bdc0568285a9aa09dbf8ea9ef63a0b951704968fd95ab7b50&mpshare=1&scene=1&srcid=09028iXEmPsgtDOiXXwx6jbD&sharer_sharetime=1567427813147&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
