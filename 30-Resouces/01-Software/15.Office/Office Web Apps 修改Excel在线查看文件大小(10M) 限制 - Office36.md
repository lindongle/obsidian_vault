---
title: Office Web Apps 修改Excel在线查看文件大小(10M) 限制 - Office36...
updated: 2026-06-06T00:21:20
created: 2026-07-05T17:04:55
---

下午
已剪辑自: <http://www.office-cn.net/office365-function/1017.mhtml>
Office Web Apps 修改Excel在线查看文件大小限制  

展开  
Office Web Apps 2013 修改Excel在线查看文件大小限制  
前言  

最近搭建了一个OWA 2013环境，帮客户实现在线查看Excel文档，不过，使用过程中出现了错误，文件大小超过10MB就无法预览了，查了好久，发现需要使用PowerShell命令进行修改。  

1.出现的错误,提示在线查看文件大小不能超过10M  

2.可以使用PowerShell命令查看场的配置  

登陆Office Web Apps 2013 Server服务器，打开PowerShell并输入如下命令：  

Get-OfficeWebAppsFarm  

  

3.我们发现Excel文档最大限制是10MB，我们可以通过PowerShell命令进行修改：  

Set-OfficeWebAppsFarm -ExcelWorkbookSizeMax 50  

  
4.修改完毕，Excel文档的最大限制，就变成50MB了，这里面还有很多属性可以修改，大家可以看看这些属性，也许未来还会用到  

