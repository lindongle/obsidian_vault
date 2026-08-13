---
title: office online server2016详细安装步骤及问题总结 - q386815991的博...
updated: 2026-06-06T10:05
created: 2018-11-14T00:19:38
---

office online server2016详细安装步骤及问题总结 - q386815991的博客 - CSDN博客
2018年11月14日
0:19
已剪辑自: <https://blog.csdn.net/q386815991/article/details/81705128>
由于公司需要，自己一直在研究office online server 2016这款在线浏览文档的软件，其中遇到了很多问题，以下是自己综合网上的资料和自己的搭建过程写出来的安装步骤，亲测可用，值得注意的是在安装后除word格式的文件其他都可以进行在线浏览，找了差不多两周的问题才知道是语言包的问题，具体没做深入研究，所以这个安装步骤就没有使用语言包进行安装，默认为英文使用
首先需要准备两套服务器，而且都必须是Windows Server 2012 R2版本的服务器，推荐使用下方红框内的ISO镜像，其他版本的安装更新时会报错
![image1](978608557287450f94487de7e48285da.png)
附文件下载地址： <https://pan.baidu.com/s/1qcYuczFFRk1Ellv6yv_C3g>
密码：vsrg
注：域控和OOS服务器需要给administrator设置密码，且设置成一样的密码最好
# <span style='color:#1E4E79'>[1.](https://blog.csdn.net/q386815991/article/details/81705128)环境安装</span>
## <span style='color:#2E75B5'>1.1 搭建域控服务器</span>
1\. 打开服务器管理器，添加角色和功能；
![image2](ef41f34174064516ac68e6a6a7db72a2.png)
2.下一步；
![image3](6bacd3fcd7a242129dfdd903a916c126.png)

3.下一步；

![image4](7c695cff63e140319b10f2bfe22e353c.png)
4.下一步

![image5](b32dc01e5d854f33a2a12febb8078af0.png)
5.下一步，选择添加AD域服务，同时添加所需功能；
![image6](a687071c3c664f1cb6337826db2acf76.png)

6.下一步，安装功能；

![image7](be336e18deb745ce98cb9883ac758e6d.png)
7.下一步
![image8](8ed93944fd704ed4b6c22b3b5a35861b.png)

8.点击安装，安装功能，安装完成后点击关闭。
![image9](23a0005124e94ef09d1a1366c5a89094.png)

9\. 点击“升级为域控制器”；

![image10](0c491b3554a74603a02a1bcab4e0fced.png)
10\. 进入AD域服务器配置向导，选择添加新林，并输入根域名，点击下一步；
![image11](812bb18fa194432aafc6b315e22994d4.png)

11\. 填写密码，下一步；
![image12](bb1c7db98ffe4a4faaf8e430d18f154a.png)

12\. 提示DNS无法创建，不用管，继续下一步
![image13](36bf83327aeb47eab290f88136cda6d5.png)

13.下一步

![image14](03bae90c708d47638cd44b7899486c9a.png)
14\. 安装路径，默认，下一步；

![image15](46d4ccad3ce046838dbe4e765dbcedf7.png)
15\. 查看选项，默认，下一步；

![image16](71acea9c0db3465bb0626708f22dadf7.png)
16.点击安装，安装完成后重启系统即可

![image17](21c7c5bbb59947d1aabc1e6ac1ee6e26.png)
## <span style='color:#2E75B5'>1.2 将Office Online Server服务器加入域服务器</span>
1.打开控制面板-\>网络和Internet-\>网络和共享中心，并点击更改适配器设置
![image18](9458b4b817144046bb87a87df744b679.png)
2.右击网络并打开属性，双击IPV4
![image19](fa0d7f1d4b274ae4b68667faffdeafc6.png)
3.将DNS服务器配置为刚才配置好的域控服务器IP
![image20](306293f1460e4eb88e7b68919cbf076e.png)
4.点击确定
5.右键电脑，点击属性，点击高级系统设置
![image21](3f56e22c7e6f42c49ca7e3d4bbb5442d.png)
6.选择计算机名，并点击更改
![image22](166d5a6a38ad432b8dbd0a47cc02ffba.png)
7.选择域，并输入之前域控服务器中配置的根域名
![image23](dc50afe41ec548a4955dc7fb6e300ebe.png)
8.点击确定，然后输入对应的用户名密码即可，更改完成后重启电脑
## <span style='color:#2E75B5'>[1.3为 Office Online Server 安装必备软件](https://blog.csdn.net/q386815991/article/details/81705128)</span>
打开 Microsoft PowerShell 提示符，然后运行此命令示例来安装必需的角色和服务。

Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,InkandHandwritingServices,NET-Framework-Features,NET-Framework-Core,NET-HTTP-Activation,NET-Non-HTTP-Activ,NET-WCF-HTTP-Activation45,Windows-Identity-Foundation,Server-Media-Foundation

## <span style='color:#2E75B5'>[1.4](https://blog.csdn.net/q386815991/article/details/81705128)Microsoft .NET Framework4.5.2</span>
1、右键以管理员身份运行Microsoft .NET Framework4.5.2安装包，勾选“我已阅读并接受许可条款”点击“安装”。
![image24](0a76c2b616534de4867fef94cbfb2185.png)

2、安装进行中，待进度完成。
![image25](381b34977cbe43a8a92bc3c564a0d973.png)

3、点击“完成”，完成Microsoft.NET Framework 4.5.2的安装。
![image26](9bb61ae0d92340a9853e6cd403be3987.png)

## <span style='color:#2E75B5'>[1.5Visual C++ Redistributable Packages for Visual Studio 2013](https://blog.csdn.net/q386815991/article/details/81705128)</span>
1、右键以管理员身份运行Visual C++ Redistributable Packages for Visual Studio 2013安装包，勾选“我已阅读并接受许可条款”点击“安装”。
![image27](499a931ec7894d9f843091b0efcd3f06.png)

2、安装进行中，待进度完成。
![image28](7a9e5d001c2f45a4aa9a1f2a627497a1.png)

3、点击“关闭”，完成Visual C++ Redistributable Packages for Visual Studio 2013的安装。
![image29](4c14a2215acb4d74bc5ad14f2ff97eda.png)

## <span style='color:#2E75B5'>[1.6Visual C++ Redistributable for Visual Studio 2015](https://blog.csdn.net/q386815991/article/details/81705128)</span>
1、右键以管理员身份运行Visual C++ Redistributable for Visual Studio 2015安装包，勾选“我已阅读并接受许可条款”点击“安装”。
![image30](607ebf12782d4199b64f6d0582b01fe6.png)

2、安装进行中，待进度完成。
![image31](c49b3b6bde3d4e4d9c072fa8467caf75.png)

3、点击“关闭”，完成Visual C++ Redistributable Packages for Visual Studio 2013的安装。
![image32](261c6340dd16488cb8abc8f554c157cf.png)

## <span style='color:#2E75B5'>[1.7](https://blog.csdn.net/q386815991/article/details/81705128)Microsoft.IdentityModel.Extention.dll</span>
1、右键以管理员身份运行Microsoft.IdentityModel.Extention.dll 安装包，勾选“I accept the terms in the License Agreement”点击“install”。
![image33](1de52c49bf054ed99c7839870e93aad0.png)

2、安装进行中，待进度完成。
![image34](0375a6cb793940ee8767bb766315bbde.png)

3、点击“关闭”，完成Visual C++ Redistributable Packages for Visual Studio 2013的安装。
![image35](e37318eb02784f5daba301d1892cee50.png)

## <span style='color:#2E75B5'>[1.8 Windows8.1-KB2999226-x64.msu](https://blog.csdn.net/q386815991/article/details/81705128)</span>
1.将下载好的Windows8.1-KB2999226-x64.msu双击打开即可安装
![image36](3d988af0ea4545d1915870253ec69e2b.png)
# <span style='color:#1E4E79'>[2.](https://blog.csdn.net/q386815991/article/details/81705128)软件安装部署</span>
## <span style='color:#2E75B5'>[2.1 office online sevrer 2016](https://blog.csdn.net/q386815991/article/details/81705128)</span>
1.将下载好的office online server 2016的安装包解压好，并点击图中标注文件夹
![image37](b7e500a8093244d1ac7c8c267fef8ac4.png)

2.点击setup.exe
![image38](3f93f09313bc4593890c719798fdee29.png)

3\. 勾选“I accept the terms of this Agreement”点击“continue”。

![image39](213adcb002fc47fc8bd9969e400f258a.png)

4.默认安装路径，点击“install now”
![image40](ea49b5b4cfe9447c96bd45017b41ab77.png)

5\. 安装进行中，待进度完成。
![image41](8b33e96c19484639acb214f6e88aca1a.png)

6.安装完成
![image42](a7facd24c62848e590980b08b921bf33.png)

## <span style='color:#2E75B5'>[2.2 相关配置](https://blog.csdn.net/q386815991/article/details/81705128)</span>
### <span style='color:#5B9BD5'>[2.2.1 office online server](https://blog.csdn.net/q386815991/article/details/81705128) 配置</span>
1.安装完成后，打开PowerShell，开始配置office online server
输入：New-OfficeWebAppsFarm –InternalURL “ <http://192.168.1.131>” –AllowHttp –EditingEnabled
注：如果输入命令报错，请重新启动电脑
-InternalURL：内网浏览地址，http://xx.domin.com 其中 xx表示计算机名 domin.com 表示域名 也可以设置为对应的IP地址
-ExternalURL：外网浏览地址
-AllowHttp： 允许80端口访问
-OpenFromUrlEnabled：允许通过url方式进行预览
-CacheLocation： 缓存文件存放路径 默认是C:\ProgramData\Microsoft\OfficeWebApps\Working\d
-CacheSizeInGB： 最大缓存文件大小 单位GB 默认为15GB
注：若http:// 192.168.1.131/hosting/discovery 能登录，http://192.168.1.131/op/generate.aspx显示“服务器错误”，控制台输入Set-OfficeWebAppsFarm -OpenFromUrlEnabled:\$true即可访问成功
![image43](d60ed96fbf3f4c5daeea2fab044554c2.png)
2.输入Y
![image44](e7895c400ae943068db5d4bc452850ea.png)
3.设置成功
![image45](9ffc5273e2f54f0ebb1051e44f6ba038.png)
4.输入设置好的地址进行访问，若显示为下图，则部署成功
![image46](ba45fac33bf04e2bb9a0fdbd74de4998.png)
### <span style='color:#5B9BD5'>[2.2.2](https://blog.csdn.net/q386815991/article/details/81705128) 文档地址配置</span>
1.由于微软这款软件对IP有访问限制，所以需将IP转化为域名进行访问，所以需要进行配置，来让软件自动进行域名转化为IP，具体路径如下
注：此IP是指要访问文档路径的IP
![image47](e54db74312394ceab8e5f9a1e8a6956a.png)
2.打开hosts文件，在其中添加对应IP和自定义的域名，即可访问
![image48](8fd4f2633f2242638d553ba1c24f2cf4.png)
### <span style='color:#5B9BD5'>[2.2.3](https://blog.csdn.net/q386815991/article/details/81705128) 大文件转码配置（必须配置）</span>
1.安装后的office online server 对大文件会有限制，所以需要配置才能进行访问，具体配置路径如下

![image49](3191819a161f4fc6acad56caa06676d4.png)
![image50](9312d97ae1d34a619b642cacd46af8b7.png)
2.将上面两个文件夹中的settings文件进行修改，在其中填入并保存
OpenFromUrlMaxFileSizeInKBytes=(System.Int32)512000
注意后面不要加分号
![image51](7f420399737c4f158fce92d9e330413b.png)
3.配置完成后打开CMD命令，输入services.msc打开服务，并找到office online服务
![image52](118ab893cfc542ac95929ff395405afe.png)
4.右键重启服务即可
### <span style='color:#5B9BD5'>[2.2.4](https://blog.csdn.net/q386815991/article/details/81705128) 访问文档是否可以进行转码</span>
例：
<http://myscloud.cn/test.xlsx>
1.将上述网址填入第一行，然后点击create link即可生成浏览网址
![image53](040c6d5eeb3841f1b73f20e46f6e223d.png)
2.点击test this link进行测试
![image54](855ce1e875e54277ac811c0c7f7133c6.png)
3.浏览文档
![image55](33241f67bf764c3abb5660e0c2a727e2.png)

