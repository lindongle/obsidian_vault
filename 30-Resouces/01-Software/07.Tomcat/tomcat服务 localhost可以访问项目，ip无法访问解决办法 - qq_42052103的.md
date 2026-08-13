---
title: tomcat服务 localhost可以访问项目，ip无法访问解决办法 - qq_42052103的...
updated: 2026-06-06T00:34
created: 2019-11-05T23:15:53
---

tomcat服务 localhost可以访问项目，ip无法访问解决办法 - qq_42052103的博客 - CSDN博客
星期二, 十一月 5, 2019
3:15 下午
已剪辑自: <https://blog.csdn.net/qq_42052103/article/details/82620162>
最近在开发项目中，遇到的一个问题是：
在 tomcat中发布一个web项目，但是发布成功后，只能用<http://localhost:8080/fm>访问项目，不能用
[http://127.0.0.1:8080/fm](https://blog.csdn.net/xinyue3054/article/details/7895166)访问项目，也不能用本地的IP地址访问（[http://192.16/8.0.191:8080/fm](https://blog.csdn.net/xinyue3054/article/details/7895166)）
起初认为是防火墙的原因，但是防火墙是关闭的，应该没有影响；
后来认为是win7的原因，那个远程那有个不允许远程访问，但是更改了都没有效果；
再后来认为是想原来tomcat6的时候，没有出现过此问题，所以现在觉得应该是tomcat5的问题。

经过从网上查找，原因应该是tomcat绑定IP地址的问题，可以通过ping localhost查看IP是哪种格式，现解决方案如下：
（借鉴而得的解决方法）
1\. 使用cmd命令netstat -n, 查看tomcat地址绑定, 发现是绑定到::1, IPv6.
2\. 配置tomcat的server.xml, 更改connector配置, 端口不用改, 加上address="0.0.0.0", 使其绑定到IPv4, 如下

（借鉴的解决方案）
\<1\>使用cmd命令netstat -n, 查看tomcat地址绑定, 发现是绑定到::1, IPv6;
\<2\>配置tomcat的server.xml, 更改connector配置, 端口不用改, 加上address="0.0.0.0", 使其绑定到IPv4
\<Connector port="8080" maxHttpHeaderSize="8192" **address="0.0.0.0"  
 maxThreads="150" minSpareThreads="25" maxSpareThreads="75"  
 enableLookups="false" redirectPort="8443" acceptCount="100"  
 connectionTimeout="20000" disableUploadTimeout="true" /\>**
\<3\>重启tomcat, 再次使用netstat -n, 查看tomcat地址绑定, 已变为IPv4.
此问题即可迎刃而解。
