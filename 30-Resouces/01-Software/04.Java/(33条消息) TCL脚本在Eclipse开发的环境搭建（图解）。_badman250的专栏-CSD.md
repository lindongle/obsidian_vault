---
title: (33条消息) TCL脚本在Eclipse开发的环境搭建（图解）。_badman250的专栏-CSD...
updated: 2026-06-06T10:05
created: 2020-11-05T01:27:28
tags:
  - Java
---

(33条消息) TCL脚本在Eclipse开发的环境搭建（图解）。\_badman250的专栏-CSDN博客
星期三, 十一月 4, 2020
5:27 下午
已剪辑自: <https://blog.csdn.net/notbaron/article/details/50273165>
前言：准备跳槽到电信公司了，新公司的自动化测试开发平台采用的是TCL脚本语言开发，以前没有用过TCL，对TCL也不了解。为了能更快地胜任新的岗位，下午花了点时间了解TCL语言。总体感觉语言还是属于弱类型的语言，比VBS更弱一些，因为不支持面对对象的方法、其次变量类型也简单得只有string类型。看来还是比较好掌握，至于运用，得投入实际生产中磨练了。为了学习TCL，咱们总得先搭个开发平台吧，Yes，立马开始！

1、前提是已经安装了Eclipse开发平台，选择菜单Help-\>Install New SoftWare,在Work with输入框中输入http://download.eclipse.org/technology/dltk/updates，然后一直选择下一步，直至安装完成。
![image1](939647facbea4cf0b882676dbbcc3656.png)
2、安装Active TCL开发环境，在http://www.activestate.com/activetcl/downloads页面上下载对应的Active TCL的安装包，下载到本地，并安装。安装完在安装目录下可以看到如下图的文件信息。
![image2](112f3c4d52284766ab8e8f62733f1782.png)

3、在Eclipse平台上新建一个TCL项目，File-\>New-\>others 选择Tcl Project。命名新项目为TCL_Test
![image3](4e0b325f4e1b4766b754c107ac0acbdb.png)

4-1、在新建的项目下添加TCL的编译器，如下图，在Active Tcl安装路径下找到bin文件夹下的tclsh85.exe文件，加载之。
![image1](939647facbea4cf0b882676dbbcc3656.png)

4-2、安装完成后，在你的项目下可以看到相关的加载类库信息，如下图：
![image3](4e0b325f4e1b4766b754c107ac0acbdb.png)

5、执行TCL脚本，新建一个TCl文件，在文件中输入命令puts "hello world!",并执行，如果可以在底部看到执行信息，表示你的环境以及安装成功。
![image4](47fa576ca2f84be5b00589498268ea4b.png)
