---
title: AWC索引编制
updated: 2026-06-19T15:54:31
created: 2026-07-05T17:05:04
---

AWC索引编制
2023年5月12日
9:19
![image1](83d67e01ad5f4f21a4a31d3822a8c552.png)
文件位置放到tcdata下，单机默认即可
![image2](e0fc56d005af47d2924759157b0d35d2.png)

![image3](c2bab4639e88457cb845522682fb1b0e.png)

![image4](3cdb44f9c27343bd86dafde8ae155abc.png)
安装完成后，运行D:\Siemens\Teamcenter14\solr-8.11.1\runSolr.bat
网页打开：http://tcqas:8983/solr
用户名：solr_admin密码：infodba登录
![image5](005fcbc708f343eab77c149fd276baae.png)

执行索引设置：
cmd
cd /d D:\Siemens\Teamcenter14\solr-8.11.1
TcSchemaToSolrSchemaTransform.bat D:\Siemens\tcdata\ftsi\solr_schema_files
![image6](f1895d7bbfc44af49d5711269d3ad118.png)
初始化索引：（新环境可忽略）
启动四层服务
cd /d D:\Siemens\Teamcenter14\TcFTSIndexer\bin
runTcFTSIndexer -task=objdata:index
![image7](98628fe8ba4e46a2926481c93e9aa4d0.png)
设置定时索引任务：
D:\Siemens\Teamcenter14\TcFTSIndexer\bin\runTcFTSIndexer -task=objdata:sync -interval=3600，放到bat文件，1小时执行一次；

