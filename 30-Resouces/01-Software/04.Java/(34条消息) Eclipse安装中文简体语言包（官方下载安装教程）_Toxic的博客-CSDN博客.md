---
title: (34条消息) Eclipse安装中文简体语言包（官方下载安装教程）_Toxic的博客-CSDN博客
updated: 2026-06-06T10:05
created: 2020-11-05T01:27:40
tags:
  - Java
---

(34条消息) Eclipse安装中文简体语言包（官方下载安装教程）\_Toxic的博客-CSDN博客
2020年11月5日
1:27
已剪辑自: <https://blog.csdn.net/qq_41101213/article/details/84405452>
<https://download.eclipse.org/technology/babel/update-site/R0.18.0/2020-06/>
### <span style='color:#5B9BD5'>更新2020/1/26</span>
<https://download.eclipse.org/technology/babel/update-site/R0.17.1/2019-12/>
### <span style='color:#5B9BD5'>更新2019/7/20</span>
<https://download.eclipse.org/technology/babel/update-site/R0.17.0/2019-06/>
### <span style='color:#5B9BD5'>更新2019/5/22</span>
附：eclipse代码自动提示设置，（同时解决自动补全变量名的问题）。配置eclipse,设置空格，等号，回车，左括号等不自动补全详细教程。[传送门](https://mp.csdn.net/postedit/84489656)

# <span style='color:#1E4E79'>前言：</span>
    刚开始接触Eclipse，会都头疼于eclipse的汉化问题。好在的是，Eclipse的汉化比较简单，不用到网上自己下载汉化包，而且关于这个软件的汉化也非常的多，所以我也就写一下我这边的Eclipse版本的汉化。
# <span style='color:#1E4E79'>方法一：</span>
1\. 下载中文语言包；
   打开网址： <https://www.eclipse.org/babel/downloads.php>
   此网页列出当下主流版本的下载链接， 旧版本可进入如下网址：http://archive.eclipse.org/technology/babel/index.php
   在此网页查找适合的版本，找到相应链接，进入下一页面，依照语言进行选择，
2\. 将文件下载后，解压，将eclipse文件夹中的features与plugins两个文件夹，**覆盖正式路径中的同名文件夹**即可。  

# <span style='color:#1E4E79'>方法二：</span>
版本：Eclipse Photon（2018 9月）（推荐解压版安装）
![image1](b68e0c1e370e40808834b61195870939.png)
   **1**、以 eclipse-committers-2018-09-win32-x86_64 为例
      下载链接：[传送门xiu~](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2018-09/R/eclipse-committers-2018-09-win32-x86_64.zip)

   **2**、安装JDK配置环境变量，这里就先不说了，目前最高版本JDK11；
      解压eclipse，创建一个快捷方式就好了。
    **3**、在Eclipse中打开help -\> install new software
![image2](4ca580c267a2462a8bcbe49468e821eb.png)
然后会有如下界面
![image3](faba3129858f48d182652deca8be6a6b.png)
   **4**、**在work with里输入**网址：输入上方最新的网址，点击Add，官方源可能会比较慢，等待的时间可能会久：
**    photon:**
<https://download.eclipse.org/technology/babel/update-site/R0.16.1/photon/>
**    oxygen:**
<https://download.eclipse.org/technology/babel/update-site/R0.16.1/oxygen/>
**    or**
<https://download.eclipse.org/technology/babel/update-site/R0.16.1/2018-12/>

 **5**、在下面出现的内容框里选择 Babel Language Packs in Chinese(Simplified)
       之后一直点击继续就可以下载安装了，**右下角**会出现Installing Software
       中途可能会出现警告，点install anyway就行。
![image4](9020780961f1435c8bd3c055f4f687de.png)
    **6**、重启Eclipse之后，就是中文版的啦。

附：(**有小伙伴反应上面的网址不好用了，那么我就直接告诉大家获得这个网址的方法叭**)。
       <https://www.eclipse.org/babel/downloads.php>
      打开上面这个网页，找到 Installing the language packs, 找到网址复制即可。
      P.S. 这是官方给的连接，不出意外为最新链接了叭。
![image5](57538456286f42c798c0f5d6ead90d78.png)

![image6](fa1f47a76cf74e78af55feab7102bc83.png)

