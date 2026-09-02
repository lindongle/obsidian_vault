---
title: Active Workspace URL changed in AW5.1.
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:49
---

Active Workspace URL changed in AW5.1.
2022年5月21日
2:06

已剪辑自: <https://support.sw.siemens.com/zh-CN/product/282219420/knowledge-base/PL8566007>
# TeamcenterActive Workspace URL changed in AW5.1. 
更新于 2021年8月18日
Active Workspace
Share
With Architecture change in AW 5.1 , user observed that AW URL has been changed but AW team want to check if Old URL can be retained in latest AW version.  

With AWC 4.2 , user can see URL like below.  

  
Old URL : [https://serverhost:**8080/awc**/#/com.siemens.splm.clientfx.tcui.xrt.showObject?uid=\<UID\>](https://serverhost:8080/awc/#/com.siemens.splm.clientfx.tcui.xrt.showObject?uid=<UID>)  

New URL: [https://serverhost:**3000**/#/com.siemens.splm.clientfx.tcui.xrt.showObject?uid=\<UID\>](https://serverhost:3000/#/com.siemens.splm.clientfx.tcui.xrt.showObject?uid=<UID>)  

Is there any configurable way to maintain old URL for AW?  
For example -  
How do I can get the AWC URL like [https://serverhost:**3000**/awc](https://serverhost:3000/awc)  ?  

  

  

  

## Solution
This is a change in the gateway config.json and supported in AW 5.1.  

1. Update the UrlPrefix in config.json .  
  Refere line no 10 from below snap .  
2. Restart the process manager .  

3. In your browser URL add a trailing "/".  

  for example - After STEP 1 , URL will be like below  [https://serverhost:**3000**/awc](https://serverhost:3000/awc)  

  In browser , you have to add trailing "/" i.e. [https://serverhost:**3000**/awc/](https://serverhost:3000/awc/)  

              
![image1](5ca5ae86cc334fd3bbd8710d0f9a5632.png)

## Notes and References
Additional Information .  
User can also refere below documentation details and try to achieve your use case.  
<https://internal.docs.sw.siemens.com/en-US/product/282219420/doc/PL20201019171517939.Configuration/htm7l/xid184922>  

  

urlPrefix  
If you work with load balancers, you may need to change the URL prefix for your site to a non-root context  

## Hardware/Software Configuration
Platform: INTL64  
OS: windows  
OS Version: XP64_SP2  
Product: TEAMCENTER  
Application: ACTIVEWORKSPACE  
Version: V5.1  
Function: FRAMEWORK  

Ref: 002-8566007  

