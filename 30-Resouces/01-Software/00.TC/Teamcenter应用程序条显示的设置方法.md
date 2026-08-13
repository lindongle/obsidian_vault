---
title: Teamcenter应用程序条显示的设置方法
updated: 2026-06-06T10:08
created: 2019-12-16T22:05:04
tags:
  - TC
---

## <span style='color:#2E75B5'>Teamcenter应用程序条显示的设置方法 </span>
![image1](9862d650896a413ab26e6f2b3340ee5b.jpg)
如何修改上图中红线部分的显示内容，后面一堆的空括号真是莫名其妙？
这个地方的显示组合是由appbar_title_contents首选项来控制的，该首选项可指定要在瘦客户端和胖客户端的应用程序条的标题字符串中显示的值。有效值包括：
user
指定Teamcenter 完整用户名。
userid
指定Teamcenter 登录用户名。
group
指定为已登录用户指派的组。
role
指定已登录用户的角色。
site
指定站点标识符。我们也可以直接在组织中对Site的显示名称进行修改
![image2](ebdf647277de47f6961c9f9d156ed9a7.jpg)
curr_proj
指定当前选定的项目。
prev_login_time
指定上次登录时间。
prev_session_ip
指定上次会话地址。
current_login_time
指定当前会话的登录时间。
locationcode
指定位置代码标识符。
change_notice
指定胖客户端中的当前更改通知
该首选项的默认值：
   (user  
   (userid) group/role \[site\] \[loctioncode\]\[change_notice\]
)
这下你可以根据需要进行组合了，更改后如下所示
![image3](0d3bc118a139452aa3fc5bdf86813858.jpg)

阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image4](7890a2fdefa146568da6a90e5302f6b2.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发布到看一看 </span>*
发送
最多200字，当前共字
发送中
相关阅读
[更多文章](javascript:;)

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
[确定](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzUxOTA0MDM3Ng==&mid=2247487063&idx=1&sn=0dbb33e697b4840ca3c4f6c9dab9341e&chksm=f9fef240ce897b56004eacac37e571c2824c2ff798a1a0ec95ba43c62dab1343c219b56bc347&mpshare=1&scene=1&srcid=1216momL6tomtbOtN8PKCtIV&sharer_sharetime=1576505101801&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzUxOTA0MDM3Ng==&mid=2247487063&idx=1&sn=0dbb33e697b4840ca3c4f6c9dab9341e&chksm=f9fef240ce897b56004eacac37e571c2824c2ff798a1a0ec95ba43c62dab1343c219b56bc347&mpshare=1&scene=1&srcid=1216momL6tomtbOtN8PKCtIV&sharer_sharetime=1576505101801&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
