---
title: Apache24发布多端口网站
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:51
---

目的：在默认80端口，增加8090端口，发布另一个目录的网站。使用虚拟主机配置功能。
原始配置文件
[httpd.conf](a855848316a14dfe9beae9d699ebfa2a.conf)

[httpd-vhosts.conf](25043b2b530e4c53a028b7f71c22ff5a.conf)
1、修改D:\Apps\Apache24\conf\httpd.conf，修改4个地方。
[httpd.conf](a855848316a14dfe9beae9d699ebfa2a.conf)
1）修改Apache24的路径：左反斜杠。
![image1](7b57c64488804c578f8d7faf53ce0c81.png)
2）找到LoadModule vhost_alias_module modules/mod_vhost_alias.so，将前面的#去掉，打开虚拟主机功能
![image2](ede3e02d33bc40e8a865ad8727ed348e.png)
3）找到Include conf/extra/httpd-vhosts.conf，将前面的#去掉，从设置从extra/httpd-vhosts.conf文件中读取配置
![image3](413b34f04fd64043bbeacf292bbf2398.png)
4）添加监听端口号8090，新增一行。
![image4](bbb243d345164f56a1e60d2d9478a08c.png)
2、修改D:\Apps\Apache24\conf\extra\httpd-vhosts.conf文件，
[httpd-vhosts.conf](25043b2b530e4c53a028b7f71c22ff5a.conf)
1）直接在最后添加以下内容：
\<VirtualHost \*:80\>
ServerAdmin webmaster@dummy-host.localhost
DocumentRoot "D:\Siemens\WebTier\Web_Tier\RichClient\webapp_root\otwweb"
ServerName 172.16.254.39
ErrorLog "logs/dummy-host.localhost-error.log"
CustomLog "logs/dummy-host.localhost-access.log" common
\<Directory "D:\Siemens\WebTier\Web_Tier\RichClient\webapp_root\otwweb"\>
Options FollowSymLinks
AllowOverride None
Require all granted
\</Directory\>
\</VirtualHost\>

\<VirtualHost \*:8090\>
ServerAdmin webmaster@dummy-host.localhost
DocumentRoot "D:\Siemens\WebTier\Web_Tier\RichClientTest\webapp_root\otwweb"
ServerName 172.16.254.39
ErrorLog "logs/dummy-host.localhost-error.log"
CustomLog "logs/dummy-host.localhost-access.log" common
\<Directory "D:\Siemens\WebTier\Web_Tier\RichClientTest\webapp_root\otwweb"\>
Options FollowSymLinks
AllowOverride None
Require all granted
\</Directory\>
\</VirtualHost\>
2）针对标红的地方按照实际主机名、端口、目录修改即可。
![image5](248d64c0c3814803a94a1b369a970898.png)
3、保存后，重新启动Apache服务。
