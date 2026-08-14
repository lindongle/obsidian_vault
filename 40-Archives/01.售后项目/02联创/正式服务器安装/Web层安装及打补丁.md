---
title: Web层安装及打补丁
updated: 2026-06-13T22:07:03
created: 2026-07-05T17:04:57
tags:
  - 联创
---

服务器172.16.254.41
1、安装web层。
安装介质：D:\TC\TCInstall\TC11.2.0\Tc11.2.0a_win64\Web_tier\INSTALL_TCWEB.EXE
1）双击运行INSTALL_TCWEB.EXE，路径选择D:\Siemens\Web_tier\\点击Extract。
![image1](8c6353e28a0f462db866604c11de17e0.png)
2）进入D:\Siemens\Web_tier，双击运行insweb.bat，弹出应用管理器界面。
![image2](da90fd7db41f4224b4ec0630f7e27f23.png)
3）点击复制ICD，路径选择D:\TC\TCInstall\TC11.2.0\Tc11.2.0a_win64\Web_tier\icd，点击打开，确定，开始进行ICD复制操作，完成后点击确定。
![image3](72fb4fe8794d4fd7bd36a8971425a485.png)
4）回到Web应用程序界面，点击添加按钮，名称输入WebTier，登台位置输入D:\Siemens\Web_tier\WebTier
![image4](94a89891910542dca6172c779c862986.png)
5）安装镜像的磁盘位置，点击添加，选择D:\TC\TCInstall\TC11.2.0\Tc11.2.0a_win64\Web_tier，点击打开，确定。
![image5](5828a125d0424aeb89ba7f15974282f9.png)
![image6](1042640b223d4ac6a640af4a13c94271.png)
6）点击确定，弹出参数输入界面，修改TreeCache Peers参数的host值为172.16.254.41，修改TCLocale参数值为zh_CN。点击确定。
![image7](a553471f5397434c9aa9527f43cf8e1d.png)
![image8](ede897091d334758858acf58fbd320ae.png)
7）开始安装解决方案并生成war包。点击确定完成web层安装。
![image9](0751ea9d959d4d9da86523c1fcb9e96a.png)
2、web层打补丁（到11.4）
1）回到web应用程序界面，点击复制ICD，定位到D:\TC\TCInstall\TC11.4\Tc11.4_wntx64\wntx64\Web_tier\icd，打开，确定。复制完成后，点击确定。
![image10](476cb507ceb4473d84f94461fbf6d608.png)
2）选中WebTier，点击修改，点击修改磁盘位置，定位到D:\TC\TCInstall\TC11.4\Tc11.4_wntx64\wntx64\Web_tier点击打开，确定。
![image11](8e92d51343ab4045a40d4dda7628dc33.png)
3）点击重新安装解决方案，弹出的确认提示，点击是
![image12](7f3e57f99cd74605a207f14a3f5e6ea6.png)

![image13](131a5b68481a42b3b09a935063384c2a.png)
4）点击确定，确定。
5）重新执行安装解决方案并生成war包，点击确定。
![image14](35009a2fc81c41f084d84abb28634890.png)
6）点击确定，完成补丁更新到11.4。
3、web层打11.4.0.3补丁
过程同打11.4补丁一样，只是复制ICD时路径修改为D:\TC\TCInstall\Tc11.4.0.3patch\Tc11.4.0_patch_3_wntx64\wntx64\Web_tier\icd，修改磁盘位置，添加D:\TC\TCInstall\Tc11.4.0.3patch\Tc11.4.0_patch_3_wntx64\wntx64\Web_tier。其他过程无区别。
完成之后，点击退出。
4、部署Web层。
1）安装weblogic并创建域（略）
2）管理员身份运行D:\Oracle\Middleware\Oracle_Home\user_projects\domains\base_domain\startWebLogic.cmd
3）输入username：weblogic，password：WEBLOGIC123，回车。
![image15](a46d02502e7c4c16b8509105e47f51d3.png)
4）到以下界面，启动完成。
![image16](b26d6dc0facc460caa062eb24de4dc95.png)
5）打开IE，地址输入http://172.16.254.41:7001/console，回车。打开登录界面。
6）输入weblogic用户名和密码（weblogic/WEBLOGIC123），点击登录
![image17](24cbea7cc3f7447894bf3730b5180df8.png)
7）点击锁定并编辑，再点击部署。
![image18](9e4f05b9c6f9486eb2d6a5aa57fc47b0.png)
7）右侧安装按钮，定位到D:\Siemens\Web_tier\WebTier\deployment\tc.war，勾选tc.war，点击下一步。
![image19](642515701f5241318f1d3a96f6e64f8c.png)
8）点击下一步。
![image20](a873816b62ee4a61b0675af844857976.png)
9）点击完成按钮。
![image21](150dc5135c2a4b4fb24ba0be8dfbcbf3.png)
10）点击激活更改按钮。
![image22](8258ecf00bd544eca6611801d35d692b.png)
11）切换到监控标签页，勾选tc，点击启动-为所有请求提供服务。
![image23](47c51b85aa1245568ebe4d60b806d583.png)
12）点击是，完成部署。
![image24](3ed9b7e42bf04658b53df79b082f8b0e.png)

