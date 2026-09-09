---
title: Creo转换JT的license机制
updated: 2026-06-06T00:17
created: 2019-10-30T18:49:18
---

JT转换器 经过测试得出了个结论：jt的转换的点，跟并发同时执行多个JT转换任务无关，只跟安装了多少个JT转换器有关，即有几个Model就需要几个服务器也就需要有几个jt转换的license，1个module上可以并行N个转换任务，但这N个转换任务需要消耗更大的CPU及CAD的许可。配置多少个JT转换点，主要看JT转换器的硬件配置及负载均衡。

JT转换对内存要求不高，但需消耗大量CPU资源。同时开5个转换进程，基本在30%-50%之间（CPU）
并行N个任务需要N\*2个Creo的license

设置同一服务器多个转换任务，修改4个文件

In the %DC_HOME%\Module\conf\Transmodule.properties file, set the MaximumTasks variable to 3.
MaximumTasks=3

In the %DC_HOME%\Module\conf\translator.xml file, edit the \<ProeToJt\> tag and set the maxlimit attribute to 3 (add the attribute if it is not already present):
\<ProEToJt provider="SIEMENS" service="proetojt" isactive="true" maxlimit="3" wrapperclass="&EAIWRAPPER;"\>

In the %IPEM_DIR%\runipemauxserver.bat file, set the MaximumTasks variable to 3.
That is, change this
set MaximumTasks=1
to this: set MaximumTasks=3

In the %IPEM_DIR%\ipemaux.bat file, set the MaximumTasks variable to 3.
That is, change this set MaximumTasks=1
to this: set MaximumTasks=3

