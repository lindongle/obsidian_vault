---
title: vmware中设置共享磁盘需要满足两个条件 - CSDN博客
updated: 2026-06-06T00:32:04
created: 2026-07-05T17:04:55
---

vmware中设置共享磁盘需要满足两个条件 - CSDN博客
星期三, 六月 6, 2018
5:27 下午

已剪辑自: <https://blog.csdn.net/reason2008/article/details/1266544>
 vmware中设置共享磁盘，需要满足两个条件：
 1、硬盘的高级属性中必须设置成1:0,如果增加第二块共享硬盘，也设成1:0，系统就会报错，所以设置成1:1（这种方式本人还没试过，不过在oracle双机的文章中看到过这样的设置方法）  

 2、需要在vmware的配置属性文件（如rhel3.vmx）中加入两条属性  
 scsi\[n\].sharedBus = "virtual"  
 disk.locking = "false"
 系统启动的时候会锁定磁盘，所以当启动linux1后共享磁盘被锁定了，linux2就起不来了,因此需要加入disk.locking = "false" 。  

 一般来说，如果是scsi1:0，则n为1，也就是scsi1.sharedBus = "virtual" ，表示所有的bus都共享，vmare推荐这种做法。
 如果说是不是所有的bus都共享的话，可以将上述scsi1.sharedBus = "virtual"改成scsi1:1.shared = "true" 。  

** 疑问：**scsi1:0中的1和0到底是什么含义？如有高手看到，请提点一下，先谢过了啦！  

  

