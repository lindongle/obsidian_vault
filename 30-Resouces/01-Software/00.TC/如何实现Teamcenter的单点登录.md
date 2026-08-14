---
title: <span style='color:#2E75B5'>如何实现Teamcenter的单点登录 </span>
updated: 2026-07-31T10:03:23
created: 2026-07-05T17:04:52
tags:
  - TC
---

如何实现Teamcenter的单点登录
2019年10月26日
0:11

# <span style='color:#2E75B5'>如何实现Teamcenter的单点登录 </span>
![image1](0fdbce87d3b340a687c1bc68634b42cf.gif)

作者：leo 校对：Jeff  
单点登录（Singel SignOn），简称为SSO，是比较流行的企业业务整合的解决方案之一。通过SSO，当企业中存在多个系统时，用户只需要登录一次就可以访问所有相互信任的应用系统，这样的登录方式可带来以下好处，首先就是可以提高用户效率，用户不再受多次登录不同系统的困扰，也无需去记忆不同系统的用户名和密码，甚至可减少用户因忘记密码而发起重置密码的工单申请，其次是简化管理，减轻用户帐号的管理负担。
![image2](264fd90766e742ae9bf6b945d42275c5.gif)

Teamcenter提供的Security Services组件可以实现单点登录的需求。为便于大家对Teamcenter单点登录配置有一个较好的理解，下面将以两层架构的Teamcenter以及非域环境为例，对其中的主要配置步骤做个简单的说明。

1.安装Directory Service  

可从Apache网站下载Apache DS安装程序，安装完成后，可在计算机服务中看到新增的【ApacheDS -default】服务，并已启动。
![image3](eee0dc3182524f98bda700851199dc1a.png)
   2.安装Apache Directory Studio
同样的，从Apache网站下载相应的程序，根据提示完成安装。完成后，将弹出图示的欢迎界面。
![image4](466005b7709b46778fb6239d18d418b3.jpg)
3.配置LDAP
LDAP的配置首先是先建立一个新连接，然后建立图示中的组织和用户。
![image5](6edf539e750049e5828ec15d0e4550e5.png)
4.测试连接
通过第三方工具LDAPBrowser对刚才建立的连接进行测试，必须确保测试是成功的，方可进入下一步的配置。
![image6](245382afb9d548b0827db6ee49ba6c15.png)
5.安装Teamcenter Security Services
利用TcSecurityService安装程序，分别创建图示的两个部署包，分别是tcssologin和tcssoidentity。
![image7](3241e90596e54d26984a38bdd465788b.png)
![image8](6b269bafb2764455a05dbe733912662f.png)
6.测试部署包
将上一个步骤中产生的部署包复制到Tomcat中，以便检查identity服务和Login服务是否已经正常启动并运行。
![image9](72f4118134ef42a6b2d03cd834962cab.png)
![image10](49993450bf69480da2c8373a6f0264db.jpg)

7.配置身份识别和登录参数
经过上一步骤的测试，两个服务均可正常启动运行后，接下来就是对具体的参数进行配置，并将重新产生的部署包复制到Tomcat中。
![image11](fe5622ad4fbf4ce89ff8876ff9fba978.png)
8.安装Teamcenter Security ServicesSession Agent
根据提示完成安装，启动SessionAgentStart.bat，可在桌面右下角看到图示的图标，表明Session Agent已经正确安装。
![image12](f4e130770d364a62aa6f288fa41cab01.png)
9.更新Teamcenter环境配置
在tc_profilevars.bat以及client_specific_properities中，设置如下变量，以便在启动TC时，可跳转到刚才部署的web服务。
![image13](1d0c454043c6405680c27b063b9b309a.png)
10.验证SSO登录
完成上述配置后，即可进行Teamcenter单点登录的测试。双击Tc图标，启动Teamcenter，这时系统会弹出一个浏览器界面，根据提示输入帐号密码，即可直接登录Teamcenter。
![image14](a88df5dbbdbf4dc7a0d46721f5052b2c.jpg)
只要不关闭图示的浏览器，即使中途退出了Teamcenter，下次启动时，也无需再输入密码了。
![image15](f807faf1ff484c7cadf3eb67674a00e3.png)
同样的，与Teamcenter集成的第三方工具，例如Office、Solidworks，在进行相应的登录认证配置后，也不再需要输入账号密码即可实现登录。当计算机在域环境下，我们还可以通过进一步配置，通过登录计算机而登录应用程序。
<span style='background:white'>- END -</span>

<span style='background:white'> ▼关注我们，发现更多精彩▼</span>

«span style='background: \#60ADEF'»关于今宏科技«/span»
<span style='background: white'>广州今宏信息科技有限公司（Gohope）为致力提升企业竞争力的制造型企业及经理人打造一个综合的技术服务平台。帮助企业建立强大的产品研发体系，促进制造企业技术转型，提高运营效率、降低复杂度，从而帮助制造企业加快产品上市时间。</span>
![image16](fa59c03c84a94f049c75493e807e2297.jpg)

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image17](2d0acbb13f524f2da8b2c82899bb19d0.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
## *<span style='color:#5B9BD5'>发布到看一看 </span>*
发送
最多200字，当前共字
发送中
[留言](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzU3NzkxODA1OA==&mid=2247484896&idx=3&sn=ec29cf317396c83b91bfff202aa1fb91&chksm=fd7c00e5ca0b89f3133a79e12b4c6ac489306fbba15b5a132c7f336f42cea50384ced048cbd9&mpshare=1&scene=1&srcid=1026ixVb5DGXOW0bBK4xrZFG&sharer_sharetime=1572019895664&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzU3NzkxODA1OA==&mid=2247484896&idx=3&sn=ec29cf317396c83b91bfff202aa1fb91&chksm=fd7c00e5ca0b89f3133a79e12b4c6ac489306fbba15b5a132c7f336f42cea50384ced048cbd9&mpshare=1&scene=1&srcid=1026ixVb5DGXOW0bBK4xrZFG&sharer_sharetime=1572019895664&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
