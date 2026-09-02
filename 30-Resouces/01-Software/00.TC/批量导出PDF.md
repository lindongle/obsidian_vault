---
title: 批量导出PDF
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

批量导出PDF
2019年7月10日
0:31

## Teamcenter 技术技巧 
***1. 如何手动重新安装ServerManager服务***
问题：
如何为当前的Server Manager重新创建Windows服务？
方法：
对当前的Server Manager创建Windows服务，可参考下面的步骤：
1\. 打开%TC_ROOT%\pool_manager\confs\\
2\. 定位到'installmgr.bat', 并以管理员身份运行
3\. 打开Windows服务，刷新
4\. 找到Teamcenter Server Manager Service服务，并更新服务的用户名和密码
5\. 启动服务

***2. 批量导出PDF文件***
问题: 用户需要批量导出大量的PDF文件。这些pdf文件都是正常存放在数据集中，如何实现呢？
办法：在该场景中有两个PDF数据集
![image1](75e01bdda9f6498cb5d5a2320013db2e.png)
同时选中这两个PDF数据集，选择工具—导出—到PLMXML...  

![image2](5dc9ca47d99042458fe8372be6b8c385.jpg)
传递模式选择ConfiguredDataFilesExportDefault，根据需要选择导出目录
![image3](e2ed9f237be740bc98b17afb57689970.png)
导出的结果存放在以导出文件名命名的文件夹中。在这个文件夹中有你需要的PDF文件
![image4](212fe01503284ccfa09d65a8de25329a.png)

***3. 从TC10导入TC11后，分类图片丢失***
问题：创建新的组，抽象类和类，类包含一个图片。
使用plmxml和转换模式ICSExport_Subtree导出。导出成功后，并成功导入另外的数据库。但是分类图片没有导入。从TC10.1.7 导出，并导入 TC11.6a。
方法：为了能够导入分类图片。需要将包含图片的文件夹跟将要导入的plmxml文件放置在相同的路径。比如创建如下结构
![image5](57612f095d9d41f3a9e9c25d818e972e.jpg)
![image6](97ae1ee1595b448a98faf279579b045b.jpg)
在该示例中，分类包含图片，"Class1"的ID是"ICM010101"，父层类"Standard"的ID是"ICM0101"，组"GTAC"的ID是"ICM01"。当使用"ICSExportSubtree"转换模式导出层次结构后，会创建一个plmxml文件，同时也会创建一个跟组ID名字"ICM01"相同的文件夹  

![image7](2a2a8647ce6e4481b50b326c9157b825.png)
打开该文件夹，会发现包含一个图片
![image8](7d0abde0cd5a4fdd9e15fe21ae67d741.png)
在导入plmxml文件到另外的环境时，需要将plmxml文件跟包含图片的文件夹放在同一个路径下。如果打开plmxml文件，会发现图片的路径指向了该文件夹。
![image9](01b79e714cf949bdb73ee0fae8090905.png)

阅读
分享 在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image10](c5065ee8410b47b59d0d7857aca43fd8.png)
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882517&idx=1&sn=207167ff4143acf7f92b739795212772&chksm=82cc5e25b5bbd73301a7eba798449336435ffb6bbe112d5d133a7323ecd3bae5bcef634e48a9&mpshare=1&scene=1&srcid=#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882517&idx=1&sn=207167ff4143acf7f92b739795212772&chksm=82cc5e25b5bbd73301a7eba798449336435ffb6bbe112d5d133a7323ecd3bae5bcef634e48a9&mpshare=1&scene=1&srcid=#rd)
