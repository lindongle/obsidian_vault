---
title: IIS配置（Server）
updated: 2026-06-06T10:09
created: 2022-04-26T12:25:10
---

![image1](16293c8fc17f485e8d79f241b52ad1fe.png)

![image2](be3412d53931438db92ce3b8750e96a3.png)

![image3](c960f9d7bd674e149cd2ba3da093e892.png)

![image4](2a4e089e4ac24a1bb332e1b51c39d09a.png)
用户名为Windows的用户名；

![image5](72ae7afd44d148d58f0f4bc2f19bb91d.png)
修改以上两个参数；（注：如果您保留“加载用户配置文件”设置的默认值“False”，您可能会遇到应用程序池失败并出现以下错误：访问路径“C:\Windows\TEMP\Pool\OC\fbb5dd8006834b02dd8ae6dfa049ca89”被拒绝 ExceptionType -UnauthorizedAccessException）
![image6](b90fa5d938cc4f66adec2d3c0c812e97.png)

![image7](6723f7e3e5674d9486518c69d27cd723.png)

![image8](9fb60049c3664b8aa6b71c871c9abab8.png)

![image9](5d52cb8b002e404a9e8b645807922d10.png)

![image10](296100e73a8e4680a2a29d4919dc771f.png)

![image11](6e66f04dd8f047399a4b54b9dcdf69a6.png)

![image12](f3fe770de3434e3c819a9d8167ecc2f9.png)

![image13](9f87e575f6f64e84b312c99253ddd911.png)

![image14](d344385215b24cf8a43efa8a2097b632.png)

![image15](77f5b5502a7443f8b67aaebcb1093165.png)

![image16](47e6ce5b713e42fc86cbdc3068f05d68.png)

![image17](b3ebeca7587749b284d5d1b5649a2b33.png)
此处已经是35000000，可以不用再设置；
![image18](cf134284c386463294889450a3674426.png)
《Teamcenter_Product_Cost_Management_9.4_Installation_Guide_3-tier.pdf》中7.2.4-7.2.7章节（不知如何设置，此处暂时忽略）
![image19](a281f325e2854298b152a14584bcb709.png)

![image20](a89ff91f2edb4c4695720387af3ee509.png)

![image21](563ca690c2bf462d8af16b44f98054b5.png)

![image22](4eed2f5d019942b2be8c8caebcee0e3e.png)
将服务端文件E:\Software\PCM\tcpcm_9.4_Patch_1_9_4_0100_334_Production\Server复制到上述应用程序目录：C:\tcpcm
![image23](b4a274c1d8d84cb7a8454caa672c68bd.png)

![image24](734bd023bd66466db0da46dcfdec44c1.png)
测试ServerOperationsMessage.svc连接（注意，创建数据库并在web.config中配置数据库连接）

![image25](6de15ce835a84c5a9597c7a4fdc54be3.png)

