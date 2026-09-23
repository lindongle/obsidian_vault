---
author: 小涛
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzYzMjc2ODEzNQ==&mid=2247486253&idx=1&sn=e30a44ef5c9311c5a50a292c21bf1cfa&chksm=f1492fe894da72a044f887734820001af99f3d604e26b5aab0610d0e66a35c2b31936e7d51ee&mpshare=1&scene=1&srcid=0922WcAfUTjKVW8RJY6qbc1W&sharer_shareinfo=c66af28b3a065a0203f0b15a9f84a707&sharer_shareinfo_first=c66af28b3a065a0203f0b15a9f84a707#rd
Created: 2026-09-22 06:49:23
tags:
  - 笔记同步助手
id: 0d48e5c2-d911-4064-9ad3-4e79e80ecb17
---

公众号名称：GHub开源甄选

作者名称：小涛

发布时间：2026-08-25 07:28

---

你有没有过这种抓狂的时刻？屏幕上堆了十几个窗口，想找桌面上的某个文件，得挨个最小化，或者手忙脚乱去按 Win+D。更气人的是，macOS Sonoma 用户只需要轻轻点一下桌面空白处，所有窗口就乖乖让路——Windows 呢？从来没有这待遇。

这事儿连微软自己人都看不下去了。Scott Hanselman，微软开发者社区的副总裁，直接撸起袖子写了个小工具，名字叫 **PeekDesktop**。目的就一个：让 Windows 也能拥有那种"点一下桌面就看穿所有窗口"的爽快感。

**它到底能干嘛？**

装好之后，你什么都不用配。运行起来，它就在系统托盘里安安静静蹲着，内存占用不到 5MB，有时候甚至只有 2MB 左右，比一张高清壁纸还省资源。

这时候你回到桌面，随便找个空白区域点一下。唰——所有打开的窗口瞬间消失，露出干净的桌面。你想拖个图标、右键新建文件夹、或者点开某个快捷方式，完全没问题。等你忙完了，再点一下桌面空白处，或者随便点开一个应用，所有窗口又会精确地回到原来的位置，连最大化状态都给你保留着。

更妙的是，它不会误触。你点桌面图标、拖拽文件的时候，它不会突然把所有窗口藏起来。因为它能分辨出你点的是空白壁纸还是图标，这点很贴心。

## 怎么安装？超简单

PeekDesktop 是个绿色工具，不需要安装 .NET 运行时，也不需要管理员权限。目前支持 Windows 10 和 Windows 11，不管是 Intel/AMD 的 x64 电脑，还是骁龙处理器的 ARM64 设备（比如 Surface Pro X），都能用。

## 方法一：直接下载（最推荐）

1.  打开它的 GitHub Releases 页面。
    
2.  根据你的电脑选择版本：
    

-   大部分电脑下载 `PeekDesktop-vX.Y.Z-win-x64.zip`
    
-   用骁龙或英伟达 ARM 处理器的朋友下载 `PeekDesktop-vX.Y.Z-win-arm64.zip`
    

4.  把 zip 包解压到随便哪个文件夹。
    
5.  双击 `PeekDesktop.exe`，搞定。
    

第一次运行，它会在系统托盘出现一个小图标。你可以右键点它，勾选"Start with Windows"，这样每次开机它都会自动启动，不用你操心。

## 方法二：用 Winget 装（适合命令行爱好者）

如果你电脑上已经装了 Windows 包管理器，直接打开终端敲一行：

```
winget install Hanselman.PeekDesktop
```

等它自动下载、安装完，托盘里就会出现 PeekDesktop 的图标。

## 使用方法：零学习成本

装好之后，默认是单击触发。也就是说，你只要点一下桌面空白处，窗口就全部收起来；再点一下，或者点任何一个应用窗口、任务栏，它们就全部恢复。

不过有些朋友可能会担心误触——毕竟桌面那么大，万一不小心点到了呢？没问题，右键托盘图标，把"需要双击"打开。这样你得快速点两下桌面空白处才会触发，日常操作基本不会误碰。

还有几个好玩的小开关：

-   **点击任务栏触发**：开启之后，你点任务栏的空白区域也能收起所有窗口，适合喜欢把桌面占满的朋友。
    
-   **游戏中暂停/全屏**：默认开着，玩游戏或者看全屏视频的时候它不会捣乱。
    
-   **预览样式**：默认是"资源管理器模式"，也就是调用 Windows 原生的显示桌面机制，最稳定。如果你想耍帅，可以切成"飞离模式"（Fly Away），窗口会像受惊的鸟一样飞出屏幕，视觉效果挺带感，不过偶尔会有点抽风，建议尝鲜用。
    

## 自动更新，省心到家

这工具还有个我特别喜欢的地方——它会自己更新。有新版本的时候，它会静默下载、验证签名，然后自动重启替换，全程不用你动手。对那种"下载完就忘了更新"的人来说，简直是福音。

Hanselman 还写了一篇特别硬核的工程深度解析，讲他怎么把 .NET 程序从 65MB 压到不到 2MB，怎么用 Native AOT 编译成单文件，甚至怎么用低层 Windows API 来实现鼠标钩子、窗口状态追踪。感兴趣的朋友可以去找来看看，技术含量相当高。

## 写在最后

PeekDesktop 不是什么改变世界的大家伙，它就是那种"用了就回不去"的小工具。每天省下的那几秒窗口操作，累积起来也是不小的幸福感。而且它是开源的，完全免费，MIT 协议，你可以随便用、随便改。

guthub地址：https://github.com/shanselman/PeekDesktop

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/fe9299c3_1790030962704?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzYzMjc2ODEzNQ%3D%3D%26mid%3D2247486253%26idx%3D1%26sn%3De30a44ef5c9311c5a50a292c21bf1cfa%26chksm%3Df1492fe894da72a044f887734820001af99f3d604e26b5aab0610d0e66a35c2b31936e7d51ee%26mpshare%3D1%26scene%3D1%26srcid%3D0922WcAfUTjKVW8RJY6qbc1W%26sharer_shareinfo%3Dc66af28b3a065a0203f0b15a9f84a707%26sharer_shareinfo_first%3Dc66af28b3a065a0203f0b15a9f84a707%23rd&s=obsidian)