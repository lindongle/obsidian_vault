---
title: 更换JRE
updated: 2026-06-06T00:05
created: 2018-04-09T14:42:14
tags:
  - TC安装部署
---

1、卸载原JRE
2、修改JRE64_HOME环境变量值
3、修改path下JRE/bin的值
4、修改tc_root\install\tem_init.bat中的jre路径
5、管理员身份运行tem.bat，选择迁移JRE，输入新的JRE的路径
6、cmd中输入
1）set TCCS_JAVA=新路径
2）set TC_JRE_HOME=新路径
3）set TCEDA_JRE_HOME=新路径
