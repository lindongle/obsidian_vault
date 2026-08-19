---
title: Office Online 部署
updated: 2026-08-19T13:46:59
created: 2026-07-05T17:04:41
---

4、office online
1）
前期：
1.转换文档需要两台服务器，一台为转换server，另外一台为域控server。（安装office web apps的服务器必须加域才能安装成功，如果没有加域后面步骤会出现错误，疑难问题里面会介绍）

2.系统要求为widow server2008R2 64bit SP1或者以上，NET Framework 4.5，KB2592525，Windows PowerShell 3.0，IIS，保证80 443 809端口不被占用，<span style='color:red'>确保当前机器没有安装office</span>，确保当前机器没有安装Exchange,sharepoint,lync server,sql server

3.服务器带宽和内存越高越好，测试发现比较耗性能，原因得从服务的实现原理上讲起。office web apps服务会通过用户提供的文档src，从src服务器上把文档下载下来，然后进行转换，根据文档名称进行缓存，转换完成以后返回。 带宽越大下载过程使用的时间越短，服务器性能越好转换速度越快。
<span style='color:#E84C22'>4、域控不能和Office Online Server装在一台服务器</span>
2）
添加角色服务：选择.NET FRAMEWORK 4.6和identity foundation3.5
![image1](18e98ee36f924fc2ada84921d0cb8de8.png)

![image2](f317e0b3507047c585e5596c4d86d0c4.png)

![image3](94c37e5f0f2c4311aac9ce294c61db78.png)
IIS所有功能
![image4](1fc782e8e25f4e8db1a8488997d2c2ae.png)
或管理员身份运行WindowsPowerShell，Winserver2012输入Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,NET-Framework-Features,NET-Framework-45-Features,NET-Framework-Core,NET-Framework-45-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation
Winserver2016输入：Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,InkandHandwritingServices,NET-Framework-Features,NET-Framework-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation
3）安装MicrosoftIdentityExtensions-64、.Net framework 4.5.2(可能需要重启系统，根据提示，如果不按照，会提示打开遇到问题，请再次尝试)
4）安装Visual C++ Redistributable Packages for Visual Studio 2013
5）安装Visual C++ Redistributable for Visual Studio 2015
6）安装office server online
7）服务 Claims to Windows Token Service设置为在此服务器上自动启动
8）安装语言包：wacserverlanguagepack.exe
报错：The installer has encountered an unexpected error installing this package. This may indicate a problem with this package. The error code is 2711. The arguments are: WacServer_Intl_MathSolver_1033,
解决：根据安装的office online server语言，安装其他的语言包，不要英文版officeonline安装英文语言包。
9）管理员身份运行Windows PowerShell ISE，输入Import-Module -Name OfficeWebApps
报错：
Import-Module : 未能加载指定的模块“OfficeWebApps”，因为在任何模块目录中都没有找到有效模块文件。
所在位置 行:1 字符: 1
\+ Import-Module OfficeWebApps
\+ \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~
\+ CategoryInfo : ResourceUnavailable: (OfficeWebApps:String) \[Impor
t-Module\], FileNotFoundException
\+ FullyQualifiedErrorId : Modules_ModuleNotFound,Microsoft.PowerShell.Comman
ds.ImportModuleCommand
解决：将office online server安装路径下的C:\Program Files\Microsoft Office Web Apps\AdminModule\OfficeWebApps文件夹复制到C:\Windows\System32\WindowsPowerShell\v1.0\Modules下，然后管理员身份运行C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe文件，输入Import-Module -Name OfficeWebApps 回车即可。
10）输入New-OfficeWebAppsFarm -InternalURL <http://OfficeWebApp.FAW.COM> -ExternalURL <http://192.168.1.200> -AllowHttp -EditingEnabled -OpenFromUrlEnabled
后面的ExternalURL为外网访问地址。
报错：
New-OfficeWebAppsFarm : 操作失败。服务器不满足以下先决条件:
\- “墨迹和手写服务”Windows 服务器功能必须安装并启用。
所在位置 行:1 字符: 1
\+ New-OfficeWebAppsFarm -InternalURL <http://Teamcenter.FAW.COM> -Extern ...
\+ \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~
\+ CategoryInfo : NotInstalled: (:) \[New-OfficeWebAppsFarm\], InvalidOperationException
\+ FullyQualifiedErrorId : PrerequisiteFailure,Microsoft.Office.Web.Apps.Administration.NewFarmCommand
解决：添加角色中勾选墨迹及手写服务（Winserver2016默认自带的，不会有选择，如果仍有此问题，更新windowsserver或office online server可能会解决。）
安装完成出现以下界面。
![image5](7080e7643d83465db9d5500738c28dd1.png)
打开IE，输入http://OfficeWebApp.FAW.COM/hosting/discovery，出现以下界面，表示部署成功。必须填写计算机全名，即带域名后缀。否则必须添加host映射。
![image6](0ef96418ac2547ddb62ae6ff895a9175.png)
11）打开C:\Program Files\Microsoft Office Web Apps\OpenFromUrlHost下的Settings_Service.ini，
在默认内容后添加(512000/1024M,可以根据自己的需求设定)，修改文档浏览的最大文件大小。
OpenFromUrlMaxFileSizeInKBytes=(System.Int32)512000
![image7](9a3858269f264e2090214e945eaa15e2.png)
验证：
IE中输入：http://officewebapp.faw.com/op/generate.aspx

![image8](4308affa18c04f2e9431e856a7c56655.png)

[亚普Officeonline西门子回复.docx](aa2aa9a72d724cb3ab68da0372581cd4.docx)
第一个框输入共享或IIS部署文档的路径，其中前面的主机名必须是对应计算机的全名，不能IP或计算机名。否则必须添加host映射。点击Create link。
自动在第二个框中生成测试链接，点击Test this link。会在网页中加载该文档。
![image9](3c48c6f19eb2411a99ff4a61f5aa5edf.png)
EXCEL和PPT均可以，但对于word报错：很抱歉,Word Online打开此文档遇到问题,要查看此文档,请在 microsoft word 中打开它.
Sorry, Word Onlineran into a problem opening this document. To view this document please open it in Microsoft Word.

![image10](9d545790945c4db7827e810823216524.png)

