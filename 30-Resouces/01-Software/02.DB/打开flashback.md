---
title: 打开flashback
updated: 2026-06-06T00:30:58
created: 2026-07-05T17:04:54
---

<span style='font-family:tahoma;background:#FAFAFC'>1</span>«span style='font-family: "Microsoft YaHei";background:#FAFAFC'»、打开«/span»<span style='font-family:tahoma; background:#FAFAFC'>flashback</span>«span style='font-family:"Microsoft YaHei"; background:#FAFAFC'»：«/span»
«span style='background: \#FAFAFC'»关闭数据库«/span»
<span style='background:#E3F0FA'>SQL\>shutdown immediate;</span>
«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»启动到«/span»<span style='font-family:tahoma;background:#FAFAFC'>mount</span>«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»方式«/span»
<span style='background:#E3F0FA'>SQL\>startup mount;</span>
«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»如果归档没有打开，打开归档«/span»<span style='font-family:tahoma;background:#FAFAFC'>\[</span>«span style='font-family: "Microsoft YaHei";background:#FAFAFC'»因为«/span»<span style='font-family:tahoma; background:#FAFAFC'>flashback</span>«span style='font-family:"Microsoft YaHei"; background:#FAFAFC'»依赖«/span»<span style='font-family:tahoma;background:#FAFAFC'>Media recovery,</span>«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»所以在打开«/span»<span style='font-family:tahoma;background:#FAFAFC'>flashback</span>«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»之前必须先启用归档«/span»<span style='font-family:tahoma;background:#FAFAFC'>\]</span>
<span style='background:#E3F0FA'>SQL\>alter database archivelog;</span>
«span style='background: \#FAFAFC'»打开闪回«/span»
<span style='background:#E3F0FA'>SQL\> alter database flashback on;</span>
<span style='background:#FAFAFC'></span>
<span style='font-family:tahoma;background:#FAFAFC'>2</span>«span style='font-family: "Microsoft YaHei";background:#FAFAFC'»、关闭«/span»<span style='font-family:tahoma; background:#FAFAFC'>flashback</span>«span style='font-family:"Microsoft YaHei"; background:#FAFAFC'»：«/span»
«span style='background: \#FAFAFC'»关闭数据库：«/span»
<span style='background:#E3F0FA'>SQL\>shutdown immediate</span>
«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»启动到«/span»<span style='font-family:tahoma;background:#FAFAFC'>mount</span>«span style='font-family:"Microsoft YaHei";background:#FAFAFC'»方式«/span»
<span style='background:#E3F0FA'>SQL\>startup mount;</span>
«span style='background: \#FAFAFC'»关闭闪回«/span»
<span style='background:#E3F0FA'>SQL\> alter database flashback off;</span>

*来自 \< <https://www.linuxidc.com/Linux/2011-12/50543.htm>\>*

