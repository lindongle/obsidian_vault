---
title: 修改tctata数据库密文密码
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

1\. 在TC的窗口输入，明文连接字符串

set TC_DB_CONNECT=infodba:infodba@tc11=DBSid;SERVER=tc11

set TC_DB_CONNECT=infodba:infodba@tc11

2\. 在输入一下

install -encrypt

3、回车后出现密文的连接字符串。

infodba:nETk5CKACS6IpknrAJWqZ7PPiFc0KmnF8JXwM0J3mhY@tc11

4、粘贴到 \<TC_DATA\>\tc_profilevars.bat即可

5、
输入install -ayt，来验证数据库是否连接成功。
![image1](476fa7f4daba4dcca82813f51ffecbb0.png)

![image2](32a3891bdcb94464b82d519b1e36e40e.png)

![image3](eb92799034704cb8b6148847b167a1f5.png)

