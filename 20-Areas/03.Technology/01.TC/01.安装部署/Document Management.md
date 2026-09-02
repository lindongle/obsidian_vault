---
title: Document Management
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

**[www.p30download.com](http://www.p30download.com) office online 解压密码**
**静默安装：**TcClientAppLauncher
D:\HRYTPLMInstall\TC11.5.0.2patch\Tc11.5.0_patch_2_wntx64\wntx64\additional_applications\TcClientAppLauncher\setup.exe

Cd /d D:\HRYTPLMInstall\TC11.5.0.2patch\Tc11.5.0_patch_2_wntx64\wntx64\additional_applications\TcClientAppLauncher\setup.exe
setup.exe -r -f1c:\temp\tclauncher.iss

将生成的tclauncher.iss和源文件setup.exe放到一个目录下
start /wait setup.exe/s /f1"c:\temp\tclauncher.iss" /f2"c:\temp\setup.log"　//f1:输入路径,f2:输出路径

单点登录/ Teamcenter客户端通信系统（SSO / TCCS）
Active Workspace不支持Teamcenter Client for Microsoft Office。

document打开在vis中打开提示错误
Error: 找不到可查看的数据。但是，如果对象包含一些数据集，请检查以下首选项的配置来激活它们的渲染：VMU_Datasets、VMU_SecondaryDatasets、VMU_FileSearchOrder。 找不到可查看的数据。但是，如果对象包含一些数据集，请检查以下首选项的配置来激活它们的渲染：VMU_Datasets、VMU_SecondaryDatasets、VMU_FileSearchOrder。

导出需求规范-实时编辑模式：

Invalid URI: The format of the URI could not be determined.
Teamcenter.Schemas.Soa.\_2006_03.Exceptions.ProtocolException: Invalid URI: The format of the URI could not be determined.
at Teamcenter.Soa.Internal.Client.HttpTransport.ExecuteRequest(String service, String operation, Byte\[\] requestBytes, String servletURI)
at Teamcenter.Soa.Internal.Client.XmlRestSender.Invoke(String service, String operation, Object requestObject, Type type, Type\[\] extraTypes)
配置VSTO URL
This capability has the following prerequisites, which you perform in this procedure:
• Microsoft Word is installed on each client machine.
• Microsoft .NET or Java EE is installed on each client machine.
• Microsoft Visual Studio Tools for Office (VSTO) runtime is installed at a location that is accessible
by all client machines.
• TCCS is installed and FMS_HOME is set.
• The preference REQ_word_addin_url set on the Teamcenter server to the VSTO URL.
Example: <http://localhost/RM_Word_Extension/AWRMMSWordExtension.vsto>
1\. Install the following on each client machine:
• Microsoft Word
• Microsoft .NET
Deploy the Microsoft Visual Studio Tools for Office (VSTO) Add-in using Deployment Center.
Ensure that you deploy VSTO to a location that is accessible to every client machine. For more
information about using Deployment Center, see Installing Teamcenter in the Teamcenter
collection.
The following sections outline the Deployment Center processes for deploying VSTO with .NET
and with Java EE:

Microsoft Word editing preferences
Set the following preferences that support editing requirements in Microsoft Word documents.
Default_Transient_Server
Specifies the default transient file server location. Environment variable settings override this
FCC configuration file setting.
Fms_BootStrap_Urls
Determines which FMS server cache manages file downloads. When searching for an assigned
FMS server cache to manage file downloads, the FSC servers defined in this preference are
contacted in the order listed. The server responds with the FSC server assigned, and all
subsequent communication is with that assigned server cache. Environment variable settings
override this FCC configuration file setting.
This preference is required to enable the editing of requirements in Microsoft Word.
REQ_word_addin_url
Defines the URL to the Microsoft Visual Studio Tools for Office (VSTO) runtime. Example URL:
<http://localhost/RM_Word_Extension/AWRMMSWordExtension.vsto>. For more information,
see Re-import Microsoft Word from Active Workspace.
WEB_default_site_server
Sets the server URL of the default site server used for server related tasks. You must also
set the Web_default_site_deployed_app_name preference, which appends the name of the
application to be launched to this URL.
WEB_default_site_deployed_app_name
Appends the name of the application to be launched to the server URL defined in the
WEB_default_site_server preference.
WEB_protocol
Defines the protocol used by the web server; either http:// or https://.

![image1](3c35d4923df54d9cae1df38c11d24919.png)

Cell A1 has the header Tc_Level.
• Cell B1 have the header Tc_ObjectType.
• \<endtag\> must be present at the end of sheet data in Column A，如果提示必须以""结束，则检查\<endtag\>后面是否有多余空格。
![image2](65fc2fc02b2748ae9194019984727b84.png)

