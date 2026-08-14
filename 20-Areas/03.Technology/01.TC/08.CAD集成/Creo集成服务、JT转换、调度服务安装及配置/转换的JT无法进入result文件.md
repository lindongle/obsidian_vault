---
title: 转换的JT无法进入result文件
updated: 2026-06-06T10:05:38
created: 2026-07-05T17:04:44
---

![image1](48a20751c95a4b43a7c560a3cd2a5af5.png)
在result平级，不进入result文件夹，后台显示没有结果文件生成；
原因：
数据集命名改掉，ipem.xml之前配置的jt文件中必须含有item_id才可以匹配的上，恢复原配置即可（注释掉，默认读取cad_name）；
![image2](8353fff806654e7eabbbdbd3a4ef092b.png)

