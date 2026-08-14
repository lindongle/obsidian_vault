---
title: ApacheServer-----关于443端口被占用的解决方法 - qtyy - 博客园
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:54
---

上午
已剪辑自: <https://www.cnblogs.com/chihirotan/p/5785339.html>
最经公司项目需要经过Apache服务器转发，自己也下载了ApacheServer，但是在启动的过程中，遇到443端口被占用，网上看了一些解决方法，都不对，没有解决问题。
执行启动命令httpd -k start (出现443 端口被占用的情况)
![image1](3f12a65778684db4aa24f0a7b0f06452.png)

自己查看了端口，netstat -aon\|findstr "443"
![image2](9480ab1f8d1d49d1b7aa4ccb74907bcd.png)
然后查看 该pid 属于哪一个进程（从而知道，是哪一个进程占用的端口443）
![image3](b563d0cb9c1a49a6840910abd797a66f.png)
发现是svn服务器占用了端口，以lz 的性格，不会委屈求全，（怎么也要让两个程序都正常的运行）

也浏览了很多资料，很多人都说（进入Apache的安装目录，搜索httpd-ssl.conf，右击文本打开。寻找443替换成其他不常用的端口号，比如442）
但是lz 试过，发现并没有解决问题
于是lz 有改了这个配置文件 httpd.ahssl.conf （寻找443替换成其他不常用的端口号，比如442）
![image4](541d2184f06a4106be58f81f9701dbac.png)

至此 Apache 启动正常
![image5](446a283245d347359202cf2ce9cfe5fe.png)
![image5](446a283245d347359202cf2ce9cfe5fe.png)

关于Apache的442 端口，对应的是https 协议
用户可以通过https://localhost:442/ 来访问到我们需要的页面
