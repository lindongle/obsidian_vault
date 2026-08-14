---
title: Java基础
updated: 2026-06-13T22:08:52
created: 2026-07-05T17:04:54
tags:
  - Java
---

1、CAD命令
del \*.XXX删除所有同一后缀名。
cls 清屏
exit退出命令窗口。
CD\回退到跟目录
MD/RD/CD 创建、删除、改变目录（文件夹）
rd /s 文件夹，可以删除文件夹及文件夹下的所有文件及文件夹。直接rd，只能删除空文件夹。后面再加/q可以不用删除确认
DEL删除文件
2、跨平台
不同语言使用不同的JVM虚拟机来进行翻译。JVM不是跨平台，每每种系统都有自己的JVM。
JVM：java虚拟机
JRE：Java运行环境（包括JVM及核心类库）
JDK：Java开开发工具包（包含JRE）
3、类名与当前java文件的文件名一致。
![image1](59d75216668046ac9f367c09003b098f.png)
public static void main（String \[\] args）{
<span style='background:white'>system.out.println"helloworld!";</span>
<span style='background:white'>} </span>
通过命令窗口，javac XXX.java运行进行编译，会自动生成一个class文件。然后通过Java XXX进行执行。
4、配置JAVA_HOME Jdk的根目录，和path（jdk的bin目录）。
5、配置了classpath，则默认优先执行配置的路径下的class文件。
