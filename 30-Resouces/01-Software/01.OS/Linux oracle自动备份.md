---
title: Linux oracle自动备份
updated: 2026-06-06T00:28
created: 2018-10-20T00:03:56
---

1、新建备份目录
2、将备份目录权限给oracle安装用户
chown -R oracle:oinstall /backup/oracledata -R
3、vi /backup/oracledata/ordatabak.sh
如果在windows下编辑过，则需要vi时，使用set ff=unix，进行格式转换。
4、文件中输入：
echo -e '\*\*\*\*\*\*Start\*\*\*\*\*\*\*\*'\$(date '+%Y%m%d%H%M%S')\>\>/plmdata/backup/oraledb/log.txt
source ~/.bash_profile
export ORACLE_BASE=/home/infodba/Oracle12C
export ORACLE_HOME=\$ORACLE_BASE/product/12.2.0/dbhome_1
export ORACLE_SID=tc11
export PATH=\$PATH:\$HOME/bin:\$ORACLE_HOME/bin
export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/usr/lib
export LANG=en_US.UTF-8
export NLS_LANG="AMERICAN_AMERICA".AL32UTF8
rq='db'\$(date '+%Y%m%d')'214001'
orq='db'\$(date -d'30 day ago' +'%Y%m%d')'214001'
echo -e \$rq \$orq\>\>/plmdata/backup/oraledb/log.txt
expdp infodba/infodba@tc11 dumpfile=\$rq.dmp log=\$rq.log schemas=infodba directory=oradb_backup_dir
zip -m /plmdata/backup/oraledb/\$rq.zip /plmdata/backup/oraledb/\$rq.dmp /data/backup/\$rq.log
find /plmdata/backup/oraledb/ -name \$orq.zip \|xargs rm -rf
echo -e '\*\*\*\*\*\*End\*\*\*\*\*\*\*\*\*\*'\$(date '+%Y%m%d%H%M%S')\>\>/plmdata/backup/oraledb/log.txt

5、
添加脚本执行权限
chmod +x /backup/oracledata/ordatabak.sh
6、
编辑系统任务执行计划
crontab -e
7、
输入一下信息（#每天凌晨1点，以oracle用户执行ordatabak.sh备份文件）“：

00 01 \* \* \* /backup/oracledata/ordatabak.sh
