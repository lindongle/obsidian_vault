---
title: 调整FSC配置文件
updated: 2026-06-13T22:07:03
created: 2026-07-05T17:04:57
tags:
  - 联创
---

一、服务器172.16.254.41
1、打开，开始菜单-Teamcenter11-tc_Corporate Command。
![image1](c9581511373e4a72b007dd483ff2e2a1.png)
2、黑框中输入backup_xmlinfo -u=infodba -p=infodba -g=dba，回车。
3、等待执行完成，在下图目录找到backup.xml文件，打开。复制enterpriseId和transVolId。
![image2](d5585daf1ba247699da7cbb6936abe70.png)

![image3](018c0508f22844a9a9bf25c2cbe5381b.png)

4、在下图目录下找到fsc配置文件，打开。
![image4](413985e4e13947569e77b8949860cdaa.png)
5、复制fsc id，FSC_POOLA_plm
![image5](7ecdf0a26d86423dbb4a76bcc6e82a32.png)
二、打开172.16.254.47
1、在下图目录找到主FSC主配置文件，打开。
![image6](6a6b968a5a2a4cf78f8da75d608cd8b4.png)
2、修改文件
添加以下内容，四个地方按照复制的backup.xml文件中的内容对应修改，FSC_POOLA_plm的地址改为172.16.254.41（pool池fsc服务的地址）
\<fsc id="FSC_POOLA_plm" address="http://172.16.254.41:4544" ismaster="false"\>
\<transientvolume id="63d4de5c8ce34f7b0ce4c365df4b1006" enterpriseid="-1880701319" root="C:\Temp\transientVolume_infodba" priority="0" /\>
\</fsc\>
![image7](e26f1eba184d4335ae6f31d08eec0295.png)
3、保存，并重启FSC服务。
三、172.16.254.48
将二中的文件FSC主配置文件复制到172.16.254.48上对应位置进行覆盖，重启172.16.254.48的FSC服务。
四、172.16.254.41
重启FSC服务。
五、登录两层客户端进行验证。

