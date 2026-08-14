---
title: Windows10下命令行工具Cmder - lzypdc的博客 - CSDN博客
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:53
---

下午
已剪辑自: <https://blog.csdn.net/lzypdc/article/details/80570545>
首先到[Cmder官网](http://cmder.net/)下载软件，有压缩版和完整版两款给我们选择，建议选择完整版，下载到本地后解压（比如C:\Program Files\cmder\\可以看见下面的目录：
![image1](eedc6a9e8e5e4741a0262480e86297a7.png)
首先右键单击Cmder.exe属性-兼容性-勾选以管理员身份运行，然后Cmder.exe就能打开软件了。
接着需要给它配置一下系统变量，添加到右键菜单。打开系统变量配置界面，把目录路径添加到Path变量的值里面
![image2](b8163f1a30b94838af750e578efb69e5.png)

完成后打开Cmder输入命令Cmder.exe /REGISTER ALL
![image3](dfb33b669bfa473d853dc0faf8451659.png)
然后在任意目录中右键就可以见Cmder Here这个命令了，至此添加到右键菜单就完成了。
