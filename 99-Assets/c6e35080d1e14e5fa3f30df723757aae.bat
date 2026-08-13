@echo off

set FMS_HOME=D:\Siemens\Teamcenter13\tccs
set JRE_HOME=D:\Java\jre

%FMS_HOME%\bin\fccstat -kill
taskkill /f /im java.exe
taskkill /f /im java.exe
taskkill /f /im java.exe
taskkill /f /im javaw.exe
taskkill /f /im javaw.exe
taskkill /f /im Teamcenter.exe
taskkill /f /im Teamcenter.exe
taskkill /f /im Teamcenter.exe
taskkill /f /im VisView.exe
 
echo *****************************************
echo 正在清除TeamCenter程序临时文件，请稍等......
echo *****************************************          
del /f /s /q "%userprofile%\FCCCache\*.*" 
del /f /s /q "%userprofile%\FSCCache\*.*" 
rd /s /q "%userprofile%\FCCCache\" 
rd /s /q "%userprofile%\FSCCache\"   
del /f /s /q "%userprofile%\Oracle\*.*" 
rd /s /q "%userprofile%\Oracle\" 
del /f /s /q "%userprofile%\Siemens\*.*" 
rd /s /q "%userprofile%\Siemens\" 
del /f /s /q "%userprofile%\Teamcenter\*.*" 
rd /s /q "%userprofile%\Teamcenter\"
del /f /s /q "%userprofile%\fcc.*
rd /s /q "%userprofile%\.TcIC
rd /s /q "%userprofile%\.swt
rd /s /q "%userprofile%\.%USERNAME%_lock_%COMPUTERNAME%

echo *****************************************
echo 清除%temp%缓存
echo *****************************************          
del /f /s /q %temp%\*.*
del /f /s /q %temp%\*.*
pushd "%temp%"
for /f "delims=" %%a in ('dir /b *.*') do (
  if exist "%%a\" (rd /s /q "%%a") else del /f /q "%%a"
)
md %temp%
md %temp%\2
md %temp%\3

echo *****************************************
echo 清除TeamCenter胖客户端临时文件完成！
echo *****************************************