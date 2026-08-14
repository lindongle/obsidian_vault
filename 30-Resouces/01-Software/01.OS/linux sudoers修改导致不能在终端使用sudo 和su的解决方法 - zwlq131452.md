---
title: linux sudoers修改导致不能在终端使用sudo 和su的解决方法 - zwlq131452...
updated: 2026-06-06T00:27:43
created: 2026-07-05T17:04:53
---

linux sudoers修改导致不能在终端使用sudo 和su的解决方法 - zwlq1314521的专栏 - CSDN博客
星期日, 十月 14, 2018
8:25 下午
已剪辑自: <https://blog.csdn.net/zwlq1314521/article/details/40508943>
版权声明：本文为博主原创文章，未经博主允许不得转载。 <https://blog.csdn.net/zwlq1314521/article/details/40508943>
首先要严正声明：如果不是非常必要，请不要擅自修改/etc/sudoers里的内容
如果终端执行sudo 相关指令，但是提示 用户名不在sudoers文件中，网上有解决方案 如下：
1.  切换到root用户
\[linux@localhost ~\]\$ su root
密码：
\[root@localhost ~\]#
2.  2
查看/etc/sudoers文件权限，如果只读权限，修改为可写权限
\[root@localhost ~\]# ll /etc/sudoers
-r--r-----. 1 root root 4030 12月 10 09:55 /etc/sudoers
\[root@localhost ~\]# chmod 777 /etc/sudoers
\[root@localhost ~\]# ls -l /etc/sudoers
-rwxrwxrwx. 1 root root 4030 12月 10 09:57 /etc/sudoers
3.  3
修改/etc/sudoers文件，执行命令如下：
/\*username是你的用户名\*/
\[root@localhost ~\]# echo 'username ALL=(ALL)  ALL' \>\> /etc/sudoers 
或者root权限下输入Visudo 或者 vim /etc/sudoers,找到 root  ALL=(ALL)  ALL的字段,在下一行追加:
username  ALL=(ALL)   ALL
5分钟之后密码过期,下次需要重新输入,如果不想如此麻烦，可以用以下方法
username  ALL=(ALL)   NOPASSWD: ALL
说明：格式为{用户名  网络中的主机=（执行命令的目标用户）  执行的命令范围}
4.  4
保存退出，并恢复/etc/sudoers的访问权限为440
\[root@localhost ~\]# chmod 440 /etc/sudoers
\[root@localhost ~\]# ll /etc/sudoers
-r--r-----. 1 root root 4030 12月 10 09:59 /etc/sudoers
5.  5
切换到普通用户，测试用户权限提升功能  

6.  如果你发现在你执行第一步su root时提示：su 认证失败，那么问题来啦，你要解决sudo不在sudoers的问题，必须要跳转到root目录，但是su root又无法认证，由于你更改了sudoers的内容；环环相套，
7.  我的解决方法是：重启电脑，一直按着esc键，进入recovery mode，选入 root，回车，这是会进入root目录
8.  在root终端输入 mount -o remount rw /
9.  然后 chmod 777 /etc/sudoers
10. nano /etc/sudoers 回车，然后在后端加入 %admin ALL=(ALL) ALL 回车 sudo ALL=(ALL:ALL) ALL 保存
11. 输入 chmod 440 /etc/sudoers 回车
12. 输入 reboot
