echo -e '******Start********'$(date '+%Y%m%d%H%M%S')>>/plmdata/backup/oraledb/log.txt
source ~/.bash_profile
export ORACLE_BASE=/home/infodba/Oracle12C
export ORACLE_HOME=$ORACLE_BASE/product/12.2.0/dbhome_1
export ORACLE_SID=tc11
export PATH=$PATH:$HOME/bin:$ORACLE_HOME/bin
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/usr/lib
export LANG=en_US.UTF-8
export NLS_LANG="AMERICAN_AMERICA".AL32UTF8
rq='db'$(date '+%Y%m%d')
orq='db'$(date -d'30 day ago' +'%Y%m%d')
echo -e $rq $orq>>/plmdata/backup/oraledb/log.txt
expdp infodba/infodba@tc11 dumpfile=$rq.dmp log=$rq.log schemas=infodba directory=oradb_backup_dir
zip -m /plmdata/backup/oraledb/$rq.zip /plmdata/backup/oraledb/$rq.dmp /data/backup/$rq.log
find /plmdata/backup/oraledb/ -name $orq.zip |xargs rm -rf
echo -e '******End**********'$(date '+%Y%m%d%H%M%S')>>/plmdata/backup/oraledb/log.txt
