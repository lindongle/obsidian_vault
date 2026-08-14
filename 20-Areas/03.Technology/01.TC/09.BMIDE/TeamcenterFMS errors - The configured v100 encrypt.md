---
title: TeamcenterFMS errors - The configured v100 encrypt...
updated: 2026-06-05T23:15:28
created: 2026-07-05T17:04:45
---

<span style='color:#2D373C'>**Teamcenter**FMS errors - The configured v100 encryption key is the default key</span>
<span style='color:#2D373C'>更新于2020年8月03日</span>
<span style='background:#879BAA'>Installation & Upgrade</span>
<span style='color:#2D373C'>Share</span>
<span style='color:#5E6B74'>Copy</span>
<span style='background:#2387AA'>保存该页面</span>

<span style='color:#2D373C'>**详细信息**</span>
<span style='color:#2D373C'>Errors in FSC log:</span>
<span style='color:#2D373C'>The configured v100 encryption key is the default key</span>

<span style='color:#2D373C'>The configured F100 encryption key is the default key</span>

<span style='color:#2D373C'>The configured M050 encryption key is the default key</span>

<span style='color:#2D373C'>**SOLUTION**</span>
<span style='color:#2D373C'>To get rid of this error a customer would need to use their own key instead of using the default.</span>

<span style='color:#2D373C'>An example for how to do this is below:</span>

«span style='color:#2D373C'»Create the FMS key [file:«/span](file://«/span)»
<span style='color:#2D373C'>1. Open a TC prompt.</span>
<span style='color:#2D373C'>2. Cd %TC_ROOT%\fsc</span>
<span style='color:#2D373C'>3. Keygen 128 \> fms.key</span>
<span style='color:#2D373C'>4. Install_encryptionkeys -u=infodba -p=infodba -g=dba -f=modify</span>
<span style='color:#2D373C'>5. Choose Yes to modify.</span>
<span style='color:#2D373C'>6. 将 fms.key 文件中的值粘贴到提示符中，然后按回车键。</span>
<span style='color:#2D373C'>7. 将 -f=modify 更改为 -f=list 以确认字符串正确。</span>
<span style='color:#2D373C'>Install_encryptionkeys -u=infodba -p=infodba -g=dba -f=list</span>

<span style='color:#2D373C'>Update FMS Master file to use the key:</span>
<span style='color:#2D373C'>1. After the open \<fmsenterprise\> element, create a new line and paste this block in:</span>

<span style='color:#2D373C'>\<!--- Required FMS key encryption tags --\></span>
<span style='color:#2D373C'>\<ticket version="v100" keyfile="fms.key" /\></span>
<span style='color:#2D373C'>\<ticket version="M050" keyfile="fms.key" /\></span>
<span style='color:#2D373C'>\<ticket version="F100" keyfile="fms.key" /\></span>

<span style='color:#2D373C'>2. Save the file.</span>
<span style='color:#2D373C'>3. Restart the FSC service.</span>
<span style='color:#2D373C'>4. Verify that the three error log entries are no longer present in the FSC log file.</span>
<span style='color:#2D373C'></span>
<span style='color:#2D373C'></span>
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

