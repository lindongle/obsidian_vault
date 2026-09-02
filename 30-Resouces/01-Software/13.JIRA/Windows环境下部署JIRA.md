---
title: Windows环境下部署JIRA
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:55
---

Windows环境下部署JIRA
2019年7月27日
2:59

## Windows环境下部署JIRA 
**准备工作：**
1、下载JIRA-V7.3.8版本：
<https://www.atlassian.com/software/jira/download>

<https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.3.8-x64.exe>

2、下载jdk1.8版本：jdk-8u121-windows-x64.exe

3、下载Mysql+Apache+php集成下的upupw，推荐使用更方便
 <https://pan.baidu.com/s/107XwmIeWZTPN4vg8kGcJEQ> 密码: ecwu

4、下载MySQL JDBC连接驱动：mysql-connector-java-5.1.25-bin.jar

«span style='color:#333333'»5、MySQL中创建JIRA用户，JIRA数据库，设置用户权限  
（1）INSERT INTO mysql.user(HOST, USER, PASSWORD) VALUES("localhost", "jirauser", PASSWORD("123456"));«/span»
**（2）**CREATE DATABASE jiradb CHARACTER SET utf8 COLLATE utf8_bin;
**（3）**GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, INDEX ON jiradb.\* TO 'jirauser'@'localhost' IDENTIFIED BY '123456';
**（4）**flush privileges;

6、下载JIRA破解包7.3.8版本：
将包中的atlassian-extras-3.2.jar 复制到 usr/local/atlassian-jira-software-7.3.6-standalone/atlassian-jira/WEB-INF/lib/ 替换原有的包。 重启jira
![image1](72e8f4859cff4ab48c3b82dde9c41b5a.png)

**搭建upupw：**
网上很多安装步骤，使用方便  

**安装jira步骤：**
1、双击运行文件：atlassian-jira-software-7.3.8-x64.exe
2、点击next
3、选择安装模式
（1）使用默认安装选项 ：
Express Install(use default settings)：
（2）自定义安装Custom install(recommended for advanced users)：
（3）升级安装Upgrade an existing JIRA installation：
4、选择JIRA安装路径
5、选择JIRA数据路径
6、选择创建开始菜单
7、端口设置：8000
8、JIRA作为服务安装
9、安装完成

**设置JIRA:**
1、设置MYSQL -JDBC连接包，先停掉JIRA，把mysql-connector-java-5.1.25-bin.jar放到d:\Atlassian\JIRA\lib，再启动JIRA服务。
![image2](38ab1a037e874b3f92671ff1692989ff.jpg)
2、设置数据库，http://localhost:8000，输入相应数据，点击：Test Connection，说明连接MySQL成功。然后点击：Next
![image3](bdb5f237b4a44d7da90e3a58177e04c5.jpg)
3、设置应用属性 ，输入jira名称，选择私有就可以
![image4](f1d8efa36f194560b46d2eb008aaf63c.jpg)
4、输入授权码：
<https://my.atlassian.com/，登陆你的谷歌账号，输入已安装的JIRA-server> ID，来获取授权码
![image5](a58843cfab9c448a9305aa4a65bebbbc.jpg)

生成破解授权码：
![image6](aa4d5e724f6249e1a3efe80a5ebf9902.jpg)
JIRA设置服务授权页面，输入授权码
![image7](27eab79ca49a46159666148b9e70149e.jpg)
5、设置管理员账号
![image8](417aa94628e34fe2ba0a742f01489f37.jpg)
6、设置邮件通知  

![image9](bf1cd2f76a4d4be4ae1e0b5d14beeaa7.jpg)
7、打开http://localhost:8000，输入用户名和密码，点击Login。
![image10](fb243561cb1d46f8a9ce9b6f26179270.png)
8、系统页面，点击应用程序-版本和许可证，破解成功
![image11](2fe6ce0ffb7d42c78bdba11eb853fa62.jpg)
9、开启JIRA使用之旅，欢迎吐槽
阅读
在看
**已同步到看一看**
[取消](javascript:;) [发送](javascript:;)
[我知道了](javascript:;)
#### *朋友会在“发现-看一看”看到你“在看”的内容 *
确定
![image12](7b96325d00b8429fa6b50e52161ed6eb.png)
已同步到看一看[写下你的想法](javascript:;)
最多200字，当前共字 发送
已发送
#### *朋友将在看一看看到 *
确定
写下你的想法...
取消
#### *发布到看一看 *
确定
最多200字，当前共字
发送中

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
即将打开一个新页面
[取消](javascript:void(0);) [允许](javascript:void(0);)
[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzU2MTAzNTM2Mg==&mid=2247483966&idx=1&sn=6d16fbc1633ac60498228dd50db49328&chksm=fc7fa333cb082a25827199d491c5c1a92828944356ae3601eda93dc4b5a47864adfd67680300&mpshare=1&scene=1&srcid=0727z9d37MliJJVj8fz9KRAI&sharer_sharetime=1564167592235&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzU2MTAzNTM2Mg==&mid=2247483966&idx=1&sn=6d16fbc1633ac60498228dd50db49328&chksm=fc7fa333cb082a25827199d491c5c1a92828944356ae3601eda93dc4b5a47864adfd67680300&mpshare=1&scene=1&srcid=0727z9d37MliJJVj8fz9KRAI&sharer_sharetime=1564167592235&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
