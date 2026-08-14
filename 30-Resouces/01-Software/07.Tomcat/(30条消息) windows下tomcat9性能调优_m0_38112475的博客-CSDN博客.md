---
title: (30条消息) windows下tomcat9性能调优_m0_38112475的博客-CSDN博客
updated: 2026-06-08T19:55:22
created: 2026-07-05T17:04:55
---

(30条消息) windows下tomcat9性能调优_m0_38112475的博客-CSDN博客
星期五, 一月 29, 2021
2:05 下午
已剪辑自: <https://blog.csdn.net/m0_38112475/article/details/105587000>
tomcat是很多人日常使用的调试代码工具，还有很多小型项目在服务器上使用tomcat，但是不经过调优，不但发挥不出机器性能，还很容易宕机、卡顿。  
很多调优文章，我觉得只需要两处调优足够了。  
一、server.xml配置文件里修改
```xml
<Connector  
port="8080"  
protocol="org.apache.coyote.http11.Http11AprProtocol"  
enableLookups="false"  
maxThreads="1000"  
minSpareThreads="100"  
acceptCount="900"  
redirectPort="8443"  
disableUploadTimeout="true"  
connectionTimeout="20000"  
URIEncoding="UTF-8"  
compression="on"  
compressionMinSize="1024"  
useSendfile="false"  
noCompressionUserAgents="gozilla, traviata"  
compressibleMimeType="text/html,text/xml,text/plain,text/css,text/javascript,application/javascript "/>
```

1.启用 apr protocol=“org.apache.coyote.http11.Http11AprProtocol”  
bin目录里自带tcnative-1.dll，直接启用就行。  
不过要注意的是，apr模式使用的是ipv6网络，如果计算机不支持ipv6，趁早改回nio。  
2.线程调优，直接复制就行，已经优化。  
二、bin/catalina.bat 修改  
默认是客户端模式，所以性能差了点。
![image1](8b41aa78e16f41678d1cad61f383dc2e.png)
在set "JAVA_OPTS=%JAVA_OPTS% -Djava.protocol.handler.pkgs=org.apache.catalina.webresources"这句下面直接加
JAVA_OPTS="\$JAVA_OPTS -server -Xms2048m -Xmx2048m -XX:PermSize=128m -XX:MaxPermSize=256 -Djava.awt.headless=true"
- 1
1.第一个作用增加内存  
2.第二个作用-server 以服务形式启动。  
有了这几处修改，性能暴涨数倍。
