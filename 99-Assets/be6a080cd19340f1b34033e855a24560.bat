rem 修改最后语句中的的的58589/L，为产品号及版本号，-default_d=D:\test\58589_L为导出路径
rem 以下TC_ROOT为服务端AP02的路径，客户端导出，需修改为客户端的路径C:\splm\tc101
set UGII_UGMGR_ALLOW_PFM_IMPORT_EXPORT=1
set UGII_UGMGR_EXTERNAL_COMMS_LIB=pdi_corba_client
set UGII_UGMGR_SOA_ENABLED=TRUE
set UGII_UGMGR_COMMUNICATION=HTTP
set UGII_UGMGR_HTTP_URL=http://sopfap02.dosea.local:8080/tc
SET TC_ROOT=D:\siemens\tc101
SET FMS_HOME=%TC_ROOT%\tccs
SET Path=%UGII_BASE_DIR%\nxbin;%UGII_BASE_DIR%\ugii;%PATH%
%UGII_BASE_DIR%\UGII\ug_clone.exe -pim=yes -u=TC_Support_CN -p=!Dsg123! -o=export -fam=strip_status -asse=@DB/58589/L -default_d=D:\test\58589_L -default_n=autotranslate -r="DS4_Development_Phase" 
pause