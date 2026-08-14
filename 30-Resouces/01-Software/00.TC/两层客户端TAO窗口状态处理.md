---
title: 两层客户端TAO窗口状态处理
updated: 2026-06-13T22:08:29
created: 2026-07-05T17:04:52
tags:
  - TC
---

## <span style='color:#2E75B5'>两层客户端TAO窗口状态处理 </span>

![image1](a8881ba1dc5d4ce2897bd27c83616c28.gif)
«span style='color:white'»**作者：陈扬鑫 审校：陈泓希  **
«/span»
**使用版本：TC8.3**
<span style='color:#338DAF'>-----</span>
![image2](85a55fee413240edb5e2bfdc74a7c4b1.png)
<span style='color:#338DAF'>-----</span>
在使用两层客户端时登陆时，伴随着登陆界面启动的还有一个黑色的窗口，这就是TAO窗口。由于客户端登陆和TAO窗口都是同时出现的，于是乎就产生他们两者之间是否有什么关系，能否控制TAO窗口的状态的想法。通过查看客户端的启动文件，了解到，其实TAO窗口实际上是启动了三个TAO服务和设置了一系列变量。其中，三个服务分别为：tcserver.exe、ImR_Activator.exe、ImplRepo_Service.exe。那么，能否通过控制这三个服务实现对TAO窗口状态的控制呢？答案是可以的。我们可以通过控制这三个服务来达到以下两个状态；第一，关闭TC后，TAO窗口也跟着关闭；第二，打开TC登陆界面是，不显示TAO窗口，让其在后台静默运行。

<span style='background:#59C3F9'>1</span>
<span style='color:black'>首先我们来实现第一个状态，通过测试发现关闭客户端的同时，只有tcserver.exe服务停止，其他两个服务仍然在运行，这就是为什么关闭客户端后TAO窗口还存在原因。既然原因找到了，那么解决方法自然就有了。只需要在start_TcServer1.bat文件在第一个goto :EOF前添加以下语句:</span>
<span style='color:black'>**taskkill /F /IM ImR_Activator.exe**</span>
<span style='color:black'>**taskkill /F /IM ImplRepo_Service.exe**</span>

![image3](10027548fdb749f9a04a0bc2946f7b3b.png)
**图1**

<span style='background:#59C3F9'>2</span>
<span style='color:black'>接着我们来实现第二个状态。在%TC_ROOT%\iiopservers目录下，有两个分别名为install_imrserv.bat和removeimrserv.bat的批处理文件。其中install_imrserv.bat就是用来安装ImR_Activator.exe 和ImplRepo_Service.exe服务的（tcserver.exe在启动客户端时会自行启动）。所以要实现第二状态也很简单，只需要以管理员运行install_imrserv.bat，这样在启动客户端的时候就不再需要重复启动这两个服务了，因此TAO窗口也不会存在了。需要恢复TAO窗口的时候，只需要以管理员运行remove_imrserv.bat就可以了。</span>
![image4](748fb4107cbc4b808745e05370e7f261.png)
**图2**
![image5](29907d829b294b8796bade19971f6fff.jpg)
![image6](53ec804a5ff540bba5492a8cb41052b5.jpg)
阅读
在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *<span style='color:#5B9BD5'>朋友会在“发现-看一看”看到你“在看”的内容 </span>*
确定
![image7](0b35e5dfa9b84a2191301ed02a7dc90a.png)
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
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655042118&idx=7&sn=249963dc8fd0c9629891d30181bc14c1&chksm=815420eeb623a9f8fe443cbc2dcc2b88ba356afebdfc370eaa69a38df9d3e4ccd478b1edcf7d&mpshare=1&scene=1&srcid=&sharer_sharetime=1567427730441&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655042118&idx=7&sn=249963dc8fd0c9629891d30181bc14c1&chksm=815420eeb623a9f8fe443cbc2dcc2b88ba356afebdfc370eaa69a38df9d3e4ccd478b1edcf7d&mpshare=1&scene=1&srcid=&sharer_sharetime=1567427730441&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
