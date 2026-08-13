---
title: (7条消息)Oracle 12c连接 em - s2018_0423的博客 - CSDN博客
updated: 2026-06-06T10:05
created: 2019-09-23T16:37:59
---

(7条消息)Oracle 12c连接 em - s2018_0423的博客 - CSDN博客
星期一, 九月 23, 2019
8:37 上午
已剪辑自: <https://blog.csdn.net/s2018_0423/article/details/84997554>
说一下配置 win10，oracle12c，不想看废话从第3段开看
装完Oracle后试图用http://localhost:1158/em 打开oracle那个可以通过浏览器访问的管理界面，然后打不开。搜了一堆过期教程，告诉我要改host文件，改了，没用；告诉我打开一个叫OracleDBConsoleoracl的服务，我一看根本没这服务；又去搜索没这服务怎么办，叫我重装数据库，反正新数据库重装就重装，结果重装完还是没有；又找了个解决办法说用一堆命令来重新创建OracleDBConsoleoracl服务的，敲完还是没有；又搜其他，说通过一个emctl的命令来打开服务的，接着转机来了，忘了提示的啥了，好像是敲完显示我这没这个服务吧，于是我又去搜索emctl，然后百度的第3条结果就是解决方法。这是原帖链接 [http://tieba.baidu.com/p/4953655820#](http://tieba.baidu.com/p/4953655820)
主要是说oracle12c没有emctl命令，要进行网页登录可以通过执行以下几步来实现：
1.  打开cmd 执行 sqlplus /nolog 登录数据库
2.  数据库中执行命令 connect /as sysdba
3.  数据库中执行命令 exec DBMS_XDB_CONFIG.SETHTTPSPORT(5500);（括号里是端口号，应该能照自己需要设置的，我就跟着他写的5500）
4.  数据库中执行命令 alter user sys account unlock和alter user system account unlock 完成后exit退出数据库，终端输入命令lsnrctlstart打开监听服务
5.  浏览器打开https://localhost:5500/em
6.  出来这个，输入用户名密码后登录就完事了
7.  ![image1](1aab3c0b6ae54567948ad07b2fcaa40d.png)

