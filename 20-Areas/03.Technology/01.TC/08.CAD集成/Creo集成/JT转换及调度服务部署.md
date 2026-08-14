---
title: JT转换及调度服务部署
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:43
---

1、安装JT转换软件、安装调度服务。
在下面的说明中，将适当的完整路径替换为以下符号名称。 如果路径包含任何空格，请确保使用正确的MS-DOS 8.3格式。 例如，路径C：\\ Program Files（x86）应该以C：\\ PROGRA〜2的形式给出。 您可以使用MS-DOS窗口中的dir / x命令生成这些缩写路径。
如：C:\Program Files\PTC\Creo 2.0换成C:\PROGRA~1\PTC\CREO2~1.0
![image1](93cfc329d94d465f863546d4296f9bb5.gif)
2、代理用户授权（如果dcproxy在为dba角色，则省略此步）
系统中新建dcproxy账户，并对此账户授权。
![image2](b99d6686a5d94d44bdfe6de6d0d28820.gif)

![image3](608a29c220eb46e4974121af10203733.gif)
3、配置Creo运行环境
1）增加系统环境变量PRO_COMM_MSG_EXE，值为：
C:\PTC\CREO2~1.0\COMMON~1\M230\x86e_win64\obj\pro_comm_msg.exe
![image4](75877ef084444db8b163206a3b8c61b0.gif)
2）在path中增加C:\PTC\CREO2~1.0\COMMON~1\M230\x86e_win64\lib
![image5](576045cb178c42f98130872386cd834c.gif)
4、验证DIS基础功能。（确保dispatcherServerSheduler和dispatcherServerModule服务启动，一般安装完调度服务会自动启动，如没有启动，手动先启动dispatcherServerSheduler：运行C:\Siemens\DispatcherServer\Scheduler\bin\runscheduler.bat，再启动dispatcherServerModule：运行C:\Siemens\DispatcherServer\Module\bin\runmodule.bat）

运行C:\Siemens\DispatcherServer\AdminClient\bin\runUI.bat。弹出登录界面，输入代理账户及密码登录进去。
![image6](c14a6ea411994a0c986a098b5e9938e9.gif)

![image7](c9bcc324f9794668a908c0821270a9d4.gif)
点击Submit按钮，下方提示成功，则表示基本功能无问题。
![image8](503a8e3a62ab4d1a8851fc46f542a043.gif)
5、安装Creo集成功能（见安装步骤），注意安装的时候在JT转换界面选择以下选项。
![image9](de5bfa38faa34d8283b07cb0376055c7.gif)
选择此选项后，会自动在C:\ipemClient\Creo\ipem.xml文件中出现\<jt_file action="translate" cad_type="ASM:PRT"/\>这一行内容。
6、安装JT转换程序，不再赘述。
7、修改集成配置文件。
右键编辑C:\ipemClient\Creo\startipemaux.bat这个文件，找到set userdir=，改为set userdir=C:\Siemens\DispatcherServer\DispatcherClient\lib，保存。
右键编辑C:\ipemClient\Creo\runipemauxserver.bat这个文件，找到set userdir=，改为set userdir=C:\Siemens\DispatcherServer\DispatcherClient\lib，保存。
右键编辑C:\ipemClient\Creo\startipemduplicate.bat这个文件，找到set userdir=，改为set userdir=C:\Siemens\DispatcherServer\DispatcherClient\lib，保存。
运行C:\ipemClient\Creo\runipemauxserver.bat。
![image10](f68442e735844f0daa60a6cbde9a46bc.gif)
右键编辑C:\ipemClient\Creo\ipemaux.bat，将set StagingDir=""改为
set StagingDir="C:\Siemens\DispatcherServer\Stage"，将Scheduler.URL=
8、配置调度服务。
编辑C:\Siemens\DispatcherServer\Module\conf\translator.xml这个文件，找到ProEToJT标签。修改此区域配置。
确保以下内容均正确，如果已经争取则无需改动（默认只增加maxlimit="1"即可。）
maxlimit="1"（许可证点数为1） isactive="true"（活动状态）
![image11](6548675575aa4b508a0f36a11059be82.gif)
然后找到ProEToDXF标签。修改此区域配置。
![image12](2ef888f114d7440299d850f188e4f029.gif)
在ProEToDXF标签后面增加CreoDuplicate转换配置。复制一下内容到ProEToDXF后面。
\<!-- Configuration of the Duplicate translator --\>
\<Duplicate provider="ITI" service="creoduplicate" maxlimit="1" isactive="true" wrapperclass="&EAIWRAPPER;"\>
\<SysExecutable name="&JAVABIN;\java"/\> \<TransExecutable dir="C:\ipemClient\Creo" name="ipemtoduplicate.bat"/\>
\<Options\>
\<Option name="inputpath" string=""
description="Full path to the input file."/\>
\<Option name="outputdir" string=""
description="Full path to the output directory."/\>
\</Options\>
\<TransErrorExclStrings\>
\<TransErrorStreamExcl string="ERROR: Duplicate Error"/\>
\</TransErrorExclStrings\>
\<FileExtensions\>
\<OutputExtensions nitem="1"\>
\<OutputExtension extension=".txt"/\>
\</OutputExtensions\>
\</FileExtensions\>
\</Duplicate\>
![image13](7e5bd28447e247b8a92caafc776e0fe3.gif)
9、配置调度客户端
复制ETSProE.jar、ipem.jar、ipemsync.jar、iPEM_plugin_10000.11.400.0.jar、ipem.properties、ipem.xml、ipem.dtd从D:\PLM\Integration\ipemC:\ipemClient\Creo到C:\Siemens\DispatcherServer\DispatcherClient\lib
修改文件：C:\Siemens\DispatcherServer\DispatcherClient\bin\setDispatcherClientEnv.bat
在文件中添加如下内容：
set HOME=C:\Siemens\DispatcherServer\DispatcherClient
set classpath=%classpath%;%HOME%\lib\ETSProE.jar
set classpath=%classpath%;%HOME%\lib\ipemsync.jar
set classpath=%classpath%;%HOME%\lib\iPEM_plugin_10000.11.400.0.jar
10、修改Creo路径
右键编辑C:\Siemens\Translators\Creo\proetojt.bat，设置set CREO_DIR=C:\PTC\CREO2~1.0（解决Creo安装路径中包含空格问题。）
11、修改集成组件服务。
右键编辑C:\Siemens\DispatcherServer\Module\conf\transmodule.properties这个文件，将MaximumTasks=3的值改为1.（并发任务设置，减少排队，但消耗license）。
将Staging.Dir设置为Staging.Dir=C:/Siemens/DispatcherServer/Stage
将Scheduler.URL=rmi://实际IP地址:2001
右键编辑C:\ipemClient\Creo\ipemaux.bat这个文件
set MaximumTasks=1
右键编辑C:\ipemClient\Creo\runipemauxserver.bat这个文件
set MaximumTasks=1
12、配置集成功能提交调度任务，配置自动转JT。
修改C:\ipemClient\Creo\ipem.xml文件。在auxiliary_file map标签中增加以下内容：
\<auxiliary_file cad_type="ASM:PRT" direction="cadtopdm"\>
\<ets_request translator="proetojt"
provider="SIEMENS" priority="2" /\>
\<cadtopdm_control label="保存JT文件(Dispatcher)"
user_preference_default="true" /\>
\</auxiliary_file\>
![image14](7ca6a88ced994bfb81a9daccd076ff9f.gif)
增加：
\<auxiliary_file cad_type="DRW:LAY" direction="cadtopdm"\>
\<ets_request translator="proetodxf"
provider="SIEMENS" priority="2" /\>
\<cadtopdm_control label="保存DXF文件(Dispatcher)"
user_preference_default="true" /\>
\</auxiliary_file\>
13、按顺序以此重新运行
1）C:\Siemens\DispatcherServer\Scheduler\bin\runscheduler.bat
2）C:\Siemens\DispatcherServer\Module\bin\runmodule.bat
3）C:\Siemens\DispatcherServer\DispatcherClient\bin\runDispatcherClient.bat
