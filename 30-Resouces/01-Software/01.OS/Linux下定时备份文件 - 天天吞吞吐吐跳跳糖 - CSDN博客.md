---
title: Linux下定时备份文件 - 天天吞吞吐吐跳跳糖 - CSDN博客
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:53
---

已剪辑自: <https://blog.csdn.net/q290994/article/details/79186821>
今天有人让我给写个脚本，说是让Linux定时备份文件数据，并删除超过一定时间的备份。听起来很有意思，一番摸索之后成功了没有呢？（因为是给对linux不太熟的人看，所以比较详细）具体看下面吧：
## 一、 编写脚本
编写一个脚本文件，使脚本可以执行备份命令。  
例如，将文件目录 /home/backups/balalala 备份到/home目录下，并压缩。
### 1. 创建脚本
命令格式: touch 路径/文件名.sh  
例如：  
输入命令：touch /home/backup.sh  

### 2. 写入命令
首先进入脚本：vi命令  
vi /home/backup.sh  
在脚本内写入：
\#！/bin/sh  
mkdir /home/beifen  
\#创建一个临时文件（要保存备份的路径）  
cp -r /home/backups/balalala /home/beifen  
\#数据存在backups目录下，备份到beifen目录下，所以先将数据拷过来  
tar -zcPvf /home/backup\$(date +%Y%m%d).tar.gz /home/beifen  
\#将数据所在文件夹beifen打包  
rm -rf /home/beifen/  
\#删除临时文件内容  

find ./ -mtime +30 -name "\*.tar.gz" -exec rm -rf {} \\  
\#删除改文件夹下超过30天的文件
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12

### 3. 执行脚本文件
直接手动执行脚本文件。  
命令格式：sh 路径/文件名.sh  
例如：sh /home/backup.sh
## 二、 设置定时执行本脚本。
例如：设置脚本每7天执行一次。
### 1. 安装crond
如果没有安装crond服务就先装上服务。  
检查服务状态：service crond status
### 2. 修改crontab内容
输入命令：crontab –e  
进入后继续输入命令：0 0 */7* \* /home/backup.sh  
设置为每7天执行一次脚本文件  
然后，保存退出:wq
sh脚本前面五个字段分别表示分钟（0-59）、小时（0-23）、日（1-31）、月（0-12）、星期几（0-6）后面的为脚本所在目录

### 3. 重新启动crond服务
输入命令：service crond restart
