---
title: I、配置调度服务转换JT
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:44
---

注：
安装CREO时，必须勾选tookit接口。或Creo未破解成功。
ERROR ( 31.874): Original Exception pfcExceptions::XToolkitNoLicense
Pro/TOOLKIT error in function ProEngineerConnectStart, error code -40
J-Link method pfcAsyncConnection::AsyncConnection::Start
com.ptc.pfc.Implementation.pfcExceptions\$XToolkitNoLicense
![image1](c63737e2a4914ac2ab3ce78e1de856ae.png)
使用多model时，下面stage和lib文件夹路径必须使用网络磁盘映射。
1、环境变量配置：
1）增加系统环境变量PRO_COMM_MSG_EXE，值为：
D:\PTC\CREO2~1.0\COMMON~1\M230\x86e_win64\obj\pro_comm_msg.exe
![image2](48f4e45df4df46c6803dd394b2b5dc9b.png)
2）在系统的环境变量path中增加D:\PTC\CREO2~1.0\COMMON~1\M230\x86e_win64\lib
![image3](191b15aca3bf42828221fb89f7a8bbc5.png)

将首选项ETS.PROVIDERS中的值ITI移除。


2、ipem配置。路径d:\apps\ipem
1）修改ipem.xml文件。
修改模板文件路径：
![image4](a3f41cd3edfb44848ab157bf795d0ac1.png)
以下设置asm格式不转JT，去除ASM:
«span style='font-family:"Microsoft YaHei"; font-size:10.5pt;background:yellow;mso-highlight:yellow'»必要时，增加«/span»\<jt_file action="translate" cad_type="ASM:PRT"/\>

![image5](82221feb6828466f9bcefaa824f367bd.png)

2）安装dispatcher的model服务器上修改runipemauxserver.bat、startipemaux.bat、startipemduplicate.bat、ipemauxserver四个文件，添加userdir的路径D:\apps\ets\DispatcherClient\lib
![image6](bcbbaecbd95c4d2ea81e77079a636120.png)

![image7](ef4824c9c8374b55aa54d015757a88cf.png)
此文件新版本如下：设置set rootdir
![image8](27824a93729c456980b6017bffe4a25e.png)

![image9](5b42ed6b427f41f2ae8b949c5b5d5479.png)
3）修改ipemaux.bat文件。添加ETS登台路径。D:\apps\ets\Stage
![image10](2ad9328c038f455eba51edf1953ac250.png)

所有配置PTC相关路径的地方，均需要将空格进行短路径转换，CD到目录下，使用dir /x显示短路径。否则服务闪退
![image11](aa167f7056cb4cd9b2d3930b7425d1ea.png)

按照下图配置以下文件。

![image12](620ff905fc3e48b2bcdcd781da4a517c.png)

![image13](5a77faf857864d008f1c6ea5354c0bed.png)

![image14](c35fd859225e4e539e2570c00a4fda52.png)
4）启动IpemAux服务。运行d:\apps\ipem\runipemauxserver.bat
![image15](a9f7c128c96a422db3691e212403a3f0.png)
3、ETS服务端配置：路径d:\apps\ets
1）修改D:\apps\ets\Module\conf\translator.xml文件
找到proetojt页签，按照下图所示修改。添加maxlimit="1"及cadlaunchscript路径（注意斜杠为向左斜杠），其他一般默认，按照图示进行检查。
![image16](2689b60b59284c009490589e51acc180.png)

找到ProEToDxf页签，按照下图所示修改。此步应该可以省略。未验证。
![image17](5fddc372a9c44bf8a8537a90fc3d873a.png)
4、ETS客户端配置：
修改D:\apps\ets\DispatcherClient\bin\setDispatcherClientEnv.bat文件（所有安装dispatcher的client的服务器均要更新）。按下图所示修改。添加
set IPEM_DIR=D:\apps\ipem
set classpath=%IPEM_DIR%\ipem.jar
set classpath=%classpath%;%IPEM_DIR%\ETSProE.jar
![image18](475adfe5583d443e84b0d78595a04a34.png)
5、依次启动服务：
D:\apps\ets\Scheduler\bin\runscheduler.bat
D:\apps\ets\Module\bin\runmodule.bat
D:\apps\ets\DispatcherClient\bin\runDispatcherClient.bat

按需修改端口：
![image19](1426760b52e740eab0220814ac43a63a.png)

![image20](14d4ca27d909409db6c72a98725bf7d4.png)
转STP的话，直接添加以下内容
![image21](f8e3cd052fa24debb8ea02d607bed9ec.png)
如果报以下错误，则将D:\Siemens\DC\Module\Translators\proetojt\proetojt.jar复制到D:\Siemens\DC\Module\lib
![image22](04d34a6bf1784f9295af348124d2ebb3.png)

![image23](ab7c569f10b7409ea97e37cd1e9a2574.png)

![image24](92f76e4be29c45d2ad924735656f315a.png)
下面地方设置为空即可
![image25](7de657170fe14f7e959582b9ff230ed7.png)
模型中包含中文乱码，导致无法上传；
![image26](ec205a7b67164332acf5437efb0038fc.png)
解决：在以下文件增加字符集设置，可以实现转jt可以上传，但仍未乱码；
![image27](a4599f81864545f8a18c16ad7abd0902.png)
终极方式，将Windows区域，勾选UTF-8，注意其他应用是否乱码
![image28](831a433e7abb4fe7921dd72b7fa0b28d.png)

