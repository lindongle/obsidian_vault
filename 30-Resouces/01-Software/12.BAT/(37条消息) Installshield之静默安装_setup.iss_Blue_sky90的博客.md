---
title: (37条消息) Installshield之静默安装_setup.iss_Blue_sky90的博客...
updated: 2026-06-06T00:34:40
created: 2026-07-05T17:04:55
---

(37条消息) Installshield之静默安装_setup.iss_Blue_sky90的博客-CSDN博客
星期四, 六月 15, 2023
1:30 下午
已剪辑自: <https://blog.csdn.net/cx1990820/article/details/106377608>
最近打包遇到静默安装的需求，特地记录一下，防止后面忘掉。
静默安装说白了就是可以实现在无人值守的状态下，实现程序的自动安装。那怎么样可以达到自动安装的目的呢，首先必须要有一个录制文件，将我们手动执行的部分全部录制下来，然后在无人的状态下通过执行这个录制文件来达到目的。所以可以分两部分来介绍静默安装的实现：
1.录制安装
在[cmd](https://so.csdn.net/so/search?q=cmd&spm=1001.2101.3001.7020)中执行setup.exe -R /f1"c:\setup.iss", 执行命令开始录制安装。完成后会生成setup.iss,后续的静默安装需要setup.iss文件。
2.开始静默安装
在cmd中执行setup.exe -s /f1"c:\setup.iss" /f2"c:\setup.log", 执行成功会生成setup.log文件。 参数f1,f2分别是用来指定iss文件和log文件的命令。
