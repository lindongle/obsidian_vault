@echo off
@echo start backup...

rem 设置备份路径
set backdir=D:\plmdatabackup_temp\tcdata_bmideproject_temp

set tcdata=D:\Siemens\tcdata

set bmidedir=D:\Siemens\Teamcenter11\bmide\workspace\11000.2.0\h6hryt


rem 创建文件夹，先删后建
rd /s /q %backdir%\tcdata
rd /s /q %backdir%\h6hryt
md %backdir%\tcdata
md %backdir%\h6hryt

rem 备份数据
xcopy /E /Y /S %tcdata% %backdir%\tcdata
xcopy /E /Y /S %bmidedir% %backdir%\h6hryt

rem 设置当前时间，年月日时分秒
:: 注意windows的时间格式是否是简体中文，如果不是，则不适用。Control Panel\Clock, Language, and Region\Language左下角location，将format改为简体中文。
set THISDATE=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
set THISTIME=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set todaydate=%THISDATE%%THISTIME%

@echo start zip...
rem 压缩备份数据,先要安装7-zip，并将D:\7-Zip\7z.exe复制到C:\Windows\System32

7z a -tzip "%backdir%\tcdata%todaydate%.zip" "%backdir%\tcdata"
7z a -tzip "%backdir%\h6hryt%todaydate%.zip" "%backdir%\h6hryt"
@echo delete folder...
rem 压缩后,把文件夹删除

rd /s /q %backdir%\tcdata
rd /s /q %backdir%\h6hryt

exit

