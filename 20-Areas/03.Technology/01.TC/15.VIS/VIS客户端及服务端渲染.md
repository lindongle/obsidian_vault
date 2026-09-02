---
title: VIS客户端及服务端渲染
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:49
---

客户端渲染
客户端渲染通过 Active Workspace 客户端浏览器使用 WebGL 来利用客户端图形功能。
注释:
对于客户端渲染，仍需要使用可视化服务器才能在 Active Workspace 中将 3D 数据可视化。但是，可视化服务器上不需要配备图形卡。
客户端渲染具有以下优点：
- 无需服务器端图形卡。
- 渲染不依赖于服务器的处理能力。
- 渲染不受网络流量影响，响应速度更快，对延迟也较不敏感。但是，必须先将模型的三角形加载到客户端计算机上，然后才能进行渲染。
服务器端渲染对较大的数据大小可能仍更合适，因为其加载速度更快，数据大小限制也更高。不支持 Web GL 的客户端设备需要服务器端渲染。
设置客户端渲染
要为 3D 查看器和通用查看器设置渲染方法，可在 Teamcenter 首选项**AWV0ViewerRenderOption**中指定正确值：
- **CSR**（客户端渲染）
- **SSR**（服务器端渲染）这是默认值。

*来自 \< <https://docs.sw.siemens.com/documentation/external/PL20190228103430914/zh-CN/aw/4.1/aw_html_collection_sc/zh-CN/Deployment/xid481852/xid907320/xid1563354.html>\>*

![image1](fbb5e7ec98944cbeaa72daacc569a50a.png)

