---
title: NX或者AWC客户端在获取许可的时候非常慢， 大概需要花20~30秒才能完成登录或者打开NX。
updated: 2026-07-05T17:09:19
created: 2026-07-05T17:09:19
tags:
  - 许可
  - 登录
  - 性能
---



已剪辑自: <https://support.sw.siemens.com/zh-CN/support-case/details/ac1dba81-82e0-11f0-bc5d-5510fd42cc41>

NX或者AWC客户端在获取许可的时候非常慢， 大概需要花20~30秒才能完成登录或者打开NX。

申请了紧急许可，在其他机器上也都是一样的问题，

将许可安装到Windows服务器上，则正常。 linux许可服务器则有此问题。 

试用其他demo许可，在同一台linux许可上也是正常的，不存在延迟问题


还有种怀疑是 域名解析的问题;   license 文件中 看到的是:  
SERVER workstation286.cfmoto-tech.com COMPOSITE=1A5A212DD471 28000  
  
Linux 机器是否在 domain 中? 如果windows client 的 hosts 文件中直接指定 ip 是否能解决这问题? 是否DNS 的问题?  
  
  
祝您工作顺利. Steven<LiangHao> Hou 侯良浩  
<steven.hou@siemens.com>  
  
6/F, Building B, Siemens Center Shanghai, No.500, Dalian Road, Shanghai 200082, China   
Tel. :+86 (21) 2208-6715 / hotline: 800-810-1970/ 86-21-2208-6635 www.siemens.com/plm  
cell：+86-139-1761-7453   
   
================  
  
用户 添加了 域名解析后, 问题已经解决.  
  
================  
  
尊敬的用户 您好, 您提出/递交的问题已经处理完毕, 在此我关闭这个问题, 关闭代码:  TQ - technical question. 如您对此IR有进一  
步问题, 请不要犹豫继续和我们<Siemens  支持中心>联系, 这个IR能够被重新打开。重新打开的方法: 请拨打电话号码800-810-1970(或  
021-2208-6635)告诉我们这个IR的号码即可.  
  
当每一个IR 关闭的时候, 系统会自动对您的邮箱发出一个  "问卷调查" 的邮件, 希望您有时间对我们的服务做出评价和提出建议, 以便  
帮助我们改进工作. 感谢您对我们的支持与厚爱,祝您工作顺利.  
  
Steven<LiangHao> Hou 侯良浩