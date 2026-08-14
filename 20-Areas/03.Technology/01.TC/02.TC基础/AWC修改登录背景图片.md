---
title: AWC修改登录背景图片
updated: 2026-08-14T11:02:51
created: 2026-07-05T17:04:40
---

AWC修改登录背景图片
2021年5月25日
9:12
1、更换图片：
C:\Siemens\Teamcenter11\aws2\stage\repo\tc-aw-framework\src_native\assets\images
ssobackground.jpg和logo.jpg。
2、关闭其他服务，保留fsc和微服务；
3、运行tem，选择“更新AWC客户端配置”
4、勾选Published to gateway，下一步，开始，等待完成即可；
如果不想显示西门子图标，可以直接将logo.jpg重命名

1\. Go to path %tc_root%\aws2\stage\repo\tc-aw-framework\src_native\assets\images
2\. Take a backup of file "ssobackground" and replace your background image with same name.
3\. Open the TC command prompt
4\. Navigate to %tc_root%\aws2\stage on command prompt
5\. Run the command "initenv.cmd"
6\. Run the command "awbuild"
7\. Once run completed, restart the Pool
8\. Clear the browser cache
9\. Launch the AWC.
You will see the modified image.

