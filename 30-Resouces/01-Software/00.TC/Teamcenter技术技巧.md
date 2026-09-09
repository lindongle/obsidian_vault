---
title: Teamcenter技术技巧
updated: 2026-06-06T10:08
created: 2019-08-06T23:37:29
tags:
  - TC
---

## <span style='color:#2E75B5'>Teamcenter技术技巧 </span>
***1. 安装低版本的安全会话代理应用时出现错误***
问题：
在已安装有TC11.5 或者更高版本的安全会话代理应用的客户端电脑上，安装低版本的安全会话代理应用时出现错误
中止：所用系统上已安装有该产品的一个或多个新版本。故无法升级
![image1](8bebdcd1ddaf4b0e9bd21f089720f0b8.jpg)
解决版本：
众所周知，安全会话代理程序是一个InstallAnywhere 应用程序，它使用自己的注册文件来进行安装。
清理已安装的应用的方法是：
在C:\Program Files\Zero G Registry 文件夹中找到注册文件
(.com.zerog.registry.xml)。该文件和文件夹是隐藏的。因此你需要变更文件夹选项来显示隐藏的文件夹和文件。
删除Zero G Registry 文件夹。
![image2](f84a37aa45d34550b266b3d3068931cd.jpg)
***2. 如何根据FCC子网掩码配置客户端IP地址***
为已有的或者新加的客户端电脑配置了新的IP，fmsmaster文件中的clientmap标记往往会被忽略，可能造成潜在的FCC问题
子网掩码是一个32位数字，它标识了一个IP地址，将IP地址分割为网络地址和主机地址通过设置网络字段为1和主机字段为0来组建子网掩码
下例展示了一个使用了新IP地址的客户端电脑，并通过一些有用的命令来找到真正的原因。
FCC无法启动
![image3](25691c2f8873473197029c043f18778c.jpg)
客户端电脑可以ping到FSC的URL地址
![image4](a82c52639e494fd0a29cb2d594495132.jpg)
客户端电脑的IP地址是 134.244.98.110  

![image5](cb5c6f16344d43a3a3f793cdb7ce95d2.jpg)
在FSC 组中验证该IP地址，失败
![image6](1433ca775ae44977970bdb1f8763a901.jpg)
客户端不属于FSC组
![image7](710b5999d62f4961994abd904192d779.png)
请求FMS主配置文件，正常
注意子网掩码是255.255.255.192
![image8](87e1dfd37f0d4a38bc9fb96301ce32c9.jpg)
子网掩码255.255.255.192中指定的主机地址范围是每个子网有62的个主机 主机地址范围从134.244.98.1 到134.244.98.62 客户端IP地址134.244.98.110 不在这个范围内
fmsmaster clientmap需要更新来包含该地址范围
下面是在子网掩码包含客户端IP地址后的正常的响应
![image9](0749eef7b31c4dfcb0c020e1d6a57bad.jpg)

阅读
在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *<span style='color:#5B9BD5'>朋友会在“发现-看一看”看到你“在看”的内容 </span>*
确定
![image10](3a3b6e7295e84509830ef7aab739585c.png)
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMjUyOTUwMw==&mid=2649882548&idx=1&sn=5c79d6812473e16fdecc35ea6839d48c&chksm=82cc5e04b5bbd7128a0dd1e57c79f74b1de441f0e46f4911333e9e85f972177bf5a5301c6857&mpshare=1&scene=1&srcid=&sharer_sharetime=1565105843928&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMjUyOTUwMw==&mid=2649882548&idx=1&sn=5c79d6812473e16fdecc35ea6839d48c&chksm=82cc5e04b5bbd7128a0dd1e57c79f74b1de441f0e46f4911333e9e85f972177bf5a5301c6857&mpshare=1&scene=1&srcid=&sharer_sharetime=1565105843928&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
