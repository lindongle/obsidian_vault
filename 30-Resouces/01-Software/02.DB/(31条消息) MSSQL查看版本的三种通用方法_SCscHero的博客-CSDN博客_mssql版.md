---
title: (31条消息) MSSQL查看版本的三种通用方法_SCscHero的博客-CSDN博客_mssql版...
updated: 2026-06-06T10:05
created: 2023-02-23T19:13:54
---

已剪辑自: <https://blog.csdn.net/qq_33391499/article/details/105002900>
# <span style='color:#1E4E79'>一、使用T-SQL查询</span>
- 可查询**MSSQL的软件大版本（如开发版、企业版）及位数和升级补丁版本（SP）**。
SELECT SERVERPROPERTY('edition')  
SELECT SERVERPROPERTY('productlevel')
- 1
- 2
![image1](da96794b935045ce9a608177a27bbeeb.png)
# <span style='color:#1E4E79'>二、使用Sql Server [Configuration](https://so.csdn.net/so/search?q=Configuration&spm=1001.2101.3001.7020) Manager</span>
- 快速开启方法：Windows键+R打开运行
- 输入SQLServerManager10.msc，点击回车即可。如图所示操作。
- 可查看查看**SQL状态、版本、单品名称、实例ID、文件版本**
![image2](9c958a9a61e9477d8393a5e3a3550028.gif)
- 点击菜单栏帮助==\>关于即可查看。
- 可查看到**SSMS版本、客户端工具、MDAC、MSXML等版本信息**
![image3](875792338d7e4867ab25e838e2594335.gif)
<span style='color:blue'>转载请注明出处：SCscHero</span>
