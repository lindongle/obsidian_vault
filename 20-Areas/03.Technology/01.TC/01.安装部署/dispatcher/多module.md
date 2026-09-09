---
title: 多module
updated: 2026-06-06T10:08
created: 2020-12-23T09:28:04
tags:
  - TC安装部署
---

多module
2020年12月23日
9:28
一个主调度服务（schedule） 多组module和client
西门子建议Dispacher客户端与离tcserever最近，如放到Pool服务器上或单独，Schedule可以单独一台服务器或与client或model放一起均可以，Model做多台服务器

Siemens PLM Software recommends that you install the dispatcher client on a machine in close proximity to the client machine for optimal performance.

**A typical data flow through the dispatcher client is as follows:**
1\. The client (A) triggers a translation request to the client service (B) based on some translation criteria such as checkin or on-demand.
2\. The request activates a trigger for: • Queuing a request for output file generation.
• Gathering the required files (C) and placing them in a predefined directory.
• Creating a task definition file (D).
3\. The dispatcher client submits the translation request to the Dispatcher Server (E).
The request contains all the necessary information to submit the request, including a hierarchical map of CAD files.
4\. The Dispatcher Server notifies: • The dispatcher client if the translation request is successfully completed (F).
• The client service (B) if the request fails.
5\. The dispatcher client maps translated files to CAD files and adds this mapping information to the original task file (G).
6\. The dispatcher client passes this information to the client for further processing.
The following figure shows the flow of data through the dispatcher client.
**通过调度程序客户端的典型数据流如下：**
1.客户端（A）根据某些转换标准（例如签入或按需）触发对客户端服务（B）的转换请求。
2.该请求激活以下触发器：•排队请求生成输出文件。
•收集所需文件（C）并将它们放置在预定义目录中。
•创建任务定义文件（D）。
3.调度程序客户端将翻译请求提交给调度程序服务器（E）。
该请求包含提交请求的所有必要信息，包括CAD文件的层次结构图。
4.调度程序服务器通知：•调度程序客户端是否成功完成了翻译请求（F）。
•如果请求失败，则为客户端服务（B）。
5.调度程序客户端将翻译后的文件映射到CAD文件，并将此映射信息添加到原始任务文件（G）。
6.调度程序客户端将此信息传递给客户端以进行进一步处理。
下图显示了通过调度程序客户端的数据流

![image1](b5949eae80184ccc98fea30bcfb2e13f.png)

![image2](edcf95ed9b0540a69974980e81e9e624.png)

![image3](c554cc7c983c4e34a784a0a6c4d965a7.png)

![image4](eeb42b4945c94c5e9e150df7fd7a8d79.png)

![image5](1cf6695f921e4e74a006a6a93a3c1665.png)

![image6](3d06c2ec1e674c929a39fcd065b59958.png)

![image7](537d80960d8f49bb809a8cc46da1330d.png)

![image8](98f22b5b1a25473a8e23c8f99a6c733e.png)

![image9](00feda59a0b944bfafdd56b5b83e5d89.png)
