---
author: 众享软记
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzI4NDUzNjk1Nw==&mid=2247494997&idx=1&sn=22dbff658539f68587b5dc126507d9c3&chksm=eab31746715a3cb25ec35690b31e6f9c04c42ed60996c660a97be0af253259e17cdb47fa1119&mpshare=1&scene=1&srcid=1107O4eIkfUYbQGWxG5RAfEM&sharer_shareinfo=17f9e6f1bc030119d4f2921e514f21e0&sharer_shareinfo_first=17f9e6f1bc030119d4f2921e514f21e0#rd
Created: 2026-11-07 09:45:37
tags:
  - 笔记同步助手
id: 3df1b76b-1308-4ae2-a017-18ca6cb2e61f
created: 2026-11-07T10:24:29
updated: 2026-11-07T10:24:33
---

公众号名称：众享软记

作者名称：

发布时间：2026-11-05 11:30

> Lertaro 是免费开源的 Windows 文件搜索工具，直读 NTFS 底层索引，双击 Ctrl 秒出全盘结果，支持拼音搜中文、挂载打开/另存对话框、即时预览和插件扩展。本文提供 Lertaro 安装与使用教程，并对比 Everything、Listary，帮你告别转圈搜索。

在 Word 里点"打开"，对话框翻五分钟找不到那份合同；资源管理器一搜索就转圈……受够 Windows 文件搜索慢的人，可以试试 Lertaro。这款免费开源的 Windows 文件搜索工具，双击 Ctrl 全盘秒搜，文件刚保存就能找到，界面还有简体中文。

![[99-Assets/7dccf8b37351ba25df27eb9c8a13bf6d_MD5.png]]

## Listary 开源替代：Lertaro 和 Everything 怎么选

一句话：**它把 Everything 的索引速度和 Listary 的对话框挂载合在一起**，再加一个开放插件生态。

| 对比项 | Everything | Listary | Lertaro |
| --- | --- | --- | --- |
| 授权 | 免费、闭源 | 免费版 + Pro | 免费、开源 |
| 索引方式 | USN 日志 | USN 日志 | USN + $MFT，实时同步 |
| 挂载打开/另存对话框 | 不支持 | 支持 | 支持 |
| 插件扩展 | 无插件系统 | 有限 | .NET SDK，兼容 Flow Launcher |
| 磁盘可视化 | 无 | 无 | Treemap 免重扫 |

## Lertaro 下载与安装教程

1.  打开官网 lertaro.github.io 或 GitHub Releases 页面下载，中文文档在 lertaro.github.io/zh-CN/。
    
2.  **安装版**：自动注册后台索引服务，适合长期使用。
    
3.  **便携版**：解压即用；需要索引服务时，在设置里一键注册。
    
4.  支持 Windows 10/11，x64 和 ARM64 版本都有。
    

![[99-Assets/0c1e06ab890809ab48f4d315d54502bc_MD5.png]]

## Lertaro 使用教程

**场景一：双击 Ctrl，全盘秒搜。**  
按两下 Ctrl 弹出搜索框，输入即出结果。记不全文件名就打几个字母，支持跳跃匹配；中文不用切输入法，**拼音首字母、全拼都能命中**。常用修饰符：`!` 排除、`'` 精确、`^` 前缀、`$` 后缀、`|` 或条件。

**场景二：在"打开/另存为"对话框里直接搜。**  
这是它不一样的地方——在别的软件里选文件时，搜索框直接嵌进原生对话框，还会自动同步当前目录。资源管理器、Total Commander、Directory Opus、OneCommander、XYplorer 也能挂载。

**场景三：不打开文件，先看再动手。**  
选中文件按 **Ctrl+O** 呼出动作菜单（含系统原生右键功能），按 **Alt+P** 即时预览文档、图片和音视频。主窗口里还能生成 **Treemap 磁盘占用图**，基于已有索引、免去重新扫盘，大文件一眼定位。

**插件与扩展。**  
官方提供 .NET 10 C# SDK，可自定义搜索源、别名和动作，并兼容 Flow Launcher 社区插件；内置网页搜索、浏览器书签/历史、内容搜索、翻译、日历等。命令行下有 `lff` 做交互式模糊查找，也支持 `lertaro://` 协议直达搜索。

## 隐私与架构：零遥测，断网也能用

**纯本地运行，零遥测、无云端通信，断网也能正常用。** 它采用三进程隔离：SYSTEM 级索引服务（Lertaro.Service）负责读 USN/$MFT，用户态界面（Lertaro.App）零管理员权限，独立钩子进程管全局快捷键和对话框挂载，搜索记录不外传。

![[99-Assets/aee923eb88a15c298c9539956d1bd190_MD5.png]]

## 常见问题排查（FAQ）

**Lertaro 能当 Everything 替代软件用吗？**  
看你的工作流：要"搜得快 + 挂对话框 + 预览 + 插件"一个顶俩，选它；只做纯文件名检索，Everything 依旧轻快。

**搜索会上传云端吗？**  
不会。全程本地运行，零遥测，断网可用。

**U 盘、网络盘能搜吗？**  
FAT32/exFAT（含 U 盘）通过变更监听覆盖，网络共享路径有缓存同步，可在设置中添加路径。

**双击 Ctrl 没反应怎么办？**  
在设置里确认快捷键绑定，排查是否有其他软件占用全局热键，必要时查看运行日志。

**便携版和安装版怎么选？**  
安装版自动注册后台索引服务，适合长期使用；便携版解压即用，需要时一键注册。

---

收藏这篇，转给那个总在"打开"对话框里迷路的同事，他能少翻十分钟文件夹。

#效率工具 #Windows技巧 #开源软件 #软件推荐 #文件管理

  

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/384e0984_1794015936243?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzI4NDUzNjk1Nw%3D%3D%26mid%3D2247494997%26idx%3D1%26sn%3D22dbff658539f68587b5dc126507d9c3%26chksm%3Deab31746715a3cb25ec35690b31e6f9c04c42ed60996c660a97be0af253259e17cdb47fa1119%26mpshare%3D1%26scene%3D1%26srcid%3D1107O4eIkfUYbQGWxG5RAfEM%26sharer_shareinfo%3D17f9e6f1bc030119d4f2921e514f21e0%26sharer_shareinfo_first%3D17f9e6f1bc030119d4f2921e514f21e0%23rd&s=obsidian)