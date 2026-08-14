---
title: (31条消息) hyper-v开启与关闭_红辣椒...的博客-CSDN博客_hyperv开启好还是关...
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:54
---

(31条消息) hyper-v开启与关闭_红辣椒...的博客-CSDN博客_hyperv开启好还是关闭好
星期五, 十二月 30, 2022
1:48 下午
已剪辑自: <https://blog.csdn.net/bloestone/article/details/101872777>
（1）控制面板
![image1](726302a8a5604731a185efbff3f2bf2c.png)
（2）服务
以管理员身份运行msconfig
![image2](87af0902ab814f9e863375f4bb053aec.png)
（3）cmd命令，以管理员运行
开启，上次关闭[docker](https://so.csdn.net/so/search?q=docker&spm=1001.2101.3001.7020)服务时，重新启动虚拟化技术执行了上面个两个步骤，未执行下面命令，检查了好久查了网上的资料才想起来
bcdedit /set hypervisorlaunchtype auto
关闭
bcdedit /set hypervisorlaunchtype off
![image3](7592037c1df64a458c5d83bbd8602ca2.png)
