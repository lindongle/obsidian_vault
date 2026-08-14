---
title: officeonline
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

勾选5个模块：
![image1](fbb92a4aacf940e4a7b27934ae82a659.png)

![image2](4f2b84ab46c04ed0806bf8965d62efe2.png)

![image3](3b876423b62641f6888f5509df962bf2.png)

![image4](1b5299d0cff84f25a99ca4c0bb7a0268.png)

![image5](bc64a1552fcc4768858d3f0e4d70d508.png)
Sponsor密码：Y#pp#2020

![image6](7b9068f22f944ba4ab429aa1c332e84f.png)
![image7](ee1a912f503c47e1a63e6b9612b0d698.png)

![image8](ac7235a558254247ac072ebe4f020a46.png)
<span style='color:#FA0000'>启动微服务后后，再执行下一步；如果还连不上，重启fsc服务。需安装IIS服务</span>
![image9](02606ab8b7f24b7eaca2295cb20d5947.png)
<span style='color:#FA0000'>没装IIS</span>
![image10](8b8e6dffffbf4aa48f00d674ee9ba1e9.png)
<span style='color:#FA0000'>IIS网站添加everyone权限；</span>
<span style='color:#FA0000'>新建首选项：</span>
![image11](1fe892dbb72f4254a5600339bf8837be.png)

![image12](3074ea3f666a40cfa5af01d227252a8f.png)

![image13](1a4e5d7d9ef3462f82e836fb301ff515.png)
<span style='color:#FA0000'>TC中创建Sponsor用户，上图可以修改安装时的密码，改成一致。Y#pp#2020</span>
<span style='color:#FA0000'>新建环境变量：--可不设置，待验证</span>
![image14](c443d01d050048c09a1347ff22d44127.png)

![image15](0af7d624d612401ab0c86568306f8e73.png)
<span style='color:#FA0000'>修改</span>
<span style='color:#FA0000'>在IIS中浏览网站进行配置测试：</span>
![image16](647da402417245978cd837398b0b1f55.png)
<span style='color:#FA0000'>根据提示删除下面文件中开头乱码</span>
![image17](eab9bae2748e4d10b31827bad8b81ed8.png)
<span style='color:#FA0000'>出现以下错误，安装下面.net模块，需重启服务器</span>
![image18](cb90654a1f7c43a3b7c2c16a998acd4e.png)
<span style='color:#FA0000'></span>
![image19](345fff07695f45bcbae13252c4b388d0.png)
以下错误，需要安装.4.5.2及以上版本，安装方式及补丁，可百度
![image20](00a99faa1ac548d48be31f0b831da6f6.png)

![image21](eb9fc1bea1184d34897d88bab1403b60.png)

![image22](b7387b8c94a44e72a36e2ac9461ecdf6.png)

![image23](512b367ec7624b06800099a2a7fa1b35.png)
以上报错：首选项不要有主机名或sponsor角色下没有添加infodba用户
<span style='color:#FA0000'>更换officeonline服务器（提前将新服务器进行域名绑定）或首选项地址格式不对</span>
<span style='color:#FA0000'>Chrome浏览器需将3000对应的服务器和officeonline服务器地址加入可信站点</span>
![image24](e32c480cd1454764a5ef1010f915e414.png)
<span style='color:#FA0000'></span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>Import-Module -Name OfficeWebApps</span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>New-OfficeWebAppsFarm -InternalURL " <http://officeonline.yapp.com>" -ExternalUrl " <http://172.20.2.112>" -AllowHttp –EditingEnabled –OpenFromUrlEnabled</span>

Get-OfficeWebAppsMachine

Get-OfficeWebAppsHost

从 Office Online Server 服务器场中移除所有标记为不正常的服务器。
Repair-OfficeWebAppsFarm

Set-OfficeWebAppsFarm -InternalURL " <http://officeonline.yapp.com>" -ExternalUrl " <http://172.20.2.112>" -AllowHttp –EditingEnabled –OpenFromUrlEnabled
<span style='color:#FA0000'></span>
<span style='color:#FA0000'></span>
![image25](85660604abe540bab6bcc326730a9798.png)

![image26](838fca50b4b2455bb933a6b4504fc884.png)

![image27](825ab478bc3f42319f152b627d19eaef.png)
<span style='color:#FA0000'></span>

FarmOU :
InternalURL : <http://officeonline.yapp.com/>
ExternalURL : <http://172.20.2.59/>
AllowHTTP : True
AllowOutboundHttp : False
SSLOffloaded : False
CertificateName :
S2SCertificateName :
EditingEnabled : False
LogLocation : C:\ProgramData\Microsoft\OfficeWebApps\Data\Logs\ULS
LogRetentionInDays : 7
LogVerbosity :
Proxy :
CacheLocation : C:\ProgramData\Microsoft\OfficeWebApps\Working\d
MaxMemoryCacheSizeInMB : 75
DocumentInfoCacheSize : 5000
CacheSizeInGB : 15
ClipartEnabled : False
OnlinePictureEnabled : False
OnlineVideoEnabled : False
TranslationEnabled : False
MaxTranslationCharacterCount : 125000
TranslationServiceAppId :
TranslationServiceAddress :
RenderingLocalCacheLocation : C:\ProgramData\Microsoft\OfficeWebApps\Working\waccache
RecycleActiveProcessCount : 5
AllowCEIP : False
OfficeAddinEnabled : False
ExcelRequestDurationMax : 300
ExcelSessionTimeout : 450
ExcelWorkbookSizeMax : 10
ExcelPrivateBytesMax : -1
ExcelConnectionLifetime : 1800
ExcelExternalDataCacheLifetime : 300
ExcelAllowExternalData : True
ExcelUseEffectiveUserName : False
ExcelWarnOnDataRefresh : True
ExcelUdfsAllowed : False
ExcelMemoryCacheThreshold : 90
ExcelUnusedObjectAgeMax : -1
ExcelCachingUnusedFiles : True
ExcelAbortOnRefreshOnOpenFail : True
ExcelEnableCrossForestKerberosAuthentication : False
ExcelAutomaticVolatileFunctionCacheLifeTime : 300
ExcelConcurrentDataRequestsPerSessionMax : 5
ExcelDefaultWorkbookCalcMode : File
ExcelRestExternalDataEnabled : True
ExcelChartAndImageSizeMax : 1
OpenFromUrlEnabled : True
OpenFromUncEnabled : True
OpenFromUrlThrottlingEnabled : True
PicturePasteDisabled : False
RemovePersonalInformationFromLogs : False
AllowHttpSecureStoreConnections : False
Machines : {OFFICEONLINE}
<span style='color:#FA0000'></span>
<span style='color:#FA0000'></span>
<span style='color:#FA0000'>独立服务器安装tc的officeonline，即IIS服务器，需要在每个pool上勾选以下模块。否则awc中officeonline空白</span>
![image28](26ab3996f390445da4616dadd9fa3f17.png)
![image12](3074ea3f666a40cfa5af01d227252a8f.png)
