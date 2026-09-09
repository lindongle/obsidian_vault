---
title: 日志debug
updated: 2026-06-06T10:08
created: 2022-11-27T01:15:03
---

日志debug
2022年11月27日
1:15

![image1](ef19ad01629b43a686d3bf056ad7747a.png)
%USERPROFILE%\AppData\Local\swim 下找到的所有日志文件
SWIM Debug
======================================
Please provide the following information.

SWtoJT version (if applicable)
swim.xml
swim.properties
txdlog.txt
client_socket.log

In the swim.properties file, set these three settings, then restart swim and run the operations again.. That creates the log file and is based on the current actions that cause the error..

log.enable = true
log.suppress = 10000 (SWIM12)
Log.level = TRACE (SWIM13)
log.file = txdlog.txt

