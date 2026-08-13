/*设置数据库允许直接操作系统表*/

  use   master  
go  
exec sp_configure   'allow updates',1  
go    
reconfigure   with   override  
go  
  /*设置为紧急修复模式*/
  alter database tc10prod set emergency
   go
   alter database tc10prod set single_user with rollback immediate
   go
   alter database tc10prod Rebuild Log on  (name=tc10prod,filename= 'D:\MSSQL\Data\tc10prod_Data_log.ldf')

alter database tc10prod set multi_user