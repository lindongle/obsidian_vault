---
title: <span style='color:#2E75B5'>【技术应用】安装TC12安全服务实现与AD域集成 </span>
updated: 2026-07-31T10:03:18
created: 2026-07-05T17:04:52
tags:
  - TC
---

# <span style='color:#2E75B5'>【技术应用】安装TC12安全服务实现与AD域集成 </span>
  Teamcenter可以实现与AD与集成，实现单点登录，本文将描述如何安装TC12的安全服务，其他版本TC安装安全服务也类似。如果安装过程出现问题，请参考TC官方安装手册。

前提条件：
1\. 需要四层架构，已经安装TC web服务
2\. 启用AD域集成后，需要TC的用户名和AD域的用户名一样
3\. 对应版本的安装介质

1， 安装TC安全服务
1\. 拷贝文件，安装文件放在additional_applicationssso目录下：
![image1](e20cb86c4aca46c286b34786b65cf728.png)
a\) 创建WEB_ROOT目录，这个目录用来存放我们需要安装的Login Service和Identity Service文件。比如：d:webbase.
b\) 解压上面TcSecurityServices12.0_20180319.zip到WEB_ROOT目录
c\) 在解压的目录中找到install_tcweb.exe和install_sso.exe文件。分别双击install_tcweb.exe和install_sso.exe，如下图所示。
![image2](2975514cb5b940619052f8013ccf196e.png)
2\. 执行Web Applicaton Manager.
a\) 切换到WEB_ROOT目录，并执行insweb.bat文件。
b\) 打开Web Application Manager窗口：
![image3](dd4b00926254433d993a7b74b6ea160f.jpg)
3\. 创建Login Service
a\) 修改默认服务的名称和路径:
![image4](2d6e8ab2f8364f0a9aa9ab13eac4b23a.jpg)
b\) 修改高级选项:
![image5](56b0bbac0f224595a936dc4ea4b1820c.jpg)
c\) 选择磁盘路径，指向安装文件目录下存放install_tcweb.exe和install_sso.exe的文件夹，如下图所示：
![image6](0784684356e4439e8efda168cf73541a.png)
d\) 选择解决方案类型，默认为瘦客户端
e\) 选择解决方案：勾选Login Service Web Application
![image7](ff692dbd374e4b14ad20a24c519b7661.png)
f\) 点确定。
4\. 创建Identity Service
a\) 步骤类似Login Service
![image8](515a5ed8ffa94eebac2af144e113e8bb.png)
![image9](be20fbce27fa4a2881ab6bc3be20f560.png)
b\) 完成点确定:
![image10](ccaf03ef53b044d08ce5b8b17d1d0534.jpg)
2， 安装LDAP服务器
启用Windows 活动目录（AD）。
在Teamcenter系统里建立Administrator用户供浏览。
3， 配置安全服务
1\. 配置Login Service关联参数，仅修改webmaster和tcsso.login_service.sso_service_url栏，同时记住tcsso.login_service.appid的值。其中，tcsso.login_service.sso_service_url栏为Identity Service的访问路径。
![image11](a8c51a3237b04748afa8f9400472e222.png)
2\. 配置Identity Service关联参数，关注红框内的值，跟LDAP 服务器设置有关。
a\) 设置 LDAP configuration

![image12](6b3f5e00b3954a0ebe29329345ad09bd.png)

![image13](d3db6775acd94dbea43396c79a1981b5.png)
![image14](7195ca56a33942d5b43ad85b2810e538.png)
![image15](d9c4da3e27f44c158dc5d45c247b8b6f.png)
3\. 配置Identity Service关联表:
修改Application Registry，注意TCSSOLoginService行，此Application ID即为Login Service关联参数表中tcsso.login_service.appid的值；Teamcenter2行，此Application ID即为Teamcenter应用程序的Application ID。
![image16](56755ee8fbca4415b01298295f04bf8e.png)

4\. 修改Teamcenter Web Tier关联参数表，关注红框内的值，与安全服务相关：并重新生成可部署的文件。IS_SSO_ENABLED改成true
![image17](79163018a6f04635b3de9d8110f086b6.jpg)
![image18](c4e9da4985294ebea5e379c660e54032.png)

5\. 修改%TC_DATA% c_profilevars.bat，添加2行，对应SSO Service。如果注释掉，则安全服务不生效。
![image19](83f43dfe4a664fa8b6ab5c3b644301c6.jpg)

4， 部署服务
在weblogic中部署Login Service 和Identity Service服务，并重新部署Teamcenter Web Tier服务。
![image20](ff61dfe6e69d434681e035ff6c9caadb.jpg)
![image21](fb1378c3fa634e84b52f77c69be2f682.png)
![image22](b936efc610ff4b09b04617f17fe4f3ff.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image23](69bb17dda7614ad1b7b6e700595254f4.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
## *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
【技术应用】安装TC12安全服务实现与AD域集成
最多200字，当前共字
发送中
[留言](javascript:;)
相关阅读
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
正在加载
以上推荐为优质及原创文章

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzIzMjE2MjMwNw==&mid=2247484899&idx=5&sn=ae63a9f53363baf4510210cf24cdcb45&chksm=e898508fdfefd999fe05837c4843af3ffe9b79eed82d4038738e3d56b7b1bbcac08309c23340&mpshare=1&scene=1&srcid=&sharer_sharetime=1583903586315&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzIzMjE2MjMwNw==&mid=2247484899&idx=5&sn=ae63a9f53363baf4510210cf24cdcb45&chksm=e898508fdfefd999fe05837c4843af3ffe9b79eed82d4038738e3d56b7b1bbcac08309c23340&mpshare=1&scene=1&srcid=&sharer_sharetime=1583903586315&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
