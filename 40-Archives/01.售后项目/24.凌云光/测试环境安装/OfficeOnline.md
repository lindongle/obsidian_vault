---
title: OfficeOnline
updated: 2026-06-06T10:09
created: 2023-05-15T15:35:03
---

创建用户sponsor/infodba，勾选可赞助
![image1](856a6750f5014b94bf3c7e0dd10626bd.png)
将infodba加入到系统自带的sponsor组和角色中，并添加该组对本地卷的访问权限。否则用此组登录时，会提示对任何卷都没有权限。并在infodba的用户属性中，勾选可赞助。只要将某个管理员账号加入到该组即可；即在officeonline安装时的可赞助用户必须放到OOTB的Sponsor组和dba组中
![image2](83cd12f6b9924c3e9a711dbb3f9deabb.png)

![image3](c7c2f141ad4e4d1b980bbfa568a2c9f1.png)

![image4](fc0daa85fda5437f82880fd8976d2a5a.png)

![image5](e0efd79c954b416991d8c6186f8e53e2.png)

![image6](4baf36f2a5664a61be8f3193df02b6a7.png)

连接另一台服务器（Teamcenter OfficeOnline Server不能与微服务在同一台服务器）
新建环境变量：
![image7](b5e0ead98f3249b38c0bde83caf94b5f.png)

![image8](8f3042fff9c346afb145e383c7e924d0.png)

![image9](af019366b72947208bd216871bca601a.png)

![image10](b0633f0b347543a094c2dd02c5639ecd.png)
勾选另一台服务器所有涉及model的模块，可在D:\Siemens\tcdata\install\models.xml看到，该文件可以使用xml格式化工具格式化后查看[在线 XML 格式化 \| 菜鸟工具 (runoob.com)](https://c.runoob.com/front-end/710/)
![image11](e89e6419257f41b3978fd64043da8605.png)
![image12](9ab24d8eea71493b9e7947bc684ef0f8.png)

![image13](54920f5cf3c74cbdb0daeadf929dd9c8.png)

![image14](17760459c25b4d45bd98cedefe80a827.png)

![image15](102160a80f144a3d8ec0f391e7890156.png)

![image16](cfa71009a85542d49d5511cc968e85f4.png)

![image17](259e30455a344c31b9bb071f61a3d716.png)

![image18](134c6d102bca44128d476c1d5e2de457.png)

![image19](82bda28384f74ba48454d359fe7d75de.png)

![image20](9e8f997fa27d416bbc203d16a8d3442f.png)

确认首选项：（会自动创建及更新）
<http://tcqas_tcoos:9090/tcooweb/v1/wopi>
![image21](454f81ecc9bd410e972e6c9d562c47af.png)
