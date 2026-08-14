---
title: Special Schematics Customizations
updated: 2026-06-05T22:25:42
created: 2026-07-05T17:05:02
---

**Material List & Wire List(EML/EWL)**
原理图工具栏下拉 Dornier BOM 包含材料列表和线列表的命令。每个命令中的一个只是启动宏以生成列表报告并将其放置到绘图上，这是原理图的标准功能。
Excel/Teamcenter 的函数列表启动一个宏，该宏将报告生成到一个文本文件中，并启动一个后过程以将列表导入到一个 excel 模板中，并将一个作业发送到一个调度程序模块，该模块将 excel 文件导入到 Teamcenter 中。
1\. 命令启动宏 Dornier_xx_list_Excel_TC.macro（xx 代表 Wire 或 Comp）。
此宏将报告创建到文本文件中并将其存储在 C:\temp\nx\xx_list_out.txt 中。
最后它调用 Visual Basic 脚本 Dornier_xx_list_Excel_TC_Post.vb。
2\. Dornier_xx_list_Excel_TC_Post.vb 从 NX 文件中获取一些属性，用它打开 Excel 模板 s:\nx90\win64\schematics_custom\Dispatcher\xx_list.xltm 并在 excel 表中执行宏 ImportXXlist。
3\. Excel宏导入文本文件，用完后删除，将excel文件和NX的图号保存到s:\nx90\win64\schematics_custom\Dispatcher\\
4\. 在 sopfap02.dosea.local 上，当前用户 Teamcenter 运行一个调度程序模型 excel_import.bat，它等待那些 excel 文件并使用 tcpb_import_file 函数将其导入 Teamcenter
