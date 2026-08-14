---
title: 安装或卸载出现"Windows error 2 occured while loading the ...
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:54
---

安装或卸载出现"Windows error 2 occured while loading the Java VM"时解决办法 - 超级无敌菜鸟 - 博客园
星期四, 八月 16, 2018
9:33 下午
已剪辑自: <https://www.cnblogs.com/ling00218077/p/5446897.html>
这种情况一般是由于应用程序无法定位本机上的虚拟机造成的：下面是有人解决卸载Skill Test时所用的方法。
其他应用程序可以使用相同的方法解决。
When uninstalling Silk Test, the following error message might display:
"Windows error 2 occurred while loading the Java VM"
![image1](a491834b349348a994390f04216fa0aa.png)
This means that the uninstall procedure cannot find the Java VM or the present Java version cannot be used by the uninstaller for some reason.
Perform the following actions to fix this issue and to successfully uninstall Silk Test:
1.  Open the Silk Test installation directory. For example*C:\Program Files (x86)\Silk\SilkTest*.
2.  Open the folder*ng*.
3.  Copy the folder*jre*to another location, for example to*C:\Temp*.
4.  In the Silk Test installation directory, open the folder*Uninstall_SilkTest*.
5.  Open the file*Uninstall SilkTest \[VERSION\].lax*in an editor.
6.  Find the property**lax.nl.current.vm.**
7.  Change the value of****the propertytothe path to the file*java.exe*in the copied folder*jre*. For example, type*lax.nl.current.vm=c:\\temp\\jre\\bin\\java.exe*.
8.  Uninstall Silk Test.
9.  Delete the copied*jre*folder.
