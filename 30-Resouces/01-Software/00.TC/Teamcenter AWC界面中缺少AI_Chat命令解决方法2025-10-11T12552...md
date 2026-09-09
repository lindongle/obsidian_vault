---
title: Teamcenter AWC界面中缺少AI_Chat命令解决方法2025-10-11T12:55:2...
updated: 2026-06-06T10:08
created: 2025-10-11T12:55:28
tags:
  - TC
---

源网页：https://mp.weixin.qq.com/s?\_\_biz=MzAxOTU4MTk0NA==&mid=2455831226&idx=1&sn=c6d2a0950f852547114231570f7b430d&chksm=8d98e7272ed77d7ecc9f052b45b51ffd6dc7a36368faca1cf174d1f82db93fb03c4bf5fef29c&mpshare=1&scene=1&srcid=1011gobJRQquGMZa651kuCRl&sharer_shareinfo=036aeb0ee7bc8f8906dde6db440db721&sharer_shareinfo_first=036aeb0ee7bc8f8906dde6db440db721#rd
**网页内容：**
公众号名称：PLMCoder
作者名称：dxh
发布时间：2025-09-23 09:29
<span style='color:black'>问题：</span>

<span style='color:black'>  在安装 Teamcenter AI Chat并进行相关配置后，AWC UI 中缺少AI_Chat命令。</span>

<span style='color:black'>解决方法：</span>

- <span style='color:black'>检查首选项“TC_AI_Question_Answering_Enabled”值，将其设置为“true”，如果没有，则将其设置为 true。</span>
- <span style='color:black'>如果未添加到首选项“AWC_StartupPreferences”中，请将首选项“TC_AI_Question_Answering_Enabled”添加到首选项“TC_AI_Question_Answering_Enabled”。</span>

![image1](c8a0dfd469f64d8784801fec2d41bb53.png)
**网页截图：**
[Webpage.html](e4c3869feecb4d1bb2c5d40eb2d6a7ae.html)
