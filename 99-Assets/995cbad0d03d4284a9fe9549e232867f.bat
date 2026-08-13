@echo off

rem @<COPYRIGHT>@
rem ============================================================================
rem Copyright 2012.
rem Siemens Product Lifecycle Management Software Inc.
rem All Rights Reserved.
rem ============================================================================
rem @<COPYRIGHT>@
rem
rem This script starts up the Teamcenter Server Pool manager in the console.
rem
rem ============================================================================

setlocal

title Teamcenter Server Manager TcWeb

set TC_ORIG_PATH=%PATH%

if not defined MGR_ROOT set MGR_ROOT=D:\Siemens\Teamcenter10\pool_manager
if not defined MGR_CFG set MGR_CFG=TcWeb
set MGR_DIR=%MGR_ROOT%\confs\%MGR_CFG%
if not defined MGR_BIN set MGR_BIN=D:\Siemens\Teamcenter10\bin

if not defined TC_ROOT set TC_ROOT=D:\Siemens\Teamcenter10
if exist "%TC_ROOT%\install\tem_init.bat" call "%TC_ROOT%\install\tem_init.bat"
set JAVA_HOME=%TC_JRE_HOME%

if not defined POOL_ID set POOL_ID=PoolA

rem Verify necessary paths exist.
if not exist "%MGR_ROOT%" goto MGR_ROOT_error
if not exist "%MGR_DIR%" goto MGR_DIR_error
if not exist "%JAVA_HOME%" goto JAVAHOME_error
if exist "%JAVA_HOME%\jre" set JAVA_HOME=%JAVA_HOME%\jre
if not exist "%JAVA_HOME%\bin\java.exe" goto JAVA_error

set PATH=%MGR_BIN%

rem replace forward slash with backward slash
set MGR_DIR=%MGR_DIR:/=\%

pushd "%MGR_DIR%"

call mgrenv.bat

"%JAVA_COMMAND%" %JVM_OPTS% %*-Dcom.teamcenter.jeti.util.log.category=ServerManager -Dcom.teamcenter.mld.utility.logging.timezone="Asia/Shanghai" %PoolManager_Main%"

popd

goto Finish

:MGR_ROOT_error
echo *** ERROR ***
echo Could not find Pool Manager root directory (path=%MGR_ROOT%).
goto Finish

:MGR_DIR_error
echo *** ERROR ***
echo Could not find Pool Manager configuration directory (path=%MGR_DIR%).
goto Finish

:JAVAHOME_error
echo *** ERROR ***
echo Could not find JAVA_HOME directory (path=%JAVA_HOME%).
goto Finish

:JAVA_error
echo *** ERROR ***
echo Could not find java executable (path=%JAVA_HOME%\bin\java.exe).
goto Finish

:Finish
endlocal
