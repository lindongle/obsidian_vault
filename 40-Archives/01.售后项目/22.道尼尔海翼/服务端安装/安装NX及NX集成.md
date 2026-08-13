---
title: 安装NX及NX集成
updated: 2026-06-06T10:09
created: 2023-04-23T09:45:06
---

安装NX及NX集成
2023年4月23日
9:45

1.  安装NX并打补丁：
    1.  执行D:\Media\NX\nx-9.0.0-64bit\dvdrom090\Launch.exe，
![image1](ff646cb8837c41d782f8fca4fa6dd71a.png)
2.  路径选择D:\Siemens\NX902
3.  执行D:\Media\NX\nx-9.0.3\dvdrom0903\ugs_update0903\ugs_update.bat，弹出黑窗口后，按任意键继续执行，直至显示成功；
4.  执行D:\Media\NX\nx-9.0.3.mp10\ugs_update.bat，弹出黑窗口后，按任意键继续执行，直至显示成功；
2.  安装NX集成
    1.  ![image2](2c9d885dcfb5459eb2257e08cce55a77.png)

2.  ![image3](aca262bd94914aa2b3c760880367e26d.png)

3.  ![image4](ef36f0e8ff36455b945580b5ff9c215f.png)

4.  ![image5](a8c32bd12b8f4db4951c7dea3e1892f1.png)
5.  配置环境变量：
6.  ![image6](7f6b185438184395bc256e0fb0fbf8aa.png)
7.  创建目录：
c:\splm
c:\temp\nx
c:\temp\tc
8.  配置SIDT-Software Implementation Design Team（NX自定义设置文件，共享方式给所有人，便于集中控制所有人的配置）
    1.  ![image7](1eec57b1ec12439c8c1efc0023241964.png)

2.  ![image8](00d8657150524e1398bd5d12126721a6.png)

3.  ![image9](d971263cd4004797a56299d786f3403e.png)

4.  ![image10](8a973c92f70b4693a75350410a79bfe9.png)

5.  ![image11](376f2fc3062e46b5a5562c1fc14105f9.png)

6.  ![image12](bd252b936f7244e6b1ac31bd50f78060.png)

7.  ![image13](b4097f833a7c42de99c18272aa45b319.png)
8.  设置环境变量
    1.  SPLM_APPL_DIR=C:\splm
    2.  SPLM_SHR_DIR=s:
    3.  SPLM_TMP_DIR=C:\temp
9.  创建环境变量
![image14](2e484feb201a46fd8192bbd481c654ee.png)
10. 将服务器s:\sidt复制到s:\sidt
11. ==运行(不要管理员身份运行)s:\sidt\nx90\applications\windows\nx90\after_install_client.bat--提示无权限==
12. ![image15](f339ee5ba63842fcbb99072d548d2ef1.png)
13. 将s:\sidt\nx90\applications\windows\nx90\shortcuts\Siemens NX 9.0 复制到c:\ProgramData\Microsoft\Windows\Start Menu，从共享中启动SIDT
14. 安装VISBase（复制s:\sidt\nx90\applications\windows\tcvis101\win64\shortcuts\Teamcenter 10.1\Lifecycle Visualization到c:\ProgramData\Microsoft\Windows\Start Menu\Teamcenter 10.1），==从共享SIDT中启动==
15. 安装TC客户端（省略）复制S:\sidt\nx90\applications\windows\tc101}db\shortcuts\Teamcenter 10.1到C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Teamcenter 10.1,==从共享SIDT中启动==
16. %SPLM_SHR_DIR%\start_apps\windows\custom_nx90.bat为共享SIDT的定制化启动脚本文件
