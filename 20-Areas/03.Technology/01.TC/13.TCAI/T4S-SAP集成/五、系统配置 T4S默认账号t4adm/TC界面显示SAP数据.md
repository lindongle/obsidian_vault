---
title: TC界面显示SAP数据
updated: 2026-07-29T13:50:08+08:00
created: 2019-05-30T20:03:19
---

窗口--显示视图--SAPdata
mapping文件：
E:\PLM\Siemens\T4S\var\mmap\t4s_mapping_config\t4s_prop_mapping.sd

界面字段的添加：
mapping文件中proc GetBOM**DataView** {ObjectKey Parameters}
需要添加直接Create，根据样例可以调整渲染。（未具体验证）
![image1](7cc8d803721d4ddd90a4dfd3b58acd4a.png)
![image2](b95b7516bf7a4de192e38ed3c73d7a71.png)
![image3](9684eac538604e31889e4e58eb2401b8.png)

使用gs中GET xxx脚本验证：
注意脚本测试时，界面上要区分大小写。
![image4](7d528cfc40044977862452c52a782eac.png)
在Mapping文件中
也要将编号给转为大小写：
![image5](aef4938ff05f474eb1754e725f735ed0.png)

