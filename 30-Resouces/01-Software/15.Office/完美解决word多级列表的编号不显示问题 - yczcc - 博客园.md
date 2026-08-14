---
title: 完美解决word多级列表的编号不显示问题 - yczcc - 博客园
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:56
---

下午
已剪辑自: <https://www.cnblogs.com/yczcc/p/9180186.html>
**转载需注明来源：<https://www.cnblogs.com/yczcc/p/9180186.html>**
word 标题 多级列表 显示编号 显示
**word多级列表的编号不显示的解决方法**
**根本原因：**本地样式模板中的字体特征损坏了。可能是由于复制了格式混乱的文档中的文字直接粘贴到自己的文档里，破坏了本地样式。有必要的时候，在复制粘贴前，先将文本粘贴至记事本中再复制出来粘贴到word即可。
**终极解决方法：**
适用于word 2010、2013等，其他版本未知，本文截图为2013版本。
如果会使用VBA的话，可直接Alt+F11打开VBA编辑器，创建宏添加本文的代码，并执行宏即可。
不会使用VBA的话，继续看下面的图文教程：
选择菜单栏的“开发工具”，点击“宏”，打开宏创建窗口，随便输入一个非数字开头的宏名，点击创建，如下图所示：
![image1](278ec607c9b8417397208b59ce79387b.png)
之后会自动打开VBA编辑窗口，并自动写好了宏代码开头和结尾，如下图所示：

![image2](f43e5a8ba4864b10a70258fafd6edb13.png)
在光标默认停留处（即代码“End Sub”的上一行），粘贴如下代码，如下图所示：
For Each templ In ActiveDocument.ListTemplates  
For Each lev In templ.ListLevels  
lev.Font.Reset  
Next lev  
Next templ
![image3](ae9f07822f3041ba84dfbeaa07884501.png)
然后按F5键运行，或者点击工具栏运行按钮运行该宏过程，如下如所示：

![image4](b3e35ac35824459f8530c68f2f8d1e0a.png)
此时会发现编号已显示正常，关闭VBA编辑窗口即可。
以后关闭word文档后再次打开，也OK了。

如果没有菜单栏没有“开发工具”，则打开“文件”——“选项”——“自定义功能区”中勾选“开发工具”即可。如下图所示：
![image5](825a2826a34d42b6bf16aadce660534e.png)

本文解决方法参考：https://answers.microsoft.com/en-us/office/forum/office_2010-word/ms-word-header-styles-are-showing-black-boxes/c427b21c-dcda-46ce-a506-b9a16c9f2f3f
**转载需注明来源：<https://www.cnblogs.com/yczcc/p/9180186.html>**
