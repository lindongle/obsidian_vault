---
title: SVN实现自动更新（Windows平台） - 码农的boss - 博客园
updated: 2026-06-06T00:24
created: 2019-07-26T21:12:29
---

SVN实现自动更新（Windows平台） - 码农的boss - 博客园
星期五, 七月 26, 2019
1:12 下午
已剪辑自: <https://www.cnblogs.com/mnboss/p/5821699.html>
很多人都把SVN服务器搭建在正式服务器上，commit后，需要在测试服务器先测试一下，这时候，就需要在测试环境进行update操作。
问题是，commit后，测试环境如何实现自动更新呢？
找版本库保存的目录，新建一个post-commit.bat文件
我的目录是在
post-commit.bat文件内容为
1.  @echo off
2.  "C:\Program Files\VisualSVN Server\bin\svn.exe" update "F:\www\auto_test" --username "test" --password "123456"
3.  上面的代码使用的时候要修改一下，svn.exe的路径，同步的目录，svn的用户和密码，根据自己的情况修改一下
测试一下是不是成功了
4.  下一个问题是怎么调用这个bat文件呢？如果正式和测试环境，都在同一只机器上，那么直接编写HOOK，调用这个文件就可以。
但如何不是同一个机器呢？一个比较简单的办法，就是在测试环境上，每经过一个时间间隔进行更新操作，我们可以编写一个vbs脚本，每隔15秒调用一次svnUpdate.bat。
采用vbs调用有一个好处，可以隐藏弹出的cmd.exe窗口。
我们新建一个文件，callSvnUpdate.vbs，内容如下：
5.  '指定时间间隔调用.bat文件  
    '停止脚本请在任务管理器结束wscript.exe  
    Set ws=wscript.createobject("wscript.shell")  
    dim bat  
    '需运行的文件  
    bat="cmd.exe /c svnUpdate.bat"  
    do  
    '0表示不显示窗口，1显示，调试用  
    ws.run bat,0  
    '每15秒运行一次  
    wscript.sleep 15000  
    loop
6.  将两个文件放于同一目录中，运行callSvnUpdate.vbs，一切尽在不言中。
