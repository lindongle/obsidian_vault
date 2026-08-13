#! /bin/sh
mkdir /plmdata/backup/backup_temp
cp -r /plmdata/Volume /plmdata/backup/backup_temp
cp -r /plmdata/backup/oraledb /plmdata/backup/backup_temp
tar -zcPvf /plmdata/plmdatabackup_temp/volume_database_temp/volume_database$(date +%Y%m%d).tar.gz /plmdata/backup/backup_temp
rm -rf /plmdata/backup/backup_temp/
