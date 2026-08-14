---
title: 导出导入组织、导出导入首选项，修改首选项主机名， 添加BMIDE模板，导入BMIDE包
updated: 2026-06-06T10:09:06
created: 2026-07-05T17:05:03
---

将导出的数据放到
D:\Siemens\tc101\tc_menu
[Role.plmxml](0634661df63043eeb8f550772985cb3c.plmxml)

[Person.plmxml](ae76e65feb6d446195ac88f2e2876240.plmxml)

[Group.plmxml](4f879f8228b9447e9141c576f1473f42.plmxml)

[tc_pre.xml](526a8471e21c465887dc6af3d5d21614.xml)

![image1](7ffa3a929a2b4741969cb6478701475d.png)
导入组织：
plmxml_import -u=infodba -p=infodba -g=dba -xml_file=Role.plmxml -import_mode=overwrite
plmxml_import -u=infodba -p=infodba -g=dba -xml_file=Group.plmxml -import_mode=overwrite
plmxml_import -u=infodba -p=infodba -g=dba -xml_file=Person.plmxml -import_mode=overwrite
导入首选项：
preferences_manager -u=infodba -p=infodba -g=dba -mode=import -file=tc_pre.xml -scope=site -action=override

![image2](9a63997760ba42f999ab5da7f7528adf.png)

![image3](1bf8837d9aa64fcf90a11a0ed09f11e0.png)

![image4](b0ad9a13fb244ce69d75c318aaeb23de.png)

![image5](4c9e2944b13542f8900d5c0eedc02ca0.png)

导入BMIED模板包
![image6](c4fb21d7971d4809a53a18a60539f374.png)

![image7](a3963b48e495440f9d99475aa0f24ec9.png)

![image8](64cab8bf3e43441d860d1791660d889d.png)

