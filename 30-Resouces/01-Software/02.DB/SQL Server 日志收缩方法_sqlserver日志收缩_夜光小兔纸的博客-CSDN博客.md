---
title: SQL Server 日志收缩方法_sqlserver日志收缩_夜光小兔纸的博客-CSDN博客
updated: 2026-06-13T15:25:51
created: 2026-07-05T17:04:54
---

已剪辑自: <https://blog.csdn.net/Ruishine/article/details/112917414>
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»在日常运维中，有时会遇到«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>“The transaction log for database ‘xxxx’ is full due to ‘ACTIVE_TRANSACTION’.”</span>«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»这样的报错信息。«/span»  
<span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»此错误消息表明：数据库的事务日志文件空间耗尽，«/span»<span style='font-family:Verdana;font-size:12.0pt'>log </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»文件不能再存储新的«/span»<span style='font-family: Verdana;font-size:12.0pt'>transaction log</span>«span style='font-family:"Microsoft YaHei"; font-size:12.0pt'»。«/span»  
<span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»这个时候我们需要进行日志收缩。本文将介绍日志收缩的两种方法。«/span»
**通过图形界面进行日志收缩**
第一步：右键数据库属性
![image1](440f8ebcefac4a62beba3e5c946f895e.png)
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»第二步：更改数据库恢复模式，将模式改为«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Simple</span>«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»。«/span»  
<span style='font-family:Verdana;font-size:12.0pt'> </span>
![image2](2f1313c02fb04a4e804d7db21992f85a.png)
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»第三步：右键数据库，«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Tasks</span><span style='font-family:Arial;font-size:12.0pt'>→</span><span style='font-style: italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Shrink</span><span style='font-family:Arial;font-size:12.0pt'>→</span><span style='font-style: italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Files</span><span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»。«/span»  
<span style='font-family:Verdana;font-size: 12.0pt'> </span>
![image3](be5d2ce1fed34de8a567a1d7e3da0131.png)
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»第四步：收缩数据库日志，选择文件类型«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Log</span>«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»，并在«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Shrink action</span><span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»中将文件收缩到给出的«/span»<span style='font-style: italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Minimum</span><span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»值，这里的数据库因为是新建的没有数据，所以提供的«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Minimum</span><span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»值为«/span»<span style='font-family:Verdana; font-size:12.0pt'>0MB</span>«span style='font-family:"Microsoft YaHei"; font-size:12.0pt'»，可以将红框«/span»<span style='font-family:Verdana;font-size:12.0pt'>3</span>«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»中的数字修改为«/span»<span style='font-family:Verdana;font-size:12.0pt'>0</span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»。«/span»  
<span style='font-family:Verdana;font-size: 12.0pt'> </span>
![image4](59d99cc9dd53443cb0b488944c6201a3.png)
*File type：选择所要收缩的是“数据库文件”还是“日志文件”。*  
*Currebtly allocated space：数据库为该文件分配的大小，就是在磁盘上看到的文件大小。*  
*Available free space：就是“当前分配的空间” 减去“实际使用的空间”。*  
*Shrink action：*  
*① Release unused space：将该文件中未使用的空间释放出来，数据在文件中不移动；*  
*② Reorganize pages before releasing unused space：此选项可以将文件收缩到“指定大小”，并将数据重新组织。其最小值为数据库“实际使用的空间”；*  
*③ Empty file by migrating the data to other files in the same filegroup：该选项很少用。*
上述操作也可以使用T-SQL替代：
DBCC ShrinkFile(‘数据库名’, targetsize);/\* 收缩数据库文件 \*/  
DBCC ShrinkFile(‘数据库名_log’, targetsize);/\* 收缩日志文件 \*/
- 1
- 2
*Targetsize：单位为兆，必须为整数，DBCC SHRINKFILE 尝试将文件收缩到指定大小。*  
*DBCC SHRINKFILE 不会将文件收缩到小于“实际使用的空间”大小，例如“分配空间”为10M，“实际使用空间”为6M，当制定targetsize为1时，则将该文件收缩到6M，不会将文件收缩到1M。*
用本例中的数据库替换后如下：
DBCC ShrinkFile(‘TEST01’, 1);/\* 收缩数据库文件 \*/  
DBCC ShrinkFile(‘TEST01_log’, 1);/\* 收缩日志文件 \*/
- 1
- 2
<span style='color:#0099FF'>注意：如若磁盘空间已满，无法进行收缩数据库事务日志文件，可采取先分离出部分暂未使用的数据库，然后将MDF文件及LDF文件进行拷贝到其他空余盘，进行释放磁盘空间，待日志收缩后，再次将分离出的数据库文件进行附加。</span>
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»分离数据库操作如下：«/span»  
<span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»右击数据库，«/span»<span style='font-style:italic; font-family:Verdana;font-size:12.0pt;color:#0099FF'>Task</span><span style='font-family:Arial;font-size:12.0pt'>→</span><span style='font-style: italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Detach</span>  
<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'> </span>
![image5](67556a8c90364588bc5daa89327c3961.png)
点击OK
![image6](939f46768a0f47bca662a1af4872a86a.png)
此时发现数据库列表中已经没有**TEST01**，说明数据库分离成功了。
![image7](54c291f334ce44319af4e2e2683212d9.png)
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»附加数据库操作如下：«/span»  
<span style='font-family:Verdana;font-size:12.0pt'> </span>«span style='font-family: "Microsoft YaHei";font-size:12.0pt'»右击«/span»<span style='font-style:italic; font-family:Verdana;font-size:12.0pt;color:#0099FF'>Databases</span>«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»，单击«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Attach</span>  
<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'> </span>
![image8](6c1ada23750f4040828eb3d79b0df3bf.png)
«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»点击«/span»<span style='font-style:italic;font-family:Verdana;font-size:12.0pt;color:#0099FF'>Add</span>«span style='font-family:"Microsoft YaHei";font-size:12.0pt'»，添加数据库文件«/span»  
<span style='font-family:Verdana;font-size:12.0pt'> </span>
![image9](a4de4db0bcc54fd1b59a67ba684c2460.png)
选择需要添加的文件后点击OK
![image10](d51fcb45be0c41d8bd24bad1351c63d8.png)
检查添加的文件无误后，点击OK
![image11](ef93332afde043eea4a72ed270c0db7b.png)
此时在数据库列表中可看到刚附件上去的数据库**TEST01**
![image12](63724d170988459cb9fe5e33724cc472.png)
若未显示**TEST01**,请刷新数据库列表
![image13](53944a8e147a4dd4a9e409b13180eed7.png)
**通过 Transact-Sql 进行日志收缩**
执行如下命令：
USE \[数据库名\]  
GO  
ALTER DATABASE \[数据库名\] SET RECOVERY SIMPLE WITH NO_WAIT  
GO  
--设为简单模式  
ALTER DATABASE \[数据库名\] SET RECOVERY SIMPLE  
GO  
USE \[数据库名\]  
GO  
DBCC SHRINKFILE (N'\[log文件名\]', \[ targetsize\], TRUNCATEONLY)  
GO  
USE \[数据库名\]  
GO  
ALTER DATABASE \[数据库名\] SET RECOVERY FULL WITH NO_WAIT  
GO  
--还原为完全模式  
ALTER DATABASE \[数据库名\] SET RECOVERY FULL  
GO
![image14](ef0807bcfce44bf99c67ef10136d7a12.png)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
*\[数据库名\]替换为具体数据库， \[ targetsize\]替换为收缩目标值。*
替换为本例中的数据库修改如下：
USE TEST01  
GO  
ALTER DATABASE TEST01 SET RECOVERY SIMPLE WITH NO_WAIT  
GO  
--设为简单模式  
ALTER DATABASE TEST01 SET RECOVERY SIMPLE  
GO  
USE TEST01  
GO  
DBCC SHRINKFILE (N'TEST01_log', 1, TRUNCATEONLY)  
GO  
USE TEST01  
GO  
ALTER DATABASE TEST01 SET RECOVERY FULL WITH NO_WAIT  
GO  
--还原为完全模式  
ALTER DATABASE TEST01 SET RECOVERY FULL  
GO
![image14](ef0807bcfce44bf99c67ef10136d7a12.png)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
