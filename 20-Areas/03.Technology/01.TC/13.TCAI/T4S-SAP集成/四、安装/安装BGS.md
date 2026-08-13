---
title: 安装BGS
updated: 2026-08-06T10:48:51+08:00
created: 2019-05-07T10:16:39
---

**安装BGS**
不要将BGS与任何PL4x GS安装一起安装在同一目录中。 您必须为BGS指定一个目录，为GS指定另一个目录。
请勿在共享（已安装）驱动器上安装PL4x BGS或GS，包括物理上位于同一台计算机上但通过网络连接进行连接的驱动器。 也不允许使用UNC路径（\\ server \\ share）。
避免路径名中的长路径名和空格。
确保对PL4x BGS或GS具有写访问权限，并确保复制后文件没有写保护。 在UNIX / Linux中，整个目录树需要权限755。
由于它可能导致文件系统问题，请确保从自动备份中排除PL4x目录。 如果需要，只应包含目录\<T4x_BGS_ROOT\> / var。
启动BGS或GS后，不允许更改文件夹名称或安装路径。
1、启动安装脚本：E:\TC\01.Installer\T4S\\**Teamcenter_Gateway_for_SAP_18.2_install_and_patch_tool\t4x_install_and_patch_tool\\\_\_installer.bat**
![image1](c3f2bcbaf35e4a72b615d03717321fa5.png)

![image2](2a45469a381e4b8e838806ecc9aaaa20.png)

![image3](afaffe2c72ed4d36b285b863628b5344.png)

![image4](e606fa97fda248b29cb06432e9555549.png)

![image5](4053cf208a624573866b76283325cc04.png)

![image6](112eb7e07e7b41cb920437a4eb032ad9.png)
以下填写集成安装根目录。需要手动新建好目录。
![image7](768dd8e0bbc24dda9ffaaff90d359e5b.png)

![image8](4f54cc74e8fd478eb437239d8aa9e92e.png)
输入许可服务的ip和端口
![image9](3ca11fe3c34047aabe2bc4381ef46f74.png)
点击Start。
![image10](d76a10220e85429e9b7cb0c58816de93.png)
安装完成后，点击Exit退出。
![image11](12d1a9e65a154c38b0bbd5fbcae963af.png)
安装后会自动运行tgbgs进程。进程如果不小心关闭，可以运行E:\T4x_BGS\bin64\restart.exe，重新启动。
![image12](1732e932eba443f48e1bbf7892f7a58d.png)
可以使用E:\T4x_BGS\bin64\status.exe查看运行状态。
![image13](4e8b041d08dc42fbb924aa9825bb1ba3.png)
修改密码
![image14](42859806995e4a2188a2099cf326ccd7.png)
登录BGS。主要不要添加兼容性视图，否则显示为空。加入可信站点，服务器管理器-本地服务器-右侧IE增强配置-关闭系统和用户的

![image15](6f63f91513dd495e94dc979496092802.png)

![image16](e771e1d7d6cf4d1fb59c62698bf0729f.png)

