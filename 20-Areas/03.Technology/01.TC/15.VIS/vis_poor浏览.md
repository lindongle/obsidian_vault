---
title: vis_poor浏览
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:49
---

启动服务提示\[ 2018/10/10 16:23:17.638 \| Thread-20 \| INFO \]: Waiting for system resources …
一直显示。
解决：修改D:\Siemens\Teamcenter11\vispoolmanager\jetty\jettyservice.properties，
把VisPoolProxy.maxUsageThreshold=1改为VisPoolProxy.maxUsageThreshold=0.7

可视化服务器为Active Workspace 客户端提供动态**3D 可视化**功能。如果您不想使用Active
Workspace 中的3D 查看器，请勿安装可视化服务器，需要浏览JT文件时，此服务必须开启。
浏览2D ，如PDF，则不需要此模块。
![image1](ace7a177ed7c4db6ae690c7e4b1e6431.png)

