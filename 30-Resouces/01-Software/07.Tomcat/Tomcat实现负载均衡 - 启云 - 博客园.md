---
title: Tomcat实现负载均衡 - 启云 - 博客园
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

Tomcat实现负载均衡 - 启云 - 博客园
星期四, 五月 19, 2022
2:21 下午

已剪辑自: <https://www.cnblogs.com/eeexu123/p/13685319.html>
动态服务器的问题，往往就是并发能l力太弱，常常需要多台动态服务器一起提供服务。但是如何把并发的压力分摊，这就是需要调度，采用一定的调度策略，将请求分发给不同的服务器，这就是Load Balance负载均衡。
**1、负载均衡规划和准备**
负载均衡各主机的网络与规划
| **IP**     | **主机名**      | **服务** | **软件**      |
|------------|-----------------|----------|---------------|
| 10.0.0.141 | herine          | 调度器   | Nginx         |
| 10.0.0.175 | herine-web      | Tomcat1  | JDK8、Tomcat9 |
| 10.0.0.176 | herine-web-node | Tomcat2  | JDK8、Tomcat9 |

在调度器上的实现域名解析：vim /etc/hosts
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4  
::1 localhost localhost.localdomain localhost6 localhost6.localdomain6  
10.0.0.175 harlan-web  
10.0.0.176 harlan-web-node
**2、Tomcat主机准备**
在tomcat1和tomcat2节点上conf/server.xml
\<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  
　　prefix="access" suffix=".log"  
　　pattern='%a %h %l "-" %t "%r" %s %b %D "%{Referer}i" "%{X-Forwarded-For}i" "%{User-Agent}i"' /\>  
　　\<Context path="/" docBase="/data/webapps/ROOT" debug="0" reloadable="true"\>\</Context\>
在tomcat1和tomcat2节点上/data/webapps/ROOT/index.jsp
![image1](e347a139976248388b5f73d6064b989a.gif)
\<%@ page import="java.util.\*" %\>  
\<!DOCTYPE html\>  
\<html lang="en"\>  
\<head\>  
\<meta charset="UTF-8"\>  
\<title\>lbjsptest\</title\>  
\</head\>  
\<body\>  
\<div\>On \<%=request.getServerName() %\>\</div\>  
\<div\>\<%=request.getLocalAddr() + ":" + request.getLocalPort() %\>\</div\>  
\<div\>SessionID = \\<%=session.getId() %\>\</span\>\</div\>  
\<%=new Date()%\>  
\</body\>  
\</html\>
![image1](e347a139976248388b5f73d6064b989a.gif)
Tomcat1(10.0.0.175)的配置是否正确
![image1](e347a139976248388b5f73d6064b989a.gif)
\[root@herine ~\]# curl -I 10.0.0.175  
HTTP/1.1 200  
Set-Cookie: JSESSIONID=39E7E70DFDE6567DA77504DEFC45758F; Path=/; HttpOnly  
Content-Type: text/html;charset=UTF-8  
Content-Language: zh-CN  
Transfer-Encoding: chunked  
Date: Thu, 17 Sep 2020 06:12:45 GMT
![image1](e347a139976248388b5f73d6064b989a.gif)
Tomcat2(10.0.0.176)的配置是否正确
![image1](e347a139976248388b5f73d6064b989a.gif)
\[root@herine ~\]# curl -I 10.0.0.176  
HTTP/1.1 200  
Set-Cookie: JSESSIONID=FFB77376E2C24B63C725399E8A710205; Path=/; HttpOnly  
Content-Type: text/html;charset=UTF-8  
Content-Language: zh-CN  
Transfer-Encoding: chunked  
Date: Thu, 17 Sep 2020 06:12:50 GMT
![image1](e347a139976248388b5f73d6064b989a.gif)
由上可知，两台的Tomcat主机准备正确，访问正常。
**3、Nginx实现后端tomcat的负载均衡调度**
1、配置Nginx的配置文件：vim /etc/nginx/nginx.conf
![image1](e347a139976248388b5f73d6064b989a.gif)
worker_processes 1;  
events {  
worker_connections 1024;  
}  
http {  
include mime.types;  
default_type application/octet-stream;  
sendfile on;  
keepalive_timeout 65;  
upstream tomcat-pools{  
server 10.0.0.175;  
server 10.0.0.176;  
}  
server {  
listen 80;  
server_name [www.harlan-web.io](http://www.harlan-web.io);  
location / {  
proxy_pass <http://tomcat-pools>;  
include proxy.conf;  
}  
}  
}　　
![image1](e347a139976248388b5f73d6064b989a.gif)
2、配置负载配置文件:vim /etc/nginx/proxy.conf

![image1](e347a139976248388b5f73d6064b989a.gif)
proxy_set_header Host \$host;  
proxy_set_header X-Forwarded-For \$remote_addr;  
proxy_connect_timeout 60s;  
proxy_send_timeout 60s;  
proxy_read_timeout 60s;  
proxy_buffer_size 4K;  
proxy_buffers 4 32k;  
proxy_busy_buffers_size 64k;  
proxy_temp_file_write_size 64k;
![image1](e347a139976248388b5f73d6064b989a.gif)

重启Nginx
systemctl restart nginx
通过浏览器打开:[www.harlan-web.io](http://www.harlan-web.io)
![image2](1bd8a623241c4525a2fce0572831bf39.png)

多次刷新后，可以看到每次刷新后，主机不一样，而且SessionID也会不一样。
**Session会话**
当浏览器第一次HTTP请求服务器端时，在服务器端产生一个随机值既SessionID发送给浏览器，浏览器端收到后会保持这个sessionID在Cookie当中，这个Cookie值一般不能持久存储，浏览器关闭就消失。浏览器在每一次提交HTTP请求的时候会把这个SessionID传给服务器，服务器端就可以通过对比知道谁了。
- session通常会保存在服务器端内存，如果没有持久化，则容易丢失。
- session会定时过期，过期后浏览器再访问，服务端发现没有此ID，将给浏览器端重新发新的SessionID
- 更新浏览器也将重新获取新的sessionID
在upstream中使用ip_hash指令，使用客户端IP地址Hash
![image1](e347a139976248388b5f73d6064b989a.gif)
worker_processes 1;  
events {  
worker_connections 1024;  
}  
http {  
include mime.types;  
default_type application/octet-stream;  
sendfile on;  
keepalive_timeout 65;  
upstream tomcat-pools{  
ip_hash; \#启动源地址hash  
server 10.0.0.175;  
server 10.0.0.176;  
}  
server {  
listen 80;  
server_name [www.harlan-web.io](http://www.harlan-web.io);  
location / {  
proxy_pass <http://tomcat-pools>;  
include proxy.conf;  
}  
}  
}
![image1](e347a139976248388b5f73d6064b989a.gif)
再次重启Nginx
systemctl restart nginx
接下来，打开浏览器:[www.harlan-web.io](http://www.harlan-web.io),通过浏览器看到主机不变，sessionID也不变。
![image3](3ad40121690a43f6863925feb6b25432.png)

当关闭掉Tomcat2(10.0.0.176)的tomcat服务器后，再次刷新浏览器，有如下变化：
![image4](800ade0313794d2daa0a25c740863ec6.png)

虽然，上述的方法实现客户端在一段时间内找同一台Tomcat，从而避免切换后导致session丢失。但是如果tomcat节点挂掉，那么session依旧丢失。
推荐使用session共享服务器。使用redis、memcached做共享的session服务器。
