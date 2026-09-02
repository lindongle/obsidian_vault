---
title: (15条消息) 解决 PHP 输出中文乱码的问题_zhaokaifeng.com-CSDN博客_ph...
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

已剪辑自: <https://blog.csdn.net/wy_bk/article/details/88124285>
本文由荒原之梦原创，原文链接： <http://zhaokaifeng.com/?p=1340>
# 解决 PHP 输出中文乱码的问题
## 问题描述
今天给导航狗( <https://daohanggou.cn/)的> PHP 程序和数据库文件迁移了服务器, 但是迁移到新的服务器上之后 PHP 输出的中文和 PHP 输出的从 MySQL 数据库查询出来的数据中的中文都出现了乱码的情况. 下面记录一下我解决该问题的过程.
## 解决步骤
首先解决的是 PHP 程序直接输出 (*输出的不是从数据库中查询的数据*) 的中文乱码的问题. 由于我使用的是一台虚拟主机, 没有管理员权限, 无法修改 PHP 的配置文件, 因此, 对于这个问题我的解决办法是在 PHP 文件的头部加上如下代码:
\<head\>  
\<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /\>  
\</head\>
- 1
- 2
- 3
或者加上如下代码也可以:
\<?php  
header("Content-type:text/html;charset=utf-8");  
?\>
- 1
- 2
- 3
这样处理之后, 输出的结果是这样的 (图 1):
![image1](6c58d1f66f6348c5a7b8163cec6a9b42.jpg)
*图 1*
如图 1 所示, 我用红框标注的是 PHP 程序从 MySQL 数据库查询的结果, 查询结果中的英文可以正常显示, 中文却变成了问号. 关于这个问题, 我的解决方法是在 MySQL 查询语句的前一行加入如下代码:
mysql_query('SET NAMES UTF8');
- 1
如图 2:
![image2](66733970d5e74af694a5407e0fc6c420.jpg)
*图 2*
如果经过上面的步骤之后问题还是没有解决, 可以尝试使用下面的 SQL 命令将出现中文编码错误的数据表改成 UTF-8 编码:
ALTER TABLE \`Test\` DEFAULT CHARACTER SET utf8;
- 1
