---
title: weblogic生产模式与开发模式互相切换 - CoodIceMoon - 博客园
updated: 2026-06-06T00:33:11
created: 2026-07-05T17:04:54
---

<span style='background:white'>weblogic12.1生产模式和开发模式切换</span>
<span style='font-weight:bold;background:white'>1、生产模式--》开发模式</span>
<span style='background:white'> 将domain路径下%DOMAIN_HOME%\bin\setDomainEnv.cmd文件</span>
<span style='background:white'> set PRODUCTION_MODE=true 更改为 set PRODUCTION_MODE=false 或set PRODUCTION_MODE=</span>
<span style='background:white'> 将%DOMAIN_HOME%\config\config.xml文件中</span>
<span style='background:white'> \<production-mode-enabled\>true\</production-mode-enabled\>删掉。</span>
<span style='background:white'>更改为\<production-mode-enabled\>false\</production-mode-enabled\>好像不管用</span>
<span style='font-weight:bold;background:white'>2、开发模式--》生产模式</span>
<span style='background:white'> 将domain路径下%DOMAIN_HOME%\bin\setDomainEnv.cmd文件set PRODUCTION_MODE= 更改为 set PRODUCTION_MODE=true</span>
<span style='background:white'>ps:上面是Windows环境下更改配置的方法，linux环境下很类似。</span>

*来自 \< <https://www.iteye.com/blog/happyqing-1936016>\>*
