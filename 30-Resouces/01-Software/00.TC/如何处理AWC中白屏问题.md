---
title: 如何处理AWC中白屏问题
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:52
tags:
  - TC
---

## <span style='color:#2E75B5'>如何处理AWC中白屏问题 </span>
![image1](80961243c1a347509ee8d0e091ffba7f.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：陈嘉颖 审校：陈泓希«/span»
**适用版本：AWC3.4**

用户在使用AWC的时候出现下图中的白屏问题如何处理。

![image2](ea6105b84ac94204b04acf3cc93a712c.jpg)
**解 决 方 法  
  **

![image3](999268f1a2cf471a9eaab58746079644.png)
需要确保用户已经登出胖客户端和AWC，使用控制台将白屏用户的踢出资源池。
![image4](aef31d73e480491da1aba3e118429cb7.png)
![image3](999268f1a2cf471a9eaab58746079644.png)
在TC的命令行中键入preferences_manager -u=infodba -p=infodba -g=dba -mode=clear -scope=USER -target=白屏用户名
![image5](54bc7f40d5ba49129e986859c667a859.png)
![image3](999268f1a2cf471a9eaab58746079644.png)
登陆AWC查看白屏问题已被解决
![image6](101a98392c5442c882bf87a4bbab9653.png)
如果将AWC_search_automatic_wildcard的值设置成0
![image7](e54d381f99a3472d8312061922207619.png)
在AWC的搜索栏中输入AWCTEST，执行“AWCTEST”的搜索命令。
![image8](136c949041444e37b512ac3e6d8a95ac.png)
如果将AWC_search_automatic_wildcard的值设置成1
![image9](7e9a4fcc6a8146fdb9547dad6f2941ef.png)
在AWC的搜索栏中输入AWCTEST，执行“AWCTEST\*”的搜索命令。
![image10](e3a2e1e8f7324ee5aaf4d82a1786c013.png)
如果将AWC_search_automatic_wildcard的值设置成2
![image11](d0e6db1509684f55b6d9a89dd55eb4fd.png)
在AWC的搜索栏中输入AWCTEST，执行“\*AWCTEST”的搜索命令。
![image12](d53e3c9deea64484a2764fe1148047c7.png)
如果将AWC_search_automatic_wildcard的值设置成3
![image13](8189bff2a0514bc5bb672dadce5968b9.png)
在AWC的搜索栏中输入AWCTEST，执行“\*AWCTEST\*”的搜索命令。
![image14](87bdac91890848f18ff75f22a1c45c53.png)
<span style='color:#FEFEFE;text-align:center'>**关注我们**</span>
![image15](3c25ea91f4e045dba8217bb5cff2004c.png)
![image16](a3aa76109174477fb32738a6dbb96368.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image17](caf45ec5d9764d7a8faba163ca632d2e.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
如何处理AWC中白屏问题
最多200字，当前共字
发送中
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
**微信版本过低**
当前微信版本不支持该功能，请升级至最新版本。
[我知道了](javascript:void(0);) [前往更新](javascript:void(0);)
确定删除回复吗？
[取消](javascript:;) [删除](javascript:;)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: https://mp.weixin.qq.com/s/lJNw6Lj3GaOSB_HabBwTTw\>](https://mp.weixin.qq.com/s/lJNw6Lj3GaOSB_HabBwTTw)
