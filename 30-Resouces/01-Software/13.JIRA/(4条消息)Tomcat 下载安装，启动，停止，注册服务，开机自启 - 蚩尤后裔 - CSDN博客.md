---
title: (4条消息)Tomcat 下载安装，启动，停止，注册服务，开机自启 - 蚩尤后裔 - CSDN博客
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:55
---

(4条消息)Tomcat 下载安装，启动，停止，注册服务，开机自启 - 蚩尤后裔 - CSDN博客
2019年7月31日
1:17
已剪辑自: <https://blog.csdn.net/wangmx1993328/article/details/81013715#Tomcat%20%E4%B8%8B%E8%BD%BD>
**目录**
[Tomcat 下载](https://blog.csdn.net/wangmx1993328/article/details/81013715#Tomcat%20%E4%B8%8B%E8%BD%BD)
[startup.bat 启动 Tomcat](https://blog.csdn.net/wangmx1993328/article/details/81013715#startup%20.bat%20%E5%90%AF%E5%8A%A8)
[service.bat 服务启动](https://blog.csdn.net/wangmx1993328/article/details/81013715#%E6%B3%A8%E5%86%8C%E6%9C%8D%E5%8A%A1%E5%90%AF%E5%8A%A8)
[注册服务](https://blog.csdn.net/wangmx1993328/article/details/81013715#%E6%B3%A8%E5%86%8C%E6%9C%8D%E5%8A%A1)
[移除服务](https://blog.csdn.net/wangmx1993328/article/details/81013715)
[停止 Tomcat](https://blog.csdn.net/wangmx1993328/article/details/81013715#%E5%81%9C%E6%AD%A2%20Tomcat%C2%A0)
启动 tomcat 一般有两种方式：
1、直接运行 %Tomcat_HOME%//bin/startup.bat 启动；
2、使用 %Tomcat_HOME%//bin/service.bat 注册 windows 服务启动。
# <span style='color:#1E4E79'>Tomcat 下载</span>
1、官网下载： <https://tomcat.apache.org/download-90.cgi>
2、如果是 Linux 系统，则可以下载[tar.gz](http://mirrors.shu.edu.cn/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz) ([pgp](https://www.apache.org/dist/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz.asc), [sha512](https://www.apache.org/dist/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz.sha512))，如果 Windows 系统，则建议下载[64-bit Windows zip](http://mirrors.shu.edu.cn/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16-windows-x64.zip) ([pgp](https://www.apache.org/dist/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16-windows-x64.zip.asc), [sha512](https://www.apache.org/dist/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16-windows-x64.zip.sha512))（视自己系统位数选择32、64），因为 zip(gpg,sha513) 解压后虽然可以使用，但是 bin 目录下没有 service.bat，无法注册 Windows 服务。
![image1](08bdb2e125a84d0d8258ba6b234b21bd.png)
# <span style='color:#1E4E79'>startup.bat 启动 Tomcat</span>
1、通常下载解压版即可，解压后可以直接使用，安装版使用不灵活。
2、直接到 %Tomcat_HOME%/bin 目录下面运行 startup.bat ( linux 中是 startup.sh )文件即可开启 Tomcat，默认端口 8080，浏览器输入 localhost:8080 即可访问。
3、这样做的好处是能直接从窗口中实时的看到项目中所有输出的内容，以及抛出的异常与错误等，适合于调试阶段
4、Windws 系统中可以将 startup.bat 创建快捷方式，然后放到启动文件夹中，这样就会开机自起。
![image2](1aa7b1d1eb98455ebec6e8e8c6f8110b.gif)
![image3](fd88441ddd6d43249d6d0f6021df297a.gif)

# <span style='color:#1E4E79'>service.bat 服务启动</span>
1、对于项目部署阶段，有时候不希望用户看到这样一个黑框还有这些内容，因为很可能由于误操作而导致 Tomcat 关闭。
2、此时可以将 tomcat 注册成服务，再设置这个服务为“自动”启动，这样每次同样是开机自起，而且不会再弹框，看不到任何内容。
3、%Tomcat_HOME%/bin 目录提供了一个 service.bat 批处理文件，用于为 tomcat 注册成系统服务所用。
![image4](3675508fc0f946a082f9f0e4646fed11.png)
## <span style='color:#2E75B5'>注册服务</span>
1、Windows 的DOS 命令行模式下，cd 到 tomcat 的 bin 目录下，或者直接在 service.bat 目录下打开 cmd。
2、执行命令:“service.bat install 服务名”，后面的服务名可以随便取，别跟系统已有的服务名冲突即可，不写时默认服务名为“Apache Tomcat”

![image5](1471547685d94eb89a7b6c1a3b0e1aaa.gif)
![image6](ac700d0cfe804a988c130eefee6ebc4e.gif)
3、执行命令:“service.bat install 服务名”后，看到提示：The Service '服务名' has beeninstalled ，则表示成功。
4、启动服务就可以运行 tomcat 了。
![image7](9d66c95d1ba64acca10d85cb4ed9db86.gif)
5、如果想要开机自启，则将“启动类型”的“手动”改为“自动”或“自动（延迟启动）”即可。
![image8](6e31dfe2ffd64ed9943d3246857dcea3.gif)
## <span style='color:#2E75B5'>移除服务</span>
1、如果不再需要 Tomcat 服务了，也可以用"service.bat uninstall 服务名" 将其移除。
2、移除成功的提示信息：The Service ‘服务名' has been removed，同时在电脑服务中也会消失。
3、移除前先停止 Tomcat 服务。
![image9](7af3af2553ce4dc2aa5d04d5d666c082.gif)
![image10](4f7467c148664e05a03fc1dc727d938f.gif)
# <span style='color:#1E4E79'>停止 Tomcat</span>
1、如果是 startup.bat、startup.sh 启动 Tomcat，则对应着使用 shutdown.bat、shutdown.sh 进行停止 Tomcat
2、如果是服务启动 Tomcat，则进入服务，停止服务即可停止 Tomcat。
![image11](0e71e905d9944cb2b05a9c5cebc64044.png)

