---
title: 手动调整Deployment Center 安装状态2025-08-08T19:30:59.441Z
updated: 2026-06-06T10:08
created: 2025-08-08T19:31:11
tags:
  - TC
---

手动调整Deployment Center 安装状态2025-08-08T19:30:59.441Z

源网页：https://mp.weixin.qq.com/s?\_\_biz=MzkxMjQ0MTI4NQ==&mid=2247483689&idx=1&sn=7897e3c24eea0de03186f5ed0998c841&chksm=c0bb174b901937a4dd36ba6c8eb237ceafe45b7722f091d81576c8920bf2b9705a84c22845f2&mpshare=1&scene=1&srcid=0808FARAosLevdp2K1MCWtjo&sharer_shareinfo=991018302d8a04c568a479482bcf95cb&sharer_shareinfo_first=891f15150a1948314f0f7be84bf6a680#rd
**网页内容：**
公众号名称：实施又开发的大柱
作者名称：大柱
发布时间：2025-06-19 15:43
当你通过Deployment Center (DC)安装Teamcenter时，可能会遇到一个常见问题：尽管所有机器上的安装脚本都已成功执行，但DC界面中Components和Software的状态却没有相应更新。你提到可以使用-offlineUpdate参数来更新Components的状态，但Software的状态依然保持不变。
在这种情况下，你可以通过直接修改DC的数据库来手动更新Software的状态。以下是详细的步骤和说明：  
手动更新DC数据库以修复Software状态
1.  定位并提取必要的JAR文件
在DC的安装目录下找到deploymentcenter.war文件。这是一个WAR（Web Application Archive）文件，你可以使用解压工具（如WinRAR、7-Zip等）将其打开或解压。
从deploymentcenter.war中，你需要找到并提取以下三个JAR文件：
com.dc.webapp.business.jar
com.dc.crypto.jar
h2-2.1.212.jar
1.  获取数据库密码
DC的数据库密码存储在com.dc.webapp.business.jar中的database.properties文件里。
![image1](83e7e12ae8a04e348ef5ee1c72a408f9.png)
打开这个database.properties文件，你会看到一个加密的密码。  
 3.解码数据库密码
DC的密码是加密的，你需要一个Java工程来解码它。
创建Java工程：在你的集成开发环境（IDE）中（如Eclipse、IntelliJ IDEA），创建一个新的Java工程。
引入com.dc.crypto.jar：将之前提取的com.dc.crypto.jar文件添加到你的Java工程的构建路径中。
![image2](624c2517c07840b6a2bb38aadcfef5fb.png)
运行这个Java程序，它将输出解码后的密码。你提到解码后的密码是dc123。
1.  连接H2数据库
DC使用H2数据库。你可以使用之前提取的h2-2.1.212.jar来连接和管理数据库。
打开命令行工具，导航到h2-2.1.212.jar所在的目录，并执行以下命令来启动H2数据库控制台：  
 Bash
java -jar h2-2.1.212.jar
![image3](4250ef5ea2d14eef9d3f0adb9bb3d682.png)
这将打开一个浏览器窗口，显示H2数据库登录界面。在登录界面中：
JDBC URL:输入H2数据库的JDBC URL。通常类似于jdbc:h2:file:C:/Teamcenter/DeploymentCenter/data/db/dc  (请根据你的实际DC安装路径调整)。
User Name:输入数据库用户名，通常是sa。
Password:输入你刚刚解码得到的密码，dc123。
![image4](167513f94ea34477af4e4cd5040dd470.png)
点击Connect连接到数据库。  
 5.执行SQL语句更新状态
成功连接到H2数据库后，你可以在查询编辑器中执行SQL语句来更新INSTALLED_SOFTWARE表中的部署状态。
首先，建议你查询一下INSTALLED_SOFTWARE表，以确认当前的记录和ENV_ID：  
 SQL
SELECT \* FROM  DEPLOY_CENTER.INSTALLED_SOFTWARE;
根据查询结果，找到对应你想更新的软件记录的ENV_ID。然后，执行以下SQL语句来更新状态：  
 SQL
UPDATE DEPLOY_CENTER.INSTALLED_SOFTWARE  SET DEPLOYMENT_STATUS = 'Installed' WHERE ENV_ID = '11';
请将'11'替换为你实际需要更新的ENV_ID。
执行成功后，返回DC界面，你会发现Software中的安装状态已经成功更改
![image5](e0d19490029349b197b2c896536cf94d.png)
**网页截图：**
[Webpage.html](cde5645a4c7c4bc6bb189e8a51329979.html)
