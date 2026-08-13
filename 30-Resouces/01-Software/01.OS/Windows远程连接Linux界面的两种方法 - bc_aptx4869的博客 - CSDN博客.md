---
title: Windows远程连接Linux界面的两种方法 - bc_aptx4869的博客 - CSDN博客
updated: 2026-06-06T00:22
created: 2018-10-22T18:21:44
---

已剪辑自: <https://blog.csdn.net/bc_aptx4869/article/details/78218084>
版权声明：Yes, I still love you, let me accompany you around, staged an impossible love <https://blog.csdn.net/bc_aptx4869/article/details/78218084>
# <span style='color:#1E4E79'>使用VNC连接,最简单.</span>
**首先在linux端键入命令安装vncserver**
yum -y install vnc \*vnc-server\*
- 1
**然后键入命令设置vncserver密码**
vncpasswd
- 1
**然后键入命令来查看当前的vncserver端口**
vncserver
- 1
**可以看到类似下面的显示(这里的7代表我运行了此命令7次,已经迭代到了7,假如你是第一次,应该是1.这个数字后面链接的时候会用到):**  

**然后关闭linux的防火墙**
service firewalld stop
- 1
**linux配置完毕**
**然后在windows端安装vncviewer**  
百度网盘连接:  
<http://pan.baidu.com/s/1nvdwZnN>  
安装很简单.
安装完成后点击vncviewer.exe应用程序,出现如下界面(只需要填入ip地址和上面提到的数字即可,点击connect):  

**正常情况会出现输入vncserver密码的界面:**  

TIPS:删除一个vncserver的端口命令是:
vncserver -kill :7
- 1
# <span style='color:#1E4E79'>使用Xmanager+Xshell连接</span>
我目前掌握的阶段是只有输入命令时才有对应的互动界面弹出,也就是说初识界面还是命令行….  
ok,需要下载两个软件,Xmanager+Xshell.  
只说核心步骤吧:  
下载安装完Xmanager后,点击打开桌面上的Xmanager 5快捷图标,出现下面界面,双击Xmanager - Passive快捷方式,它自动启动并最小化窗口,也就不用管它了:  

此时再打开xshell,连接上linux服务器,并在建立连接时，设置连接属性，在 SSH –\> tunneling(隧道) 选项下勾选 Forward X11  
连接上linux之后键入命令下载一个测试工具:
yum install -y xclock
- 1
然后在linux键入命令查看是否弹出一个时钟弹窗:
xclock
- 1

