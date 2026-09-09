---
title: 安装部署Apache
updated: 2026-06-06T10:09
created: 2018-06-14T23:45:18
tags:
  - 联创
---

服务器172.16.254.41
安装介质：D:\TC\Apache24
1）复制Apache24文件夹到D:\Apps\\
![image1](60ce0b9223ab444094f0bdfaee49c740.png)
2）找到D:\Apps\Apache24\conf\httpd.conf文件，打开，修改以下内容，并保存。
修改Define SEVROOT为下图路径。
![image2](eb1e2adb51f541e9b1089161a27d7705.png)
修改DocumentRoot何Directory路径为D:\Siemens\Web_tier\RichClient\webapp_root\otwweb
![image3](b49a29f56c3e4ff6b40d5927ff1677f8.png)
3）开始-运行，cmd，输入cd /d D:\Apps\Apache24\bin，回车。
![image4](9405b90e95734eff8e777fbbd9ee3124.png)
4）输入httpd -k install，回车，完成Apache服务安装。
![image5](1d09e7669ea2479c9563c53bef6d23ea.png)
<span style='color:#333333'>5）验证Apache服务。</span>
<span style='color:#333333'>打开IE输入http://172.16.254.41进行验证，不报错，则成功。</span>
![image6](ba0613d74f224e29a46e46f27586b06a.png)
<span style='color:#333333'></span>
