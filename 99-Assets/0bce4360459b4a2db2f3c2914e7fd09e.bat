@echo off
Title 解决CAD签出保存不了问题
REM 适用于安装位置：D:\Program Files\AutoCAD 2010
reg add "HKCR\AutoCAD.Drawing\ShellCommon" /f /v "Launcher" /t REG_SZ /d "D:\Program Files\AutoCAD 2010\acad.exe"
reg add "HKCR\AutoCAD.Drawing.18\Shell\open\command" /f /ve  /t REG_SZ /d "\"D:\Program Files\AutoCAD 2010\acad.exe\" /O %%1 " 
reg add "HKCU\Software\Classes\AutoCAD.Drawing.18\Shell\open\command" /f /ve  /t REG_SZ /d "\"D:\Program Files\AutoCAD 2010\acad.exe\" /O %%1 "
reg add "HKLM\SOFTWARE\Classes\AutoCAD.Drawing.18\Shell\open\command" /f /ve  /t REG_SZ /d "\"D:\Program Files\AutoCAD 2010\acad.exe\" /O %%1 "
echo 按任意键退出
Pause>null
exit