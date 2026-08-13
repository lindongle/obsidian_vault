---
title: 使用Office Online Server在线预览Office - SpringCore - 博客...
updated: 2026-06-06T10:05
created: 2020-02-26T03:08:44
---

使用Office Online Server在线预览Office - SpringCore - 博客园
星期二, 二月 25, 2020
7:08 下午
已剪辑自: <https://www.cnblogs.com/fanqisoft/p/10506286.html>
[微软官方文档介绍](https://docs.microsoft.com/zh-cn/officeonlineserver/deploy-office-online-server)
⒈介绍
　　Office Online Server是 Office Web Apps Server 的升级版本，安装环境必须为两台Windows Server 2012 R2 或 Windows Server 2016服务器（注意，Windows Server 2016 需要 Office Online Server 2017 年 4 月或更高版本。）。一台做转换服务器（安装 Office OnlineServer 2016 软件，除此之外不能安装与office相关的其他程序），一台做域控服务器（转换服务器只有加在域下才能被访问，同时项目部署服务器只有加在域控服务器下才能访问转换服务器）。最好将Office Online Server部署在一台干净的服务器上，而且该服务器必须在域中。
注意事项：
　　1.请勿在运行 Office Online Server的服务器上安装任何其他服务器应用程序。包括 Exchange Server、SharePoint Server、Skype for Business Server 和 SQL Server。如果服务器不足，则可以在这些服务器的其中一台的虚拟机上运行 Office Online Server。
　　2.不要在端口 80、443 或 809 上安装依赖 Web 服务器 (IIS) 角色的任何服务或角色，因为 Office Online Server 会定期删除这些端口上的 Web 应用程序。
　　3.不要安装任何版本的 Office。如果已经安装，在安装 Office Online Server 之前必须将其卸载。
　　4.不要在域控制器上安装 Office Online Server。它不会在包含 Active Directory 域服务 (AD DS) 的服务器上运行。
⒉环境搭建所需软件等
　　1.服务器镜像　　
![image1](2f89a20ef53f44d9916d8cc76d5b9231.gif)
文件名  
cn_windows_server_2012_r2_vl_with_update_x64_dvd_6052729.iso  
SHA1  
5E88BF62773D4867CF904AF94F66EEA2062E35E4  
文件大小  
5.16GB  
发布时间  
2014-12-15  
下载地址  
ed2k://\|file\|cn_windows_server_2012_r2_vl_with_update_x64_dvd_6052729.iso\|5545527296\|BD499EBCABF406AB82293DD8A5803493\|/
![image1](2f89a20ef53f44d9916d8cc76d5b9231.gif)
　　2.Office Online Server安装包
![image1](2f89a20ef53f44d9916d8cc76d5b9231.gif)
文件名  
cn_office_online_server_may_2016_x64_dvd_8480704.iso  
SHA1  
A85B00E0D1DDD219985FBC6B76EF2E422A5EEDBD  
文件大小  
676.81MB  
发布时间  
2016-05-09  
下载地址  
ed2k://\|file\|cn_office_online_server_may_2016_x64_dvd_8480704.iso\|709687296\|99014E02579B6E08E7172D05857F2D05\|/
![image1](2f89a20ef53f44d9916d8cc76d5b9231.gif)
　　3.[.NET Framework 4.5.2](https://go.microsoft.com/fwlink/p/?LinkId=510096)
　　4.[Visual C++ Redistributable Packages for Visual Studio 2013](https://www.microsoft.com/download/details.aspx?id=40784)
　　5.[Visual C++ Redistributable for Visual Studio 2015](https://go.microsoft.com/fwlink/p/?LinkId=620071)（如果安装了Visual C++ Redistributable for Visual Studio 2017则不需要再安装2015了）
　　6.[Microsoft.IdentityModel.Extention.dll](https://go.microsoft.com/fwlink/p/?LinkId=620072)
　　7.[Update for Windows Server 2012 R2 (KB2919442)](https://www.microsoft.com/zh-CN/download/details.aspx?id=42153)
　　8.[Update for Windows Server 2012 R2 (KB2919355)](https://www.microsoft.com/zh-CN/download/details.aspx?id=42334)
　　9.[Update for Windows Server 2012 R2 (KB2999226)](https://www.microsoft.com/zh-CN/download/details.aspx?id=49063)
⒊环境搭建（参考https://blog.csdn.net/q386815991/article/details/81705128）
　　1）搭建域控服务器
　　　　1.打开服务器管理器，添加角色和功能
　　　　
![image2](be11263ec60a4d1e84ac598b18dfd438.png)
　　
　　　　2.下一步
　　　　
![image3](d66fd76e383641a9b0c25c4eb35a1df0.png)
　　　　3.下一步
　　　　
![image4](5802195bb3894a038a914564b384ac6a.png)
　　　　4.下一步
　　　　
![image5](a3fb8bd3c040482990e5bf4fe78bda2c.png)
　　　　5.下一步，选择添加AD域服务，同时添加所需功能
　　　　
![image6](b3dd419bc007480182cde25ad2dea575.png)
　　　　6.下一步，安装功能
　　　　
![image7](88bd5e010ddf4d6a81fd1202998927c9.png)
　　　　7.下一步
　　　　
![image8](dfe128b7912e4c13aa5924d90d9e8483.png)
　　　　8.点击安装，安装功能，安装完成后点击关闭。
　　　　
![image9](f147477640454cbba34beeac3b17e397.png)
　　　　9.点击“升级为域控制器”
　　　　
![image10](c6e52dbfec9a42ec9738bcdb69ad771d.png)
　　　　10.进入AD域服务器配置向导，选择添加新林，并输入根域名，点击下一步
　　　　
![image11](9e491544d55f46d49549f8a105a52f13.png)
　　　　11.填写密码，下一步
　　　　
![image12](5a6394b730534fb7a117fd8d6fed6feb.png)
　　　　12.提示DNS无法创建，不用管，继续下一步
　　　　
![image13](283baf56177a4cd9afffe1ef40ee62f8.png)
　　　　13.下一步
　　　　
![image14](0a7d0b69f26d40d7a798df304f941fd4.png)
　　　　14.安装路径，默认，下一步
　　　　
![image15](acb4422bdeb94250b96392305f9102c0.png)
　　　　15.查看选项，默认，下一步
　　　　
![image16](22c9195c7df846e78c17ef66d102899a.png)
　　　　16.点击安装，安装完成后重启系统即可
　　　　
![image17](27587011117d48bcbd5b8bf1a5a34413.png)
　　2）搭建Office Online Server转换服务器
　　　　1.将Office Online Server转换服务器加入到域控服务器
　　　　　　Ⅰ打开控制面板-\>网络和Internet-\>网络和共享中心，并点击更改适配器设置
　　　　　　
![image18](570c09aa912d4ad08734f63033a6045f.png)
　　　　　　Ⅱ右击网络并打开属性，双击IPV4
　　　　　　
![image19](e147b2e1192043118b462d2a8451d9d2.png)
　　　　　　Ⅲ将DNS服务器配置为刚才配置好的域控服务器IP
　　　　　　
![image20](fb68ad913d6743b7bfaafb0d6c10c57e.jpg)
　　　　　　Ⅳ点击确定
　　　　　　Ⅴ右键电脑，点击属性，点击高级系统设置
　　　　　　
![image21](cc4d154f455543309d05b33cd6937c69.png)
　　　　　　Ⅵ选择计算机名，并点击更改
　　　　　　
![image22](825a88142906490294f6d35950586ad2.png)
　　　　　　Ⅶ选择域，并输入之前域控服务器中配置的根域名
　　　　　　
![image23](be94576d8ff14adb90062c8c98ac0bc2.png)
　　　　　　Ⅷ点击确定，然后输入对应的用户名密码即可，更改完成后重启电脑
　　　　2.在Office Online Server转换服务器上安装Office Online Server
　　　　　　Ⅰ打开Microsoft PowerShell提示符，然后运行此命令示例来安装必需的角色和服务。
　　　　　　Windows Server 2012 R2:　　
Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,InkandHandwritingServices,NET-Framework-Features,NET-Framework-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation
　　　　　　Windows Server 2016：
![image1](2f89a20ef53f44d9916d8cc76d5b9231.gif)
Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,NET-Framework-Features,NET-Framework-45-Features,NET-Framework-Core,NET-Framework-45-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation
![image1](2f89a20ef53f44d9916d8cc76d5b9231.gif)
　　　　　　Ⅱ安装以下软件
　　　　　　　　1）.NET Framework 4.5.2
　　　　　　　　2）Visual C++ Redistributable Packages for Visual Studio 2013
　　　　　　　　3）Visual C++ Redistributable for Visual Studio 2015（如果你电脑里面安装了Visual C++ Redistributable for Visual Studio 2017那这个你肯定装不上）
　　　　　　　　4）Microsoft.IdentityModel.Extention.dll
　　　　　　　　5）那三个补丁提前安了吧，能安进去就安，安不进去就算，反正我是一个也没安进去最后也能成功运行。
　　　　　　Ⅲ通过Office Online Server镜像安装（下一步下一步还用我说？）
　　　　　　Ⅳ开始配置
　　　　　　　　1）打开PowerShell，开始配置Office Online Server　　　　　　　　
New-OfficeWebAppsFarm –InternalURL “<http://192.168.1.131>” –AllowHttp –EditingEnabled
如果输入命令报错，请重新启动电脑
　　　　　　　　-InternalURL：内网浏览地址，http://xx.domin.com 其中 xx表示计算机名 domin.com 表示域名 也可以设置为对应的IP地址
　　　　　　　　-ExternalURL：外网浏览地址
　　　　　　　　-AllowHttp： 允许80端口访问
　　　　　　　　-OpenFromUrlEnabled：允许通过url方式进行预览
　　　　　　　　-CacheLocation： 缓存文件存放路径 默认是C:\ProgramData\Microsoft\OfficeWebApps\Working\d
　　　　　　　　-CacheSizeInGB： 最大缓存文件大小 单位GB 默认为15GB
注：若http://192.168.1.131/hosting/discovery 能登录，http://192.168.1.131/op/generate.aspx显示“服务器错误”，控制台输入Set-OfficeWebAppsFarm -OpenFromUrlEnabled:\$true即可访问成功　　　　　　
　　　　　　　　2）浏览器访问http://192.168.1.131/hosting/discovery出现XML配置信息，访问http://192.168.1.131/op/generate.aspx下图则表明配置已成功。
　　　　　　　　
![image24](217aa87638994b60b1532487d332932a.png)
　　　　　　Ⅴ文档地址配置　　　　　
　　　　　　由于微软这款软件对IP有访问限制，所以需将IP转化为域名进行访问，所以需要进行配置，来让软件自动进行域名转化为IP，具体路径如下
　　　　　　注：此IP是指要访问文档路径的IP
　　　　　　
![image25](e6cfb9005dd04ebb98fd5880fd1b18ca.png)
　　　　　　打开hosts文件，在其中添加对应IP和自定义的域名，即可访问
　　　　　　
![image26](9a9ecdb604624cbfbfe41d19621ef494.png)
　　　　　　Ⅵ大文件转码配置（必须配置）
　　　　　　安装后的office online server 对大文件会有限制，所以需要配置才能进行访问，具体配置路径如下
　　　　　　
![image27](d1fece49751743bd93d625cf111f18c7.png)
　　　　　　
![image28](333db50c2e174058a2fbc132231ba6e0.png)
　　　　　　将上面两个文件夹中的Settings_Service.ini文件进行修改，在其中填入以下内容并保存，注意后面不要加分号　　　　
OpenFromUrlMaxFileSizeInKBytes=(System.Int32)512000
　　　　　　
![image29](98f898dbe0a9483db7b2f6b5e6bc2e66.png)
　　　　　　配置完成后使用CMD命令，输入services.msc打开服务，重启office online服务
　　　　　　
![image30](8bb0e3595e934417ad0b2296b4a9baed.png)
　　　　　　Ⅶ测试文档预览
　　　　　　　　1.将http://myscloud.cn/test.xlsx填入第一行，然后点击create link即可生成浏览网址
　　　　　　
![image31](1337f7f5ecb948498e080cfdb610ece3.png)
　　　　　　　　2.点击test this link进行测试
　　　　　　　　
![image32](9bfe49f1ac36441ca021b6efedd49816.png)
　　　　　　　　
![image33](90c67904e8c042b996ce10d1b2ca4ae0.png)
　　　　　　

