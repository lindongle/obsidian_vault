---
title: (4条消息)Failed to run the WC DB work queue associate...
updated: 2026-06-06T10:05
created: 2019-08-01T23:03:02
---

(4条消息)Failed to run the WC DB work queue associated with 错误的解决 - alan00000的专栏 - CSDN博客
星期四, 八月 1, 2019
3:03 下午
已剪辑自: <https://blog.csdn.net/alan00000/article/details/44084455>
svn checkout 代码是出现如标题的错误，提示我clean up ，clean up失败，于是网上搜到了这一clean up 失败的解决方法，clean up 后再进入代码update 就可以了
svn提交遇到恶心的问题，可能是因为上次cleanup中断后，进入死循环了。
错误如下：
![image1](bee183fde1df4f1eb51b843d3748951c.jpg)

解决方法：清空svn的队列
1.下载[sqlite3.exe ](http://pan.baidu.com/s/1i3ie1HN)
2.找到你项目的.svn文件，查看是否存在wc.db
3.将sqlite3.exe放到.svn的同级目录
4.启动cmd执行sqlite3 .svn/wc.db "select \* from work_queue"
![image2](333e4f69ddbe45c88d24b9ba1917e28b.jpg)
5.看到很多记录，下一步执行delete from work_queue
![image3](0d60f427b7fc4ea1b878cb5e2cbb4165.jpg)

6.ok了，现在在到项目里面，执行cleanup，完全没问题了，图标状态也已经恢复了。
