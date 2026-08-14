---
title: (7条消息)Linux 下 SQL*Plus 上下键不能查看历史命令 - 学习是一种态度 - CSD...
updated: 2026-06-06T00:29:05
created: 2026-07-05T17:04:53
---

(7条消息)Linux 下 SQL\*Plus 上下键不能查看历史命令 - 学习是一种态度 - CSDN博客
星期四, 九月 26, 2019
5:52 下午
已剪辑自: <https://blog.csdn.net/ccie38499/article/details/12860303>
解决方法
1\. 安装 readline 软件包
在 Linux 的安装光盘中就有该软件包，不用额外下载。
使用 YUM 前，需先配置好本地 YUM 源。
1.  \[root@localhost ~\]# yum list readline
2.  Loaded plugins: refresh-packagekit, security
3.  Installed Packages
4.  readline.i686 6.0-4.el6 @ol6_local
5.  readline.x86_64 6.0-4.el6 @anaconda-OracleLinuxServer-201302251503.x86_64/6.4
6.  \[root@localhost ~\]# yum install -y readline
7.  Loaded plugins: refresh-packagekit, security
8.  Setting up Install Process
9.  Package readline-6.0-4.el6.x86_64 already installed and latest version
10. Nothing to do
11. \[root@localhost ~\]# rpm -qa \| grep readline
12. readline-6.0-4.el6.x86_64
13. readline-6.0-4.el6.i686
14. \[root@localhost ~\]#
2\. 安装 rlwrap 软件包
2.1. 下载 rpm 包
[http://pan.baidu.com/share/link?shareid=3482858924&uk=2332205065<u>  
</u>](http://pan.baidu.com/share/link?shareid=3482858924&uk=2332205065)
2.2. 使用 YUM 安装 rpm 软件包
\[root@localhost ~\]# yum localinstall -y rlwrap-0.37-1.el5.x86_64.rpm
3\. 使用 rlwrap
编辑 oracle 用户的 .bash_profile 文件，在文件尾部添加下面两行内容。
1.  \[oracle@localhost ~\]\$ tail -2 /home/oracle/.bash_profile
2.  alias sqlplus='rlwrap sqlplus'
3.  alias rman='rlwrap rman'
4.  \[oracle@localhost ~\]\$
4\. 使用 SQL\*Plus，验证效果。
1.  SQL\> select status from v\$instance;
2.  
3.  STATUS
4.  ------------
5.  OPEN
6.  
7.  SQL\> select status from v\$instance;
OK 可以通过上下键查看历史命令。
