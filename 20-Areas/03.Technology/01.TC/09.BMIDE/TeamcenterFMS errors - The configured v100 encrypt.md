---
title: TeamcenterFMS errors - The configured v100 encrypt...
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:45
---

**Teamcenter**FMS errors - The configured v100 encryption key is the default key
更新于2020年8月03日
Installation & Upgrade
Share
Copy
保存该页面

**详细信息**
Errors in FSC log:
The configured v100 encryption key is the default key

The configured F100 encryption key is the default key

The configured M050 encryption key is the default key

**SOLUTION**
To get rid of this error a customer would need to use their own key instead of using the default.

An example for how to do this is below:

«span style='color:#2D373C'»Create the FMS key [file:«/span](file://«/span)»
1. Open a TC prompt.
2. Cd %TC_ROOT%\fsc
3. Keygen 128 \> fms.key
4. Install_encryptionkeys -u=infodba -p=infodba -g=dba -f=modify
5. Choose Yes to modify.
6. 将 fms.key 文件中的值粘贴到提示符中，然后按回车键。
7. 将 -f=modify 更改为 -f=list 以确认字符串正确。
Install_encryptionkeys -u=infodba -p=infodba -g=dba -f=list

Update FMS Master file to use the key:
1. After the open \<fmsenterprise\> element, create a new line and paste this block in:

\<!--- Required FMS key encryption tags --\>
\<ticket version="v100" keyfile="fms.key" /\>
\<ticket version="M050" keyfile="fms.key" /\>
\<ticket version="F100" keyfile="fms.key" /\>

2. Save the file.
3. Restart the FSC service.
4. Verify that the three error log entries are no longer present in the FSC log file.


\<!--- Required FMS key encryption tags --\>  
\<ticket version="F100" keyfile="fms.key" /\>  
\<ticket version="M050" keyfile="fms.key" /\>  
\<ticket version="v100" keyfile="fms.key" /\>  
\<ticket version="Z100" keyfile="fms.key" /\>  
\<ticket version="N050" keyfile="fms.key" /\>  
\<ticket version="T100" keyfile="fms.key" /\>

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8512897>\>*

导出plmxml，提示凭单验证失败
Invalid Ticket was originated at remote IP address

