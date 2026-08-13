---
title: (36条消息) windows查看cpu的核心数和线程数_u012899746的博客-CSDN博客
updated: 2026-06-06T10:05
created: 2021-01-04T21:11:57
---

(36条消息) windows查看cpu的核心数和线程数_u012899746的博客-CSDN博客
星期一, 一月 4, 2021
1:11 下午
已剪辑自: <https://blog.csdn.net/u012899746/article/details/103342925>

1、打开cmd，先输入 wmic，在输入 cpu get，
![image1](c3b2471cc5c34863907bfa6b2fec5123.png)
2、往后拖，NumberOfCores为核数 NumberOfLogicalProcessors为线程数，可以看到图中为6核心6线程
![image2](d02705c041c74206825ff9d3267e1180.png)

