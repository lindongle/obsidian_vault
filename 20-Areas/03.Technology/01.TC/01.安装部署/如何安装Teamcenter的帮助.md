---
title: 如何安装Teamcenter的帮助
updated: 2026-06-06T10:08
created: 2019-07-10T00:29:29
tags:
  - TC安装部署
---

如何安装Teamcenter的帮助
2019年7月10日
0:29

## <span style='color:#2E75B5'>如何安装Teamcenter的帮助 </span>

<span style='color:red'>1概述</span>
在TC的标准安装中是不包含帮助系统安装的。TC的帮助需要单独安装和配置。本文讲述如何安装TC12.1和AW4.1的帮助。

# <span style='color:red'>2在线帮助服务</span>
如果不安装帮助系统，用户可以使用Internet系统上的帮助。
TC12.1的帮助位于
<https://docs.plm.automation.siemens.com/tdoc/tc/12.1/help/>
AW4.1的帮助位于
<https://docs.plm.automation.siemens.com/tdoc/aw/4.1/aw_html_collection>
如果需要其它软件和其它版本的帮助，可以访问文档中心
<https://www.plm.automation.siemens.com/global/en/support/docs.html>
访问上述网址可能需要用户拥有Siemens颁发的Webkey

# <span style='color:red'>3何时需要安装本地网络帮助</span>
需要安装帮助系统的情况
•不能访问internet
•没有WebKey或WebKey已过期
•生产系统
不需要安装帮助系统的情况
•能访问Internet
•有WebKey
•测试系统

# <span style='color:red'>4安装帮助服务的前置条件</span>
帮助服务可以安装在一台单独的服务器上，不需要与TC使用同一台服务器
安装帮助服务需要事先安装JAVA JRE。

# <span style='color:red'>5帮助服务器软件下载</span>
您需要有Wekey才能从西门子官网下载下列软件：
<https://download.industrysoftware.automation.siemens.com/download-n.php/siemens_plm_doc_server/full_products/Win64/3.5/splmdocserver035.zip>
![image1](24a43ffef35e456faaa0be6756e75d5c.png)

运行splmdocserver文件夹中的setup.exe，按默认方式安装
![image2](47a5f042466a480993a52f25246a9002.jpg)

使用默认的端口
![image3](51431791d2404ccd946d10e4de6d85a2.png)

请注意安装具体的文档时，安装界面的语言要使用英文，不要使用中文。否则会报错。

# <span style='color:red'>6安装TC的帮助</span>
您可以安装TC12.0帮助的中文版或者TC12.1帮助的英文版，或者同时安装。
<https://download.industrysoftware.automation.siemens.com/download-n.php/teamcenter/full_products/Teamcenter12/Teamcenter12/Tc12.0.0.0_pub_chinese-simplified.zip>
![image4](30cfaf670e57429e9294ede1cf81181b.jpg)

<https://download.industrysoftware.automation.siemens.com/download-n.php/teamcenter/product_updates/SP_MP_MinorRelease/Teamcenter12/12.1/Tc12.1.0.0_pub.zip>
![image5](5bac5e1b5a2b4cb3a351b3ed2f8011e6.png)

有三部分帮助可以安装：普通Help适合于与软件一同使用，PDF适合于学习或打印，Developer References用于开发和定制。
![image6](56e422b7023e45cd9be36d5e971897a3.jpg)

![image7](840668c3c9504810940ebcb86fd27bde.jpg)
![image8](b88d423e27874ab998d71eb04a7f93b1.jpg)
![image9](cbfad1800fac4d208992155c31465241.jpg)
安装后的路径如下，你应该将localhost改为服务器的计算机名，便于从其它计算机上访问。
![image10](f186b679fb5946bc824473b383f77346.jpg)
![image11](db0dac935bd04e47b6f2cee0a8e8484c.jpg)
在TC胖客户端的安装过程中，可以在Rich Client Setting中设置帮助文件的路径。也可以在安装完成后通过TEM修改。  

![image12](bb7995c1f60e46cb9ace62136b7093e0.jpg)
![image13](11f6fde3b7494dccbadc4171676105ab.jpg)

# <span style='color:red'>7安装AW的帮助</span>
Active Workspace的帮助是单独安装的，不包含在TC的帮助中
<https://download.industrysoftware.automation.siemens.com/download-n.php/teamcenter/full_products/Teamcenter12/ActiveWorkspace/4.1/4.1/Tc12.0.0.0_ActiveWorkspace4.1_pub_simplified-chinese.zip>
![image14](cb394fe8ac5047f4a80338a1ae08ccfd.jpg)

运行splmdoc_install.exe，语言请选择English
![image15](b90ad749e4ce47f9be98250d0b29c2bc.png)

选择Custom，选择Html或PDF
![image16](f30259f0633746aea62fffeda77db4c7.png)

用户使用时，应该将localhost改为服务器的名字，例如
<http://awcserver:8282/tdoc/aw/4.1/aw_html_collection#uid:index>
界面如下：
![image17](6df18e55d796416b8de761ecd8863aaf.jpg)
在AW中访问帮助是点击下面的瓷砖：
![image18](8f1ea9b54a6e46e898cfacc193b0731c.jpg)
设置的方法是搜索Help对象  

![image19](b21e54babf244107a742629fc7dbb1eb.png)

找到Help对象的Tile Template属性对应的Awp0QuickStartTemplate对象。
![image20](57be89d38daa454dae242da8c9bb02fb.png)

将Awp0QuickStartTemplate对象的Action属性修改为内网帮助的路径。

<span style='color:red'>更多信息，欢迎关注KigerPLM微信公众号。如果有问题，请留言。</span>

Kiger
您的支持，我的动力

上一页 [1](javascript:;)/3 下一页
长按二维码向我转账
您的支持，我的动力

受苹果公司新规定影响，微信 iOS 版的赞赏功能被关闭，可通过二维码转账支持公众号。
阅读
分享 在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *<span style='color:#5B9BD5'>朋友会在“发现-看一看”看到你“在看”的内容 </span>*
确定
![image21](967e6a2589974f52aacaec4615e20783.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *<span style='color:#5B9BD5'>朋友将在看一看看到 </span>*
确定
写下你的想法...
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
确定
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
即将打开一个新页面
[取消](javascript:void(0);) [允许](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzI4MDYyNDY1Mw==&mid=2247484851&idx=1&sn=fae7aa98528e67da6f89057ec0bb065a&chksm=ebb4eed1dcc367c7d3477911f68a0e9e6b67126d813bf1a7913907bbe676bce6db79dfca92b7&mpshare=1&scene=1&srcid=0710Q97cOthThUFmn8r6YtG3#rd\>](http://mp.weixin.qq.com/s?__biz=MzI4MDYyNDY1Mw==&mid=2247484851&idx=1&sn=fae7aa98528e67da6f89057ec0bb065a&chksm=ebb4eed1dcc367c7d3477911f68a0e9e6b67126d813bf1a7913907bbe676bce6db79dfca92b7&mpshare=1&scene=1&srcid=0710Q97cOthThUFmn8r6YtG3#rd)
