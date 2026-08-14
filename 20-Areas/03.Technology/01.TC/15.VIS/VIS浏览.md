---
title: VIS浏览
updated: 2026-06-06T10:05:36
created: 2026-07-05T17:04:49
---

1、更改浏览器许可级别后
![image1](6f96c26a49d24fb0979254e026ab5ef1.gif)
2、修改浏览器的许可证级别。及区别。如果配置不同用户不同license级别，需要单独部署分发实例进行安装。
![image2](2c9636e9fdb94c87bcbe77f3d43d793c.gif)

![image3](76b9acfb6d67483195941a7b61488783.gif)
3、配置PDFvis浏览
首选项：defaultViewerConfig.VIEWERCONFIG
添加值：PDF.TCTwoDViewer=PDF_Reference,PDF

**数据集名称.查看器名称=数据集引用的名称（dwg可以参照此格式配置）**
![image4](62b9236b7aea4a2ab1b8ef426421548d.gif)
TCTwoDViewer指vis的二维查看器
![image5](678e3b3060fe437babcb29c42cc526ca.gif)
4、打印PDF提示没有关联程序。
![image6](ef9d912f850146fe892fd5fe08a3173e.gif)
安装AdobeReader10或11。
5、不支持caxa及所有三维的二维工程图的直接浏览，需要转为PDF。
6、数据集浏览
系统中没有的数据集类型，如dwg，需要在BMIDE中dataset业务对象上新增，并添加查看工具和编辑工具，两个工具可以一致。如dwg数据集如果查看希望vis浏览，编辑使用AutoCAD编辑。则在查看工具中选择PV_visview，编辑工具选择dwg工具（需新增）
新增工具，在BMIDE，左下方-扩展-选项-工具，新增工具时，MIME/类型：就是在注册表HKEY_CLASSES_ROOT目录下，找到工具要打开的数据格式，它的Content Type属性值就是这个工具的MIME/类型；②Sell/符号：打开所用工具的命令，如打开txt命令：%SystemRoot%\notepad.exe\$；
![image7](d1ac6d12417e42d9b67d08bd5ca50641.gif)
7、TC11.x，配置PDF查看，一直提示打开文件失败。
根据西门子解释，查看PDF需要安装内嵌式VIS浏览器，许可证可以选择base或更高。
