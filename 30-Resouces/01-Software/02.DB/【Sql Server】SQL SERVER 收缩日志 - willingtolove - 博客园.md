---
title: 【Sql Server】SQL SERVER 收缩日志 - willingtolove - 博客园
updated: 2026-06-13T17:16:46
created: 2026-07-05T17:04:54
---

已剪辑自: <https://www.cnblogs.com/willingtolove/p/10165665.html>

**正文**
　　事务日志记录着在相关数据库上的操作，同时还存储数据库恢复(recovery)的相关信息。
　　收缩日志的原因有很多种，有些是考虑空间不足，有些则是应用程序限制导致的。
　　下面介绍的是在简单模式下，进行收缩操作。
[回到顶部](https://www.cnblogs.com/willingtolove/p/10165665.html#_labelTop)
### <span style='color:#5B9BD5'>#  方法一：通过图形界面逐步操作</span>
#### *<span style='color:#5B9BD5'>1、打开数据库属性窗口</span>*
![image1](4e13c3ccbdbe4b4b98c90caad6fddad4.png)
#### *<span style='color:#5B9BD5'>2、更改数据库恢复模式，“完整”改成“简单”</span>*
![image2](ec14ff2e15a2462182e5db19509db11c.png)
#### *<span style='color:#5B9BD5'>3、收缩数据库日志，“任务”-\>“收缩”</span>*
![image3](c9c77f23b32742edbcdb58b214326b7e.png)

![image4](a93b607227284672a7026e4c592ece00.png)
#### *<span style='color:#5B9BD5'>4、收缩完，将数据库的恢复模式修改为“完整”</span>*
![image5](87c29f4f84a34374b6bc961d1f82c956.png)
[回到顶部](https://www.cnblogs.com/willingtolove/p/10165665.html#_labelTop)
### <span style='color:#5B9BD5'># 方法二：使用命令</span>

![image6](4a855b0588ca41c6874fc782698ce4b0.png)
ALTER DATABASE test SET RECOVERY SIMPLE --将“恢复模式”设置为“简单”  
GO  
USE test  
GO  
DBCC SHRINKFILE (N'test_log' , 1, TRUNCATEONLY)--收缩日志文件大小到1M  
GO  
USE test  
GO  
ALTER DATABASE test SET RECOVERY FULL WITH NO_WAIT ----将“恢复模式”设置为“完整”  
GO  
ALTER DATABASE test SET RECOVERY FULL  
GO
![image6](4a855b0588ca41c6874fc782698ce4b0.png)

**注：通过修改恢复模式为“简单”，这种收缩日志的方法是不得以的方法，也是终极方法，在收缩之前，在完整模式下，进行备份；**

