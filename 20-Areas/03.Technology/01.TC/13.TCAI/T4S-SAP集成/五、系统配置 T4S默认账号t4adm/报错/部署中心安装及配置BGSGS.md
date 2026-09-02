---
title: 部署中心安装及配置BGSGS
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:48
---

AIG介质：
[Active Integration Gateway 21.1.1 (siemens.com)](https://support.sw.siemens.com/zh-CN/product/281683587/download/PL20211222186606313)

安装部署中心4.1.1；管理员身份运行cmd
C:\Users\Administrator\>cd /d F:\DeploymentCenter_4.2.0.1\deployment_center
F:\DeploymentCenter_4.2.0.1\deployment_center\>deployment_center.bat -install -serverDir=D:\Siemens\deployment_center\server -serverPort=9090 -repoDir=D:\DC_REPO -repoPort=9595 -user=infodba -password=infodba -serviceName=DC_Service

确认DC_SERVICE和RepositoryService服务已启动；
将AIG介质放到software文件夹中；
![image1](25eb8f62339e4759a0d6edb049c4ed84.png)

登陆部署中心后会看到自动创建了环境；
<http://localhost:9090/deploymentcenter/>
-user=infodba -password=infodba（用户/密码为上面脚本中的信息）
选择环境-新建
注：如果软件中没有出来放的介质，重启下RepositoryService服务；
切换到概述，修改环境名称；
![image2](6cd50de3dd804fc6af24283d0f4d17d2.png)
勾选介质
![image3](79a1391b5c654cb4bdfe30ab51a0ea08.png)
环境类型最好选择单项式，如果在虚拟机中，否则占用CPU很大；
![image4](03e61880e9444031a71edbc563e415fe.png)
勾选一下两个，不要全选
![image5](2dfee907408b431ca5de801203822df9.png)

![image6](44e8c574c01d4821bf12eab6275d5339.png)

![image7](8169e51bd44e49a3a97e69ae8fd34ed5.png)

![image8](c2c47f19c1594cb7a278ea9280938950.png)

![image9](0ed58d82dd5c49b99af8dd3c26ddc34b.png)

![image10](cad6aca5b9854ae9b4cd2910cbc98576.png)

![image11](60305d04162747c487be95942d5e5079.png)

![image12](13bea78362214846a4545053771cdf2f.png)

![image13](72f11ef439c142fca1c3b9ec96287552.png)

![image14](04c0fd183b514ca4b3219c79ad248bd0.png)

![image15](1bf35fe963034da0a702af019178a206.png)

![image16](64d0789e5c614c9a8289c817fbca556c.png)
找到脚本生成的目录，将zip文件解压；
![image17](075c88b20f66439cbbda725f9e1b831f.png)
管理员身份运行cmd
C:\Windows\system32\>CD /D E:\DC_REPO\deploy_scripts\AIG\install\20220215190358CST\deploy_TC

E:\DC_REPO\deploy_scripts\AIG\install\20220215190358CST\deploy_TC\>SET JRE_HOME=C:\Java\jre1.8.0_162

E:\DC_REPO\deploy_scripts\AIG\install\20220215190358CST\deploy_TC\>deploy.bat -dcusername=dcinfodba -dcpassword=dcinfodba -softwareLocation=d:\software
![image18](08596c8e05d542a2ab3e64cda5b62c12.png)
安装运行库：可以直接下载“VC++运行库2024.zip”
The Microsoft Visual C++ Redistributable for Visual Studio 2015, 2017 and 2019 is
required
