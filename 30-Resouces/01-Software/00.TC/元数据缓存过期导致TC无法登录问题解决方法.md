---
title: 元数据缓存过期导致TC无法登录问题解决方法
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:52
tags:
  - TC
---

## 元数据缓存过期导致TC无法登录问题解决方法 

![image1](97adc12d6303427d9cc850748ae4e931.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：陈瑞航 审校：陈泓希«/span»
**适用版本：Teamcenter11**

项目实施过程中，常遇到TC客户端无法登录的情况，其中一种是元数据缓存过期导致。见下图报错信息：
![image2](44445e6674b0489fbeeabf1123de4103.png)
![image3](f3cff78637eb41c9b76bcecc39b61138.png)

**报错内容是：**客户端共享元数据缓存过期了，数据集版本59比数据库版本61低，因此，进程中元数据不可用了。◆◆**解决方法**◆◆

既然客户端缓存过期，那可以先删除原有的Metadata Cache，然后再重新生成。
![image4](d26022a2bf454da8a8a4ee2552960721.png)
在TC服务器中，打开TC管理员命令窗口，依次运行以下命令：  

generate_client_meta_cache -u=infodba -p=infodba -g=dba -t delete all
generate_metadata_cache -u=infodba -p=infodba -g=dba -force
generate_client_meta_cache -u=infodba -p=infodba -g=dba -t generate all

![image5](9fa192cba0354d37bcc7b0eb987d397b.png)

![image4](d26022a2bf454da8a8a4ee2552960721.png)
经过一段时间后，客户端Metadata Cache生成完成。

![image6](9806c962a99f497e9a3054df48c8f2d9.jpg)

![image4](d26022a2bf454da8a8a4ee2552960721.png)
最后我们再次启动TC客户端，进行登录，就可以正常登录了。

![image7](ec8407592cd9403580bb758084563581.png)

![image8](fac6434f33f04b3d814703b3279d82a8.jpg)
![image9](cea1f44e0f2348a6a49e70ff258f6994.jpg)
阅读
在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image10](d3622b281f2f48fdaeb1452ef63629b9.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *朋友将在看一看看到 *
确定
写下你的想法...
取消
#### *发布到看一看 *
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
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655042401&idx=2&sn=0e4db26f470c1f3ff11b45a2e522f59c&chksm=815421c9b623a8df1c799a887321b16179c17c2dc2f8ec09c6e2e881a2c57be696921a7aed47&mpshare=1&scene=1&srcid=&sharer_sharetime=1567427253457&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655042401&idx=2&sn=0e4db26f470c1f3ff11b45a2e522f59c&chksm=815421c9b623a8df1c799a887321b16179c17c2dc2f8ec09c6e2e881a2c57be696921a7aed47&mpshare=1&scene=1&srcid=&sharer_sharetime=1567427253457&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
