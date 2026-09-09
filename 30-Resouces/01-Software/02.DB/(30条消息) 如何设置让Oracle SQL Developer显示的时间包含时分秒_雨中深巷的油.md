---
title: (30条消息) 如何设置让Oracle SQL Developer显示的时间包含时分秒_雨中深巷的油...
updated: 2026-06-06T00:31
created: 2022-08-12T21:27:01
---

(30条消息) 如何设置让Oracle SQL Developer显示的时间包含时分秒_雨中深巷的油纸伞的博客-CSDN博客
星期五, 八月 12, 2022
1:27 下午
已剪辑自: <https://blog.csdn.net/qq_25086397/article/details/81365492>
参考设置1:  

将工具--首选项--数据库--NLS--日期格式由DD-MON-RR修改为DD-MON-RR HH24:MI:SS  

参考设置2：  

将Tools --\> Preferences --\> Database --\> NLS Parameters --\> Date Format的值由"RR-MM-DD"改为  

"YYYY-MM-DD HH24:MI:SS"，这样显示的时间就包含时分秒了。  

参考设置3:  

选择 Tools --\> Preferences --\> Database --\> NLS--\>Date Format,  

把默认的格式：DD-MON-RR 改为你想要的格式，比如改为 ‘YYYY-MM-DD HH24:MI:SS’即可，这样就可以输入时分秒了。
