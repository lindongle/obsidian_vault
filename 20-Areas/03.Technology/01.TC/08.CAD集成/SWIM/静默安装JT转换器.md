---
title: 静默安装JT转换器
updated: 2026-06-05T23:45:37
created: 2026-07-05T17:04:45
---

PLM Components JT Translator for Solidworks 22.0.0 wntx64 22.0.0
Usage:

--help Display the list of valid options

--version Display product information

--unattendedmodeui \<unattendedmodeui\> Unattended Mode UI
Default: none
Allowed: none minimal minimalWithDialogs

--optionfile \<optionfile\> Installation option file
Default:

--debuglevel \<debuglevel\> Debug information level of verbosity
Default: 2
Allowed: 0 1 2 3 4

--mode \<mode\> Installation mode
Default: win32
Allowed: win32 unattended

--debugtrace \<debugtrace\> Debug filename
Default:

--enable-components \<enable-components\> Comma-separated list of components
Default: SolidworksJT

--disable-components \<disable-components\> Comma-separated list of components
Default:

--installer-language \<installer-language\> Language selection
Default: en
Allowed: sq ar es_AR az eu pt_BR bg ca hr cs da nl en et fi fr de el he hu id it ja kk ko lv lt no fa pl pt ro ru sr zh_CN sk sl es sv th zh_TW tr tk uk va vi cy

--prefix \<prefix\> Choose the installation location
Default: C:/Program Files/Siemens/JTTranslators/SolidworksJT_22.0.0

--Name \<Name\> Server Name
Default: WIN-SC7O3RVI0L6

--IP \<IP\> IP Port \#
Default: 28000

Start /wait swtojt.exe --unattendedmodeui minimal --installer-language zh_CN --prefix D:/Siemens/JTTranslators/SolidworksJT_22.0.0 --Name tcdata --IP 28000
