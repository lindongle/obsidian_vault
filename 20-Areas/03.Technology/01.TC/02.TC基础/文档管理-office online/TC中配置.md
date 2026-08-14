---
title: TC中配置
updated: 2026-06-06T10:09:05
created: 2026-07-05T17:04:41
---

TC中配置
2018年11月9日
0:14
1、新建首选项OfficeOnlineServerURL，值为：
<http://OfficeWebApp.FAW.COM/hosting/discovery>

2、主机名改为对应IP 或在host中做映射。并将各个服务器的windows 防火墙和更新服务在服务中启动。
3、设置sponsor赞助用户。
1）新建环境变量：TC_POM_SPONSORED_USER，设置此环境变量后，系统限制只允许sponsor组的用户登录系统，其他用户会提示：
![image1](2b6f72b32a4d44c19b633c73e2d5df29.png)
值为部署中心中设置（6））的赞助用户信息中输入的用户名。测试中设置的infodba
2）将infodba加入到系统自带的sponsor组和角色中，并添加该组对本地卷的访问权限。否则用此组登录时，会提示对任何卷都没有权限。并在infodba的用户属性中，勾选可赞助。只要将某个管理员账号加入到该组即可；即在officeonline安装时的可赞助用户必须放到OOTB的Sponsor组和dba组中；
![image2](6cab4e90adb840c09ba355e0e58cd3a9.png)
3）所有需要在线浏览的用户，必须勾选可赞助。
如果不勾选sponsor组会提示以下错误：
![image3](1f4c59fe17db4d6c96ee9415f8319ca0.png)

中文数据集在线浏览提示500错误：
500 Internal Server Error
操作执行期间，与 Teamcenter 服务器之间的通信丢失。服务器可能异常终止--产品bug，AWC4.3.3版本修复

未勾选可赞助或勾选后未重启四层，第一次打开时会提示以下问题
cannot be viewed because of a configuration error
