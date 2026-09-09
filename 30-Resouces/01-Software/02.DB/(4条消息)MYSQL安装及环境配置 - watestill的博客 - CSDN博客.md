---
title: (4条消息)MYSQL安装及环境配置 - watestill的博客 - CSDN博客
updated: 2026-06-06T10:05
created: 2019-07-27T09:35:40
---

(4条消息)MYSQL安装及环境配置 - watestill的博客 - CSDN博客
星期六, 七月 27, 2019
1:35 上午
已剪辑自: <https://blog.csdn.net/watestill/article/details/81532780>
MYSQL的安装：
总结起来就：1，下载解压，2，配置环境变量，3初始化生成data文件，4安装mysql服务
1下载：
我的电脑是win7，32位系统，由于下载时是从msdn上下的，没有驱动，所以用着有点难受，建议安装前把要用到的c++运行库给安装完。
首先说下载：
直接去mysql官网下载，这里附上下载链接<https://dev.mysql.com/downloads/mysql/5.7.html#downloads>。
会进入到这个界面，一直向下滑，滑到底。
![image1](9666094c33d04087ab66ee189ddc503b.png)
根据自己的电脑下载不同的版本：
![image2](625037c9a1734a73ac6a23c68d9ad029.png)
2，配置环境变量：
点击计算机，进入之后右键点击属性，点左边的高级环境配置，点击环境变量，在系统变量里面找到path，点击path，编辑，找到最后添加D:\mysql-5.7.23-win32\bin；（一定要带上分号），不同的电脑不一样这里也就是解压后安装包里bin的目录添加完之后一路确定，环境就配好了。
![image3](888c80a2f8724134a68cc369e96b9c60.png)
3，初始化
如果是老版本需要配置my.ini文件，新版本就不用了。配置my.ini文件下面会说。
用管理员权限运行命令提示符，进行初始化，初始化有2种方法：
1、mysqld --initialize-insecure 这种方法初始化后没有设置密码，密码为空。
2、mysqld --initialize 这种方法初始化后会随机生成密码，如果要找得到密码就需要去生成得data文件夹中后缀名为.err的
文件中去找（ctrl+f搜password）
![image4](3318a671ffa14a5892fde0db11ce9a6f.png)
其中localhost:后面就是你的密码。

配置my.ini:
安装包下载解压之后会有一个my-default.ini文件，有的没有这个文件，不过不要紧按照下面修改一下就好了，新建一个文本文档，把下面内容粘进去，把名字和后缀名改为my.ini就行了。

1.  \[mysql\]
2.  \# 设置mysql客户端默认字符集
3.  default-character-set=utf8
4.  
5.  \[mysqld\]
6.  \# 设置3306端口
7.  port = 3306
8.  \# 设置mysql的安装目录
9.  basedir=C:\mysql-5.7.23
10. \# 允许最大连接数
11. max_connections=20
12. \# 服务端使用的字符集默认为8比特编码的latin1字符集
13. character-set-server=utf8
14. \# 创建新表时将使用的默认存储引擎
15. default-storage-engine=INNODB
注意里面内容要修改的就是basedir的内容了，换成自己的解压路径就行了。
4、安装mysql服务
在命令提示符里面输入mysqld -install
然后就安装完毕了！

接下来输入net start mysql；回车ok，mysql就安装好了。
修改密码：

法一：命令行格式输入：mysql -u root -p回车进入mysql
输入：
mysql\>set password =password('你的密码');
mysql\>flush privileges;
法二：
输入：mysqladmin -u root -p password回车
设置密码即可。
密码设置完成，请开始你的骚操作吧！
