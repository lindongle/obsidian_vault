---
title: TC性能优化
created: 2026-06-27T21:40:41+08:00
updated: 2026-06-28T08:50:44+08:00
tags:
  - TC
  - 系统配置
  - 优化
---
// 1. Web服务器自调整线程池数量
 
    最小值： 1 - 500
	最大值： 400 - 1000
	
// 2. Web服务器JVM, 1024M - 4096M
     
	 进入%WLS_HOME%\base_domain\startWebLogic.cmd
     在call 上一行增加：
     set USER_MEM_ARGS=-Xms4096m -Xmx4096m -XX:PermSize=512m -XX:MaxPermSize=1024m
	 
// 3. 修改TC日志级别
      
	  打开%TC_DATA%\logger.properties文件，将级别由INFO改为ERROR
	  
// 4. 修改Server Manager JVM和stack

      修改mgrenv.bat文件， JVM_HEAP_SIZE 4096M, JAVA_STACK_SIZE 256K
	  
// 5. 修改 ServerPool.properties文件，

       172.16.77.138：  PROCESS_TARGET=0700 200, 1800 16
       172.16.251.42:   PROCESS_TARGET=0700 100, 1800 16
       172.16.251.43:   PROCESS_TARGET=0700 100, 1800 16
	   
// 6. 设置REDO日志大小为1024MB
      
	  查看当前日志组成员
      select member from v$logfile;

      查看当前日志组状态
      select group#,members,bytes/1024/1024,status from v$log;
	  
      增加日志组
      alter database add logfile group 4 ('/u01/oracle/oradata/orcl/redo04.log') size 100M;
	  
      切换到新增的日志组上
      alter system switch logfile;
      alter system checkpoint;
	  
// 7. 优化数据库参数

      create pfile='d:\steven\pfile_20211125.ora' from spfile;
      alter system set sga_max_size = 80G scope=spfile
      alter system set sga_target = 80G scope=spfile
      alter system set sort_area_size = 1073741824  scope=spfile
      alter system set open_cursors = 3000 scope = spfile
      alter system set session_cached_cursors = 1000 scope = spfile
      alter system set pga_aggregate_target=20G scope=spfile

// 8. 迁移大表

      alter tablespace TEMP add tempfile ‘d:/oracle/oradata/rktcent/temp03.dbf’ size 5000M;
	  alter tablespace TEMP add tempfile ‘d:/oracle/oradata/rktcent/temp04.dbf’ size 5000M;
	  alter tablespace TEMP add tempfile ‘d:/oracle/oradata/rktcent/temp05.dbf’ size 5000M;
      create tablespace MESSAGE datafile ‘d:/oracle/oradata/rktcent/message01.dbf’ size 15000M;
      alter tablespace MESSAGE add datafile ‘d:/oracle/oradata/rktcent/message01.dbf’ size 15000M;
      create tablespace BACKPOINTER datafile ‘d:/oracle/oradata/rktcent/backpointer01.dbf’  size 15000M;
      alter tablespace BACKPOINTER add datafile ‘d:/oracle/oradata/rktcent/backpointer02.dbf’ size 15000M;
      create tablespace WORKFLOWAUDIT datafile ‘d:/oracle/oradata/rktcent/workflowaudit01.dbf’  size 15000M;
      alter tablespace WORKFLOWAUDIT add datafile ‘d:/oracle/oradata/rktcent/workflowaudit02.dbf’ size 15000M;
      create tablespace POM_OBJECT datafile ‘d:/oracle/oradata/rktcent/pom_object01.dbf’ size 15000M;
      alter table PFND0MESSAGE move tablespace MESSAGE;
      alter table POM_BACKPOINTER move tablespace BACKPOINTER;
      alter table PFND0WORKFLOWAUDIT move tablespace WORKFLOWAUDIT;
      alter table PPOM_OBJECT move tablespace POM_OBJECT;
      alter index PIPFND0MESSAGE rebuild tablespace MESSAGE;
      alter index PIPOM_BACKPOINTER rebuild tablespace BACKPOINTER;
      alter index PIPOM_BACKPOINTER_2 rebuild tablespace BACKPOINTER;
      alter index PIPFND0WORKFLOWAU rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_1 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_2 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_3 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_4 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_5 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_6 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_7 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_8 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLOW_9 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPFND0WORKFLO_10 rebuild tablespace WORKFLOWAUDIT;
      alter index PIPPOM_OBJECT rebuild tablespace POM_OBJECT;
      alter index PIPPOM_OBJECT_0 rebuild tablespace POM_OBJECT;
      alter index PIPPOM_OBJECT_1 rebuild tablespace POM_OBJECT;
	  
// 9. 将热表放入BUFFER池
      alter table pdata_0 STORAGE (BUFFER_POOL KEEP);
      alter index PIPDATA_0 storage(BUFFER_POOL KEEP);
      alter table pdata_0 modify LOB(PVAL) (cache pctversion 2);
      alter table POM_M_LOCK STORAGE (BUFFER_POOL KEEP);
      alter table POM_R_LOCK STORAGE (BUFFER_POOL KEEP);
      alter table POM_F_LOCK STORAGE (BUFFER_POOL KEEP);
      alter table PPOM_USER STORAGE (BUFFER_POOL KEEP);
      alter table PAM_ACL STORAGE (BUFFER_POOL KEEP);
      alter table PAM_ACE STORAGE (BUFFER_POOL KEEP);
      alter table PIMANTYPE STORAGE (BUFFER_POOL KEEP);
      alter table PPSVIEWTYPE STORAGE (BUFFER_POOL KEEP);
      alter table PDATA_0 STORAGE (BUFFER_POOL KEEP);
      alter table PUSER STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPOM_M_LOCK STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPOM_M_LOCK_PROCESS STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPOM_R_LOCK STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPOM_R_LOCK_04 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPOM_R_LOCK_PROCESS STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPPOM_USER STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPPOM_USER_0 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPPOM_USER_1 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPAM_ACL STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPAM_ACL_0 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPAM_ACE STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPIMANTYPE STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPIMANTYPE_0 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPIMANTYPE_1 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPIMANTYPE_2 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPPSVIEWTYPE STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPPSVIEWTYPE_0 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPDATA_0 STORAGE (BUFFER_POOL KEEP);
      alter index infodba.PIPUSER STORAGE (BUFFER_POOL KEEP);
	  
// 10. 重做数据库索引

      存储过程
	  CREATE OR REPLACE PROCEDURE generate_tablelist
      IS
      BEGIN
         DBMS_OUTPUT.ENABLE(buffer_size => null);
         FOR TableList IN (select NUM_ROWS,TABLE_NAME,TABLESPACE_NAME, ROW_NUMBER() over(order by NUM_ROWS) as NumOfRows, (select count(*) from user_tables WHERE TABLESPACE_NAME IN ('IDATA','ILOG'))  as CntOfRows  from user_tables WHERE TABLESPACE_NAME IN ('IDATA','ILOG'))
         LOOP
         dbms_output.put_line('select ''' || TableList.NumOfRows || ' Of ' || TableList.CntOfRows  || ',' || TableList.TABLE_NAME || ',' || TableList.NUM_ROWS  || ''' from dual;');
         dbms_output.put_line('alter table infodba.' || TableList.TABLE_NAME || ' move tablespace ' || TableList.TABLESPACE_NAME || ' parallel 8;');
         dbms_output.put_line('alter table infodba.' || TableList.TABLE_NAME || ' noparallel;');
         FOR IndexList IN (select index_name, degree, tablespace_name from user_indexes where index_type != 'LOB' and table_name=TableList.TABLE_NAME )
      	    LOOP
      		dbms_output.put_line('alter index infodba.' || IndexList.index_name || ' rebuild parallel ' || IndexList.degree || ';');
      		
      		END LOOP;
      		dbms_output.put_line('');
         END LOOP;
      END generate_tablelist;
      /
	  
	  生成SQL语句
	  set heading off
      set serverout on size 90000000
      spool move_table.sql;
      exec generate_tablelist;
      spool off;
	  
	  执行SQL语句
	  SQL> @move_table.sql

![[suoyin.sql]]
	  
// 11. 添加新索引
 
      SQL> create index PIPFND0WORKFLO_11 on PFND0WORKFLOWAUDIT(SUBSTR(pfnd0job,1,14));
      SQL> create index PIPFND0WORKFLO_12 on PFND0WORKFLOWAUDIT(pfnd0EventTypeName);
      SQL> create index PIPPOM_SESSION_1 on PPOM_SESSION(puser_name);
	  
	  set TC_ROOT=
	  set TC_DATA=
	  call %TC_DATA%\tc_profilevars.bat
	  install -drop_index -u=infodba -p=<password> -g=dba EPMTask responsible_party_index
	  install -add_index -u=infodba -p=<password> -g=dba state_index 0 EPMTask state_value
	  install -add_index -u=infodba -p=<password> -g=dba responsible_party_index 0 EPMTask responsible_party state_value


	  
// 12. 执行统计分析
      SQL> exec dbms_stats.gather_schema_stats(ownname =>'infodba',estimate_percent => 100, method_opt => 'FOR ALL COLUMNS SIZE AUTO',degree=>8, cascade=>TRUE, no_invalidate=>FALSE);



// 13. FSC JVM 内存由256MB修改为4096M