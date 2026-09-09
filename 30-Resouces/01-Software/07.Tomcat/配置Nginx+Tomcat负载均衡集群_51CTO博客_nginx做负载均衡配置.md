---
title: 配置Nginx+Tomcat负载均衡集群_51CTO博客_nginx做负载均衡配置
updated: 2026-06-06T10:05
created: 2023-05-13T19:29:31
---

上午
已剪辑自: <https://blog.51cto.com/yangshufan/2062649>
  Tomcat是Apache 软件基金会（Apache Software Foundation）的Jakarta 项目中的一个核心项目，由Apache、Sun 和其他一些公司及个人共同开发而成。Tomcat 是一个轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。本篇博客将配置Nginx+Tomcat负载均衡集群

**Tomcat的应用场景**
  Tomcat服务器是一个免费的开放源代码的Web应用服务器，属于轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。对于一个初学者来说，可以这样认为，当在一台机器上配置好Apache 服务器，可利用它响应对HTML 页面的访问请求。实际上Tomcat 部分是Apache 服务器的扩展，但它是独立运行的，所以当你运行tomcat 时，它实际上作为一个与Apache 独立的进程单独运行的，通常是作为一个Servlet和JSP容器，单独运行在后端，如下图所示：
![image1](5765b574902c43b19ff53a3bf898bd63.png)

**案例：**某公司发布V3版移联建站管理系统，该项目为Java语言开发的Web站点，需要一套可靠的解决方案来完善Web站点架构。我们以Nginx作为负载均衡器，Tomcat作为应用服务器的设置方法，配置负载集群，来提升整个站点的负载并发能力

**1. 配置第一台Tomcat服务器**
**（1）安装JDK，Tomcat**
\[root@localhost ~\]# service iptables stop //关闭防火墙  
\[root@localhost ~\]# tar zxf jdk-7u65-linux-x64.gz //安装JDK，配置Java环境  
\[root@localhost ~\]# mv jdk1.7.0_65/ /usr/local/java //移动jdk文件夹到/usr/local下，重命名为java  
\[root@localhost ~\]# vim /etc/profile.d/java.sh //建立脚本，使/usr/local/java/bin添加到PATH环境变量中  
export java_home=/usr/local/java  
export PATH=\$PATH:\$java_home/bin  
\[root@localhost ~\]# sh /etc/profile.d/java.sh //执行脚本，使其立即生效  
\[root@localhost ~\]# java -version //查看Java版本号，与之前安装的一致  
java version "1.7.0_45"  
OpenJDK Runtime Environment (rhel-2.4.3.3.el6-x86_64 u45-b15)  
OpenJDK 64-Bit Server VM (build 24.45-b08, mixed mode)  

\[root@localhost ~\]# tar zxf apache-tomcat-7.0.54.tar.gz //安装Tomcat  
\[root@localhost ~\]# mv apache-tomcat-7.0.54 /usr/local/tomcat //将文件移动到/usr/local下，重命名为tomcat  
\[root@localhost ~\]# /usr/local/tomcat/bin/startup.sh //启动tomcat服务  
\[root@localhost ~\]# netstat -anpt \| grep 8080 //Tomcat默认运行在8080端口  
tcp 0 0 :::8080 :::\* LISTEN 5344/java
- 1\.
- 2\.
- 3\.
- 4\.
- 5\.
- 6\.
- 7\.
- 8\.
- 9\.
- 10\.
- 11\.
- 12\.
- 13\.
- 14\.
- 15\.
- 16\.
- 17\.
**（2）打开浏览器，查看配置启动成功**  

![image2](0af82529a22249888cdd63f33033c1f1.png)

**（3）建立java的Web站点，存放网站文件，并制作测试文件**
\[root@localhost ~\]# mkdir -p /web/webapp //创建站点目录  
\[root@localhost ~\]# vim /web/webapp/index.jsp //编写测试文件  
\<html\>  
\<head\>  
\<title\> ysf\</title\>  
\<body\>  
\<% out.println("this is 192.168.1.2");%\>  
\</body\>  
\</html\>  
\[root@localhost ~\]# vim /usr/local/tomcat/conf/server.xml //修改主配置文件  
\<Host name="localhost" appBase="webapps"  
unpackWARs="true" autoDeploy="true"\>  
\<Context docBase="/web/webapp" path="" reloadable="false"\> //添加以下两行  
\</Context\>  

\[root@localhost ~\]# /usr/local/tomcat/bin/shutdown.sh  
\[root@localhost ~\]# /usr/local/tomcat/bin/startup.sh //重启tomcat
- 1\.
- 2\.
- 3\.
- 4\.
- 5\.
- 6\.
- 7\.
- 8\.
- 9\.
- 10\.
- 11\.
- 12\.
- 13\.
- 14\.
- 15\.
- 16\.
- 17\.
**（4）打开浏览器，验证该tomcat站点已经配置成功**
![image3](1c5923bb1838483487ffede37ecda1ae.png)

**2. 配置第二台Tomcat服务器**
  第二台的配置方法与第一台一样，我就不在重复了
![image4](eb9f735a1b334cc7a17c9bc7da54d49a.png)

**3. Nginx服务器配置**
\[root@localhost ~\]# service iptables stop //关闭防火墙  
\[root@localhost ~\]# yum -y install pcre-devel zlib-devel openssl-devel //安装相关软件包  
\[root@localhost ~\]# useradd -M -s /sbin/nologin nginx //创建运行nginx服务的程序用户  
\[root@localhost ~\]# tar zxf nginx-1.6.0.tar.gz -C /usr/src/  
\[root@localhost ~\]# cd /usr/src/nginx-1.6.0/  
\[root@localhost nginx-1.6.0\]# ./configure --prefix=/usr/local/nginx //指定安装  
--user=nginx --group=nginx //指定运行的用户和组  
--with-file-aio //启用文件修改支持  
--with-http_stub_status_module //启用状态统计  
--with-http_gzip_static_module //启用gzip静态压缩  
--with-http_flv_module //启用flv模块，提供寻求内存使用基于时间的偏移量文件  
--with-http_ssl_module //启用SSL模块  
\[root@localhost nginx-1.6.0\]# make && make install  

\[root@localhost nginx-1.6.0\]# vim /usr/local/nginx/conf/nginx.conf //修改配置文件  
upstream tomcat_server { //在http{…}内添加以下代码，设定负载均衡的服务器列表  
server 192.168.1.2:8080 weight=1; //weight参数代表权值，权值越高被分配到的越大  
server 192.168.1.3:8080 weight=1;  
}  
……省略部分内容  
location / { //在server{…}的location/{…}加入一行  
root html;  
index index.html index.htm;  
proxy_pass //加入此行，代理前面设定的列表中服务器  
}  

\[root@localhost nginx-1.6.0\]# /usr/local/nginx/sbin/nginx -t //测试配置文件是否正确  
nginx: the configuration file /usr/local/nginx/conf/nginx.conf syntax is ok  
nginx: configuration file /usr/local/nginx/conf/nginx.conf test is successful  
\[root@localhost nginx-1.6.0\]# /usr/local/nginx/sbin/nginx //开启nginx服务  
\[root@localhost nginx-1.6.0\]# netstat -anpt \| grep nginx //查看nginx服务的端口号及PID进程号  
tcp 0 0 0.0.0.0:80 0.0.0.0:\* LISTEN 4619/nginx
- 1\.
- 2\.
- 3\.
- 4\.
- 5\.
- 6\.
- 7\.
- 8\.
- 9\.
- 10\.
- 11\.
- 12\.
- 13\.
- 14\.
- 15\.
- 16\.
- 17\.
- 18\.
- 19\.
- 20\.
- 21\.
- 22\.
- 23\.
- 24\.
- 25\.
- 26\.
- 27\.
- 28\.
- 29\.
- 30\.
- 31\.
- 32\.

**4. 测试负载均衡效果**
  打开浏览器进行测试，可以看到权重相同，页面反复在以下两个页面来回切换
![image5](d69558ba11b540cb848aa6c948c1ae37.png)

