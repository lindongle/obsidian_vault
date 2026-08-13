---
title: BMIDE模板部署
updated: 2026-06-18T23:28:07+08:00
created: 2018-04-10T12:56:46
---

![image1](ac05430bfdc54350b1449c84bd46b945.png)

部 署 纟 吉 果
部 暑 数 据 模 型 失 败
原 因 ． The proxy could not locate or start an F M S Client
0
Cache instance. If you are in multi-user environment on
Windows platform, check if you have enabled
FMS WIN DOWS MULTIUSER
将 瞬 时 文 件 师 载 到 FMS 时 出 错 一 3001
原因fcc无法启动
检查FSC_HOME环境变量及Tc_root\tccs文件夹是否存在
检查jre路径是否更换过，如果更换，需要相应更换tccs对应的jre的环境变量

![image2](218f9b37b86f4e1aaa4fc00c0fb9ee55.jpeg)

无法打开文件FlieVersions.txt以写入
原因：域控读写权限问题
解决：将tc_data文件夹右键-安全-编辑，将user勾上写及完全控制权限。
