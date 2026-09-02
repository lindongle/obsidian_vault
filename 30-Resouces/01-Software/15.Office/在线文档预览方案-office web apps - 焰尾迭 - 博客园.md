---
title: 在线文档预览方案-office web apps - 焰尾迭 - 博客园
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:56
---

已剪辑自: <https://www.cnblogs.com/yanweidie/p/4516164.html>
　　最近在做项目时，要在手机端实现在线文档预览的功能。于是百度了一下实现方案，大致是将文档转换成pdf，然后在通过插件实现预览。这些方案没有具体实现代码，也没有在线预览的地址，再加上项目时间紧迫。只能考虑其它方案，这时微软的office web apps方案映入眼帘,于是和同事一起用一台PC机折腾了几天终于完成了部署，希望通过本篇记录下安装过程和遇到的坑。目前使用该方案的有 [明道](https://docview.mingdao.com/) [微软](https://products.office.com/zh-CN/office-online/view-office-documents-online?legRedir=true&CorrelationId=3bed72b7-5dbb-48a4-b6f2-0b02468162f1)，我部署的服务地址： <http://myscloud.vicp.cc/op/generate.aspx>下面是在线预览的效果图。
　　使用该方案的好处：
　　1.现有代码改动量很小，几乎可以忽略不计。
　　2.无需自己写代码，只需一台服务器即可
　　3.支持文档类型很全面，doc,ppt,xls,docx,pptx,xlsx,pdf。
　　4.手机和pc都支持，支持文档缓存，分页浏览。
　　

**阅读目录**
- [安装部署步骤](https://www.cnblogs.com/yanweidie/p/4516164.html#_label0)
- [使用示例](https://www.cnblogs.com/yanweidie/p/4516164.html#_label1)
- [服务器部署疑难问题](https://www.cnblogs.com/yanweidie/p/4516164.html#_label2)
- [总结](https://www.cnblogs.com/yanweidie/p/4516164.html#_label3)
[回到顶部](https://www.cnblogs.com/yanweidie/p/4516164.html#_labelTop)
# 安装部署步骤
　　介绍完特性以后，下面介绍服务的安装部署。个人感觉初次部署可能会觉得比较困难，因为这个服务限制还是很多的。
**服务器环境要求**
　　1.转换文档需要两台服务器，一台为转换server，另外一台为域控server。（安装office web apps的服务器必须加域才能安装成功，如果没有加域后面步骤会出现错误，疑难问题里面会介绍）
　　2.系统要求为widow server2008R2 64bit SP1或者以上，NET Framework 4.5，KB2592525，Windows PowerShell 3.0，IIS，保证80 443 809端口不被占用，确保当前机器没有安装office，确保当前机器没有安装Exchange,sharepoint,lync server,sql server
　　3.服务器带宽和内存越高越好，测试发现比较耗性能，原因得从服务的实现原理上讲起。office web apps服务会通过用户提供的文档src，从src服务器上把文档下载下来，然后进行转换，根据文档名称进行缓存，转换完成以后返回。 带宽越大下载过程使用的时间越短，服务器性能越好转换速度越快。
　　

　　域控服务器安装这里就不介绍了，有需要的可以参考[域服务器安装部署](http://www.cnblogs.com/lovechengcheng/p/4117391.html)这篇文章。
**软件准备**
　　1.本文安装步骤所需的软件我都放在百度云盘了，可以进行下载。下载地址：[http://pan.baidu.com/s/1hrBeYqw](http://pan.baidu.com/s/1c250HGW)

**步骤**
**　　**下面的安装步骤很重要，不按顺序安装可能出现未知错误，很难解决，所以建议按照下面步骤进行安装。
**　**　1.安装.net framework4.5
　　2.安装iis7
　　打开服务器管理，添加角色  

![image1](e14bebb0727b4c1cb67bc9d0176d8dd6.png)
这里说明一点，把这些功能全部都勾上，后面运行命令的时候会用到。
　3.安装补丁
　　Windows Server 2008 R2 x64 Edition 更新程序 (KB2592525)\_Windows6.1-KB2592525-x64.msu
　4.安装powershell
　　Windows6.1-KB2506143-x64.msu
　5.安装墨迹支持
　　服务器管理，添加功能

　　6.安装office web apps
　　官网下载URL：[http://download.microsoft.com/do ... D8639/wacserver.exe](http://download.microsoft.com/download/2/A/C/2ACCFEDB-7058-43CD-A0D0-0A420C5D8639/wacserver.exe)
　　
![image2](0b195eb86c3d45d0841414a5355d455c.png)

　 7.安装office web apps语言包
　　wacserverlanguagepack.exe
　　8.安装office web apps sp1补丁包
　　9.通过PowerShell配置Office web apps
　　这个步骤是最容易出错的，记得要使用域账户右键管理员方式运行

![image3](ea4642ed4e974d3d9b4608697ee01773.png)
Import-Module OfficeWebApps
New-OfficeWebAppsFarm -InternalURL <http://xx.domin.com> -ExternalURL <http://xx.domin.com> -AllowHttp -EditingEnabled -OpenFromUrlEnabled
New-OfficeWebAppsFarm 的使用及各参数含义可以去微软官网查看： <http://technet.microsoft.com/zh-cn/library/jj219436.aspx>
-InternalURL：内网浏览地址，http://xx.domin.com 其中 xx表示计算机名 domin.com 表示域名
-ExternalURL：外网浏览地址
-AllowHttp 允许80端口访问
-OpenFromUrlEnabled 允许通过url方式进行预览
-CacheLocation 缓存文件存放路径 默认是C:\ProgramData\Microsoft\OfficeWebApps\Working\d
-CacheSizeInGB 最大缓存文件大小 单位GB 默认为15GB
关于-InternalURL的怎么设置，可以计算机右键-》属性进行查看 计算机全名则是需要的地址
![image4](15e7e23a7b90427482b81b8bc5eadb46.png)
执行完命令就可以在iis中查看了，可以看到自动添加了两个站点，通过上面的地址http://xx.domin.com 进行浏览，出现下面的界面则表示整个安装完成了。
![image5](3db9713d9bd8403c9d9e4dda00ad334b.jpg)
![image6](4c3729e4b04b4b9482b1fa51fe3ae899.jpg)
可以通过 <http://xx.domin.com/hosting/discovery查看描述>

使用过程中如果想修改服务配置，可以通过Set-OfficeWebAppsFarm命令进行修改
Set-OfficeWebAppsFarm -AllowHttp
我这边装完以后通过花生壳映射了一个外网地址，大家可以访问预览（网络可能不稳定）。 <http://myscloud.vicp.cc/op/generate.aspx>
[回到顶部](https://www.cnblogs.com/yanweidie/p/4516164.html#_labelTop)
# 使用示例
安装完成office web apps以后，你可以采用以下方式实现在线预览。
![image7](91b836a432b945a1a8376776564768ef.png)
//在线预览服务地址  
var strOfficeApps="https://docview.mingdao.com";  

//文档地址，需要外网能访问  
var strFileUrl="http://74881.vhost65.cloudvhost.net/doc/test.docx";  

var strUrl =strOfficeApps+"/op/embed.aspx/src="+encodeURIComponent(strFileUrl);
![image7](91b836a432b945a1a8376776564768ef.png)
　　这样生成的地址即可以在浏览器中预览了，你可以把这个地址嵌入到iframe中进行使用
\<iframe src='strUrl' width='476px' height='288px' frameborder='0'\>This is an embedded \<a target='\_blank' href='http://office.com'\>Microsoft Office\</a\> document, powered by \<a target='\_blank' href='http://office.com/webapps'\>Office Web Apps\</a\>.\</iframe\>

[回到顶部](https://www.cnblogs.com/yanweidie/p/4516164.html#_labelTop)
# 服务器部署疑难问题
下面列举一下安装部署过程中出现的几个问题及解决办法
　 1.New-OfficeWebAppsFarm : 登录失败: 未知的用户名或错误密码
![image7](91b836a432b945a1a8376776564768ef.png)
PS C:\Users\Administrator\> New-OfficeWebAppsFarm -InternalURL " <http://xxxx>" -AllowHttp -EditingEnabled  
New-OfficeWebAppsFarm : 登录失败: 未知的用户名或错误密码。  
所在位置 行:1 字符: 1  
+ New-OfficeWebAppsFarm -InternalURL " <http://xxxx>" -AllowHttp -EditingE ...  
+ \~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~~  
+ CategoryInfo : NotSpecified: (:) \[New-OfficeWebAppsFarm\], AuthenticationException  
+ FullyQualifiedErrorId : System.Security.Authentication.AuthenticationException,Microsoft.Office.Web.Apps.Adminis  
tration.NewFarmCommand  

  
如果碰到这种问题，可能是使用的本地账户登录的，需要切换到域账户下面操作。
![image7](91b836a432b945a1a8376776564768ef.png)
　2.HTTP 错误 500.21
![image7](91b836a432b945a1a8376776564768ef.png)
访问 <http://xxxx/hosting/discovery>  

HTTP 错误 500.21 - Internal Server Error  
处理程序“DiscoveryService”在其模块列表中有一个错误模块“ManagedPipelineHandler”  

出现这种错误是第一步安装的.net framework4.5未在iis中注册导致的，以管理员方式打开cmd，运行以下命令  

  
cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319  
.\aspnet_regiis.exe -iru  
Microsoft (R) ASP.NET RegIIS 版本 4.0.30319.17929  
用于在本地计算机上安装和卸载 ASP.NET 的管理实用工具。  
版权所有(C) Microsoft Corporation。保留所有权利。  
开始安装 ASP.NET (4.0.30319.17929)。  
.............  
ASP.NET (4.0.30319.17929)安装完毕。  

iisreset /restart /noforce  

正在尝试停止...  
Internet 服务已成功停止  
正在尝试启动...  
Internet 服务已成功启动
![image7](91b836a432b945a1a8376776564768ef.png)
3.文件太大解决方案(\>10M)
服务默认支持的最大文件大小是10M，大于10M会报错。可以通过以下步骤解决此问题OpenFromUrlMaxFileSizeInKBytes=(System.Int32)512000 后面不要加分号

![image8](0b05827b35f241e68ff71e894b4d7992.png)
![image9](f3d5a840daf74a5db9b2535758fcd6e6.png)
![image10](c3e3238e418f4e9d88d34507bc0e1fe2.png)
![image7](91b836a432b945a1a8376776564768ef.png)
1.打开如图文件Settings_Service.ini，文件目录为C:\Program Files\Microsoft Office Web Apps\OpenFromUrlHost  
; --- OpenFromUrlHost ---  
;  

; The application root for the current application  
ApplicationRoot=(System.String)/oh  

在默认内容后添加(512000/1024M,可以根据自己的需求设定)  
OpenFromUrlMaxFileSizeInKBytes=(System.Int32)512000  

2.修改 C:\Program Files\Microsoft Office Web Apps\OpenFromUrlWeb 下的Settings_Service.ini，进行相同的修改  
3.重启office web apps服务  

再重新试一下\>10M的文件，发现可以访问了
![image7](91b836a432b945a1a8376776564768ef.png)
4.文档地址为ip不是域名的预览报错解决方案
 比如文档地址为http://10.5.192.168/A.docx 这个时候预览会报错 ，而相应的地址为http://mydoc.com/A.docx 域名的则是好的。这个问题估计是微软自己的安全验证问题，为了解决此问题我采取了一种地址转发的方式。
 步骤：在Http80站点下添加转发应用程序，站点文件路径一定要选在C:\Windows\System32\drivers\etc 下，并且赋予读写权限，为了方便修改hosts文件

![image11](2820f0395d0c49d5bc4defcc30cd057b.png)
 正常预览访问的是：http://mydoc.com/op/embed.aspx/src=文档地址，现在改为http://mydoc.com/Redirect/embed.aspx/src=文档地址
代码会判断如果是ip则在hosts添加ip和域名的映射关系
![image12](7ee995c22fb14dab86337aa1d3d762c8.png)
Redirect站点代码下载地址:[Redirect站点](http://files.cnblogs.com/files/yanweidie/Redirect%E7%AB%99%E7%82%B9.rar)
[回到顶部](https://www.cnblogs.com/yanweidie/p/4516164.html#_labelTop)
# 总结
　　整个方案不需要自己额外写代码，麻烦的地方在于安装部署，出现错误很难排查，主要还是因为资料少。所以建议安装到office web apps步骤时，用ghost工具备份一下系统，以免出错从头开始安装。
　　如果你在安装过程中遇到奇怪的错误并且解决了，希望可以告诉我一下，以供我补充完善疑难问题这一项。目前该方案已经在购买服务器实施的过程中，有需要实现在线文档预览的可以考虑使用。

如果，您认为阅读这篇博客让您有些收获，不妨点击一下右下角的【**推荐**】按钮。  
如果，您希望更容易地发现我的新博客，不妨点击一下绿色通道的【**关注我**】。
如果，想给予我更多的鼓励，求打
因为，我的写作热情也离不开您的肯定支持。
感谢您的阅读，如果您对我的博客所讲述的内容有兴趣，请继续关注我的后续博客，我是焰尾迭 。
