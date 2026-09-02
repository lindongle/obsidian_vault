---
title: windows服务访问网络磁盘(NAS)部署 - harrycheng - 博客园
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:53
---

已剪辑自: <https://www.cnblogs.com/harrycheng/p/6733592.html>
**感谢以下文章作者：**
**<http://www.cnblogs.com/foohack/p/5644145.html>  
<http://www.cnblogs.com/han1988/p/3480531.html>**

1、下载PSTools工具
2、使用组策略添加开机启动挂盘
3、安装windows服务

## 1.下载PSTools
<https://technet.microsoft.com/en-us/sysinternals/pstools.aspx>

## 2.使用组策略添加开机启动挂盘
  2.1 设置Powershell执行策略
　　　　Set-ExecutionPolicy UnRestricted
　　2.2 编写挂盘脚本
　　　　保存下列脚本为 mount_nas.ps1
![image1](7770749e57fe4f7abc7944860640c176.png)
\$PSEXECPATH="D:\PSTools\PsExec.exe" \#指定PsExec程序完整路径  
\$SHARESRVPATH="192.168.0.10" \#连接服务器地址  
\$SHAREFOLDERPATH="\\192.168.0.10\share" \#共享UNC路径  
\$CONNUSER="Administrator" \#连接用户名  
\$CONNPWD='pw' \#连接密码  

\#生成新的网络映射驱动器  
Start-Process -Wait \`  
-PSPath \$PSEXECPATH \`  
-ArgumentList "-accepteula -s net use Z: \$SHAREFOLDERPATH /user:""\$SHARESRVPATH\\CONNUSER"" ""\$CONNPWD"" ";
![image1](7770749e57fe4f7abc7944860640c176.png)
　　　　2.3 添加组策略开机启动
![image2](3c761e6278304c3a93eab54d94e227b6.png)
　　　　　　
![image3](d863315e00d04db8bc8517f772a315ad.png)
## 3.安装windowse服务
　　以localsystem 安装服务

