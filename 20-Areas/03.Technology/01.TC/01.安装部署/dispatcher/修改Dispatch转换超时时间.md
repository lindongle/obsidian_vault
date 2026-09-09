---
title: 修改Dispatch转换超时时间
updated: 2026-06-05T23:26
created: 2019-02-25T17:04:57
tags:
  - TC安装部署
---

1、在transmodule.properties调整以下参数：D:\Apps\Dispatcher\Module\conf
MaximumProgress=500
MonitorInterval=0.8
2、重启dispatcher服务
--即400分钟超时。

