---
title: SpringBoot 配置文件及日志文件路径设置
created: 2026-07-02T23:58:28+08:00
updated: 2026-07-03T10:47:05+08:00
tags:
  - springboot
---
固定application.properties文件路径，强制读取路径中的，不再获取jar包的对应文件；
set SPRING_CONFIG_LOCATION=file:C:/Siemens/PLMService/cfmotoawcservice1/application.properties
固定日志文件路径：
修改：application.properties文件，添加参数：
logging.config=C:/Siemens/PLMService/cfmotoawcservice1/logback.xml
，将logback.xml从jar包复制出来，修改里面的路径；
![[Pasted image 20260703000139.png]]