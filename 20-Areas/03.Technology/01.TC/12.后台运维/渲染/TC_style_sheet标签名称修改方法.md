---
title: TC_style_sheet标签名称修改方法
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:47
---

TC_style_sheet标签名称修改方法
2018年11月2日
8:49

## TC style sheet标签名称修改方法 
原创： 联宏科技 [UGITC](javascript:void(0);)
![image1](8f67e519e5cc4e2faef4333133c9bd54.jpg)
«span style='font-weight:bold;background: \#59C3F9'»作者：常勇  审校：张玮琦«/span»
**测试版本：TC11**
在TC的项目实施过程中，用户经常会根据自己公司的实际情况提出一些非常细节的需求。例如，用户提出对style sheet中的某个tab名称进行修改。那么在TC中如何修改style sheet中的标签名称呢？在什么地方进行修改？操作部署是什么？
本文将介绍具体的修改过程。例如，用户需要修改Item revision master form的属性样式表中tab常规的显示名称，将“常规”修改为“设计属性”，如下图中红框内容所示：
![image2](0d8f09e4eed245c8a96da91db68ed539.jpg)
修改步骤如下：
S1
首先在系统中找到该对象对应的样式表。Item revision master form默认对应的样式表为：Form。通过搜索找到Form样式表，如下图所示：
![image3](700ec47329354289bfd353f06b7a36dc.jpg)
通过类型XMLRenderingStyleSheet查找到Form样式表。
S2
查看Form样式表，找到常规对应的titlekey值。如下图所示：
![image4](ea182381b8144374b2081a0c8d72127e.jpg)
S3
在%TC_ROOT%\lang\textserver\zh_CN 下找到文件：tc_xrt_text_locale.xml
S4
通过之前找到的常规对应的titlekey，在上述文件中查找到具体的值。
S5
修改该文件中的常规为设计属性，保存。
S6
清空Server端与客户端缓存文件，并重新生成客户端meta cache。
S7
重新登录TC客户端，查看效果。如下图所示：
![image5](a20cff723075474997328f13f3fc2dba.jpg)
通过上面介绍的修改方式，即可修改stylesheet中标签对应的名称，满足用户具体的需求。
![image6](d61a3e8571864c9dbe040cad4a3928e5.jpg)
![image7](930378a07abf46458ce7a4224add9391.jpg)

联宏科技
[赞赏](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655036750&idx=4&sn=eb9a3b598e9d64ee45a79b05457501b3&chksm=81543fe6b623b6f0e86a9384d5b8462f86c29e7e071ffd3c6f158f74f02ef0567dec74843ae8&mpshare=1&scene=1&srcid=1127K7gvOTmmgwQWQ4AYqjhU##)
长按二维码向我转账
![image8](5c02916504b64fe3a987a4e256d32824.png)
受苹果公司新规定影响，微信 iOS 版的赞赏功能被关闭，可通过二维码转账支持公众号。
阅读

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
即将打开""小程序
[取消](javascript:void(0);) [打开](javascript:void(0);)
From \< <http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655036750&idx=4&sn=eb9a3b598e9d64ee45a79b05457501b3&chksm=81543fe6b623b6f0e86a9384d5b8462f86c29e7e071ffd3c6f158f74f02ef0567dec74843ae8&mpshare=1&scene=1&srcid=1127K7gvOTmmgwQWQ4AYqjhU#rd>\>
