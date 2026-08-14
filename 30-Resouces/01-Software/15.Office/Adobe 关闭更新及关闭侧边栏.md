---
title: Adobe 关闭更新及关闭侧边栏
updated: 2026-06-06T00:21:51
created: 2026-07-05T17:04:55
---

1.先找到reader DC 的安装目录。软件是默认安装在C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader路径的，如果没有可以找到桌面图标右键点击属性打开文件位置即可。
2.在该目录下右上方有搜索选项，直接搜索update，会出现两个文件**update.api**和update.CHS。直接删除**update.api**就可以了。。。。。。也可以在直接路径C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\plug_ins中找到update.api，删除即可。
附加小技巧：每次打开reader DC 都会打开右侧的注释栏，强迫症不能忍呀！在路径C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroApp下有两个文件夹，这两个文件夹里都有一个**Viewer.aapp**文件，直接在此两个文件夹下都分别新建一个文件夹，把该文件移动进去即可
