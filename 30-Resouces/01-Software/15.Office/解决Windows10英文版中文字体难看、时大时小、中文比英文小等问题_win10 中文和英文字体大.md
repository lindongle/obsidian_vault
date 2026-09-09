---
title: 解决Windows10英文版中文字体难看、时大时小、中文比英文小等问题_win10 中文和英文字体大...
updated: 2026-06-06T10:05
created: 2024-05-29T03:03:44
---

解决Windows10英文版中文字体难看、时大时小、中文比英文小等问题_win10 中文和英文字体大小不一致-CSDN博客
星期二, 五月 28, 2024
7:03 下午
Clipped from: <https://blog.csdn.net/amoscn/article/details/106224359>
安装好Windows10英文版，可是中文字体却非常难看，不是Windows10中文版默认的微软雅黑。  
并且还会存在中文字体时大时小，中文字体比英文字体小的情况。
英文版中文字体默认如下：
![image1](65cda85ad43147e799f9086847cb9ad4.png)
中文字体太小的问题：
![image2](3d664f8009094a4cb85d53cc3f2f3652.png)

![image3](0517a2564f77437dad38015d4bd3e801.png)
修改后的中文字体显示如下：
![image4](d8a66abb9385413690085dffd54fdd6e.png)

![image5](38ec325bb32a4d26beae2afcc3c1ff77.png)

![image6](90d830482ed741ceab76792b0c559f0a.png)
如何处理：
1.  打开注册表编辑器（Win+R，输入【regedit】回车）
2.  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink
3.  依次找到Segoe UI，Tahoma，Microsoft Sans Serif
4.  双击Segoe UI找到 MSYH.TTC,Microsoft YaHei UI,128,96 MSYH.TTC,Microsoft YaHei UI
5.  剪切然后放在配置的最前面。如图X和图Y所示
6.  双击Tahoma，Microsoft Sans Serif找到MSYH.TTC,Microsoft YaHei UI 删掉
7.  在配置最前面添加 MSYH.TTC,Microsoft YaHei UI,128,96 MSYH.TTC,Microsoft YaHei UI
8.  保存后重启电脑
图X：
![image7](79b41edbcefb429cb6f9e183e2604492.png)
修改之后  
图Y：
![image8](0ece17887fb14868b78d18bad3b99a86.png)
参考  
<http://blog.sina.com.cn/s/blog_58c506600101dd01.html>
