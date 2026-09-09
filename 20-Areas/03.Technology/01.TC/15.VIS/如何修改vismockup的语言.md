---
title: 如何修改vismockup的语言
updated: 2026-06-06T10:08
created: 2019-02-21T09:24:23
---

<span style='color:silver'></span>
2019年2月21日
9:24

如何修改vismockup的语言
<span style='color:gray'>2019年2月20日</span>
<span style='color:gray'>11:38</span>
![image1](de42bd6cd47540c682e18ac0640c4599.jpg)
1、安装时已经选择了所需语言
![image2](1aafec8cca8149c3a0910c147eec1b2f.jpg)

![image3](3fdb5377675246e6b2ee42bb9c9cde30.jpg)

you can use the script to add new language to the install.
the TCVIS interface is controlled by the region/language setting.
if you want to change the related language to different from the OS, pls change %TCVIS%\etc\lc_ctype.ini
for example if you want to show English interface in Simplified Chinese OS, change
from
Chinese.936=ZhGBK

to
Chinese.936=C

for example if you want to show Japanese interface in Simplified Chinese OS, change
from
Chinese.936=ZhGBK

to
Chinese.936=JaPCK

也可简单理解为修改Visualization\etc\lc_ctype.ini中的文件，=前面是默认语言，后面是需切换的语言
2、安装时未选择语言
可以先重新安装一个所有语言都有的vismockup，将对应的语言包放到Visualization\Program文件夹下
![image4](4acc0d1ba5524c78a890d8d62401fc9b.jpg)

<span style='color:#969696'>已使用 Microsoft OneNote 2016 创建。</span>
