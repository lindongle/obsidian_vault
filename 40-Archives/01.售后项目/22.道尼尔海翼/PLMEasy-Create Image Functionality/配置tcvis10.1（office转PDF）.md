---
title: 配置tcvis10.1（office转PDF）
updated: 2026-06-05T22:26:01
created: 2026-07-05T17:05:02
---

1.  说明
    1.  TcVisualization 已安装在服务器上，但未针对 PDF 转换进行配置。需要两个额外的步骤：
        1.  GhostScript 安装。
        2.  作为标准打印机安装 Postscript 打印机
2.  GhostScript 安装
    1.  GhostScript 是按照西门子的推荐从 GTAC 下载的，并安装在标准位置。但是，Postscript Printer 不能直接安装。
3.  安装 Postscript 打印机
    1.  根据 GTAC 技术说明：Teamcenter Visualization PostScript 打印机安装，无法在 Windows Server 2012 下安装没有签名的打印机驱动程序。为此，需要在服务器重启后使用特殊选项。系统管理员能够安装所需的打印机配置。
4.  测试
    1.  命令窗口中的基本测试已成功完成：d:\siemens\TcVis101\VVCP\prepare -pdf "c:\temp\test.docx" -combine -out "c:\temp\output.pdf"
5.  问题处理
    1.  当 Microsoft Word 已在服务器上运行时，TcVis 无法成功处理任何 Office 文档，需要服务器上关闭手动打开的Word。在 Teamcenter RichClient（查看器选项卡）中预览 Word 数据集时也是如此。

