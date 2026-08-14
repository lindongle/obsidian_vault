---
title: 如何通过Internet访问公司的TC系统
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:52
tags:
  - TC
---

## <span style='color:#2E75B5'>如何通过Internet访问公司的TC系统 </span>
现在有越来越多的人选择或被迫在家工作。那么在家里能否访问公司的TC系统呢？如果有VPN，就相当于在公司，无需多说。但是如果没有VPN，其实员工也可以访问公司的TC系统，这就需要管理员帮忙设置了，方法如下：

# <span style='color:#1E4E79'>1准备工作</span>
## <span style='color:#2E75B5'>1.1公网IP地址</span>
公司必须拥有自己的公网IP地址，例如202.65.21.50。如果没有，需要向电信公司申请，公网IP地址是非常宝贵的资源，几乎已经耗尽。如果采用第三方的工具，如“花生壳”，请参照本文自行研究。

## <span style='color:#2E75B5'>1.2TCRS系统</span>
公司必须已经成功部署TC系统，建议部署TCRS。如果是TC，请确保能支持四层架构。
记录下TC服务器的计算机名和内网IP地址。
例如tcserver 192.168.72.10

## <span style='color:#2E75B5'>1.3固定许可证VENDOR端口</span>
此操作在需要用到CAD集成（如NX集成、SW集成）的情况下才需要操作。固定许可证Vendor端口的作用是为了让CAD集成获取到许可证。

修改许可证文件，如c:\\ C:\Program Files\Siemens\PLMLicenseServer\splm11.lic
将
VENDOR ugslmd
修改为
VENDOR ugslmd PORT=28002

## <span style='color:#2E75B5'>1.4在TC服务器上确认端口已开放</span>
如果TC服务器设置了防火墙，请确认下面的端口已开放。在局域网内TC客户端能访问的情况下，不需要设置。
![image1](92c309d4612e4d6ab4394ea548518daf.png)

![image2](b49547f21eae475bad5fa117f9be03b4.png)

| 规则名称    | 开放的端口 |
|-------------|------------|
| TCAWC       | 8002       |
| TCLIC       | 28000      |
| TCLicVendor | 28002      |
| TCFSC       | 4544       |
| TCWEB       | 8080       |
# <span style='color:#1E4E79'> </span>
# <span style='color:#1E4E79'>2路由器端口映射</span>
此操作在公司的内外网连接的路由器上操作
需要映射上面5个端口
![image3](0d9c49d36ff84943b63bbfcadb36eeeb.jpg)

# <span style='color:#1E4E79'>3TC客户端计算机操作</span>
修改客户机的C:\Windows\System32\drivers\etc\Hosts文件，添加一条记录，例如
202.65.21.50 tcserver

# <span style='color:#1E4E79'>4测试</span>
在客户端计算机上打开TC客户端登录，测试胖客户端和AW客户端。如果能够成功登入，表示设置成功。

关注KigerPLM，学会随时随地访问PLM系统。

Kiger
您的支持，我的动力


人赞赏
上一页 [1](javascript:;)/3 下一页
长按二维码向我转账
您的支持，我的动力

受苹果公司新规定影响，微信 iOS 版的赞赏功能被关闭，可通过二维码转账支持公众号。
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image4](b69bfe29e3404ba982f281077680b2ba.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
如何通过Internet访问公司的TC系统
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
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzI4MDYyNDY1Mw==&mid=2247485332&idx=1&sn=d824f503530461832592ab59d3ca4686&chksm=ebb4ecf6dcc365e05a37e27f2b8486d9cac961b4c24ad3ec3f4354977b7414c2f5c58369bc16&mpshare=1&scene=1&srcid=&sharer_sharetime=1583384975074&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzI4MDYyNDY1Mw==&mid=2247485332&idx=1&sn=d824f503530461832592ab59d3ca4686&chksm=ebb4ecf6dcc365e05a37e27f2b8486d9cac961b4c24ad3ec3f4354977b7414c2f5c58369bc16&mpshare=1&scene=1&srcid=&sharer_sharetime=1583384975074&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
