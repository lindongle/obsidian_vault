---
title: Linux Oracle数据库自动备份Shell脚本_数据库技术_Linux公社-Linux系统门户...
updated: 2026-06-06T10:05
created: 2018-10-20T02:46:21
---

Linux Oracle数据库自动备份Shell脚本_数据库技术_Linux公社-Linux系统门户网站
星期五, 十月 19, 2018
6:46 下午
已剪辑自: <https://www.linuxidc.com/Linux/2017-11/148505.htm>
因对[Oracle](http://www.linuxidc.com/topicnews.aspx?tid=12) RMAN工具的使用不了解，所以网上查询自动备份数据库脚本，进行数据库备份
以下是可运行脚本创建步骤
**1.在服务器创建备份目录，并赋予权限  
mkdir -p /backup/P_DATA  
\#新建shell脚本存放路径  
mkdir -p /backup/P_DB_BACK \#新建Oracle数据库备份目录  
chown -R oracle:oinstall /backup/P_DATA  \#设置目录权限为oinstall用户组的oracle用户（用户oracle与用户组oinstall是在安装Oracle数据库时设置的）  
chown -R oracle:oinstall /backup/P_DB_BACK**
**2.备份脚本  
vi /backup/P_DATA/P_DB_BAK.sh \#新建文件**
\#!/bin/sh ORACLE信息可以通过 .bash_profile 查看
echo "备份脚本开始启动..." \#打印备份进度  
export ORACLE_SID=orcl1  
export ORACLE_BASE=/oracle/app  
export ORACLE_HOME=/oracle/app/110204  
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$ORACLE_HOME/lib:/lib:/usr/lib:/usr/local/lib  
export PATH=\$ORACLE_HOME/bin:/bin:/usr/bin:/usr/sbin:/usr/local/bin:/oracle/grid/bin
export LANG=en_US.UTF-8  
export NLS_LANG="AMERICAN_AMERICA".AL32UTF8  
\#以上代码为Oracle数据库运行账号oracle的系统环境变量设置，必须添加，否则crontab任务计划不能执行。
\#oracle info
dateTime=\`date +%Y\_%m\_%d\` \#当前系统时间  
days=5  \#删除5天前的备份数据  
orsid='172.16.100.57:1521/orcl'  
\#oralce连接信息  
orowner=dbUser  
\# 备份此用户下面的数据  
bakuser=dbUser  
\#用此用户来执行备份，必须要有备份操作的权限  
bakpass=dbPwd \#执行备注的用户密码  
bakdir=/backup/P_DB_BACK  
\#备份文件路径，已创建完毕  
bakdata=\$orowner"\_"\$dateTime.dmp  
\#备份数据库名称  
baklog=\$orowner"\_"\$dateTime.log  
\#备份执行时候生成的日志文件名称  
ordatabak=\$orowner"\_"\$dateTime.tar.gz  
\#最后保存的Oracle数据库备份文件  
cd \$bakdir
echo "现在开始进行数据备份..."
exp \$bakuser/\$bakpass@\$orsid grants=y owner=\$orowner file=\$bakdir/\$bakdata log=\$bakdir/\$baklog \#执行备份
echo "数据备份结束..."
echo "现在开始进行压缩备份数据..."
tar -zcvf \$ordatabak \$bakdata \$baklog  
\#压缩备份文件和日志文件
echo "压缩备份数据结束..."
echo "删除备份数据开始..."
find \$bakdir/ -type f -name "\*.log" -exec rm {} \\ \#删除备份文件  
find \$bakdir/ -type f -name "\*.dmp" -exec rm {} \\  
\#删除日志文件  
find \$bakdir/ -type f -name "\*.tar.gz" -mtime +\$days -exec rm -rf {} \\ \#删除5天前的备份（注意：{} \中间有空格）
echo "删除备份数据结束..."
echo "备份执行完毕..."
\#将备份文件上传到远程服务器 如果不输人密码上传请参考 <http://www.linuxidc.com/Linux/2017-11/148506.htm>
:wq! 保存 退出
**3.添加脚本执行权限**
chmod +x /backup/P_DATA/P_DB_BAK.sh \#添加脚本执行权限
**4.编辑系统任务执行计划**
crontab -e  
输入一下信息：  
00 03 \* \* \* /backup/P_DATA/P_DB_BAK.sh \#每天凌晨3点，以oracle用户执行P_DB_BAK.sh备份文件  
:wq! \#保存退出
**5.重启crontab**
service crond restart  
从此每天的凌晨3点 系统会自动完成数据库的备份，压缩，并上传到远程服务器的指定路径下！
以下是无注释的脚本文件
\#oracle info
echo "备份脚本开始启动..."
export ORACLE_SID=orcl1  
export ORACLE_BASE=/oracle/app  
export ORACLE_HOME=/oracle/app/110204  
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$ORACLE_HOME/lib:/lib:/usr/lib:/usr/local/lib  
export PATH=\$ORACLE_HOME/bin:/bin:/usr/bin:/usr/sbin:/usr/local/bin:/oracle/grid/bin
export LANG=en_US.UTF-8  
export NLS_LANG="AMERICAN_AMERICA".AL32UTF8
dateTime=\`date +%Y\_%m\_%d\`  
days=5  
orsid='ipaddress:port/orcl'  
orowner=dbuser  
bakuser=dbuser  
bakpass=dbpwd  
bakdir=/backup/WMS_DB_BACK  
bakdata=\$orowner"\_"\$dateTime.dmp  
baklog=\$orowner"\_"\$dateTime.log  
ordatabak=\$orowner"\_"\$dateTime.tar.gz  
cd \$bakdir
echo "现在开始进行数据备份..."
exp \$bakuser/\$bakpass@\$orsid grants=y owner=\$orowner file=\$bakdir/\$bakdata log=\$bakdir/\$baklog
echo "数据备份结束..."
echo "现在开始进行压缩备份数据..."
tar -zcvf \$ordatabak \$bakdata \$baklog
echo "压缩备份数据结束..."
echo "删除备份数据开始..."
find \$bakdir/ -type f -name "\*.log" -exec rm {} \\  
find \$bakdir/ -type f -name "\*.dmp" -exec rm {} \\  
find \$bakdir/ -type f -name "\*.tar.gz" -mtime +\$days -exec rm -rf {} \\
echo "删除备份数据结束..."
echo "备份执行完毕..."
更多Oracle相关信息见[Oracle](http://www.linuxidc.com/topicnews.aspx?tid=12) 专题页面 <http://www.linuxidc.com/topicnews.aspx?tid=12>
**本文永久更新链接地址**：<http://www.linuxidc.com/Linux/2017-11/148505.htm>
![image1](1126ba2dea174331bd25b7fd0a9c5e5b.gif)
