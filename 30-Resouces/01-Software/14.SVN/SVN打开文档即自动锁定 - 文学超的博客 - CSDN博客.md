---
title: SVN打开文档即自动锁定 - 文学超的博客 - CSDN博客
updated: 2026-06-06T00:25:04
created: 2026-07-05T17:04:55
---

SVN打开文档即自动锁定 - 文学超的博客 - CSDN博客
星期五, 七月 26, 2019
3:31 下午

已剪辑自: <https://blog.csdn.net/wenxuechaozhe/article/details/72793244>
SVN是一个开放源代码的版本控制系统，相信做开发的基本上都用过，这里就不多介绍了。团队协作开发时常常会出现提交的文档互相冲突的问题，这里给大家介绍一下给SVN文件设置必须锁定的方法，当然你也可以对冲突文档进行合并处理，这个就需要人工处理了。　　
　　项目中操作：右击项目解决方案-\>Solution File-\>Subversion Properties-\>Add-\>选择"svn:needs-lock"-\>OK.
　　文件上操作：右击项目文件夹-\>TortoiseSVN-\>Properties-\>New-\>Needs-Lock-\>Locking required(read-only update) -\>OK-\>OK.
　　这种方式属于"锁定-修改-解锁"模型，在这种系统中，在同一时间版本库只允许一个用户修改一个文件。这样，能够保证文件在打开后别人仅能进行查看，但是无法进行修改，避免冲突。
