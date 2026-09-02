---
title: CentOS/用SWAT让Samba服务器的管理温和化 - 站长百科
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:53
---

CentOS/用SWAT让Samba服务器的管理温和化 - 站长百科
2018年10月15日
7:51
已剪辑自: <http://www.zzbaike.com/wiki/CentOS/%E7%94%A8SWAT%E8%AE%A9Samba%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9A%84%E7%AE%A1%E7%90%86%E6%B8%A9%E5%92%8C%E5%8C%96>
| **[CentOS](http://www.zzbaike.com/wiki/CentOS) \| [CentOS安装](http://www.zzbaike.com/wiki/CentOS/CentOS%E5%AE%89%E8%A3%85) \| [CentOS使用手册](http://www.zzbaike.com/wiki/CentOS/CentOS%E4%BD%BF%E7%94%A8%E6%89%8B%E5%86%8C)** |
|----|
|    |
|-----|
[SWAT](http://www.zzbaike.com/w/index.php?title=SWAT&action=edit&redlink=1)是通过[浏览器](http://www.zzbaike.com/wiki/%E6%B5%8F%E8%A7%88%E5%99%A8)对[Samba](http://www.zzbaike.com/wiki/Samba)进行管理的工具之一。通过SWAT ，可以在Samba允许访问范围内的客户端，用浏览器对服务端的Samba进行控制。在线文档的阅览、smb.conf 的确认和编辑，以及密码的变更、服务的重启等等都可以通过SWAT来完成，它的直观让Samba变得温和化，对那些不喜欢文本界面管理服务器的朋友来说，是一个强大的工具。
## 安装SWAT
首先，通过 yum 在线安装 SWAT 。
\[root@sample ~\]# yum -y install samba-swat　 ← 在线安装 SWAT  

Setting up Install Process  
Setting up repositories  
update 100% \|=========================\| 951 B 00:00  
base 100% \|=========================\| 1.1 kB 00:00  
addons 100% \|=========================\| 951 B 00:00  
extras 100% \|=========================\| 1.1 kB 00:00  
Reading repository metadata in from local files  
primary.xml.gz 100% \|=========================\| 74 kB 00:00  
update: \################################################## 214/214  
Added 2 new packages, deleted 0 old in 0.99 seconds  
Parsing package install arguments  
Resolving Dependencies  
--\> Populating transaction set with selected packages. Please wait.  
---\> Downloading header for samba-swat to pack into transaction set.  
samba-swat-3.0.10-1.4E.9. 100% \|=========================\| 87 kB 00:00  
---\> Package samba-swat.i386 0:3.0.10-1.4E.9 set to be updated  
--\> Running transaction check  
Dependencies Resolved  

=============================================================================  
Package Arch Version Repository Size  
=============================================================================  
Installing:  
samba-swat i386 3.0.10-1.4E.9 base 6.5 M  

Transaction Summary  
=============================================================================  
Install 1 Package(s)  
Update 0 Package(s)  
Remove 0 Package(s)  
Total download size: 6.5 M  
Downloading Packages:  
(1/1): samba-swat-3.0.10- 100% \|=========================\| 6.5 MB 00:20  
Running Transaction Test  
Finished Transaction Test  
Transaction Test Succeeded  
Running Transaction  
Installing: samba-swat \######################### \[1/1\]  

Installed: samba-swat.i386 0:3.0.10-1.4E.9  
Complete!
## 配置SWAT
然后编辑 /etc/xinetd.d/swat ，对其进行配置。本条目的原则是只允许内网以及本地的客户端对SWAT进行访问。
\[root@sample ~\]# vi /etc/xinetd.d/swat　 ← 编辑 SWAT 的配置文件  

only_from = 127.0.0.1　 ← 找到此行，在下面添加如下行：  
only_from = 192.168.0.0　 ← 添加此行，只允许内网范围对 SWAT 进行访问  

disable = yes　 ← 找到此行，将 yes 改为 no  

disable = no　 ← 变为此状态
## 启动SWAT
在启动SWAT之前，先将[防火墙](http://www.zzbaike.com/wiki/%E9%98%B2%E7%81%AB%E5%A2%99)中SWAT使用的901号端口开放。
\[root@sample ~\]# vi /etc/sysconfig/iptables　 ← 编辑防火墙规则  

-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT　 ← 找到此行，在下面添加如下行：  
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 901 -j ACCEPT　 ← 添加此行开放SWAT的901端口  

\[root@sample ~\]# /etc/rc.d/init.d/iptables restart　 ← 重新启动防火墙，使新的规则生效  

Flushing firewall rules: 　　　　　　　　　\[ OK \]  
Setting chains to policy ACCEPT: filter 　　\[ OK \]  
Unloading iptables modules:　　　　　　 \[ OK \]  
Applying iptables firewall rules:　　　　　 \[ OK \]
由于SWAT的启动是通过超级[服务器](http://www.zzbaike.com/wiki/%E6%9C%8D%E5%8A%A1%E5%99%A8),所以只要重新启动xinetd即可启动SWAT 。
\[root@sample ~\]# /etc/rc.d/init.d/xinetd restart　 ← 重新启动超级服务器，启动 SWAT  

Stopping xinetd: 　　　　　　　　　　　\[ OK \]  
Starting xinetd: 　　　　　　　　　　　\[ OK \]
## 测试SWAT
在服务端启动SWAT后，我们就可以通过SWAT允许范围（本文以内网192.168.0.0及本地127.0.0.1为例）内的客户机的浏览器中，通过http://服务器的内网IP:901来访问服务端的SWAT了。如下所示：
1、在浏览器中输入“ [http://]()服务器的内网IP:901”（本文以测试环境的“ [http://192.168.0.9:901”为例。请各自替换为您的服务器内网](http://192.168.0.9:901”为例。请各自替换为您的服务器内网)[IP地址](http://www.zzbaike.com/wiki/IP%E5%9C%B0%E5%9D%80)。），然后输入root用户的用户名及密码进入SWAT的管理首页；
<img src="035df6d435b34736ba92be3f913001fd.png" alt="image1" />
2、确认出现如下SWAT管理中心的首页：
<img src="C:\Users\lindo\AppData\Local\Temp\个人\pandoc/media/image2.png" style="width:8.125in;height:6.11458in" />
通过SWAT管理Samba与直接修改smb.conf的方式，在本质上并无差异，但通过浏览器访问的方式，可以使Samba的管理更加温和化，更加适用于不擅长使用文本界面、直接修改配置文件的朋友。
## 参考来源
<http://www.centospub.com/make/swat.html>
## CentOS使用手册导航
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td><table style="width:98%;">
<colgroup>
<col style="width: 13%" />
<col style="width: 84%" />
</colgroup>
<thead>
<tr>
<th><strong><a href="http://www.zzbaike.com/wiki/CentOS/CentOS%E5%AE%89%E8%A3%85">CentOS安装</a>：</strong></th>
<th><a href="http://www.zzbaike.com/wiki/CentOS/CentOS%E7%9A%84%E5%AE%89%E8%A3%85">CentOS安装</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%B3%BB%E7%BB%9F%E5%AE%89%E8%A3%85%E5%90%8E%E7%9A%84%E5%88%9D%E5%A7%8B%E7%8E%AF%E5%A2%83%E8%AE%BE%E7%BD%AE">系统安装后的初始环境设置</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%96%B9%E5%BC%8F%E5%AE%89%E8%A3%85CentOS_5">服务器方式安装CentOS 5</a></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong><a href="http://www.zzbaike.com/wiki/CentOS/CentOS%E4%BD%BF%E7%94%A8%E6%89%8B%E5%86%8C">CentOS使用手册</a>：</strong></td>
<td><a href="http://www.zzbaike.com/wiki/CentOS/%E4%BD%BF%E7%94%A8RPM%E7%AE%A1%E7%90%86%E5%8C%85">使用RPM管理包</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E4%BD%BF%E7%94%A8YUM%E5%B7%A5%E5%85%B7%E6%9B%B4%E6%96%B0%E7%B3%BB%E7%BB%9F">使用YUM工具更新系统</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E4%BD%BF%E7%94%A8rsync%E6%9C%8D%E5%8A%A1">使用rsync服务</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E4%BD%BF%E7%94%A8rsync%E5%90%8C%E6%AD%A5">使用rsync同步</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E4%BD%BF%E7%94%A8tar%E5%A4%87%E4%BB%BD">使用tar备份</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E4%BD%BF%E7%94%A8tar%E6%81%A2%E5%A4%8D%E6%96%87%E4%BB%B6">使用tar恢复文件</a> | <a href="http://www.zzbaike.com/wiki/CentOS/Samba_%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9A%84%E6%9E%84%E5%BB%BA">Samba 服务器的构建</a> | <strong>用SWAT让Samba服务器的管理温和化</strong> | <a href="http://www.zzbaike.com/wiki/CentOS/SMTP%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9A%84%E6%9E%84%E5%BB%BA">SMTP服务器的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/POP%E3%80%81IMAP%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9A%84%E6%9E%84%E5%BB%BA">POP/IMAP服务器的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%97%85%E6%AF%92%E6%9F%A5%E6%9D%80%E7%B3%BB%E7%BB%9F%E7%9A%84%E6%9E%84%E5%BB%BA">病毒查杀系统的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E5%85%A5%E4%BE%B5%E7%9B%91%E6%B5%8B%E7%B3%BB%E7%BB%9F%E7%9A%84%E6%9E%84%E5%BB%BA">入侵监测系统的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%94%A8OpenSSH%E6%9E%84%E5%BB%BASSH%E6%9C%8D%E5%8A%A1%E5%99%A8">用OpenSSH构建SSH服务器</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%94%A8SSH%E5%AE%A2%E6%88%B7%E7%AB%AF%E8%BD%AF%E4%BB%B6%E7%99%BB%E5%BD%95%E5%88%B0%E6%9C%8D%E5%8A%A1%E5%99%A8">用SSH客户端软件登录到服务器</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E8%AE%A9%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%94%AF%E6%8C%81%E5%AE%89%E5%85%A8HTTP%E5%8D%8F%E8%AE%AE">让服务器支持安全HTTP协议</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E5%BC%80%E6%94%BE%E4%B8%80%E8%88%AC%E7%94%A8%E6%88%B7%E7%9A%84%E7%BD%91%E9%A1%B5%E5%8F%91%E5%B8%83%E6%9D%83%E9%99%90">开放一般用户的网页发布权限</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E8%99%9A%E6%8B%9F%E4%B8%BB%E6%9C%BA%E7%9A%84%E6%9E%84%E5%BB%BA">虚拟主机的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/Servlet%E3%80%81JSP%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9A%84%E6%9E%84%E5%BB%BA">Servlet/JSP服务器的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E5%9F%BA%E4%BA%8E%E6%97%A5%E5%BF%97%E7%9A%84%E7%AB%99%E7%82%B9%E7%BB%9F%E8%AE%A1%E7%B3%BB%E7%BB%9F%E7%9A%84%E6%9E%84%E5%BB%BA">基于日志的站点统计系统的构建</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E6%9E%84%E5%BB%BAMySQL%E6%95%B0%E6%8D%AE%E5%BA%93%E6%9C%8D%E5%8A%A1%E5%99%A8">构建MySQL数据库服务器</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%94%A8phpMyAdmin%E8%AE%A9MySQL%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E6%B8%A9%E5%92%8C%E5%8C%96">用phpMyAdmin让MySQL数据库管理温和化</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E6%95%B0%E6%8D%AE%E5%BA%93%E7%9A%84%E8%87%AA%E5%8A%A8%E5%A4%87%E4%BB%BD%E4%B8%8E%E6%81%A2%E5%A4%8D">数据库的自动备份与恢复</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%94%A8ProFTPD%E6%9E%84%E5%BB%BAFTP%E6%9C%8D%E5%8A%A1%E5%99%A8">用ProFTPD构建FTP服务器</a> | <a href="http://www.zzbaike.com/wiki/CentOS/%E7%94%A8FTP%E5%AE%A2%E6%88%B7%E7%AB%AF%E8%BD%AF%E4%BB%B6%E8%BF%9E%E6%8E%A5%E5%88%B0%E6%9C%8D%E5%8A%A1%E5%99%A8">用FTP客户端软件连接到服务器</a></td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>
## 留言
![image3](8a0b1bb2d4504172ac22e67a1c76f3d8.png)
![image4](6d3fdf7bde5f433b822f757a1d1dd29c.png)
