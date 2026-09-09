---
title: 修改dispatcher的用户名及密码
updated: 2026-06-06T10:05
created: 2018-06-15T05:29:04
tags:
  - TC安装部署
---

修改dispatcher的用户名及密码
2018年6月15日
5:29

修改用户名：
\<DISPATCHER_ROOT\>\DispatcherClient\conf
Service.properties，修改
![image1](cd7e3818452247ba81c1bd9108b7f5cb.png)
修改密码：
1\. Open a dos window and navigate to the
\<DISPATCHER_ROOT\>\DispatcherClient\bin directory
2\. In this command prompt enter encryptPass.bat \<newpassword\>

encryptPass.bat "1bc\]D;1~"

3\. This will run the command and return a message that it has created the
encrypted password file
![image2](d76b2c514294473585bbb4f73ab30f8e.png)

