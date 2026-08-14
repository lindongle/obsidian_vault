---
title: 执行utility命令报错，应用程序遇到错误
updated: 2026-06-05T23:26:04
created: 2026-07-05T17:04:46
---

Re: Error during shared memory initialization: sharedmemorypreferencemgr.cxx::Handle a remap

<span style='background: white'>Set the following variables in tc_profilevars.bat to disable shared memory and pool manager started successfully.</span>
<span style='color:#525658'></span>
在tc_profilevars.bat中增加
<span style='background: white'></span>
set TC_USE_METADATA_SHARED_MEMORY=FALSE  
set <span style='font-style:italic;background:whitesmoke'>TC_NO_TEXTSRV_SHARED_MEMORY</span>=TRUE  
set TC_USE_PREFS_SHARED_MEMORY=FALSE  
set TC_USE_LOV_SHARED_MEMORY=FALSE
