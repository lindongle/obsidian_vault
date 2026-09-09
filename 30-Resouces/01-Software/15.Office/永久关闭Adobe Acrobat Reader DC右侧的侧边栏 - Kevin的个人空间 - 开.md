---
title: 永久关闭Adobe Acrobat Reader DC右侧的侧边栏 - Kevin的个人空间 - 开...
updated: 2026-06-06T00:21
created: 2018-08-23T05:44:18
---

永久关闭Adobe Acrobat Reader DC右侧的侧边栏 - Kevin的个人空间 - 开源中国
Wednesday, August 22, 2018
9:44 PM
Clipped from: <https://my.oschina.net/xintq/blog/416675>
你可以在[这里](http://xintq.net/archives/495)找到原始文章。
最近更新了Adobe Acrobat Reader DC，说实话新版本的其他效果不错，但是有一个让人很蛋疼的毛病，就是每次打开一个PDF的时候，右侧的侧边栏（注释栏）总是会默认打开，而且找遍了各种设定也没有办法取消。 不知道是谁的脑残设计，于是乎，各种找，发现了下面的方法。
首先关闭Adobe Acrobat Reader DC
再找到Adobe Acrobat Reader DC的安装目录，C:\Program Files (x86)\Adobe\Acrobat Reader 2015\Reader\AcroApp\CHS。 然后进入这个目录，新建一个子目录，随便起一个名字，比如Disabled，把下面三个文件移动到该目录中：
- AppCenter_R.aapp
- Home.aapp
- Viewer.aapp
为了保险起见，转到C:\Program Files (x86)\Adobe\Acrobat Reader 2015\Reader\AcroApp\ENU中，也照样把以上目录下的以上三个文件挪到一个子文件夹中。
最后使用Adobe Acrobat Reader DC打开PDF文件，可以发现讨厌的注释侧边栏已经不见了。
