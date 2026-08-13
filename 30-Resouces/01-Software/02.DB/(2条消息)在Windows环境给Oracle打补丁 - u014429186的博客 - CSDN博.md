---
title: (2条消息)在Windows环境给Oracle打补丁 - u014429186的博客 - CSDN博...
updated: 2026-06-06T10:05
created: 2019-07-07T00:24:17
---

(2条消息)在Windows环境给Oracle打补丁 - u014429186的博客 - CSDN博客
星期六, 七月 6, 2019
4:24 下午
已剪辑自: <https://blog.csdn.net/u014429186/article/details/53540593>
1.  Oracle补丁一共分为如下几步
2.  1、配置环境变量
3.  2、更新Opath
4.  3、停用Oracle服务
5.  4、打补丁

- 1、配置环境变量 (这里可以不用设置环境变量，运行脚本时采用绝对路径)  

![image1](05b5e0f025ad4b2eadc60a589d455082.png)
设置ORACLE_HOME环境变量为[Oracle](http://lib.csdn.net/base/oracle)的目录，如果安装到C盘，我的目录是C:\app\Administrator\product\11.2.0\dbhome_1
- 2、更新OPath  
  OPatch是Oracle的一个更新补丁的程序，我们先把它更新到最新版本（我拿到的补丁文件中有OPatch的更新文件，所以我更新了OPatch，据说有些补丁要求的OPatch比较新，如果用老版OPatch打补丁可能会失败）  
  OPatch就在Oracle的目录中，有个OPatch目录  
  我的是  
  C:\app\Administrator\product\11.2.0\dbhome_1\OPatch  
  可以先查看下OPatch版本  
  cmd窗口进入目录然后执行opatch version  

![image2](bf2c7dd343834703a9c28b45eb319b46.png)
将最新版的OPatch文件拷贝到上面的目录，替换文件，然后可以在执行版本看下  

![image3](b1e3679c11b0420983ab179a5ef86d21.png)
这样就完成了OPatch的更新，其实就是替换文件
- 停用Oracle服务  
  打补丁之前需要先停用Oracle服务，可以在Windows服务窗口将所有Oracle开头的服务都停止掉（我当时停完了执行更新报了一个错误“”CheckActiveFilesAndExecutables” failed.”，这个错误是由于有正在使用的文件阻止了更新，这是因为我在本机运行了SQLDeveloper，它会使用Oracel一个文件，先重启下服务器，再停止Oracle服务就好了）
- 打补丁  
  我把补丁文件夹放到了桌面上，路径是C:\Users\Administrator\Desktop\21104036  
  先使用cmd窗口进入这个目录，然后执行命令  
  %ORACLE_HOME%/OPatch/opatch apply  
  这里执行了OPatch里面的命令，用了环境变量，估计如果不配置环境变量这里写绝对目录应该也可以，不过我当时配置了，就这样运行了 (或者运行命令C:/app/Administrator/product/11.2.0/dbhome_1/OPatch/opatch apply)  

![image4](83bdf5917e464f4da63dca6b935ed40f.png)
- 
![image5](3b5816b1dd854b69acdeb05c73dbc9f6.png)
按照向导一路按Y,回车就行了  

![image6](76af96986423485986d84cd6ffb4d9b6.png)

![image7](e80320a493254947b51d23bab96f8b17.png)
最后这样就完成了  

![image8](a8ae3ed5e9464ab38c5d6dabd0623be4.png)
我们可以在用cmd进入OPatch目录，执行 opatch lsinventory，查看下打的补丁号，验证下  
可以看到第一个补丁号就是我们刚打的  
这样打补丁操作就完成了  

![image9](88ff99bd7f56443d84292a6c2f9a4e9a.png)
最后一步启动数据库相关服务，如果有多个实例在每个实例下运行下面的脚本

sqlplus / AS SYSDBA

@C:\app\Administrator\product\11.2.0\dbhome_1\RDBMS\ADMIN\catbundle.sql psu apply

Quit
参考文档：http://blog.csdn.net/willjgl/article/details/53007188  

