---
title: AWC 基线无法创建
updated: 2026-08-14T10:58:43
created: 2026-07-05T17:04:40
---

1、安装dispatcher，并安装aysncService异步服务。
![image1](7ebdfcb9ef6e4752b7f71238a2370829.png)
o Open the translator.xml file from the Dispatcher\Module\conf directory.
make sure isactive="true"
2、打开dipather路径下Module\conf中的translator.xml，在aysncService模块中将isactive的值改为true，默认是false。
![image2](338f731ca01a4fecbd9cee83b7324a97.png)
o\. In Tc Organization
oo. Open the Organization application in Teamcenter.
oo. Select the top-level Sites node from the Organization List tree.
The Sites pane appears.
«span style='color:#DF402A'»o Type the SOA URL in the SOA URL box. -\> [http://:/tc/span]()»
This URL is used for SOA calls to this .
3、进入胖客户端，组织中，将站点下面的所有的站点的SOA URL属性改为http://win2012:7001/tc，保存。
![image3](340d19275b9443eebcbce0a3026e4fbc.png)
o In TC
Set the EPM_task_execution_mode preference to "CONFIGURABLE"
4、修改首选项EPM_task_execution_mode，将值改为CONFIGURABLE。
o Restart all TC services
5、重启四层服务。
<span style='background:yellow;mso-highlight:yellow'>o In workflow Designed edit workflow used for baseline.</span>
<span style='background:yellow;mso-highlight: yellow'>and enable "Process in Back ground" in Display Task Attribute panel & Set 'Stage to be available' for workflow template</span>
<span style='color:#DF402A'>==6、在流程设计器中，找到对应的基线流程（系统默认为TC Default Baseline Process），进行编辑，勾选后台运行及并勾选==</span>
