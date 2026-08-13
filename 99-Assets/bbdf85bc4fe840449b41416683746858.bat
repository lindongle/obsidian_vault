#进入到当前目录
cd %~dp0
#停止nginx,-s后面 加 quit表示有序退出， 加上stop表示直接退出
nginx.exe -s stop