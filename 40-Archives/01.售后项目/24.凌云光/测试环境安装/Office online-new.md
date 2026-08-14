---
title: Office online-new
updated: 2026-06-06T10:09:05
created: 2026-07-05T17:05:04
---

创建用户sponsor/infodba，勾选可赞助
![image1](814d57598342479f8d77ab0717c08e5d.png)
将infodba加入到系统自带的sponsor组和角色中，并添加该组对本地卷的访问权限。否则用此组登录时，会提示对任何卷都没有权限。并在infodba的用户属性中，勾选可赞助。只要将某个管理员账号加入到该组即可；即在officeonline安装时的可赞助用户必须放到OOTB的Sponsor组和dba组中
![image2](66be0be0fc564bb5a9e7ad6a3781d266.png)

![image3](725c10a85a9048ec806161c44644fa5e.png)

![image4](5c8d2ef03bb34ca38245167ed8490993.png)

![image5](5d256e7da1d44b808b1d9b3e505e95f9.png)

![image6](4fc70c9ad34b452e90d0180741119a0b.png)

确认首选项：（会自动创建及更新）
<http://tcqas_tcoos:9090/tcooweb/v1/wopi>
![image7](998c8eaff3b94af087de209349c712d3.png)
OfficeOnline的涉及host或主机名的尽量用域名
对于要在活动工作区中查看和编辑 Office 文件的用户，请确保每个用户 通过启用可赞助标志来赞助。
重新配置oos微服务时，会删除oos的微服务文件夹，提示缺少文件，做好备份即可。

