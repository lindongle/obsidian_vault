---
title: CREO遇到严重错误，回溯闪退的解决方法！
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

CREO遇到严重错误，回溯闪退的解决方法！
2019年10月26日
0:43

## CREO遇到严重错误，回溯闪退的解决方法！ 
CREO
| CREO模块: | Creo Parametric   |
|:---------:|--------------------|
| 更新时间: | 2016-11-28         |
|   语言:   | 简体中文版英文版 |
| 运行环境: |                   |
| 软件类型: | 资讯              |
| 设计类型: |                   |
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>«span style='color:black'»在使用CREO过程当中，我相信最痛苦的事情莫过于遇到下面这个回溯信息，遇到严重错误”的对话框了，<br />
点确定后，软件自动退出，如果平时没有随手保存的习惯，估计一上午或者一天的工作白干了。。<br />
«/span»</p>
<p><img src=".jpg" alt="image1" /></p>
<p>«span style='color:black'»<br />
<br />
下面看看如果解决这个问题：«/span»</p>
<h4 id="span-stylecolorff6666text-aligncenter本帖隐藏的内容span"><em>本帖隐藏的内容</em></h4>
<p>«span style='color:black'»PTC官方给出的解决方法原文是这样的：<br />
Our systems also met the min requirements and the only way to keep it from crashing was eliminating the video card by changing thegraphics config to "win32_gdi" instead of the default "opengl". This made rotation choppy and caused some flashing on certain things. 90% of the traceback.logs came up with the atio6axx error.<br />
Ended up putting a certified graphics card in a couple of the PCs and haven't had any crashes of any kind in over 2 months. Hope that helps.«/span»</p>
<p><strong>翻译过来大概的意思是这样的：<br />
防止崩溃的唯一办法是改变图形配置graphics为“win32_gdi”而不是默认的“OpenGL”，如果设置这个选项，使得模型旋转或者是操作的时候会有卡顿的情况产生，但这种设置确实能减少90%的闪退可能性，<br />
然后更换显卡为认证过的显卡，而且也做过相关实验，相关实验的电脑在2个月内没有任何崩溃记录。<br />
（PS：上述认证过的显卡应该指的是专业级显卡，如NVIDIA Quadro系列或者是AMD FirePro系列的显卡，有兴趣的同学可以尝试一下！）</strong></p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image2](bce9e4cd8a5d4a30b4667b054617b342.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *发布到看一看 *
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzA5ODYyNjQxMQ==&mid=2668470109&idx=5&sn=dd233b25f459e628952e05eb0bdb335e&chksm=8a778159bd00084fff8940ef8086bed22441ad681162a2817f37942f4788fc2461e774992e82&mpshare=1&scene=1&srcid=1026XBJvBS12oYKcSiNOvqKY&sharer_sharetime=1572021829089&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzA5ODYyNjQxMQ==&mid=2668470109&idx=5&sn=dd233b25f459e628952e05eb0bdb335e&chksm=8a778159bd00084fff8940ef8086bed22441ad681162a2817f37942f4788fc2461e774992e82&mpshare=1&scene=1&srcid=1026XBJvBS12oYKcSiNOvqKY&sharer_sharetime=1572021829089&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
