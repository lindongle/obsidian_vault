---
title: (30条消息) Tomcat局域网内共享文件夹（超级简单）_CV干饭王的博客-CSDN博客_tomc...
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

(30条消息) Tomcat局域网内共享文件夹（超级简单）\_CV干饭王的博客-CSDN博客_tomcat访问共享文件
已剪辑自: <https://blog.csdn.net/weixin_44414948/article/details/109629969>
## 同一个局域网内，电脑防火墙关闭、IP可以相互ping通的前提下，[内网](https://so.csdn.net/so/search?q=%E5%86%85%E7%BD%91&spm=1001.2101.3001.7020)任意电脑都可以访问服务器共享的文件夹。
**Tomcat共享文件夹步骤如下：**  
**（1）在 C:\apache-tomcat-8.5.59\webapps\ROOT** 文件下新建想要共享的文件夹，放入想要共享的文件。（C:\\[apache](https://so.csdn.net/so/search?q=apache&spm=1001.2101.3001.7020)-tomcat-8.5.59是笔者的Tomcat安装目录，各位看官记得改成自己的）
![image1](d812b549852647cdbb835c8d2189e833.png)

![image2](79255a4db33147b8b586d0367f06cbed.png)
（2）进入到 **C:\apache-tomcat-8.5.59\conf** 文件夹，编辑打开web.[xml](https://so.csdn.net/so/search?q=xml&spm=1001.2101.3001.7020)文件，将原本的 false 改为 true，保存退出即可。
![image3](f7ae3107941c4166b47ff9815db47ca3.png)
**最后打开浏览器输入**http://localhost:9100/Kinect-realtime/**即可本机访问（默认端口是8080，笔者为了防止被占用改成了9100端口，Kinect-realtime记得改成自己新建的文件夹名字）**
**Tomcat设置默认端口的方法，可以参考下面链接的方法2**  
[**https://blog.csdn.net/weixin_44414948/article/details/109626356**](https://blog.csdn.net/weixin_44414948/article/details/109626356)
<http://localhost:9100/Kinect-realtime/>
- 1
![image4](6fe9d1f370ef4260af87e0a3f8d1f115.png)
## 同一个局域网内，电脑防火墙关闭、IP可以相互ping通的前提下，内网任意电脑都可以访问服务器共享的文件夹。
**访问时只需要将** <http://localhost:9100/Kinect-realtime/> **改为** <http://10.22.244.31:9100/Kinect-realtime/> **即可访问**（10.22.244.31为笔者服务器ip，看官们记得改成自己服务器电脑的ip）。
2022年10月20日
19:59
