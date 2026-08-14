---
title: (26条消息) Windows Nginx 环境搭建安装配置详细教程 2020(最新)_Bnana博...
updated: 2026-07-05T17:09:11
created: 2026-07-05T17:09:11
---

(26条消息) Windows Nginx 环境搭建安装配置详细教程 2020(最新)\_Bnana博客-CSDN博客_nginx 配置详解windows
已剪辑自: <https://blog.csdn.net/ForeverBana/article/details/106850455>

# <span style='color:#1E4E79'>文章导读 </span>
## *<span style='color:#5B9BD5'>Nginx 下载</span>*
## *<span style='color:#5B9BD5'>Nginx 安装</span>*
## *<span style='color:#5B9BD5'>WIndows Nginx 环境搭建</span>*
## *<span style='color:#5B9BD5'>Nginx 配置</span>*
## *<span style='color:#5B9BD5'>Nginx 问题解决</span>*

# <span style='color:#1E4E79'>Nginx 下载</span>

[nginx-1.19.0](http://nginx.org/download/nginx-1.19.0.zip)  

  

# <span style='color:#1E4E79'>Nginx 安装</span>

**Window Nginx 为 压缩包文件——\>安装——\>解压安装包**  

** **

# <span style='color:#1E4E79'>Windos Nginx 环境配置</span>

**系统变量——\> 环境配置——\>新建系统变量 NGINX_HOME**
![image1](8effe90a46c74d5c833f8ce3ee4c3624.png)
**PATH 引入NGINX_HOME**  

![image2](e979cf25b0c74fc2a69c2cfc50cfc5e1.png)
## <span style='color:#2E75B5'>Nginx 操作命令参数</span>

### <span style='color:#5B9BD5'>nginx支持以下命令行参数</span>

**-?\| -h —打印命令行参数帮助。**
**-c file —使用替代配置file而不是默认文件。**
**-g directives —设置 全局配置指令，例如，**
**nginx -g“ pid /var/run/nginx.pid; worker_processessysctl -n hw.ncpu;”**
**-p prefix —设置nginx路径前缀，即将保留服务器文件的目录（默认值为/usr/local/nginx）。**
**-q —在配置测试期间抑制非错误消息。**
**-s signal —向 主进程发送信号。参数信号可以是以下之一：**
**stop —快速关闭**
**quit —正常关闭**
**reload —重新加载配置，使用新配置启动新工作进程，并正常关闭旧工作进程。**
**reopen —重新打开日志文件**
**-t —测试配置文件：nginx检查配置的语法是否正确，然后尝试打开配置中引用的文件。**
**-T —与相同-t，但另外将配置文件转储到标准输出（1.9.2）。**
**-v —打印nginx版本。**
**-V —打印nginx版本，编译器版本和配置参数。**

**环境测试：**  

**输入 nginx -V 查看nginx 信息**
![image3](e5dd8842db194478ad6c17d3dff78af6.png)

**Nginx 服务 开启**  

**cmd 进入 nginx 解压文件位置**
**输入nginx 开启服务**
nginx
- 1
**浏览器访问：**[http://localhost:80](http://localhost/)  

**运行效果：**
![image4](b7eecb00b9b14628898645e5eb223d65.png)
# <span style='color:#1E4E79'>Nginx 配置解析</span>

**配置文件路径 ——\> 解压文件目录/config/nginx.config**
\########### 每个指令必须有分号结束。#################  
\#user administrator administrators; \#配置用户或者组，默认为nobody nobody。  
\#worker_processes 2; \#允许生成的进程数，默认为1  
\#pid /nginx/pid/nginx.pid; \#指定nginx进程运行文件存放地址  
error_log log/error.log debug; \#制定日志路径，级别。这个设置可以放入全局块，http块，server块，级别以此为：debug\|info\|notice\|warn\|error\|crit\|alert\|emerg  
events {  
accept_mutex on; \#设置网路连接序列化，防止惊群现象发生，默认为on  
multi_accept on; \#设置一个进程是否同时接受多个网络连接，默认为off  
\#use epoll; \#事件驱动模型，select\|poll\|kqueue\|epoll\|resig\|/dev/poll\|eventport  
worker_connections 1024; \#最大连接数，默认为512  
}  
http {  
include mime.types; \#文件扩展名与文件类型映射表  
default_type application/octet-stream; \#默认文件类型，默认为text/plain  
\#access_log off; \#取消服务日志  
log_format myFormat '\$remote_addr–\$remote_user \[\$time_local\] \$request \$status \$body_bytes_sent \$http_referer \$http_user_agent \$http_x_forwarded_for'; \#自定义格式  
access_log log/access.log myFormat; \#combined为日志格式的默认值  
sendfile on; \#允许sendfile方式传输文件，默认为off，可以在http块，server块，location块。  
sendfile_max_chunk 100k; \#每个进程每次调用传输数量不能大于设定的值，默认为0，即不设上限。  
keepalive_timeout 65; \#连接超时时间，默认为75s，可以在http，server，location块。  

upstream mysvr {  
server 127.0.0.1:7878;  
server 192.168.10.121:3333 backup; \#热备  
}  
error_page 404 <https://www.baidu.com>; \#错误页  
server {  
keepalive_requests 120; \#单连接请求上限次数。  
listen 4545; \#监听端口  
server_name 127.0.0.1; \#监听地址  
location ~\*^.+\$ { \#请求的url过滤，正则匹配，~为区分大小写，~\*为不区分大小写。  
\#root path; \#根目录  
\#index vv.txt; \#设置默认页  
proxy_pass <http://mysvr>; \#请求转向mysvr 定义的服务器列表  
deny 127.0.0.1; \#拒绝的ip  
allow 172.18.5.54; \#允许的ip  
\# expires 设置客户端缓存  
\#expires 1h;  
index index.php index.html;  
\# 资源重定向，如访问http://shop.devops.com/index.html后会被重写为访问http://shop.devops.com/index.php，permanent表示永久重定向  
rewrite /index.html /index.php permanent;  

\# 资源重定向，\$request_filename为nginx的内置变量，表示资源文件路径  
if (!-e \$request_filename) {  
rewrite ^(.\*)\$ /index.php?s=/\$1 last;  
break;  
}  
}  
location ~ \\(js\|css\|jpg\|png) {  
\# 告诉客户端所有js,css,jpg,png文件都可以缓存1小时，不用重新在服务器下载  
expires 1h;  
\# 防盗链实现，所有不是从shop.devops.com跳转过去访问js\|css\|jpg\|png文件的都被拦截，返回404  
valid_referers shop.devops.com;  
if (\$invalid_referer) {  
return 404;  
}  
}  
\# php解析  
location ~ \\php\$ {  
\# root html;  
fastcgi_pass 127.0.0.1:9000;  
fastcgi_index index.php;  
fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;  
include fastcgi_params;  
}  
}  
}
![image5](8c205d089dbd49e68522df66ad2c3e67.png)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
- 19
- 20
- 21
- 22
- 23
- 24
- 25
- 26
- 27
- 28
- 29
- 30
- 31
- 32
- 33
- 34
- 35
- 36
- 37
- 38
- 39
- 40
- 41
- 42
- 43
- 44
- 45
- 46
- 47
- 48
- 49
- 50
- 51
- 52
- 53
- 54
- 55
- 56
- 57
- 58
- 59
- 60
- 61
- 62
- 63
- 64
- 65
- 66
- 67

# <span style='color:#1E4E79'>问题解决</span>

**问：Window cmd 运行 nginx 进程无法关闭？**  

**解决：**
**管理员 运行cmd**
**查找 nginx 代理端口 PID**
netstat -ano
- 1
**任务进程——\>根据 PID 查询 nginx 进程**
tasklist\|findstr "PID"
- 1
**结束 Nginx 进程**
taskkill /f /t /im nginx.exe
- 1

2022年3月7日
21:36
