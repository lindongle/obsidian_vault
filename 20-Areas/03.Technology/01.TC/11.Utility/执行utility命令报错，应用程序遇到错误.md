---
title: 执行utility命令报错，应用程序遇到错误
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:46
---

Re: Error during shared memory initialization: sharedmemorypreferencemgr.cxx::Handle a remap

Set the following variables in tc_profilevars.bat to disable shared memory and pool manager started successfully.

在tc_profilevars.bat中增加

set TC_USE_METADATA_SHARED_MEMORY=FALSE  
set TC_NO_TEXTSRV_SHARED_MEMORY=TRUE  
set TC_USE_PREFS_SHARED_MEMORY=FALSE  
set TC_USE_LOV_SHARED_MEMORY=FALSE
