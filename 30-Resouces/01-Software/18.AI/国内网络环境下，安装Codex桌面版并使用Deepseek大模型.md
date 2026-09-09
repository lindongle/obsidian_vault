---
author: 相声1
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzI5MDExODA5NA==&mid=2648352710&idx=1&sn=98ab5da8995a0490c0ef8696986b3cb1&chksm=f5d8ea67842d1db76d1b198b89b4792a75d971779b6ac3e0d63d9a0860490e42ca207b59a2bc&mpshare=1&scene=1&srcid=07043UwjPpCW4jX94wfNHM5W&sharer_shareinfo=08ff37d5bc1c851329fd8003b42f4c93&sharer_shareinfo_first=08ff37d5bc1c851329fd8003b42f4c93#rd
Created: 2026-07-04 07:07:31
tags:
  - 笔记同步助手
id: 505ecfcb-58f6-4d71-96dd-45e3c34e3527
title: 1.Codex桌面版（本体）
created: 2026-07-04T11:35:36+08:00
updated: 2026-07-04T13:36:52+08:00
---

公众号名称：相声的技术备忘录

作者名称：相声1

发布时间：2026-06-27 10:00

由于公众号推送机制调整，未设置星标的账号将被降低权重。

大家关注的号都多，为了咱们这点技术交流不被淹没，麻烦动动手指标个星⭐。

操作只需3步，看图一秒搞定。

![[99-Assets/fc427d12dc9715127b93d07bf8153e69_MD5.jpg]]

  

---

  

Codex作为一款AI辅助编程工具，最近比较火爆，于是花了点时间，安装体验了一下。

本文记录下可能会踩的几个坑，供大家参考。

OpenAI 给 Codex 做了四种版本，对应不同人群：

-   CLI（命令行）：终端里跑，轻量，适合脚本党
    
-   VS Code 插件：本来就在 VS Code 里写代码的直接用
    
-   桌面 App（今天的主角）：独立的"多 Agent 指挥中心"，能直接读文件、跑命令、并行开多个任务
    
-   Web 版：浏览器打开就能聊，不用安装
    

  

我不习惯使用命令行，所以使用桌面版的试试。

Codex是国外的，国内直接连不太顺，而且自带的GPT-5.3之类的模型价格比较贵，所以我使用Deepseek来替代其自带的模型。

  

---

  

0

先说我的环境

操作系统：Windows 10 企业版 LTSC，版本号21H2，操作系统内部版本19044.6093

要准备的几样东西：

# 1.Codex桌面版（本体）

# 2.CC Switch（用来把 Codex 的 OpenAI 请求转去 DeepSeek）

# 3.Deepseek的API Key（自己去官网申请，过程不细说了）

# 4.Codex++（测试后感觉不太好用，不如CC Switch方便，仅为个人观点）

  

---

  

下面开始安装

1

# 一、装 Codex 桌面版（LTSC 用户的弯路在这里）

## 1.1下载Codex

Codex的Windows版本只有一个下载渠道，那就是微软应用商店。

![[99-Assets/6ff650a769b60c4fcd9b4356d5504238_MD5.png]]

我的电脑是LTSC版本，没有自带的应用商店，点击网页上的下载按钮，得到的是一个1.2MB的Codex Installer.exe。

双击运行，会提示“出现问题，需要重试，我们将转到Microsoft Store以完成下载”，然后就自动关闭了窗口，就没有然后了。

![[99-Assets/1cc9fb685d0a8a70a08b99a9a39d34b2_MD5.png]]

我在网上搜索了一下，有人使用网盘分享了安装包，但是我不想下载别人网盘里转存的版本，一是担心有病毒之类的，二是我没有网盘会员，下载比较慢。

所以找了一个可以在线搞定离线包的网站：https://lixian.online/msstore

把Codex在微软应用商店的地址复制进去，就可以解析下载了。

附上Codex在微软应用商店的地址：

https://apps.microsoft.com/detail/9plm9xgg6vks?referrer=psi&hl=zh-CN&gl=CN

![[99-Assets/1b2f945bb95171978a3ee2d5c4e289eb_MD5.png]]

如上图所示，解析后从下拉框中选择第4项，点击下载按钮就可以下载了。

![[99-Assets/f91868a6750a818012d5420312e6ed89_MD5.png]]

下载速度还挺快，能达到20MB/s。

不过通过这种方式安装的 Codex 不会自动更新，未来需要手动下载新版本重新安装。

  

## 1.2安装Codex

下载下来的文件名是

OpenAI.Codex\_26.616.6631.0\_x64\_\_2p2nqsd0c76g0.msix，共有649MB。

![[99-Assets/6e25bcaa6fbb1043db8f8af19f57baf3_MD5.png]]

直接双击打开，会提示Windows无法打开此类型的文件。

![[99-Assets/1271d05df82fec96695101869acf1319_MD5.png]]

这时，需要借助于Powershell才能继续安装。

从Windows的开始菜单打开Powershell，切换到安装包所在的文件夹，然后输入以下命令，就开始安装了。

```sql
Add-AppxPackage -Path OpenAI.Codex_26.616.9593.0_x64__2p2nqsd0c76g0.msix
```

![[99-Assets/98057d6c0f9de4f823a2236d5ba077f6_MD5.png]]

安装完以后，在开始菜单的“应用”里可以看到图标，如果找不到，可以在开始菜单里搜索一下Codex，就出来了。

![[99-Assets/3f61d5615505be11a84186c95cb9f9dc_MD5.png]]

安装完以后，现在打开Codex，是需要使用OPENAI的账号来登录的。

![[99-Assets/0df1f07a951fd28623af360ed3ad6a33_MD5.png]]

所以现在需要请出第二位选手：CC Switch。

  

---

  

2

# 二、CC Switch：把 Codex 的模型换成 DeepSeek

CC Switch的官网下载地址是：https://www.ccswitch.io/zh/

它是个开源的 AI 编程 CLI 统一管理工具，支持 Claude Code、Codex、Gemini CLI 这些，核心作用就是"路由"——把某个工具原本发往 OpenAI 的请求，拐去你指定的端点（比如 DeepSeek）。

![[99-Assets/98687202acbde0595ec5836be7e81bc1_MD5.png]]

点击网页上的“免费下载”，然后正常安装即可。

安装完成以后，需要修改2个地方。

## 2.1 添加Deepseek的api

这一步需要提前在Deepseek网站上申请api，具体如何申请，本文就不再介绍了，比较简单。

如下图所示，依次点击CC Switch上面的OPENAI图标，再点击+号。

![[99-Assets/4ded606d100f325261ffe1cdba044f45_MD5.png]]

在弹出的窗口中，选择Deepseek，将API key复制进去，就可以了。

![[99-Assets/d4fac308698bad98a6d1cb7042113a54_MD5.png]]

![[99-Assets/8f207f3749c5bf7ece7c12e2e255200d_MD5.png]]

  

## 2.2 配置路由

回到CC Switch的主界面，点击左上角的齿轮标志，进入设置界面。

![[99-Assets/baaac6163bf0ea07e4f320042840f4c3_MD5.png]]

点击“路由”，打开路由总开关，再启用Codex的路由。

![[99-Assets/333a5e43d7999e7bb83552ba6dab2144_MD5.png]]

至此，就全部设置完了。

如果你刚才已经开过 Codex 被登录界面卡过，记得去任务栏右下角托盘找到 Codex 图标，右键 Exit 彻底退出，再重新开。

![[99-Assets/ad1030bc423e49fde96b14e9903e2d9b_MD5.png]]

  

---

  

3

# 三、运行一下试试

重新打开 Codex，会发现不需要登录了，因为CC Switch 已经在本地把这层拦掉。

如下图所示，这个界面可以直接点击Skip跳过。

![[99-Assets/a77920e2ce0e54fbf8a6a0e4d0e896ad_MD5.png]]

跳过后，会进入主界面，这时还不能提问，需要先点击下图中的Set up按钮，等它设置完以后，就可以对话了。

可以看到，现在的大模型已经是Deepseek V4 flash了，可以点击模型名字，切换为V4 Pro。

![[99-Assets/5f11d3312a8a690062a3a743c3642d2b_MD5.png]]

问问它是谁，它竟然说自己使用的是大模型是GPT-5，这就有点莫名其妙了。

模型名和实际的不一样，可能是 Codex 客户端自己写死的文案。

不过不影响用，实际跑下来调的就是 DeepSeek，响应和回答都对得上。从DeepSeek后台也能看到扣费信息。

![[99-Assets/81c9f550bdcef8aae19c3c38875e4cb7_MD5.png]]

  

---

  

4

# 四、后记

几个小坑记一下

1.LTSC 用户才需要走离线包这条路；普通的Win10/11 是有商店的，直接商店装最省事。

2.msix 那句 PowerShell 命令，文件名一定按你自己下回来的改。

3.CC Switch 的路由开关每次改完不用重启 CC Switch 本身，但 Codex 得重启才生效。

4.Codex++ 我也试过，个人体感不如 CC Switch 干净，尤其路由这块 CC Switch 界面更直观，所以这篇没展开讲它

装完这一套，Codex 桌面版就算"国产化"完了，国内网络正常使用，不走 OpenAI 的账单，DeepSeek 的 API 价格也友好得多。

后面准备写一篇关于使用Codex制作微信小程序的过程，并且与Trae CN和CodeBuddey进行对比，喜欢的请关注点赞。谢谢。

  

---

  

如果觉得本文有用，欢迎小伙伴们点“赞”和“推荐”，谢谢大家！

![[99-Assets/db991d9448bdec9d1b84456eb39329b4_MD5.png]]

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/cff318a8_1783120048086?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzI5MDExODA5NA%3D%3D%26mid%3D2648352710%26idx%3D1%26sn%3D98ab5da8995a0490c0ef8696986b3cb1%26chksm%3Df5d8ea67842d1db76d1b198b89b4792a75d971779b6ac3e0d63d9a0860490e42ca207b59a2bc%26mpshare%3D1%26scene%3D1%26srcid%3D07043UwjPpCW4jX94wfNHM5W%26sharer_shareinfo%3D08ff37d5bc1c851329fd8003b42f4c93%26sharer_shareinfo_first%3D08ff37d5bc1c851329fd8003b42f4c93%23rd&s=obsidian)