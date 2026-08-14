---
title: FSCCache
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

FSC<span style='color:green'>Performance Cache Server</span>FSC<span style='color:green'>性能高速缓存服务器</span>
<span style='color:green'>安装在未放置卷或未直接安装卷的主机上的FSC服务器称为性能高速缓存服务器。</span>
<span style='color:green'>Ø允许将数据放置在靠近用户的位置，同时保持中央文件量和数据库存储。</span>
<span style='color:green'>Ø检查所有文件访问请求中</span>Teamcenter<span style='color:green'>生成的用于授权文件访问的票证。</span>
<span style='color:green'>Ø管理两个段缓存，一个用于下载文件，一个用于上载文件。</span>
<span style='color:green'>Ø可以预先填充经常访问的文件。</span>
<span style='color:green'></span>
<span style='color:green'></span>
<span style='color:green'>在没有FSC缓存服务器的情况下上产到在</span>tc10sit<span style='color:green'>上，用户fsc_user</span>创建数据集f1。
ØTC在FCC<span style='color:green'>写入缓存中复制数据集</span>f1。
ØTC将数据集f1传输到站点tc10win上的卷。
![image1](2675e835f3f3416682329be0491fafd2.png)
在没有FSC缓存服务器的情况下进行下载在tc10sit上，用户fsc_user将打开数据集f1。
Ø如果f1缓存在FCC写入缓存中，则过程为：1\> RC，将f1从FCC写入缓存移到FCC读取缓存中Ø如果f1缓存在FCC读取缓存中，则过程为：1\> RC， ➢如果f1不在FCC中缓存，则过程为：2-\> 1-\> RC，将副本缓存在FCC读取缓存中。
<span style='color:green'></span>
