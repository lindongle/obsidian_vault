---
title: 通过DispatcherClient过滤转换的服务
updated: 2026-06-05T23:27
created: 2019-11-13T09:21:44
tags:
  - TC安装部署
---

通过DispatcherClient过滤转换的服务
2019年11月13日
9:21
修改D:\Siemens\Dispatcher\DispatcherClient\conf\Service.properties
注释原：Service.Filters=
添加以下：一个提供商对应一个服务
import pcbtofatf;proetodxf;proetojt
Service.Filters=TranslatorFilter
Service.TranslatorFilter.Provider=SIEMENS,SIEMENS,SIEMENS
Service.TranslatorFilter.Translator=pcbtofatf,proetodxf,proetojt

