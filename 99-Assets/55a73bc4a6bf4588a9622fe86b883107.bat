set TC_ROOT=D:\Siemens\Teamcenter14

set TC_DATA=D:\Siemens\tcdata

call %TC_DATA%\tc_profilevars.bat


clearlocks -verbose

move_volume_files -u=infodba -p=infodba -g=dba -f=move -srcvol=wuxi_localvolume -destvol=volume -v

timeout /t 10
pause