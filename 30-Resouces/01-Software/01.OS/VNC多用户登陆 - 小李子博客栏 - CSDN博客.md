---
title: VNC多用户登陆 - 小李子博客栏 - CSDN博客
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:53
---

VNC多用户登陆 - 小李子博客栏 - CSDN博客
星期四, 十一月 15, 2018
8:04 下午

已剪辑自: <https://blog.csdn.net/wuliowen/article/details/51337562>
1、安装VNC  

yum install vnc-server
或者使用rpm安装。源码安装等。
2：添加用户
注：必须要切换到对应的用户，设置用户vnc密码。不然不能使用vnc登陆。
useradd user1 //添加用户user1  
passwd user1 //设置用户的linux登录密码  

su user1     //切换到用户user1  
vncpasswd   //设置用户的user1登录密码  
exit  

useradd user2 //添加用户user2  
passwd user2 //设置用户的linux登录密码  

su user2    //切换到用户user2  
vncpasswd   //设置用户的user2登录密码
3：修改xstartup文件和配置文件。
vi ~/.vnc/xstartup
再打开的文件中将twm& 修改为 gnome-session&其中gnome-session&表示启动gnome图形界面；startkde表示启动kde图形界面；twm表示启动文本界面。修改如图所示：
![image1](ee8178209b1c4e868d665995fe9ee304.png)

vi /etc/sysconfig/vncservers  
在最后加上:  
VNCSERVERS="1:user1 2:user2"
注意用户与用户名之间有空格；  
VNCSERVERSVNCSERVERARGS\[1\]="-geometry 1024x768 -alwaysshared"   
VNCSERVERSVNCSERVERARGS\[2\]="-geometry 1024x768 -alwaysshared"  
注意：-geometry 1024x768表示分辨率；-alwaysshared 表示允许多终端同时登陆  

4、打开对应的端口
打开5901至5902 端口用于vnc //如果需要配置更多的桌面，增加端口即可  
iptables -I INPUT -p tcp --dport 5901:5902 -j ACCEPT  
iptables -A INPUT -p tcp --dport 5901:5902 -j ACCEPT  
永久保存  
service iptables save  
（如果嫌太麻烦，可以直接关闭防火墙：service iptables stop,一般不建议）  

4.启动vncserver服务  
1）启动全部桌面  
 service vncserver start  
2）启动某一桌面  
 vncserver :1  //这里1表示第一个桌面  

5、停止vncserver服务
1）停止全部桌面  
 service vncserver stop  
2) 停止某一桌面  
  vncserver -kill :1  //停止第1个界面，要用kill命令来杀掉界面1的进程  

6、查看当前有几个桌面在运行
  service vncserver status  

7、让vncserver服务随机启动
默认状态下，vncserver服务不是开机自动启动，需要手工启动。  
chkconfig --list vncserver  
chkconfig vncserver on  
保存后，重启测试。  

8.客户端登录vncserver服务
（1）先安装vncviewer来远程登录，  

（2）然后在地址栏输入“主机地址:1”（即主机IP加界面号的方式）
windows登陆可以下载vncviewer软件。
