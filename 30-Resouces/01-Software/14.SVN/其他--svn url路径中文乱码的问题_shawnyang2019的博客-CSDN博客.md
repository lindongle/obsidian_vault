---
title: 其他--svn url路径中文乱码的问题_shawnyang2019的博客-CSDN博客
updated: 2026-06-06T00:25:36
created: 2026-07-05T17:04:55
---

其他--svn url路径中文乱码的问题_shawnyang2019的博客-CSDN博客
星期二, 四月 13, 2021
3:30 下午
已剪辑自: <https://blog.csdn.net/shawnyang2019/article/details/102494858>
最近参与工作中需要使用SVN的patch功能来code review.安装了1.7.9版本的TortoiseSVN以后发现修改代码以后然后打patch,patch中的中文会变成乱码。
不解，询问同事以后被告知先试试安装中文包，不行再换个版本。似乎他们以前也有类似问题。
照做以后依然没法解决乱码问题。然后上网查询发现看到有说要加环境变量LANG=zh-CN.UTF-8(即我的电脑-右键属性-高级系统设置-高级-环境变量-新建(XX的用户变量/系统变量都可以我是加在xx的用户变量中)-变量名：LANG变量值:zh_CN.UTF8。
保存以后依然问题存在，然后发现网上帖子说变量值改为en_US.UTF-8以后可以解决，果断试验，问题解决，太神奇了。网上资料不足，也无法考证究竟是什么原因造成的，姑且用着。
设置LANG环境变量试下  
LANG=zh_CN.GBK
[添加链接描述](https://blog.csdn.net/tianya2010ji/article/details/50394457)  
[添加链接描述](https://bbs.csdn.net/topics/390915466)
