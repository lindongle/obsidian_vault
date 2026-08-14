---
title: Pipeline Designer
updated: 2026-08-11T10:13:53
created: 2026-07-05T17:04:48
---

管道是业务流程集成逻辑的定义。管道设计器是一种工具，它允许通过以低代码方式定义管道来配置主动集成网关 (AIG)；无需了解任何编程语言。管道可以通过可重复使用的“步骤”轻松构建，这些步骤可读取、写入、映射和处理正在集成的系统的数据。
管道设计器与 AIG 网关服务 (GS) 一起运行，几乎可以安装在任何客户端计算机上。管道设计器中可用的步骤库可从 GS 安装中检索。可用步骤集根据当前 GS 配置、已安装的 AIG 产品和已配置的 API 版本量身定制。例如，提供与特定系统集成的 AIG 产品（特定版本）将提供允许从该系统读取数据和向该系统写入数据的步骤。在管道设计器中创建的管道也可以部署到已配置的 GS 实例，在那里它们可以由 AIG 的管道引擎功能运行。有关管道引擎的详细信息以及如何配置 GS 实例提供的步骤的信息，请参阅通用配置指南的相应部分。

与GS安装到同一台服务器上；
安装nodejs[Node.js安装及环境配置超详细教程【Windows系统】\_windows 安装nodejs-CSDN博客](https://blog.csdn.net/Nicolecocol/article/details/136788200)
安装Pipeline Designer
![image1](e81c47d3e19d41ccb803d4ad9bb8b674.png)

![image2](beb741834fae4e658697d682d8028c76.png)

打开操作系统的命令行控制台并导航到管道设计器安装目录中的“server”文件夹。
npm start
输入https://localhost:11341/
![image3](6c0292a674374461a7a014cf374fa94d.png)

输入npm stop可以停止服务

输入默认用户名/密码：pd/pdpassword
![image4](4560da7c971a47428fabce1da895140a.png)
修改密码为infodba
![image5](993e01ef6adb477ca8c18db7317cf441.png)
配置与GS连接：
![image6](00272656d9ea4a0c87b688cbdfa4e22f.png)

![image7](8967454c62da482da8901dcb76aa9455.png)

新建管道：
![image8](627e3b7b46584f8bb29cfc97509ac7f5.png)
添加步骤库，点击阶梯库-刷新-输入gs用户名密码t4adm/infodba
![image9](78904836e68a4d7695ba264f37e12d3b.png)
设计步骤：连接tc/从tc读取数据/设置映射/连接sap/写入数据到sap
![image10](787b5748045f409789c8005b27e8c0c4.png)

![image11](11b89ef523a647eabb7913067fd6237c.png)

