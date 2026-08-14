---
title: 导入NX模板文件
updated: 2026-06-06T00:10:49
created: 2026-07-05T17:04:44
---

**UG模板文件导入：**
TC ROOT：Teamcenter的安装路径D:\Siemens\Teamcenter11
TC DATA：Teamcenter的数据路径D:\Siemens\tcdata
模板文件导入：CMD中执行以下：
C:\WINDOWS\system32\>set tc_root=D:\Siemens\Teamcenter11
C:\WINDOWS\system32\>set TC_DATA=D:\Siemens\tcdata
C:\WINDOWS\system32\>D:\Siemens\tcdata\tc_profilevars.bat
C:\WINDOWS\system32\>d:
D:\\cd D:\Siemens\NX 11.0\UGII\templates\sample
D:\Siemens\NX 11.0\UGII\templates\sample\>tcin_template_setup.bat -u=infodba -p=infodba -g=dba
结果出现：
\*\*\*\* Doing NXDM template import:
"D:\Siemens\NX 11.0\nxbin\ug_clone.exe" -pim=yes -u=infodba -p=infodba -g=dba -o=import -default_t="Item" -dir="D:\Siemens\NX 11.0\ugii\templates" -dir="D:\Siemens\NX 11.0\simulation\templates" -dir="D:\Siemens\NX 11.0\mach\templates" -dir="D:\Siemens\NX 11.0\cmm_inspection\templates" -default_a=new_revision -default_n=autotranslate -aut=legacy -default_f=infodba:"NX Templates" -s=nxdm_template_import.clone"
ug_clone Starting...
FCC interface version fms.11.2.2.20160411.00.
Loaded implementation library 'd:\Siemens\Teamcenter11\tccs\lib\FCCClientProxyDllv12064.dll'.
FCC Interface Implementation fms.11.1.0.20150713.00 initialized.
FCC interface version fms.11.1.0.20150114.00.
Loaded implementation library 'd:\Siemens\Teamcenter11\tccs\lib\FCCClientProxyDllv12064.dll'.
Logging import to nxdm_template_import.clone
import completed successfully
\*\*\*\*\* End of tcin_template_setup
