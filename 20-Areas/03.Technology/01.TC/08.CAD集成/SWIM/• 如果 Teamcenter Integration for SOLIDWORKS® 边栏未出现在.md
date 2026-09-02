---
title: • 如果 Teamcenter Integration for SOLIDWORKS® 边栏未出现在...
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:44
---


2022年11月27日
1:16

• 如果 Teamcenter Integration for SOLIDWORKS® 边栏未出现在 SOLIDWORKS® 中，请确保 Teamcenter 插件已启用。在 SOLIDWORKS® 中，选择工具→插件以打开插件对话框。确保对话框在加载项列表中包含 Teamcenter，并在其名称旁边打勾。如果该对话框不包括 Teamcenter，则可能需要重复客户端安装，或者您可以双击 %SWIM_DIR%/bin/RegisterSwimAddin.bat 以重新注册集成。

如果您安装了多个版本的 SOLIDWORKS®，安装程序将根据注册表值选择活动版本。您可以通过编辑 %SWIM_DIR%\bin\startsw.bat 轻松更改为另一个版本。在文件中找到这一行：set swExe=C:\PROGRA~1\SOLIDW~1\SOB3F7~1\SLDWORKS.exe
设置您要使用的 SOLIDWORKS® 可执行文件的路径。对带空格的路径使用短名称。可以使用 dir /x 命令生成短路径。不需要进行其他更改

在同一工作站上的不同集成客户端安装之间切换需要在集成客户端的 bin 子目录中执行批处理脚本（RegisterSwimAddin.bat 和 UnregisterSwimAddin.bat）。您必须以系统管理员身份运行这些脚本（右键单击该文件并选择“以管理员身份运行”） • 首先通过运行 bin 子目录中的 UnregisterSwimAddin.bat 取消注册当前活动的版本。
▪ 如果打开调度程序模块服务器，请运行UnregisterSwimDispatcherAddin.bat。
• 接下来，转到要切换到的版本的bin 子目录，然后运行RegisterSwimAddin.bat。
▪ 如果打开调度程序模块服务器，请运行RegisterSwimDispatcherAddin.bat。
• 使用版本对应的startsw.bat 启动SWIM。 • 您可以通过在SOLIDWORKS® 中选择工具→ 插件并将鼠标悬停在Teamcenter 选项上来验证更改。出现的工具提示应显示您要使用的集成版本的目录。

*来自 \< <https://www.login.com/>\>*

**
