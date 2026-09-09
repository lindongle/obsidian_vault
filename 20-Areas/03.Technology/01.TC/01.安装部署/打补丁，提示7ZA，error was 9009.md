---
title: 打补丁，提示7ZA，error was 9009
updated: 2026-06-05T23:18
created: 2019-08-26T17:41:43
tags:
  - TC安装部署
---

打补丁报错：
Executing \[echo n \| "D:\Siemens\Teamcenter11\install\install\7za" a "D:\Siemens\Teamcenter11\install\install\patches\backup\bkuptmp6390486532792017746.zip" @"D:\Siemens\Teamcenter11\install\zip.input"\]
An error occurred during execution. Stack trace follows...

原因：D:\Siemens\Teamcenter11\install\install缺少7za.exe文件，可以从D:\Siemens\Teamcenter11\bin目录下复制一个过来，点击重试即可
