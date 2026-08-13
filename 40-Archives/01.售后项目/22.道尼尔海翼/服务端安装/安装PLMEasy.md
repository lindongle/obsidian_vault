---
title: 安装PLMEasy
updated: 2026-06-06T10:09
created: 2023-04-13T09:00:43
---

安装PLMEasy
2023年4月13日
9:00

1.  全新安装：
    1.  安装介质
![image1](a160bf53dd784067b7f1ee82c85781db.png)
2.  导入首选项
    1.  ![image2](c328866550e24684a17e5846f17bab3d.png)

2.  ![image3](c9dcaf58bb7944f48ba38b197f22d6c1.png)
3.  导入其他首选项，使用导入命令preferences_manager
![image4](902c97dba1484dc484c5318f2c08d815.png)
2.  直接拷贝生产环境：
    1.  将D:\Media\Tc10\PLM-Easy_10.1_Software\tcpb101local下的所有文件内复制到E:\siemensshare\tc10prodlocal下；
    2.  D:\Media\Tc10\PLM-Easy_10.1_Software\portal\plugins中文件复制到客户端D:\Siemens\tc101\portal\plugins中，执行脚本注册D:\Siemens\tc101\portal\registry\genregxml.bat，重新登录客户端
    3.  ![image5](a0c077c78e744f838f273033d5e19e7b.png)
    4.  创建plmeasy用户datenmigration，密码：admin@tc
![image6](3cd9958d819d47e8bd358943d7d8fec7.png)
不删除Job日志，不删除Job的Temp，需要修改设置为true
3.  加载对应handler
    1.  在四层启动服务bat中增加：call e:\siemensshare\tc10prodlocal\config\tcpb_addons.bat
    2.  ![image7](ce4d9056fcb34b33b7e7b9bb5733ef58.png)

