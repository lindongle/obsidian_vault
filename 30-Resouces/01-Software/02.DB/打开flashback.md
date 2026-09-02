---
title: 打开flashback
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:54
---

1«span style='font-family: "Microsoft YaHei";background:#FAFAFC'»、打开«/span»flashback«span style='font-family:"Microsoft YaHei"; background:#FAFAFC'»：«/span»
«span style='background: \#FAFAFC'»关闭数据库«/span»
SQL\>shutdown immediate;
«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»启动到«/span»mount«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»方式«/span»
SQL\>startup mount;
«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»如果归档没有打开，打开归档«/span»\[«span style='font-family: "Microsoft YaHei";background:#FAFAFC'»因为«/span»flashback«span style='font-family:"Microsoft YaHei"; background:#FAFAFC'»依赖«/span»Media recovery,«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»所以在打开«/span»flashback«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»之前必须先启用归档«/span»\]
SQL\>alter database archivelog;
«span style='background: \#FAFAFC'»打开闪回«/span»
SQL\> alter database flashback on;

2«span style='font-family: "Microsoft YaHei";background:#FAFAFC'»、关闭«/span»flashback«span style='font-family:"Microsoft YaHei"; background:#FAFAFC'»：«/span»
«span style='background: \#FAFAFC'»关闭数据库：«/span»
SQL\>shutdown immediate
«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»启动到«/span»mount«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»方式«/span»
SQL\>startup mount;
«span style='background: \#FAFAFC'»关闭闪回«/span»
SQL\> alter database flashback off;

*来自 \< <https://www.linuxidc.com/Linux/2011-12/50543.htm>\>*

