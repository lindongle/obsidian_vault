---
title: (18条消息) 终于解决了ora-00119和ora-00132这个问题_谢彬のCSDN专栏-CSD...
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:54
---

(18条消息) 终于解决了ora-00119和ora-00132这个问题_谢彬のCSDN专栏-CSDN博客
星期一, 三月 15, 2021
6:04 下午
已剪辑自: <https://blog.csdn.net/xb12369/article/details/26720275>
![image1](d15f8d8341ca4ed4b5c11a9ce3ca9998.png)
oracle11g安装后，本地无法登录！
![image2](7817b82453ac4b9a9b9cfa3e9357db2a.png)

**前提：服务全部打开，监听也配置好了！**

**win7 64位  oracle 11g**

简单的sql命令：

先登录到sqlplus：

sqlplus /nolog;

登录数据库：

conn system/manager as sysdba;

然后启动数据库：
startup;

发现ora-00119【ora-00119 invalid specification for system parameter】
   ora-00132【syntax error or unresolved network name 'LISTENER_ORCL'】：
![image3](607c45503a094a6bb30651d470e7f514.jpg)

现在看来，完全可以理解就是00119就是oracle没有启动！

现在来个更简单的：
【解决办法】方法①：这种方式每次电脑重启以后，都需要用sysdba的身份启动数据库；优点：能够加深基本的sql密令的印象；缺点：麻烦；
1，找到一个文件夹：pfile；虽然每个人安装oracle的路径不一样，但是在安装的目录下一定会找到这个文件夹！
比如我的文件夹：
D:\app\jamb008\admin\orcl\pfile  

2，这个文件下有个文件：init.ora.1132014143422 他其实就是pfile，用来启动oracle的文件！

![image4](06b06167444047ea86925bc2ab8a7a2e.jpg)

3，用**写字板的方式**打开它，找到local_listener，然后将它的值换掉（原始值叫LISTENER_ORCL），换成你tnsnames.ora中的ADDRESS_LIST：
![image5](b02ea834bed945d987aecd2ea8bb0b47.jpg)

![image6](3fccc00ff4f148b2b056912903fd0166.jpg)

4，然后回到cmd中，执行：
startup pfile='D:\app\jamb008\admin\orcl\pfile\init.ora.1132014143422'

![image7](208079a8fdcb4bab973a77abd4b53c3e.jpg)

5，再次用plsql登录：system manager成功了！！！

-------------------------------------------------------华丽的分隔符-------------------------------------------------------------------------------------------------

【解决办法】方法②：（网上说什么复制pfile到spfile等等，弱爆了！！！！！）仍然用这种“弱爆的办法”。

1，用sysdba的身份登录
sqlplus /nolog  
conn /as sysdba  

2，创建spfile
create spfile from pfile = 'D:\app\jamb008\admin\orcl\pfile\init.ora.1132014143422'  
文件已创建  

这里稍作说明：oracle11g此文件在：D:\app\jamb008\product\11.2.0\dbhome_1\database
                    10g        ：D:\app\jamb008\product\11.2.0\dbhome_1\dbs
下；

再次启动：
startup  

![image8](d21176f189144d7d9f460ca0dde723e5.jpg)

3，到此，我们发现oracle已经成功启动，然后把电脑重启，再次用plsql登录，发现直接进入数据库了。
-------------------------------------------------------------------------华丽的分隔符------------------------------------------------------------------------------------------------------------------
世界上有一种不用重启电脑就能解决问题的他叫XX

还有一种不用重新安装oracle就能启动oracle的她又叫XX
