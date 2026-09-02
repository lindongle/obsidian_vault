---
title: 三分钟了解Oracle内存管理方式 - 墨天轮
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:54
---

已剪辑自: <https://www.modb.pro/db/187016>
**“**Oracle内存管理可分为两大类，自动内存管理和手动内存管理。其中手动内存管理又可分为自动共享内存管理，手动共享内存管理，自动PGA内存管理以及手动PGA内存管理。本文会简单的介绍不同的内存管理方式以及如何启用它们**”**  

在工作中发现，很多客户的数据库设置都是由运维负责操作。尤其是内存的调整大多数都是由运维来完成。但是运维对于如何设置数据库内存基本不了解，甚至连各参数有什么用都不知道。对于大部分运维来说只要有百度，就敢改参数。所以很多时候运维设定的参数实际上对于系统的运行仍有极大的调优空间。
   阅读文章你将了解到Oracle的内存管理方式，以及如何启用它们，并且你也将初步了解如何分配内存。

自动内存管理的英文全称为AutomaticMemory Management。是指Oracle自动的对SGA和PGA进行管理。如果我们要启动自动内存管理，只需设置MEMORY_TARGET和MEMORY_MAX_TARGET即可。

MEMORY_TARGET用于设置目标内存大小，Oracle会尝试将内存稳定在该值。如果你修改了MEMORY_TARGET并不需要重启数据库。

MEMORY_MAX_TARGET用于设置最大允许的内存大小，Oracle以此来限制内存使用的最大值。如果你修改了该参数，你需要重启数据库。
在修改以上两个值时需要特别注意，**MEMORY_MAX_TARGET必须大于或者等于MEMORY_TARGET**。

### 如何调整内存
调整内存的命令如下：
ALTER SYSTEM SETMEMORY_MAX_TARGET = 1000M SCOPE = SPFILE;
ALTER SYSTEM SET MEMORY_TARGET =1000MSCOPE= SPFILE;
在上述命令中：
SCOPE指的是修改范围，一共有三个值分别是SPFILE，BOTH和MEMORY
SPFILE：指修改服务器参数文件中的数据。
MEMORY：指修改内存中的数据，对于要重启数据库才生效的参数，该值不可用
BOTH：指同时修改服务器参数文件和内存中的数据。

### 什么情况下使用自动内存管理
Oracle官方推荐SGA+PGA的内存总大小如果小于或等于4GB，建议使用自动内存管理。如果你的SGA+PGA大于4G也使用了自动内存管理，那么建议最好设置SGA_TARGET和PGA_AGGREGATE_TARGET的值。那么这些值将作为SGA和PGA的最小值。该设置主要是为了避免过大的内存抖动。

自动共享内存管理

自动共享内存管理的英文全称为Automatic Shared Memory Management。简称为ASMM。当启用自动共享内存管理时，Oracle会自动的调整SGA的各个组件的值。如果需要启动自动共享内存管理，需要将SGA_TARGET和SGA_MAX_SIZE设置为非0值，同时还需要将MEMORY_TARGET和MEMORY_MAX_TARGET设置为0，否则MEMORY_TARGET不为0，Oracle采用的是自动内存管理而不是自动共享内存管理。

SGA_TARGET用于设置共享内存目标大小，Oracle会努力维持共享内存在此目标值，如果你修改了该参数，你并不需要重启数据库。

SGA_MAX_SIZE用于设置最大允许的共享内存大小，Oracle以此来限制共享内存的最大值，如果你修改了该参数，你需要重启数据库。
在修改以上两个值时需要注意，**SGA_MAX_SIZE必须大于或者等于SGA_TARGET**。
###  
### 如何调整内存
调整内存的命令如下：
ALTER SYSTEM SET SGA_TARGET =1000M SCOPE = SPFILE;
ALTER SYSTEM SET SGA_MAX_SIZE =1000MSCOPE= SPFILE;

ALTER SYSTEM SETMEMORY_MAX_TARGET = 0 SCOPE = SPFILE;
ALTER SYSTEM SET MEMORY_TARGET = 0SCOPE = SPFILE;
在上述命令中：
SCOPE指的是修改范围，一共有三个值分别是SPFILE，BOTH和MEMORY
SPFILE：指修改服务器参数文件中的数据。
MEMORY：指修改内存中的数据，对于要重启数据库才生效的参数，该值不可用
BOTH：指同时修改服务器参数文件和内存中的数据。

### 什么情况下使用自动共享内存管理
### Oracle官方推荐SGA+PGA的总大小大于4GB，建议使用自动共享内存管理。如果我们启用了自动共享内存管理，Oracle会自动的调整SGA各组件大小，一般我们并不需要干预。但如果我们知道各组件高峰期时这些值的使用量，那么我们也可以为这些组件设置指定值，这些值将作为组件的最小值。从而避免高峰期时不必要的内存调整

手动共享内存管理

手动共享内存管理的英文全称为Manual Shared Memory Management。要手动管理共享内存，首先必须禁用自动内存管理和自动共享内存管理。因此MEMORY_TARGET和SGA_TARGET都必须设置为0。同时需要手工设置其他组件的值

**DB_CACHE_SIZE:**缓冲区缓存，主要用于缓存数据，较大的缓存通常会减少磁盘的读写数量，因此缓冲区缓存的大小对性能影响较为明显，因此设置一个合理的缓冲区缓存尤为重要。

**SHARED_POOL_SIZE:**共享池，存储多种类型的数据，例如解析后的SQL，PL/SQL代码，数据字典，查询的结果集缓存等数据。因此在多用户环境下，较大的共享池对于性能提升也是非常有帮助的。
****
**LARGE_POOL_SIZE：**大池是一个可选组件。一般用于备份进程，并行执行等。
****
**JAVA_POOL_SIZE：**JAVA池，JAVA代码所需要的内存将从此分配。
****
**STREAMS_POOL_SIZE**：流池，存储缓冲队列消息的内存池。

### 什么情况下使用手动共享内存管理
不推荐使用手动共享内存管理，首先你需要对内存的各参数的作用非常的了解。其次你必须对系统各阶段内存的使用情况非常了解。并且由于不同时期对各个组件内存使用的多少可能有较大的差异，这极大的增加了管理成本。所以不推荐使用手动共享内存管理。

自动PGA内存管理

自动PGA内存管理的英文全称为Automatic PGA Memory Management。当使用自动PGA内存管理时，Oracle会自动的管理实例PGA的内存总量。我们可以通过设置初始化参数PGA_AGGREGATE_TARGET为非0值来开启自动PGA内存管理。Oracle会尝试确保分配给所有数据库服务器进程和后台进程的PGA内存总量不会超过这个目标，但实际使用时可能超过该设置。当我们使用自动PGA内存管理时，SQL工作区的大小是自动的，并且会忽略所有\*\_AREA_SIZE初始化参数
**注意：Oracle推荐使用自动PGA内存管理，不推荐使用手动PGA内存管理**
##  
手动PGA内存管理

手动PGA内存管理的英文全称为Manual PGA Memory Management。当自动内存管理被禁用并且PGA_AGGREGATE_TARGET被设置为0时，将启用手动PGA内存管理。使用手动PGA内存管理时，意味着你需要手工设置\*\_AREA_SIZE初始化参数。
**注意：Oracle推荐使用自动PGA内存管理，不推荐使用手动PGA内存管理**
##  
如何分配内存

不管是采用自动内存管理还是自动共享内存管理+自动PGA内存管理。在分配内存时，普遍的做法是分配机器总内存的50%~75%。例如：机器内存是128G,SGA+PGA合计会分配64G~96G。需要注意的是50%~75%只是一个普遍值，但不是个绝对值。机器内存只有4G的情况下，分配50%是很有必要的，但是如果机器内存有512G，对于只部署数据库的机器来说分配75%仍然有大量的内存未使用。
SGA需要多大？PGA需要多大？这个并没有参考的指标，一般需要根据实际情况来分配，一般可以先确定PGA大小，然后剩余内存都分配给SGA。如果你的系统有大量的并发访问，那么PGA分配就需要比较多，而如果你的系统并发访问人数非常少。那么几百MB的PGA就可满足了。而剩下的内存则都可以分配给SGA。

如果看完本文，您有所收获，麻烦您点个“在看”并扫码关注吧，您的支持是我创作的动力，我会以优质的原创文章回报大家。
![image1](a3962535ca9c4e088672bbee2e7d10bd.jpg)

**推荐阅读**  

