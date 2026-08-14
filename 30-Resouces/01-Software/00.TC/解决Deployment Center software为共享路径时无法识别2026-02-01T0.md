---
title: 解决Deployment Center software为共享路径时无法识别2026-02-01T0...
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:53
tags:
  - TC
---

解决Deployment Center software为共享路径时无法识别2026-02-01T09:08:32.905Z
2026年2月1日
9:08

[源网页](https://mp.weixin.qq.com/s?__biz=Mzg3NDg2NDUzOQ==&mid=2247484314&idx=1&sn=9156ec622e2894344ae1ad1c9e21b234&chksm=cf299898fa04774e8a59f102f640e016f9fbddce3de259e885846b4a8e8095860bf02a3d4b1f&mpshare=1&scene=1&srcid=0201gDxQHQegyzuSXNRAfplq&sharer_shareinfo=d46bdc55ffed2a841b1b3b6d23f52906&sharer_shareinfo_first=d46bdc55ffed2a841b1b3b6d23f52906#rd)
**网页内容：**
公众号名称：PLM菜鸟
作者名称：TcConsultant
发布时间：2026-02-01 09:01
<span style='color:black'>将Deployment Center的software共享出来后，在需要部署的服务器上映射为网络驱动器</span>
![image1](c3eb1fc4e176451086b9303e79a87a18.png)
![image2](d648c03f733d49c4b64cb17718c5b4e2.png)
<span style='color:black'>诊断时DC会报错找不到software路径</span>
![image3](c6bf054092064d39b23e2db7eb8ad52a.png)
<span style='color:black'>**<u>解决方法：</u>**</span>
<span style='color:black'>直接映射不行，需要通过脚本进行映射：</span>
<span style='color:black'>将以下命令做成bat，管理员运行</span>
@echo off  
net use X: [<span style='font-family:consolas; color:black'>\\192.168.88.21\linux-share</span>](file://192.168.88.21/linux-share) "Infodba2512" /USER:smbuser \> C:\map_drive.log 2\>&1  
type C:\map_drive.log
<span style='color:black'>参数说明：</span>
<span style='color:black'>X:要映射到本地的盘符，当前系统不能存在</span>
[<span style='color:black'>\\192.168.88.21\linux-share</span>](file://192.168.88.21/linux-share)<span style='color:black'>为共享文件夹路径</span>
<span style='color:black'>"Infodba2512" /USER:smbuser：为访问共享文件夹的账号和密码</span>
<span style='color:black'>执行后能够在文件资源管理器内访问X:\代表成功</span>
<span style='color:black'>之后DC诊断校验即可通过</span>

![image4](87cd9b5027e44203ab0b3eb43613ce06.jpg)
<span style='color:black'>Original TcConsultant PLM菜鸟 </span>
<span style='color:black'>继续滑动看下一个 </span>
**网页截图：**
[Webpage.html](009f8299035b4266aa8744b0959c1268.html)
