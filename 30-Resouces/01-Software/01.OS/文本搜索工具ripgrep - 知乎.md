---
title: 文本搜索工具ripgrep - 知乎
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:54
---

已剪辑自: <https://zhuanlan.zhihu.com/p/113289784>
常常需要在一大堆文本文件里搜索一个字符串，这里介绍一个非常好用的工具，ripgrep，这个工具也是VS Code的默认搜索工具。
## <span style='color:#2E75B5'>简介</span>
ripgrep recursively searches directories for a regex pattern
在Linux下可以用自带的grep，不过grep的命令行还是有点难记。ripgrep是开源工具，使用Rust编写，全平台支持。看上去比grep要强大不少。如果你使用VS Code，那么你必定间接的用过这个工具了，因为VS Code的Find In Files功能就是直接调用的ripgrep。
本人觉得ripgrep最大的好处是默认选项，默认选项就是没有选项，直接rg xxx就是在当前工作目录下，递归搜索所有的文本文件里出现xxx字符串的位置，完全不用记什么命令行。当然如果需要的时候，可以用rg -h来查看帮助。
VS Code里的本文件搜索（Ctrl+F)，和在所有文件里搜索(Ctrl+Shift+F)，用到的正则表达式的flavor是不一样的，就是因为多文件的用了ripgrep，内部是Rust的regex库。而单文件的用到是Javascript的flavor。
## <span style='color:#2E75B5'>安装</span>
如果你有VS Code，那么就不用安装了，在VS Code的安装目录搜索rg.exe

果然有，然后右击，打开文件位置，就发现了实际的路径

把这个路径加到PATH里，这样就免去了下载，而且随着VS Code的更新而自动升级。
直接按键盘上Win键，输入"path"，就会找到控制面板-编辑环境变量，然后把这个路径加进系统PATH。
D:\Program Files\Microsoft VS Code\resources\app\node_modules.asar.unpacked\vscode-ripgrep\bin
注意VS Code的安装位置要改成自己实际的安装位置。
否则直接去ripgrep的github主页，releases下有对应各个系统的编译好的可执行文件。下载，放到个文件夹里，也加进PATH。
## <span style='color:#2E75B5'>使用</span>
打开资源管理器，到想搜索文本的目录下，按住Shift，右击空白处，“在此处打开Powershell窗口”，输入rg，看看有没有找到
PS C:\Users\wangyueheng\source\repos\> rg  
error: The following required arguments were not provided:  
\<PATTERN\>  

USAGE:  

rg \[OPTIONS\] PATTERN \[PATH ...\]  
rg \[OPTIONS\] \[-e PATTERN ...\] \[-f PATTERNFILE ...\] \[PATH ...\]  
rg \[OPTIONS\] --files \[PATH ...\]  
rg \[OPTIONS\] --type-list  
command \| rg \[OPTIONS\] PATTERN  

For more information try --help  

PS C:\Users\wangyueheng\source\repos\> where.exe rg  
D:\Program Files\Microsoft VS Code\resources\app\node_modules.asar.unpacked\vscode-ripgrep\bin\rg.exe
然后直接搜索，无参数时是递归的对文件夹下，包括子文件夹里所有的文本文件搜索。文件路径，行号，颜色都有
![image1](0fcd299dddd24ede8b7d540f77fd1890.jpg)
## <span style='color:#2E75B5'>中文</span>
如果结果里有中文，如果不是utf-8编码，显示会有问题，下图可以看出，gbk编码的文件显示的结果中，中文是乱码
![image2](71b31d2b6cc644a9bb7b7bf46134043d.jpg)
加上-E GBK可以改变编码为GBK，这样搜试试看，下图可以看出，utf-8编码的文件的中文成了乱码

所以，可能根据需要使用-E参数来改编码，搜中文时更是如此，如果编码不对根本搜不到。
当不加-E参数时，可以搜到utf-8的文件，搜不到gkb的文件；当加上-E GBK，结果又反过来，可以搜到gbk文件，搜不到utf-8的文件：

搜索中文，或者目标文件里有中文的时候，要根据实际需要看是否要添加-E GBK参数。
还有一些其他有用的参数，都可以rg -h来看，就不一一列举了。
## <span style='color:#2E75B5'>参考</span>
VS Code搜索时regex的flavor是哪个？
ripgrep的Github下载页：
ripgrep(rust)正则表达式文档：
