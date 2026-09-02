---
title: 修改TC登录背景图
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:41
---

aifrcp包splash.bmp(24位)；登陆对话框背景图：TC版本不一样，jar包不同，一般在common\login\images包下background.png,或者kenel包icon\background.png。
![image1](26edd96de41540649fb14c212bbfa5c0.png)

![image2](528fe90579984ccfa4fbebfff7d5dc93.png)

![image3](04836308741d4ac7aa1cad82fda63d2b.jpg)
**修改背景图：**
D:\Siemens\Teamcenter11\portal\plugins\com.teamcenter.rac.kernel_11000.2.0.jar
![image4](80de826c9b0243c182b736c3c10e0fb8.png)


**修改闪图和工具栏Siemens图标：**
D:\Siemens\Teamcenter11\rac\plugins\com.teamcenter.rac.aifrcp_11000.2.0.jar
解压后：D:\Siemens\Teamcenter11\rac\plugins\com.teamcenter.rac.aifrcp_11000.2.0\com\teamcenter\rac\aif\images
![image5](d200ca495b9b44bcb122e3b8e95b2bcb.png)

修改登录的闪图文件：
D:\Siemens\Teamcenter11\rac\plugins\com.teamcenter.rac.aifrcp_11000.2.0\splash.bmp
![image6](25aba8e4d09940b697baeef43f1cc221.png)

修改四层瘦客户端背景。
修改D:\Siemens\Web_tier\ThinClient\webapp_root\teamcenter\presentation\webclient\images\Teamcenter.png，然后生成tc.war，weblogic中更新一下。
