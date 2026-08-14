---
title: 安装orcad集成
updated: 2026-06-06T10:09:06
created: 2026-07-05T17:05:04
---

1.  关闭所有打开的Cadence应用程序。
2.  解压缩安装包"D:\Media\EDA\OrCAD_2312\Teamcenter Cadence OrCAD_2312.zip"
3.  对于手动连接器安装，以管理员权限启动安装脚本install.bat，并按照向导的步骤操作。
4.  双击运行"D:\Media\EDA\OrCAD_2312\Teamcenter Cadence OrCAD_2312\install.bat"，不要管理员身份。
5.  连接器文件被复制到D:\Siemens\TeamcenterEDA6\eda\G2中，此路径下面被称为 \<INSTALL_DIR\>
6.  Orcad安装路径D:\Cadence\SPB_23.1，以下被称为%CDSROOT%
7.  复制文件integrate_menu.tcl， 从\<INSTALL_DIR\>\orcad_schematic\setup到%CDSROOT%\tools\capture\tclscripts\capAutoLoad
8.  检查文件： %CDSROOT%\share\local\pcb\skill\allegro.ilinit,
    1.  如果不存在，复制 \<INSTALL_DIR\>\orcad_pcb\setup\allegro.dynamic.ilinit到%CDSROOT%\share\local\pcb\skill，并重命名为allegro.ilinit。--默认不存在
    2.  如果存在，打开 \<INSTALL_DIR\>\orcad_pcb\setup\allegro.dynamic.ilinit,并将整个内容复制到剪贴板。编辑现有的%CDSROOT% \share\local\pcb\skill\allegro.ilinit文件，在文件最后添加剪贴板中的内容，并保存文件。
9.  启动OrCAD CIS。
10. 在菜单栏中查看Teamcenter菜单。
11. 选择Teamcenter \> Open。
12. 登录Teamcenter，成功后关闭对话框
13. ![image1](1c9694acf32c46cab9c2c53d8926cc89.png)
14. 修改"D:\Siemens\TeamcenterEDA6\eda\orcad_schematic_config.xml"
\<PartInBom id=<span style='color:#FA0000'>"</span>Part Number<span style='color:#FA0000'>"</span> name="DESCRIPTION" refdes="Reference"/\>
前面是原理图中中对应写物料号的地方，后面是对应引用指示符的地方。
15. \<INSTALL_DIR\>\orcad_pcb\custom\allegro\skill\integrate_menu.il，可以对菜单进行修改
