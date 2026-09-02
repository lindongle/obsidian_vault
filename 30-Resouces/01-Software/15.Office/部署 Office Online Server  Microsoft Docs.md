---
title: 准备服务器以运行 Office Online ServerPrepare servers to run Office Online Server
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:09:14
aliases:
  - 准备服务器以运行 Office Online ServerPrepare servers to run Office Online Server
linter-yaml-title-alias: 准备服务器以运行 Office Online ServerPrepare servers to run Office Online Server
---

已剪辑自: <https://docs.microsoft.com/zh-cn/officeonlineserver/deploy-office-online-server>
**摘要：** 说明如何在本地部署 Office Online Server 以供 SharePoint Server 2016、Skype for Business Server 和 Exchange Server 使用。**Summary:** Explains how to deploy Office Online Server on-premises for use by SharePoint Server 2016, Skype for Business Server, and Exchange Server.
**目标用户**：IT 专业人员**Audience**: IT Professionals
Office Online Server 是 Office Web Apps Server 的下一个版本。部署 Office Online Server 涉及安装某些必备软件和运行一些 Microsoft PowerShell 命令，但总的来说，此过程设计得相当简单。本文将指导完成准备服务器的过程，并提供了配置本地 Office Online Server 场的 Microsoft PowerShell 命令。Office Online Server is the next version of Office Web Apps Server. Deploying Office Online Server involves installing some prerequisite software and running a few Microsoft PowerShell commands, but overall the process is designed to be pretty straightforward. This article walks you through the procedures to get your servers ready, then gives you the Microsoft PowerShell commands to configure the on-premises Office Online Server farm.
# 准备服务器以运行 Office Online ServerPrepare servers to run Office Online Server
在所有将运行 Office Online Server 的服务器上执行以下过程。本服务器必须是 Windows Server 2012 R2 或 Windows Server 2016。（请注意，Windows Server 2016 需要 Office Online Server 2017 年 4 月或更高版本。）Perform these procedures on all servers that will run Office Online Server. This server must be Windows Server 2012 R2 or Windows Server 2016. (Note that Windows Server 2016 requires Office Online Server April 2017 or later.)
Office Online Server 是针对使用默认设置配置的服务器操作系统进行设计和测试。如果需要与非默认设置一起部署，建议从默认设置开始安装和设置。在系统经验证可以正常运行后，再以递增方式添加和测试组策略、安全设置和其他修改。Office Online Server was designed and tested for server operating systems configured with default settings. If you need to deploy with non-default settings, it is recommended to begin installation and setup with the default settings. Once the system is verified as working, then incrementally add and test Group Policies, security settings and other modifications.
## 第 1 步：安装 Office Online Server 必备软件Step 1: Install prerequisite software for Office Online Server
## 安装 Office Online ServerTo install Office Online Server
1.  以管理员身份打开 Microsoft PowerShell 提示符，然后运行此命令示例来安装必需的角色和服务。Open the Microsoft PowerShell prompt as an administrator and run this command to install the required roles and services.
**Windows Server 2012 R2:Windows Server 2012 R2:**
Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,InkandHandwritingServices,NET-Framework-Features,NET-Framework-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation
**Windows Server 2016：Windows Server 2016:**
Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,NET-Framework-Features,NET-Framework-45-Features,NET-Framework-Core,NET-Framework-45-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation
如果出现提示，请重新启动服务器。If prompted, restart the server.
1.  安装以下软件：Install the following software:
## 步骤 2：安装 Office Online ServerStep 2: Install Office Online Server
下一步，我们将安装 Office Online Server。Next, we'll install Office Online Server.
如果计划使用利用外部数据访问的任一 Excel Online 功能（如数据模型、Power Pivot 或 Power View），请注意 Office Online Server 必须以用户身份驻留在同一个 Active Directory 林中，若计划使用基于 Windows 身份验证来访问任一外部数据源也同样如此。If you plan to use any Excel Online features that utilize external data access (such as Data Models, Power Pivot, or Power View), note that Office Online Server must reside in the same Active Directory forest as its users as well as any external data sources that you plan to access using Windows-based authentication.
在将运行 Office Online Server 的所有服务器上完成以下步骤。Complete these steps on any servers that will run Office Online Server.
## 安装 Office Online ServerTo install Office Online Server
1.  从[批量许可服务中心 (VLSC)](http://go.microsoft.com/fwlink/p/?LinkId=256561) 下载 Office Online Server。Office Online Server 是 Office 的一个组件，因此可在每个产品页中进行下载，包括 Office Standard 2016、Office 专业增强版 2016 和 Office 2015 for Mac 标准版。Download Office Online Server from the [Volume Licensing Service Center (VLSC)](http://go.microsoft.com/fwlink/p/?LinkId=256561). Office Online Server is a component of Office, so it is available under each of the product pages including Office Standard 2016, Office Professional Plus 2016, and Office 2015 for Mac Standard.
2.  运行 Setup.exe。Run Setup.exe.
3.  在"阅读 Microsoft 软件许可条款"页上，选择"我接受此协议的条款"，然后选择"继续"。On the **Read the Microsoft Software License Terms** page, select **I accept the terms of this agreement** and click **Continue**.
4.  在“选择文件位置”\*\*\*\* 页上，选择要将 Office Online Server 文件安装到的文件夹（例如，C:\Program Files\Microsoft Office Web Apps），再选择“立即安装”\*\*\*\*。如果指定的文件夹不存在，安装程序会进行创建。On the **Choose a file location** page, select the folder where you want the Office Online Server files to be installed (for example, C:\Program Files\Microsoft Office Web Apps) and select **Install Now**. If the folder you specified doesn't exist, Setup creates it for you.
我们建议在系统驱动器上安装 Office Online Server。We recommend that you install Office Online Server on the system drive.
5.  在安装程序安装完 Office Online Server 后，选择"关闭"。When Setup finishes installing Office Online Server, choose **Close**.
6.  如果计划将 Kerberos 约束委派与 Excel Online 结合使用，请在" **服务**"中，将" **Claims to Windows Token Service**" [设置为在此服务器上自动启动](https://go.microsoft.com/fwlink/p/?LinkId=620769)。If you're planning to use Kerberos Constrained Delegation with Excel Online, then, in **Services**, set the **Claims to Windows Token Service** [to start automatically](https://go.microsoft.com/fwlink/p/?LinkId=620769) on this server.
如果计划将 Kerberos 约束委派与 Excel Online 一起使用，请确保将 Office Online Server 场中的每个服务器添加到 Active Directory 域服务委派列表。If you plan to use Kerberos Constrained Delegation with Excel Online, be sure to add each server in the Office Online Server farm to the Active Directory Domain Services delegation list.
## 第 3 步：安装 Office Online Server 语言包Step 3: Install language packs for Office Online Server
借助 Office Online Server 语言包，用户可以查看基于 Web 的 Office 多语言文件，无论是从 SharePoint 文档库打开，还是从 Outlook 网页版打开，都能查看。Office Online Server Language Packs let users view web-based Office files in multiple languages, whether they're opened from SharePoint document libraries or Outlook on the web.
若要安装语言包，请按以下步骤操作。To install the language packs, follow these steps.
1.  从 [Microsoft 下载中心](http://go.microsoft.com/fwlink/p/?LinkId=798136)下载 Office Online Server。Download the Office Online Server Language Packs from the [Microsoft Download Center](http://go.microsoft.com/fwlink/p/?LinkId=798136).
2.  运行 **wacserverlanguagepack.exe**。Run **wacserverlanguagepack.exe**.
3.  在 Office Online Server 语言包向导中的" **阅读 Microsoft 软件许可条款**"页面上，选择" **我接受此协议的条款**"，然后选择" **继续**"。In the Office Online Server Language Pack Wizard, on the **Read the Microsoft Software License Terms** page, select **I accept the terms of this agreement** and select **Continue**.
4.  在安装程序安装完 Office Online Server 后，选择" **关闭**"。When Setup finishes installing Office Online Server, choose **Close**.
若要**修补语言包**，可在安装 Office Online 语言包后部署 Office 在线更新。To **patch language packs**, deploy Office Online Updates after installing the Office Online Language Packs.
重要
若要在创建 Office Online Server 场后安装语言包，必须从场中删除一个服务器，将语言包安装在该服务器上，然后再将该服务器添加回场。\> 要使语言包正常工作，您需要在服务器场中的所有服务器上进行安装。To install language packs after the Office Online Server farm is created, you must remove a server from the farm, install the language pack on it, and then add the server back to the farm.\> For a language pack to work correctly, you'll need to install it on all servers in the farm.
# 部署 Office Online Server 场Deploy the Office Online Server farm
按照下面三节中任意一节的程序进行操作，具体取决于您想创建的 Office Online Server 场类型。Follow the procedures in one of the following three sections, based on what kind of Office Online Server farm you want to create.
提示
如果 Microsoft PowerShell 在您运行时无法识别 **New-OfficeWebAppsFarm** cmdlet，您可能需要导入 **OfficeWebApps** 模块。请使用此命令：\> Import-Module -Name OfficeWebAppsIf Microsoft PowerShell doesn't recognize the **New-OfficeWebAppsFarm** cmdlet when you run it, you may need to import the **OfficeWebApps** module. Use this command:\> Import-Module -Name OfficeWebApps
## 部署使用 HTTP 的单服务器 Office Online Server 场Deploy a single-server Office Online Server farm that uses HTTP
如果您仅将 Office Online Server 部署用于测试或内部使用，并且您不需要向 Skype for Business Server 2015 提供 Office Online Server 功能，则此程序适合您。您将安装使用 HTTP 的、包含一台服务器的 Office Online Server 场。您不需要证书或负载平衡器，但需要不运行任何其他服务器应用程序的专用物理服务器或虚拟机实例。If you're only deploying Office Online Server for testing or internal use, and you don't need to provide Office Online Server functionality to Skype for Business Server 2015, this procedure is for you. Here, you'll install a single-server Office Online Server farm that uses HTTP. You won't need a certificate or load balancer, but you will need a dedicated physical server or virtual machine instance that isn't running any other server application.
可以使用此 Office Online Server 场，为 SharePoint Server 2016 和 Exchange Server 2016 提供 Office Online 功能。You can use this Office Online Server farm to provide Office Online functionality to SharePoint Server 2016 and Exchange Server 2016.
备注
无论是何环境，强烈建议使用 HTTPS (TLS)，因为 Office Online Server 使用 OAuth 令牌与外部服务（如 SharePoint 或 Exchange Server）通信。OAuth 令牌包含可能会被攻击者拦截并重播的信息。如果成功攻击，攻击者就会获得与用户相同的权限，可以向 Office Online Server 发出请求。It is strongly recommended to use HTTPS (TLS) regardless of environment as Office Online Server uses OAuth tokens to communicate with external services, such as SharePoint or Exchange Server. OAuth tokens contain information that can potentially be intercepted and replayed by an attacker, granting the attacker the same rights as the user making the request to Office Online Server.
### *第 1 步：创建 Office Online Server 场Step 1: Create the Office Online Server farm*
使用 **New-OfficeWebAppsFarm** 命令创建一个包含一台服务器的新 Office Online Server 场，如以下示例中所示。Use the **New-OfficeWebAppsFarm** command to create a new Office Online Server farm that consists of a single server, as shown in the following example.
New-OfficeWebAppsFarm -InternalURL " <http://servername>" -AllowHttp -EditingEnabled
**参数Parameters**
- **-InternalURL** 是运行 Office Online Server 的服务器名称，例如 **[http://servername\*\*。](https://docs.microsoft.com/zh-cn/officeonlineserver/deploy-office-online-server)-InternalURL\*\* is the name of the server that runs Office Online Server, such as [http://servername](http://servername/).**
- **-AllowHttp** 配置要使用 HTTP 的场。**-AllowHttp** configures the farm to use HTTP.
- **-EditingEnabled** 在 Office Online 中启用编辑（如果它与 SharePoint Server 2016 一起使用）。Skype for Business Server 2015 或 Exchange Server 不使用此参数，因为这些主机不支持编辑。**-EditingEnabled** enables editing in Office Online when used with SharePoint Server 2016. This parameter isn't used by Skype for Business Server 2015 or Exchange Server because those hosts don't support editing.
### *步骤 2：验证是否成功创建 Office Online Server 场Step 2: Verify that the Office Online Server farm was created successfully*
在创建服务器场后，将在 Microsoft PowerShell 提示符中显示有关服务器场的详细信息。若要验证是否正确安装并配置了 Office Online Server，请使用 Web 浏览器访问 Office Online Server 发现 URL，如下面的示例所示。发现 URL 是您在配置 Office Online Server 服务器场时指定的 *InternalUrl* 参数，后跟 **/hosting/discovery**，例如：After the farm is created, details about the farm are displayed in the Microsoft PowerShell prompt. To verify that Office Online Server is installed and configured correctly, use a web browser to access the Office Online Server discovery URL, as shown in the following example. The discovery URL is the *InternalUrl* parameter you specified when you configured your Office Online Server farm, followed by **/hosting/discovery**, for example:
<http://servername/hosting/discovery>
如果 Office Online Server 按预期运行，您应该在 Web 浏览器中看到 Web 应用程序开放平台接口 (WOPI) 协议发现 XML 文件。该文件的前几行应类似以下示例。If Office Online Server is working as expected, you should see a Web Application Open Platform Interface Protocol (WOPI)-discovery XML file in your web browser. The first few lines of that file should resemble the following example.
\<?xml version="1.0" encoding="utf-8" ?\>  
- \<wopi-discovery\>  
- \<net-zone name="internal-http"\>  
- \<app name="Excel" favIconUrl="http://servername/x/\_layouts/images/FavIcon_Excel.ico" checkLicense="true"\>  
\<action name="view" ext="ods" default="true" urlsrc="http://servername/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" /\>  
\<action name="view" ext="xls" default="true" urlsrc="http://servername/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" /\>  
\<action name="view" ext="xlsb" default="true" urlsrc="http://servername/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" /\>  
\<action name="view" ext="xlsm" default="true" urlsrc="http://servername/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" /\>
### *步骤 3：配置 Secure Store 访问（可选）Step 3: Configure Secure Store access (optional)*
如果计划使用 HTTP 环境中 SharePoint 服务器的 Secure Store Service，则需要设置可启用此服务的参数。（如果未计划将 SharePoint 服务器中的 Secure Store 与 Excel Online 一起使用，则可跳过此步骤。）If you're planning to use the Secure Store service in SharePoint Server in an HTTP environment, there's a parameter that you need to set to enable this. (If you're not planning to use Secure Store in SharePoint Server with Excel Online, you can skip this step.)
当 Office Online Server 试图刷新工作簿或存储在 HTTP 路径中的 ODC 文件的数据时，如果尚未配置 Office Online Server 以允许通过 HTTP 的 Secure Store 连接，则数据刷新将失败。When Office Online Server attempts to refresh data in a workbook or ODC file that is stored in an HTTP path, that data refresh will fail if you have not configured Office Online Server to allow Secure Store connections over HTTP.
使用 Set-OfficeWebAppsFarm cmdlet 配置通过 HTTP 的 Secure Store 设置：Use the Set-OfficeWebAppsFarm cmdlet to configure the Secure Store over HTTP settings:
Set-OfficeWebAppsFarm -AllowHttpSecureStoreConnections:\$true
请记住将通过 HTTP 以明文形式传送工作簿的内容或 ODC 文件。数据连接工作簿和 ODC 文件包含数据库连接信息，并可以包含密码。Keep in mind that the contents of the workbook or ODC file will be transmitted in clear text over HTTP. Data connected workbooks and ODC files contain database connection information, and can contain passwords.
### *步骤 4：配置主机Step 4: Configure the host*
服务器场现在已经可以通过 HTTP 为主机提供 Office Online 功能。有关如何配置主机的详细信息，请查阅以下文章。The farm is now ready to provide Office Online functionality to hosts over HTTP. Visit the following articles for more information about how to configure hosts.
## 部署使用 HTTPS 的单服务器 Office Online Server 场Deploy a single-server Office Online Server farm that uses HTTPS
对于大多数生产环境，强烈建议对其安全功能使用 HTTPS。同样，如果要向 Skype for Business Server 2015 提供 Office Online Server 功能，则需要 HTTPS，这样用户便可在浏览器中查看 PowerPoint 广播。此处将介绍如何安装使用 HTTPS 的单服务器 Office Online Server 场。需要在服务器上安装证书。For most production environments, we strongly recommend the use of HTTPS for its security features. Also, HTTPS is required if you want to provide Office Online Server functionality to Skype for Business Server 2015, which lets users view PowerPoint broadcasts in a browser. Here's how to install a single-server Office Online Server farm that uses HTTPS. You'll need to install a certificate on the server.
此 Office Online Server 场将向 SharePoint Server 2016、Skype for Business Server 2015 和 Exchange Server 2016 提供 Office Online 功能。This Office Online Server farm will provide Office Online functionality to SharePoint Server 2016, Skype for Business Server 2015, and Exchange Server 2016.
### *步骤 1：创建 Office Online Server 场Step 1: Create the Office Online Server farm*
使用 **New-OfficeWebAppsFarm** 命令创建一个包含一台服务器的新 Office Online Server 场，如以下示例中所示。Use the **New-OfficeWebAppsFarm** command to create a new Office Online Server farm that consists of a single server, as shown in the following example.
New-OfficeWebAppsFarm -InternalUrl " <https://server.contoso.com>" -ExternalUrl " <https://wacweb01.contoso.com>" -CertificateName "OfficeWebApps Certificate" -EditingEnabled
**参数Parameters**
- **-InternalURL** 是运行 Office Online Server 服务器完全限定的域名 (FQDN)，如 **[http://servername.contoso.com\*\*。](https://docs.microsoft.com/zh-cn/officeonlineserver/deploy-office-online-server)-InternalURL\*\* is the fully qualified domain name (FQDN) of the server that runs Office Online Server, such as [http://servername.contoso.com](http://servername.contoso.com/).**
- **-ExternalURL** 是可以在 Internet 上访问的 FQDN。**-ExternalURL** is the FQDN that can be accessed on the Internet.
- **-CertificateName** 是证书的友好名称。**-CertificateName** is the friendly name of the certificate.
- **-EditingEnabled** 为可选，它在 Office Online 中启用编辑（如果它与 SharePoint Server 2016 一起使用）。Skype for Business Server 2015 或 Exchange Server 不使用此参数，因为这些主机不支持编辑。**-EditingEnabled** is optional and enables editing in Office Online when used with SharePoint Server 2016. This parameter isn't used by Skype for Business Server 2015 or Exchange Server because those hosts don't support editing.
### *步骤 2：验证是否成功创建 Office Online Server 场Step 2: Verify that the Office Online Server farm was created successfully*
在创建服务器场后，将在 Microsoft PowerShell 提示符中显示有关服务器场的详细信息。若要验证是否正确安装并配置了 Office Online Server，请使用 Web 浏览器访问 Office Online Server 发现 URL，如下面的示例所示。发现 URL 是您在配置 Office Online Server 服务器场时指定的 *InternalUrl* 参数，后跟 **/hosting/discovery**，例如：After the farm is created, details about the farm are displayed in the Microsoft PowerShell prompt. To verify that Office Online Server is installed and configured correctly, use a web browser to access the Office Online Server discovery URL, as shown in the following example. The discovery URL is the *InternalUrl* parameter you specified when you configured your Office Online Server farm, followed by **/hosting/discovery**, for example:
<https://server.contoso.com/hosting/discovery>
如果 Office Online Server 按预期运行，您应该在 Web 浏览器中看到 Web 应用程序开放平台接口 (WOPI) 协议发现 XML 文件。该文件的前几行应类似以下示例。If Office Online Server works as expected, you should see a Web Application Open Platform Interface Protocol (WOPI)-discovery XML file in your web browser. The first few lines of that file should resemble the following example:
\<?xml version="1.0" encoding="UTF-8"?\>  
\<wopi-discovery\>\<net-zone  
name="internal-https"\>\<app name="Excel" checkLicense="true"  
favIconUrl="https://wac.contoso.com/x/\_layouts/images/FavIcon_Excel.ico"\>\<action  
name="view"  
urlsrc="https://wac.contoso.com/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>"  
default="true" ext="ods"/\>\<action name="view"  
urlsrc="https://wac.contoso.com/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>"  
default="true" ext="xls"/\>\<action name="view"
备注
根据您的 Web 浏览器的安全设置，您可能会在发现 XML 文件的内容显示之前看到提示您选择"显示所有内容"的消息。Depending on the security settings of your web browser, you might see a message that prompts you to select **Show all content** before the contents of the discovery XML file are displayed.
### *步骤 3：配置主机Step 3: Configure the host*
服务器场现在已经可以通过 HTTPS 为主机提供 Office Online 功能。有关如何配置主机的详细信息，请查阅以下文章。The farm is now ready to provide Office Online functionality to hosts over HTTPS. Visit the following articles for more information about how to configure hosts.
## 部署使用 HTTPS 的多服务器负载平衡 Office Online Server 场Deploy a multi-server, load-balanced Office Online Server farm that uses HTTPS
如果预计 Office Online Server 场流量很大，并且希望其通过 Internet 且在内部网络中可用，则应使用此类型的拓扑。本节介绍如何安装使用负载平衡器和 HTTPS 的多服务器 Office Online Server 场。If you anticipate lots of traffic to your Office Online Server farm, and you want it to be available over the Internet as well as on your internal network, this type of topology is the way to go. This section shows how to install a multi-server Office Online Server farm that uses a load balancer and HTTPS.
在开始之前，请确保已配置负载平衡器。此外，需要在负载平衡器上安装一个证书。此 Office Online Server 场将为 SharePoint Server 2016、Skype for Business Server 2015 和 Exchange Server 2016 提供 Office Online 功能。Before you begin, make sure your load balancer is configured. Also, you'll need to install a certificate on the load balancer. This Office Online Server farm will provide Office Online functionality to SharePoint Server 2016, Skype for Business Server 2015, and Exchange Server 2016.
### *步骤 1：在第一台服务器上创建 Office Online Server 场Step 1: Create the Office Online Server farm on the first server*
使用 **New-OfficeWebAppsFarm** 命令在第一台服务器上创建的新 Office Online Server 场，如以下示例中所示。Use the **New-OfficeWebAppsFarm** command to create a new Office Online Server farm on the first server, as shown in the following example.
New-OfficeWebAppsFarm -InternalUrl " <https://server.contoso.com>" -ExternalUrl " <https://wacweb01.contoso.com>" -SSLOffloaded -EditingEnabled
**参数Parameters**
- **-InternalURL** 是运行 Office Online Server 服务器完全限定的域名 (FQDN)，如 **[http://servername.contoso.com\*\*。](https://docs.microsoft.com/zh-cn/officeonlineserver/deploy-office-online-server)-InternalURL\*\* is the fully qualified domain name (FQDN) of the server that runs Office Online Server, such as [http://servername.contoso.com](http://servername.contoso.com/).**
- **-ExternalURL** 是可以在 Internet 上访问的 FQDN 名称。**-ExternalURL** is the FQDN name that can be accessed on the Internet.
- **-SSLOffloaded** 允许卸载到负载平衡器的 SSL 端接。**-SSLOffloaded** enables offloading SSL termination to the load balancer.
- **-EditingEnabled** 为可选，它在 Office Online 中启用编辑（如果它与 SharePoint Server 2016 一起使用）。Skype for Business Server 2015 或 Exchange Server 不使用此参数，因为这些主机不支持编辑。**-EditingEnabled** is optional and enables editing in Office Online when used with SharePoint Server 2016. This parameter isn't used by Skype for Business Server 2015 or Exchange Server because those hosts don't support editing.
### *步骤 2：向服务器场中添加更多服务器Step 2: Add more servers to the farm*
第一台服务器运行 Office Online Server 后，在您要添加到 Office Online Server 服务器场中的每台服务器上运行 **New-OfficeWebAppsMachine** 命令。对于 **-MachineToJoin** 参数，请使用已存在于 Office Online Server 服务器场中的某台服务器的计算机名称。例如，如果 server1.contoso.com 已位于服务器场中，请使用以下名称：After the first server is running Office Online Server, run the **New-OfficeWebAppsMachine** command on each server you want to add to the Office Online Server farm. For the **-MachineToJoin** parameter, use the computer name of a server that's already in the Office Online Server farm. For example, if server1.contoso.com is already in the farm, use the following:
New-OfficeWebAppsMachine -MachineToJoin "server1.contoso.com"
### *步骤 3：验证是否成功创建 Office Online Server 场Step 3: Verify that the Office Online Server farm was created successfully*
在创建服务器场后，将在 Microsoft PowerShell 提示符中显示有关服务器场的详细信息。若要验证是否正确安装并配置了 Office Online Server，请使用 Web 浏览器访问 Office Online Server 发现 URL，如下面的示例所示。发现 URL 是您在配置 Office Online Server 服务器场时指定的 *InternalUrl* 参数，后跟 **/hosting/discovery**，例如：After the farm is created, details about the farm are displayed in the Microsoft PowerShell prompt. To verify that Office Online Server is installed and configured correctly, use a web browser to access the Office Online Server discovery URL, as shown in the following example. The discovery URL is the *InternalUrl* parameter you specified when you configured your Office Online Server farm, followed by **/hosting/discovery**. For example:
<https://server.contoso.com/hosting/discovery>
如果 Office Online Server 按预期运行，您应该在 Web 浏览器中看到 Web 应用程序开放平台接口 (WOPI) 协议发现 XML 文件。该文件的前几行应类似以下示例。If Office Online Server works as expected, you should see a Web Application Open Platform Interface Protocol (WOPI)-discovery XML file in your web browser. The first few lines of that file should resemble the following example:
\<?xml version="1.0" encoding="UTF-8"?\>  
\<wopi-discovery\>\<net-zone name="internal-https"\>\<app name="Excel" checkLicense="true" favIconUrl="https://officewebapps.contoso.com/x/\_layouts/images/FavIcon_Excel.ico"\>\<action name="view" urlsrc="https://officewebapps.contoso.com/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" default="true" ext="ods"/\>\<action name="view" urlsrc="https://officewebapps.contoso.com/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" default="true" ext="xls"/\>\<action name="view" urlsrc="https://officewebapps.contoso.com/x/\_layouts/xlviewerinternal.aspx?\<ui=UI_LLCC&amp;\>\<rs=DC_LLCC&amp;\>" default="true" ext="xlsb"/\>
备注
根据您的 Web 浏览器的安全设置，您可能会在发现 XML 文件的内容显示之前看到提示您选择"显示所有内容"的消息。Depending on the security settings of your web browser, you might see a message that prompts you to select **Show all content** before the contents of the discovery XML file are displayed.
### *步骤 4：配置主机Step 4: Configure the host*
服务器场现在已经可以通过 HTTPS 为主机提供 Office Online 功能。有关如何配置主机的详细信息，请查阅以下文章。The farm is now ready to provide Office Online functionality to hosts over HTTPS. Visit the following articles for more information about how to configure hosts.
# 如果您看到"500 Web 服务异常"或"500.21 - 内部服务器错误"消息If you see "500 Web Service Exceptions" or "500.21 - Internal Server Error" messages
如果安装后删除了 .NET Framework 4.6 的功能，在运行 OfficeWebApps cmdlet 时，你可能会看到"500 Web 服务异常"或"500.21 - 内部服务器错误"消息。若要解决此问题，请从提升的命令提示符运行以下示例命令来清理阻止 Office Online Server 正确运行的设置：If features of the .NET Framework 4.6 were installed and then removed, you might see "500 Web Service Exceptions" or "500.21 - Internal Server Error" messages when you run OfficeWebApps cmdlets. To fix this, run the following sample commands from an elevated command prompt to clean up settings that could prevent Office Online Server from functioning correctly:
**对于 Windows Server 2012 R2 或 Windows Server 2016For Windows Server 2012 R2 or Windows Server 2016**
Add-WindowsFeature NET-Framework-45-Core, NET-Framework-45-ASPNET, Web-Asp-Net45
# 另请参阅See also
[将软件更新应用到 Office Online ServerApply software updates to Office Online Server](https://docs.microsoft.com/zh-cn/officeonlineserver/apply-software-updates-to-office-online-server)
[Office 联机服务器发布计划Office Online Server release schedule](https://docs.microsoft.com/zh-cn/officeonlineserver/office-online-server-release-schedule)
[计划 Office Online ServerPlan Office Online Server](https://docs.microsoft.com/zh-CN/officeonlineserver/plan-office-online-server)
