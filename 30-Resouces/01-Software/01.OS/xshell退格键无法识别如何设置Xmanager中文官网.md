---
title: xshell退格键无法识别如何设置|Xmanager中文官网
updated: 2026-06-06T10:05
created: 2019-09-18T21:28:50
---

xshell退格键无法识别如何设置\|Xmanager中文官网
星期三, 九月 18, 2019
1:28 下午

已剪辑自: <http://www.xshellcn.com/xsh_column/tgjwfsb-sz.html>
在使用[xshell](http://www.xshellcn.com/)时，由于每个服务器不同，一些无法使用Backspace键向后删除字符。针对这个问题，小编为大家解答下退格键无法识别如何设置？
问题阐述：
无法使用Backspace键向后删除字符。
解析原因：
服务器版本不同，删除字符串的密钥本身是由stty的环境定义。运行带有选项-a以下的stty命令。
\$的stty-a
![image1](7cc52829fb184602a15f6d2e0d37b9b8.png)
图1：命令样式
箭头展示的删除信号是，我们要使用与Backspace键向后删除字符的功能。因此，Backspace键必须定义擦除字符。
![image2](de490be4691d4840b6271ffc8e89896b.png)
图2：新建属性
注：最近的shells如bash中通常不用退格键向后删除字符，但像nslookup，apt-get，等需要调整的关键序列，还是需要退格键来删除必须要的字符。
以上就是退格键无法识别如何设置的解答了，希望对您有所帮助。小编提醒大家，下载xshell需到正规官网下载。另外，xshell数字小键盘不能使用的解决方法请查看：[xshell中数字小键盘不能使用怎么办？](http://www.xshellcn.com/xsh_column/wenti/shuzi-jianpan.html)
文章内容为原创，转载请注明出处：[http://www.xshellcn.com/xsh_column/tgjwfsb-sz.html](http://www.xshellcn.com/xsh_column/xsh_column/tgjwfsb-sz.html)

