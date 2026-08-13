---
title: 本机不装Oracle，使用plsql连接远程Oracle的方法 - 迷茫王子 - 博客园
updated: 2026-06-06T00:30
created: 2018-10-22T22:21:27
---

本机不装Oracle，使用plsql连接远程Oracle的方法 - 迷茫王子 - 博客园
星期一, 十月 22, 2018
2:21 下午
已剪辑自: <https://www.cnblogs.com/lyb0103/p/8616594.html>
由于Oracle的庞大，有时候我们需要在只安装Oracle客户端如plsql、toad等的情况下去连接远程数据库，可是没有安装Oracle就没有一切的配置文件去支持。  
最后终于发现一个很有效的方法，Oracle的Instant client工具包可以很好地解决这个问题，而且小而方便。  
1、首先到Oracle网站下载Instant Client :  

<http://www.oracle.com/us/solutions/index-097480.html>  

解压之后的文件夹叫:instantclient_11_2.可以放在本地磁盘任意目录下.例如:D:/instantclient_11_2  

2、在D:/instantclient_11_2目录下新建目录network,在network目录下再建admin目录,在admin目录下新建文件tnsnames.ora,打开写入如下内容:  

ORCL =  
(DESCRIPTION =  
(ADDRESS_LIST =  
(ADDRESS = (PROTOCOL = TCP)(HOST = 10.6.8.10 )(PORT = 1521))  
)  
(CONNECT_DATA =  
(SERVICE_NAME = orcl )  
)  
)  

其中ORCL是远程数据库在本地的主机名，10.6.8.10是远程服务器的IP地址，orcl是远程数据库的名称。  

3、添加一个环境变量，名为TNS_ADMIN，值为tnsnames.ora文件所在路径。  
通过（我的电脑--属性--高级--环境变量--新建）来新增环境变量。  

4、下载并安装PL.SQL.Developer配置应用  
配置tools-\>preferences-\>connection  

Oracle Home  
D:/instantclient_11_2  

OCI library  
D:/instantclient_11_2/oci.dll  

配置完成后关闭PL/SQL ,再重启.  

主机名就会出现在PL/SQL Developer的列表里，输入用户名密码，就可以登录远程oracle 数据库。  

当我们连接成功后有时候查询出来的数据会出现乱码的问题，这是因为本地的编码和服务器端编码不一致，这时候我们可以通过SQL语句：  

select userenv('language') from dual;  

查询出服务器端的编码，如我自己的查询结果为  

USERENV('LANGUAGE')  
AMERICAN_AMERICA.ZHS16GBK  

我们就需要添加一个环境变量NLS_LANG ,值为: AMERICAN_AMERICA.ZHS16GBK 然后重启PL/SQL就不会再有乱码问题了。
分类: [软件安装](https://www.cnblogs.com/lyb0103/category/1176838.html)
[«](https://www.cnblogs.com/lyb0103/p/8582888.html) 上一篇：[ORACLE配置tnsnames.ora文件实例<u>  
</u>](https://www.cnblogs.com/lyb0103/p/8582888.html)[»](https://www.cnblogs.com/lyb0103/p/9082456.html) 下一篇：[Java集合操作类Collections的一些常用方法<u>  
</u>](https://www.cnblogs.com/lyb0103/p/9082456.html)
