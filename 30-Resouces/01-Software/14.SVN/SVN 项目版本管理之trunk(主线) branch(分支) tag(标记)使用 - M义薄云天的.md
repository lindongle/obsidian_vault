---
title: SVN 项目版本管理之trunk(主线) branch(分支) tag(标记)使用 - M义薄云天的...
updated: 2026-07-05T17:09:13
created: 2026-07-05T17:09:13
---

SVN 项目版本管理之trunk(主线) branch(分支) tag(标记)使用 - M义薄云天的博客 - CSDN博客
2019年7月27日
0:07
已剪辑自: <https://blog.csdn.net/weixin_39494923/article/details/83211104>
### <span style='color:#5B9BD5'>应用场景：</span>
1.  优异的跨平台支持，对windows平台支持非常友好。
2.  简单易用，安装后稍微培训下就知道怎么操作。
3.  代码，需求，文档，涉及稿都可以用svn进行管理，适合不同部门的技术非技术的同事协作。
4.  当研发成本比较低，协作开发人数不多，开发人员对于版本管理的水平参差不齐的时候，或者对于代码的安全性要求更高一点的时候，适合用svn
### <span style='color:#5B9BD5'>SVN仓库目录结构Repository：</span>
truck(主干\|主线\|主分支)：是用来做主方向开发的，新功能的开发应放在主线中，当模块开发完成后，需要修改，就用branch；  
branch(分支)：分支开发和主线开发是可以同时进行的，也就是并行开发，分支通常用于修复bug时使用；  
tag(标记)：用于标记某个可用的版本，可以标记已经上线发布的版本，也可以标记正在测试的版本，通常是只读的；
以上权限是通过服务端右键 Properties forxx目录来控制该目录权限以及赋予权限（前提是添加用户，分组来分配对应的权限）
### <span style='color:#5B9BD5'>SVN具体操作步骤：</span>
### <span style='color:#5B9BD5'>一：创建本地仓库</span>
1\. 创建目录结构D:\TortoiseSVN\Repository\XXX
2\. 在该目录结构上右键
---\> TortoiseSVN
---\> Create repository here(创建仓库这里)
---\> Create folder structure(创建文件结构)
---\> Start Repobrowser(开始仓库浏览)
---\> Ok
最后如下：（branches,tags,trunk是手动创建的文件结构）
![image1](b05e559a9ef04524a5f789f240c02e89.png)
备注：还有一种是通过直接在VisualSvn Server上直接在Repository右键Create New Repository下一步选择single-projiect-reprository进行创建带有文件结构的仓库，然后update到本地也是一样的；
### <span style='color:#5B9BD5'>二：将项目上传到SVN上</span>
   桌面(或者文件下空白处)右键  
---\> TortoiseSVN
---\>repo-browser--\> URL: <file:///D:/TortoiseSVN/Repository/xxx>
   ---\> Ok
--\> 选中trunk文件夹右键
---\> Add folder...
---\> 选中要上传到SVN的项目的最外层目录，输入日志
---\> Ok  
备注：Check Out 检出代码就不需要讲啦
### <span style='color:#5B9BD5'>三：开发周期</span>
1.因为项目刚建立，这是在开发新功能，所以要在主线trunk上开发;
2.开发一段时间后，经测试，上线;打包到Tags
在D:\TortoiseSVN\Repository\Source\tags 目录下新建一个目录：1.0,并将该目录提交到SVN上，然后右键 D:\TortoiseSVN\Repository\Source\trunk\MyAppProject该目录 ---\> TortoiseSVN ----\>Branch/tag... -----\> To Path :/tags/1.0/MyAppProject 并选中 Head revision in repository ---\> Ok 此时Source/tags/1.0 目录中没有任何内容，需要更新一下该 目录做update操作。更新之后看到一个完整的项目源码保存到该目录中（该目录下的源码可看做是trunk目录下版本为1.0的一个 副本）;这样就1.0的版本包就在tags里面了  
备注：以上是在本地仓库进行创建文件，在VisualSvn Server也可同样操作；效果一样
3.用户或测试人员反馈应用有重大bug，需要立即修复该bug并尽快上线， 此时程序员需要为 tags/1.0 下的MyAppProject 打一个分支branch，  
 操作过程如下：
选中Source/tags/1.0/MyAppProject
右键 TortoiseSVN----\>Branch/tag...
-----\>ToPath：/branches/MyAppProject
---\> Ok  
此时看D:\TortoiseSVN\Repository\Source\branches目录下仍然没有任何内容，也需要update一下，更新之后发现该目录下  
也出现一个完整的项目代码（该代码可看做是tags/1.0/MyAppProject的一个副本），注意打分支和打标记都是使用Branch/tag...菜单，不同的是To Path 的目录不一样，图解看打分支的图，只是to path 值不一样，此时branches/MyAppProject/HomeViewController中的viewDidLoad和tags/1.0/MyAppProject/HomeViewController中的viewDidLoad代码完全一致。
4\. bug 修复好后，先提交修改的文件，并进行客户端App上线，上线完成后再将branches/MyAppProject/打个tag到1.0.1目录下（tags/1.0.1）（操作步骤同步骤3）；
5.接下来将将trunk主干的代码合并到branch分支，操作步骤如下：
右键 branches/MyAppProject
    ------\>TortoiseSVN
----\> Merge...
---\> Merge a range of revisions
----\> Next
---\>URL to merge from : <file:///D:/TortoiseSVN/Repository/Repo-iOS/trunk/MyAppProject>
（这个路径是谁，就是合并谁的代码）
----\> Next
----\> Merge
备注：将branch和合并到trunk也是同上只是右键trunk/MyAppProject ，URL to merge from--...../branch/...
6\. 此时合并彻底结束，branches目录下的源码如果不想要也可以删掉，接着修改bug的这位程序员需要切换工作空间到主线上来，使用Xcode重新打开trunk/MyAppProject项目，接着开发尚未完成的新功能。
备注：
1\. 分支开发和主干开发是两个完全独立的过程，两者可以同时进行开发  
2. 因分支和主干开发是并行的，所以两者可以任意的多次提交当前工程所修改的文件；
![image2](f2669c97813544daa0a083ac7cc65c53.png)
