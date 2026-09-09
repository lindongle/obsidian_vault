---
title: Oracle内存管理（修改SGA与PGA） - 墨天轮
updated: 2026-06-05T23:35
created: 2025-08-27T00:57:28
---

Oracle内存管理（修改SGA与PGA） - 墨天轮
2025年8月27日
0:57

已剪辑自: <https://www.modb.pro/db/1788096417373442048>
#### *<span style='color:#5B9BD5'>目录：</span>*
- 

- Oracle11g数据库内存管理  

- 

- 一、Oracle数据库内存管理概念：  

- 二、内存管理方式的切换：  

- 三、修改实例SGA与PGA大小（ASMM）  

- 

- 1、使用sqlplus命令在数据库中修改  

- 

- （1）、查看memory_target与memory_max_target大小：  

- （2）、(如果值非零) 修改memory_target与memory_max_target大小：  

- （3）、修改SGA与PGA大小：  

- （4）、重启数据库：  

- （5）、验证SGA与PGA大小：  

- 2、通过修改pfile启动数据库在写入到spfile中  

- 

- （1）、创建pfile文件：  

- （2）、编辑pfile文件：  

- （3）、通过pfile启动实例：  

- （4）、验证SGA与PGA大小：  

- （5）、通过pfile创建spfile：  

- （6）、重启数据库：  

### <span style='color:#5B9BD5'>Oracle11g数据库内存管理</span>
#### *<span style='color:#5B9BD5'>一、Oracle数据库内存管理概念：</span>*
内存管理涉及到根据数据库变化的需要为Oracle实例内存结构保持最佳大小,Oracle数据库根据与内存相关的初始化参数的设置来管理内存。  
内存管理有三种基本方式：
**AMM**(自动内存管理)  
Automatic memory management:
- 指定实例内存的目标大小,数据库实例自动调整到目标内存大小,根据需要在SGA和实例PGA之间重新分配内存
**ASMM**(自动共享内存管理)  
Automatic shared memory management:
- 这种管理模式是部分自动化的,为SGA设置目标大小,然后可以选择为PGA设置聚合目标大小或单独管理PGA工作区
**Manual memory management**(手动内存管理)
- 不是设置总内存大小,而是设置许多初始化参数来分别管理SGA和实例PGA的组件
如果使用数据库配置助手（DBCA）创建数据库并选择基本安装选项，则默认为AMM（自动内存管理）
#### *<span style='color:#5B9BD5'>二、内存管理方式的切换：</span>*
**MEMORY_TARGET ：**  
**[操作系统](https://link.csdn.net/?target=https%3A%2F%2Fauth.huaweicloud.com%2Fauthui%2Fsaml%2Flogin%3FxAccountType%3Dcsdndev_IDP%26isFirstLogin%3Dfalse%26service%3Dhttps%253A%252F%252Flab.huaweicloud.com%252Fexperiment-detail_2384%253Futm_source%253Dhwc-csdn%2526utm_medium%253Dshare-op%2526utm_campaign%253D%2526utm_content%253D%2526utm_term%253D%2526utm_adplace%253DAdPlace070851)上 Oracle 所能使用的最大内存值（动态参数），是PAG 和SGA的总和。**
1、AMM(自动内存管理)
memory_target=非0，如果初始化参数 LOCK_SGA ＝ true ，则 AMM 是不可用的
复制
2、ASMM (自动共享内存管理)
memory_target=0 and sga_target=非0
复制
3、Manual memory management(手动内存管理)
memory_target=0 and sga_target=0，指定 share_pool_size 、db_cache_size 等 sga 参数
复制
在设置memory_target与memory_max_target 需注意注意以下三点：
- 若指定了memory_target而没有指定memory_max_target重启后，memory_max_target和memory_target大小相等；
- 若指定了memory_max_target而没有指定memory_target，重启后memory_target=0；
- 若设置 memory_max_target \< memory_target 时，则重启后报错（ORA-00837: Specified value of MEMORY_TARGET greater than MEMORY_MAX_TARGET）。
使AMM失效memory_max_target 的值应该设置为空，而不是0，使用alter system reset memory_max_target，  
（ORA-00843 ORA-00849 Trying to Change SGA_TARGET with MEMORY_MAX_TARGET=0 Being Active (Doc ID 1397761.1)）  
SQL\> alter system reset memory_max_target;  
SQL\> alter system set memory_target=0;
#### *<span style='color:#FA0000'>三、修改实例SGA与PGA大小（ASMM）</span>*
##### <span style='color:#2E75B5'>1、使用sqlplus命令在数据库中修改</span>
**思路**：首先通过spfile指定路径创建一个pfile作为备份，然后在数据库中进行内存参数调整操作，最后重启数据库。
在对数据库参数修改前创建pfile文件作为spfile备份
SQL\> create pfile='/tmp/pfile20220706.ora' from spfile;  

File created.
复制
###### *<span style='color:#2E75B5'>（1）、查看memory_target与memory_max_target大小：</span>*
SQL\> show parameter memory  

NAME TYPE VALUE  
-------------------------------- ----------- ------------------------------  
hi_shared_memory_address integer 0  
memory_max_target big integer  0  
memory_target big integer  0  
shared_memory_address integer 0  
SQL\>  
\#根据输出的结果显示 memory_max_target=0 与 memory_target=0 说明目前已经是 ASMM 模式直接修改sga与pga大小即可
复制
###### *<span style='color:#2E75B5'>（2）、(如果值非零) 修改memory_target与memory_max_target大小：</span>*
\#如果memory_max_target非0 与 memory_target非0，使用下面命令将值改为0  
1、修改memory_max_target大小：  
SQL\> alter system set memory_max_target=0 scope=spfile;  

System altered.  

2、修改memory_target大小（memory_target\<=memory_max_target）：  
SQL\> alter system set memory_target=0 scope=spfile;  

System altered.
复制
###### *<span style='color:#2E75B5'>（3）、修改SGA与PGA大小：</span>*
1、修改sga大小：  
SQL\> alter system set sga_max_size=4096M scope=spfile;  

System altered.  

SQL\> alter system set sga_target=4096M scope=spfile;  

System altered.  

2、修改pga大小：  
SQL\> alter system set pga_aggregate_target=1024M scope=spfile;  

System altered.
复制
因为将参数修改写在了spfile中，在数据库重启后参数生效
###### *<span style='color:#2E75B5'>（4）、重启数据库：</span>*
SQL\> shutdown immediate  
Database closed.  
Database dismounted.  
ORACLE instance shut down.  
SQL\> startup  
ORACLE instance started.  

Total System Global Area 2672361472 bytes  
Fixed Size 2256232 bytes  
Variable Size 503317144 bytes  
Database Buffers 2147483648 bytes  
Redo Buffers 19304448 bytes  
Database mounted.  
Database opened.  
SQL\>
复制
###### *<span style='color:#2E75B5'>（5）、验证SGA与PGA大小：</span>*
SQL\> show parameter sga  

NAME TYPE VALUE  
------------------------------------ ----------- ------------------------------  
lock_sga boolean FALSE  
pre_page_sga boolean FALSE  
sga_max_size big integer 2560M  
sga_target big integer 2560M  
SQL\> show parameter pga  

NAME TYPE VALUE  
------------------------------------ ----------- ------------------------------  
pga_aggregate_target big integer 200M  
SQL\>
复制
##### <span style='color:#2E75B5'>2、通过修改pfile启动数据库在写入到spfile中</span>
**思路**：首先通过spfile指定路径创建一个pfile，修改pfile中内存参数—\>关闭数据库—\>使用pfile启动数据库—\>通过该pfile创建spfile—\>重启数据库  
首先：创建spfile备份
###### *<span style='color:#2E75B5'>（1）、创建pfile文件：</span>*
\#/tmp/pfile20220706.ora是通过当前spfile创建  
SQL\> create pfile='/tmp/pfile20220706.ora' from spfile;  

File created.  

SQL\>
复制
###### *<span style='color:#2E75B5'>（2）、编辑pfile文件：</span>*
vi /tmp/pfile20220706.ora
复制
若在/tmp/pfile20220706.ora文件中存在memory_max_target与memory_target参数，屏蔽或删除即可。
orcl.\_\_db_cache_size=2046820352  
orcl.\_\_java_pool_size=16777216  
orcl.\_\_large_pool_size=33554432  
orcl.\_\_oracle_base='/u01/app/oracle'#ORACLE_BASE set from environment  
orcl.\_\_pga_aggregate_target=654311424#实例orcl 建议pga=(物理内存 x 80%) x 20%，由memory_target自动管理  
orcl.\_\_sga_target=2566914048#实例orcl 建议sga=(物理内存 x 80%) x 80%，由memory_target自动管理  
orcl.\_\_shared_io_pool_size=0  
orcl.\_\_shared_pool_size=436207616  
orcl.\_\_streams_pool_size=0  
\*.audit_file_dest='/u01/app/oracle/admin/orcl/adump'  
\*.audit_trail='db'  
\*.compatible='11.2.0.4.0'  
\*.control_files='/u01/app/oracle/oradata/orcl/control01.ctl','/u01/app/oracle/oradata/orcl/control02.ctl'  
\*.db_block_size=8192  
\*.db_domain=''  
\*.db_name='orcl'  
\*.diagnostic_dest='/u01/app/oracle'  
\*.dispatchers='(PROTOCOL=TCP) (SERVICE=orclXDB)'  
\#\*.memory_max_target=0#将memory_max_target屏蔽或删除  
\#\*.memory_target=0#将memory_target屏蔽或删除  
\*.nls_language='AMERICAN'  
\*.nls_territory='AMERICA'  
\*.O7_DICTIONARY_ACCESSIBILITY=FALSE  
\*.open_cursors=300  
\*.pga_aggregate_target=681574400#pga大小  
\*.processes=1500  
\*.remote_login_passwordfile='EXCLUSIVE'  
\*.sessions=1655  
\*.sga_max_size=2684354560#sga_max_size大小  
\*.sga_target=2684354560#sga_target大小  
\*.undo_tablespace='UNDOTBS1'
复制
###### *<span style='color:#2E75B5'>（3）、通过pfile启动实例：</span>*
关闭数据库实例
SQL\> shutdown immediate  
Database closed.  
Database dismounted.  
ORACLE instance shut down.  
SQL\>
复制
通过pfile启动数据库实例：
SQL\> startup pfile='/tmp/pfile20220706.ora';  
ORACLE instance started.  

Total System Global Area 2672361472 bytes  
Fixed Size 2256232 bytes  
Variable Size  1073742488 bytes  
Database Buffers  1577058304 bytes  
Redo Buffers  19304448 bytes  
Database mounted.  
Database opened.  
SQL\>
复制
###### *<span style='color:#2E75B5'>（4）、验证SGA与PGA大小：</span>*
\#查看pga大小：  
SQL\> show parameter pga  

NAME  TYPEVALUE  
------------------------------- ----------- ------------------------------  
pga_aggregate_target big integer 650M#pga大小已经修改成功(原610M)  

\#查看sga大小：  
SQL\> show parameter sga  

NAME  TYPEVALUE  
-------------------------------- ----------- -----------------------------  
lock_sga boolean FALSE  
pre_page_sga boolean FALSE  
sga_max_size big integer 2560M#sga大小已经修改成功(原2450M)  
sga_target big integer 2560M#sga大小已经修改成功(原2450M)  

SQL\> show parameter memory  

NAME  TYPE VALUE  
------------------------------- ----------- ------------------------------  
hi_shared_memory_address integer0  
memory_max_target big integer 0  
memory_target big integer 0  
shared_memory_address integer0  
SQL\>
复制
###### *<span style='color:#2E75B5'>（5）、通过pfile创建spfile：</span>*
SQL\> create spfile from pfile='/tmp/pfile20220706.ora';  

File created.
复制
###### *<span style='color:#2E75B5'>（6）、重启数据库：</span>*
SQL\> shutdown immediate  
Database closed.  
Database dismounted.  
ORACLE instance shut down.  
SQL\>  

\#再次重启数据库(默认spfile启动)  
SQL\> startup  
ORACLE instance started.  

Total System Global Area 2672361472 bytes  
Fixed Size 2256232 bytes  
Variable Size  1073742488 bytes  
Database Buffers  1577058304 bytes  
Redo Buffers  19304448 bytes  
Database mounted.  
Database opened.  
SQL\>
复制
sga与pga修改成功！
查询数据库sga和pga实际占用大小:
SELECT ROUND((a.SGA_MEM + b.PGA_MEM), 2) "TOTAL_MEMORY",  
ROUND(a.SGA_MEM, 2) sga,  
ROUND(b.PGA_MEM, 2)  
FROM (SELECT SUM(current_size) / 1024 / 1024 "SGA_MEM"  
FROM v\$sga_dynamic_components,  
(SELECT SUM(pga_alloc_mem) / 1024 / 1024 "PGA_MEM"  
FROM v\$process) a  
WHERE component IN ('shared pool',  
'large pool',  
'java pool',  
'streams pool',  
'DEFAULT buffer cache')) a,  
(SELECT SUM(pga_alloc_mem) / 1024 / 1024 "PGA_MEM" FROM v\$process) b;
复制

