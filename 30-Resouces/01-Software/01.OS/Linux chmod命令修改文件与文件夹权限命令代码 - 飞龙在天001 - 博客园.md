---
title: Linux chmod命令修改文件与文件夹权限命令代码 - 飞龙在天001 - 博客园
updated: 2026-06-06T00:28:28
created: 2026-07-05T17:04:53
---

上午
已剪辑自: <https://www.cnblogs.com/geekdc/p/5497919.html>
　　在Unix和Linux的各种操作系统下，每个文件（文件夹也被看作是文件）都按读、写、运行设定权限。

以下转自：<http://www.codeceo.com/article/linux-chmod-command.html>
在Linux中要修改一个文件夹或文件的权限我们需要用到linuxchmod命令来做，下面我写了几个简单的实例大家可参考一下。
语法如下：
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod \[who\] \[+ \| - \| =\] \[mode\] 文件名 |
|-----------------------------------------------|
命令中各选项的含义为
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
<table style="width:95%;">
<colgroup>
<col style="width: 95%" />
</colgroup>
<thead>
<tr>
<th><p>u 表示“用户（user）”，即文件或目录的所有者。</p>
<p>g 表示“同组（group）用户”，即与文件属主有相同组ID的所有用户。</p>
<p>o 表示“其他（others）用户”。</p>
<p>a 表示“所有（all）用户”。它是系统默认值。</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
操作符号可以是：
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
<table style="width:75%;">
<colgroup>
<col style="width: 75%" />
</colgroup>
<thead>
<tr>
<th><p>+ 添加某个权限。</p>
<p>- 取消某个权限。</p>
<p>= 赋予给定权限并取消其他所有权限（如果有的话）。</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
设置mode所表示的权限可用下述字母的任意组合：
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
<table style="width:20%;">
<colgroup>
<col style="width: 20%" />
</colgroup>
<thead>
<tr>
<th><p>r 可读。</p>
<p>w 可写。</p>
<p>x 可执行。</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
X 只有目标文件对某些用户是可执行的或该目标文件是目录时才追加x 属性。
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>s 在文件执行时把进程的属主或组ID置为该文件的文件属主。方式“u＋s”设置文件的用户ID位，“g＋s”设置组ID位。</p>
<p>t 保存程序的文本到交换设备上。</p>
<p>u 与文件属主拥有一样的权限。</p>
<p>g 与和文件属主同组的用户拥有一样的权限。</p>
<p>o 与其他用户拥有一样的权限。</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
**实例**
修改文件可读写属性的方法
例如：把index.html 文件修改为可写可读可执行:
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod 777 index.html |
|----------------------|
要修改目录下所有文件属性可写可读可执行:
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod 777 \*.\* |
|-----------------|
把文件夹名称与后缀名用\*来代替就可以了。  
比如：修改所有htm文件的属性:
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod 777 \*.htm |
|------------------|
修改文件夹属性的方法  
把目录 /images/xiao 修改为可写可读可执行
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod 777 /images/xiao |
|------------------------|
修改目录下所有的文件夹属性
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod 777 \* |
|--------------|
把文件夹名称用\*来代替就可以了
要修改文件夹内所有的文件和文件夹及子文件夹属性为可写可读可执行
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod -R 777 /upload |
|----------------------|
**总结linux下目录和文件的权限区别**
文件：读文件内容（r）、写数据到文件（w）、作为命令执行文件（x）。
目录：读包含在目录中的文件名称（r）、写信息到目录中去（增加和删除索引点的连结）、搜索目录（能用该目录名称作为路径名去访问它所包含的文件和子目录）
具体说就是：
（1）有只读权限的用户不能用cd进入该目录：还必须有执行权限才能进入。  
（2）有执行权限的用户只有在知道文件名，并拥有读权利的情况下才可以访问目录下的文件。  
（3）必须有读和执行权限才可以ls列出目录清单，或使用cd命令进入目录。  
（4）有目录的写权限，可以创建、删除或修改目录下的任何文件或子目录，即使使该文件或子目录属于其他用户也是如此。
**查看目录权限**
查看文件权限的语句：
在终端输入:
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| ls -l xxx.xxx （xxx.xxx是文件名） |
|-----------------------------------|
那么就会出现相类似的信息，主要都是这些：
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| -rw-rw-r-- |
|------------|
一共有10位数
其中： 最前面那个 – 代表的是类型  
中间那三个 rw- 代表的是所有者（user）  
然后那三个 rw- 代表的是组群（group）  
最后那三个 r– 代表的是其他人（other）
然后我再解释一下后面那9位数：
r 表示文件可以被读（read）  
w 表示文件可以被写（write）  
x 表示文件可以被执行（如果它是程序的话）  
- 表示相应的权限还没有被授予
现在该说说修改文件权限了
在终端输入：
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod o w xxx.xxx |
|-------------------|
表示给其他人授予写xxx.xxx这个文件的权限
[?](https://www.cnblogs.com/geekdc/p/5497919.html)
| chmod go-rw xxx.xxx |
|---------------------|
表示删除xxx.xxx中组群和其他人的读和写的权限
其中：
u 代表所有者（user）  
g 代表所有者所在的组群（group）  
o 代表其他人，但不是u和g （other）  
a 代表全部的人，也就是包括u，g和o  
r 表示文件可以被读（read）  
w 表示文件可以被写（write）  
x 表示文件可以被执行（如果它是程序的话）
其中：rwx也可以用数字来代替  
r ————4  
w ———–2  
x ————1  
- ————0  
行动：
表示添加权限  
- 表示删除权限  
= 表示使之成为唯一的权限
当大家都明白了上面的东西之后，那么我们常见的以下的一些权限就很容易都明白了：
-rw——- (600) 只有所有者才有读和写的权限  
-rw-r–r– (644) 只有所有者才有读和写的权限，组群和其他人只有读的权限  
-rwx—— (700) 只有所有者才有读，写，执行的权限  
-rwxr-xr-x (755) 只有所有者才有读，写，执行的权限，组群和其他人只有读和执行的权限  
-rwx–x–x (711) 只有所有者才有读，写，执行的权限，组群和其他人只有执行的权限  
-rw-rw-rw- (666) 每个人都有读写的权限  
-rwxrwxrwx (777) 每个人都有读写和执行的权限
