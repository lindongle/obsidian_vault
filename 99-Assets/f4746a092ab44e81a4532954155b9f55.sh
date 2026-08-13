#! /bin/sh
tar -zcPvf /plmdata/plmdatabackup/tcdata_bmideproject$(date +%Y%m%d%H%m%s).tar.gz /plmdata/plmdatabackup_temp/tcdata_bmideproject_temp
tar -zcPvf /plmdata/plmdatabackup/volume_database$(date +%Y%m%d%H%m%s).tar.gz /plmdata/plmdatabackup_temp/volume_database_temp
rm -rf /plmdata/plmdatabackup_temp/volume_database_temp/*
rm -rf /plmdata/plmdatabackup_temp/tcdata_bmideproject_temp/*
find /plmdata/plmdatabackup  -mtime +30 -name "*.tar.gz" -exec rm -rf {} \;

