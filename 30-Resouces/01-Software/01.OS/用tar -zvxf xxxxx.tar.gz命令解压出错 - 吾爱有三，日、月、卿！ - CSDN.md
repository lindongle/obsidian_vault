---
title: 用tar -zvxf xxxxx.tar.gz命令解压出错 - 吾爱有三，日、月、卿！ - CSDN...
updated: 2026-06-06T00:28
created: 2018-11-22T20:04:20
---

下午
已剪辑自: <https://blog.csdn.net/chineseyoung/article/details/80250540>
今天在学习RabbitMQ时，部署环境安装erlang时出现了解压出错，记录一下
常用的解压文件方式：
tar -zvxf xxxxx.tar.gz
tar -jvxf xxxxx.tar.bz2
unrar -x xxxxxx.rar
但是经常解压出错：
gzip: stdin: not in gzip format
或
gzip: stdin: not in gzip format  
tar: Child returned status 1  
tar: Error exit delayed from previous errors

我们可以先用file xxx.tar.gz查看文件类型
file otp_src_20.3.tar.gz
otp_src_20.3.tar.gz: POSIX tar archive (GNU)

这个文件的格式是**POSIX tar archive (GNU)**
**用以上三个解压命令是会报错的：**
gzip: stdin: not in gzip format
tar: Child returned status 1
tar: Error is not recoverable: exiting

于是用命令 tar -xvf xxx.tar 成功解压好了
