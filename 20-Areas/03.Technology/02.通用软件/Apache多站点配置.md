---
title: Apache多站点配置
updated: 2026-06-05T23:08
created: 2018-03-09T23:06:16
---

是在同一个ip下面配置不同的端口的方法
<span style='background:white'></span>
打开appserv的安装目录，找到httpd.conf文件，找到：D:\wamp\bin\apache\apache2.4.23\conf\httpd.conf
# Listen 12.34.56.78:80
Listen 0.0.0.0:80
Listen \[::0\]:80
Listen \[::0\]:81 \[注：81和82是新加入的\]
Listen \[::0\]:82
<span style='background:#F4F4F4'>然后参照虚拟主机的设置方法。不同的是：</span>
\<VirtualHost \*:80\> 这个后边的端口号按自己需求更改就成了。
如果 弄完之后 出现403错误 那 在httpd.conf里找到：
<span style='background:white'>\<VirtualHost \*:80\></span>
ServerName localhost
ServerAlias localhost
DocumentRoot D:/wwwroot/baoweima.com/public
\<Directory"D:/wwwroot/baoweima.com/public"\>
Options +Indexes +Includes +FollowSymLinks +MultiViews
AllowOverride All
Require local
\</Directory\>
<span style='background:#F4F4F4'>\</VirtualHost\></span>
<span style='background:white'></span>
<span style='background:#F4F4F4'>\<VirtualHost \*:81\></span>
ServerName localhost
ServerAlias localhost
DocumentRoot D:/thinkPHP/tp5/public
\<Directory"D:/thinkPHP/tp5/public"\>
Options +Indexes +Includes +FollowSymLinks +MultiViews
AllowOverride All
Require local
\</Directory\>
<span style='background:white'>\</VirtualHost\></span>
