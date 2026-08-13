---
title: 4 Tier users didnot connect to the server
updated: 2026-06-06T10:08
created: 2019-04-03T11:28:52
---

<span style='font-weight:bold;background: white'>4 Tier users didnot connect to the server</span>

- <span style='font-weight:bold;background:white'>4 Tier users didnot connect to the server.</span>
- <span style='font-weight:bold;text-decoration: underline;background:white'>Symptom</span>
- ---------------  
  Abnormally 4 tier users did not connect to server and all connected user’s data  
  were lost. The weblogic server shows the following error and warning message:  

  "2007. 1. 5. ¿ÀÈÄ 2½Ã 02ºÐ 03ÃÊ KST\> \<Info\> \<Common\> \<TCE802\> \<tcserver\>  
  \<ExecuteThread: '2' for queue: 'weblogic.kernel.Default'\> \<\<anonymous\>\> \<\>  
  \<BEA-000627\> \<Reached maximum capacity of pool  
  "JETIResourceAdapter_jca/JETI/Adapter", making "0" new resource instances  
  instead of "1".\>  

  \####\<2007. 1. 5. ¿ÀÈÄ 2½Ã 21ºÐ 03ÃÊ KST\> \<Error\> \<WebLogicServer\> \<TCE802\>  
  \<tcserver\> \<weblogic.health.CoreHealthMonitor\> \<\<WLS Kernel\>\> \<\> \<BEA-000337\>  
  \<ExecuteThread: '6' for queue: 'weblogic.kernel.Default' has been busy for  
  "1,582" seconds working on the request "Http Request:  
  /tc/controller/gatewayPostserviceInvoke_link", which is more than the  
  configured time (<span style='font-weight:bold;color:blue;background:white'>StuckThreadMaxTime</span>) of "600" seconds.\>"  

  ANALYSIS  
  ----------  
  As the Web server is crashing:-  
  1\] 4Tier users did not connect to server.  
  2\] Already connected users didn’t get response from Tc Server and lost the  
  data.
- <span style='font-weight:bold;text-decoration: underline;background:white'>Hardware/Software Configuration</span>
- «span style='color:#333333'»Platform: INTEL  
  OS: WINDOW  
  OS Version: Win 2003 Server  
  Family: TEAMCENTER  
  Product Version: 8.3.1«/span»
- <span style='font-weight:bold;text-decoration: underline;background:white'>Solution</span>
- Here are two suggestions to resolve this issue:-  

  1\] Enable polling and set the interval to 10 seconds.  

  2\] Modify "stuck threads" in WebLogic:  

  Log into the admin console:  

  Expand the server folder and click on server.  
  Select "Tuning" tab.  
  Set <span style='font-weight:bold;color:blue;background:white'>stuck thread max time</span> to 10800 seconds.  
  Set stuck thread interval to 3600.  

  Once done with these setting, reboot the server and this issue will be  
  resolved.
- ![image1](ee5ed8f5b1ca4384a5f80b8a32e3d46c.png)
2019年4月3日
11:28
