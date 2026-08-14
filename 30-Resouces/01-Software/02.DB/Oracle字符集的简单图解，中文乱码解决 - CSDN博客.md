---
title: Oracle字符集的简单图解，中文乱码解决 - CSDN博客
updated: 2026-06-13T15:25:55
created: 2026-07-05T17:04:54
---

Oracle字符集的简单图解，中文乱码解决 - CSDN博客
星期三, 八月 1, 2018
9:08 上午

已剪辑自: <https://blog.csdn.net/moscot_wu/article/details/52803641>
经常碰到SQLPLUS展现乱码的问题，字符集和相关的定义都有说明但是很少有能把这些关系说的很简单易懂的。
在此之前我们需要搞清楚三个概念，操作系统字符集，客户端字符集，Oracle字符集：
操作系统字符集：对应的参数是LANG，这个参数应该是Oracle数据库的超集，如果操作系统不支持，那么我们的数据就会乱码。这里的操作系统指的是客户端的操作系统。服务器端的操作系统不会影响数据的存取。
数据库字符集：NLS_CHARACTERSET，可以在nls_database_parameters中查看当前数据库的字符集，安装数据库的时候选择，一般不修改，不过在新的字符集是现有字符集的严格超集的情况下可以改，其他情况下修改可能导致数据库异常。例如将UTF8字符集修改为AL32UTF8
关于子集超集的映射关系，见如下Oracle官网的文档的***Binary Subset-Superset Pairs***。
<http://docs.oracle.com/database/121/NLSPG/applocaledata.htm#NLSPG591>  

客户端字符集：对应的参数是NLS_LANG，如果客户端未设置，此时则取的是安装时数据库的默认参数
为了帮助理解，我画了一张图如下，图中标红部分如果一致表示数据的存储方式一致，即如果LANG、NLS_LANG、NLS_CHARACTERSET的编码是一致的如UTF8，那么数据的传输过程中不会异常，字符乱码只是显示问题。  

![image1](6ee324487fcb4e7a91fbb513f60c8584.png)

1、操作系统字符集
linux下首先locale 查看字符集
1.  \[oracle@oddpc ~\]\$ locale
2.  LANG=en_US.UTF-8
3.  LC_CTYPE="en_US.UTF-8"
4.  LC_NUMERIC="en_US.UTF-8"
5.  LC_TIME="en_US.UTF-8"
6.  LC_COLLATE="en_US.UTF-8"
7.  LC_MONETARY="en_US.UTF-8"
8.  LC_MESSAGES="en_US.UTF-8"
9.  LC_PAPER="en_US.UTF-8"
10. LC_NAME="en_US.UTF-8"
11. LC_ADDRESS="en_US.UTF-8"
12. LC_TELEPHONE="en_US.UTF-8"
13. LC_MEASUREMENT="en_US.UTF-8"
14. LC_IDENTIFICATION="en_US.UTF-8"
15. LC_ALL=
16. \[oracle@oddpc ~\]\$ echo \$LANG
17. en_US.UTF-8
2、该主机并未安装中文支持包，设置LANG后可以效果如下，显然无路如何调整NLS_LANG在这台机器上都无法展现中文
1.  \[oracle@evenpc ~\]\$ export LANG=zh_CN.utf8
2.  \[oracle@evenpc ~\]\$ date
3.  2016? 10? 13? ??? 15:17:01 CST
3、安装中文支持包，使用yum -y groupinstall chinese-support 可以安装中文支持包，安装过程略过，安装完毕后可以正常显示中文
1.  \[oracle@oddpc ~\]\$ export LANG=zh_CN.utf8
2.  \[oracle@oddpc ~\]\$ date
3.  2016年 10月 13日 星期四 15:14:19 CST

4、接下来就是展现测试，我安装了两个数据库实例PROD1和PROD5，PROD1 的字符集是WE8MSWIN1252，PROD5的字符集是AL32UTF8
默认情况下NLS_LANG是空的，此时NLS_LANG取默认安装时的值，PROD1是AMRICAN,PROD5是SIMPLIFIED CHINESE
1.  \[oracle@oddpc ~\]\$ echo \$NLS_LANG
2.  \[oracle@oddpc ~\]\$

1.  SQL\> show parameter lang
2.  
3.  NAME TYPE VALUE
4.  ------------------------------------ ----------- ------------------------------
5.  nls_date_language string
6.  nls_language string AMERICAN

1.  SQL\> select sysdate from dual;
2.  
3.  SYSDATE
4.  ---------
5.  13-OCT-16
PROD5
1.  SQL\> show parameter lang
2.  
3.  NAME TYPE VALUE
4.  ------------------------------------ ----------- ------------------------------
5.  nls_date_language string
6.  nls_language string SIMPLIFIED CHINESE

1.  SQL\> select sysdate from dual;
2.  
3.  SYSDATE
4.  ----------
5.  13-10?-16
5、PROD5 发生乱码，PROD1英文正常,设置下NLS_LANG参数
PROD1 的结果如下，可以看到提示信息已经变成中文，但是由于字符集非UTF8中文字符存入后将乱码
1.  \[oracle@oddpc ~\]\$ export NLS_LANG="SIMPLIFIED CHINESE_CHINA.UTF8"
2.  \[oracle@oddpc ~\]\$ sqlplus / as sysdba
3.  
4.  SQL\*Plus: Release 11.2.0.3.0 Production on 星期四 10月 13 15:42:46 2016
5.  
6.  Copyright (c) 1982, 2011, Oracle. All rights reserved.
7.  
8.  
9.  连接到:
10. Oracle Database 11g Enterprise Edition Release 11.2.0.3.0 - Production
11. With the Partitioning, OLAP, Data Mining and Real Application Testing options

1.  SQL\> show parameter lang
2.  
3.  NAME TYPE VALUE
4.  ------------------------------------ --------------------------------- ------------------------------
5.  nls_date_language string SIMPLIFIED CHINESE
6.  nls_language string SIMPLIFIED CHINESE
7.  SQL\> show parameter db_name
8.  
9.  NAME TYPE VALUE
10. ------------------------------------ --------------------------------- ------------------------------
11. db_name string PROD1
12. SQL\> show parameter lang
13. 
14. NAME TYPE VALUE
15. ------------------------------------ --------------------------------- ------------------------------
16. nls_date_language string SIMPLIFIED CHINESE
17. nls_language string SIMPLIFIED CHINESE
18. SQL\> select sysdate from dual;
19. 
20. SYSDATE
21. ------------
22. 13-10? -16

1.  SQL\> select \* from nls_database_parameters;
2.  
3.  PARAMETER VALUE
4.  ---------------------------------------- ----------------------------------------
5.  NLS_LANGUAGE AMERICAN
6.  NLS_TERRITORY AMERICA
7.  NLS_CURRENCY \$
8.  NLS_ISO_CURRENCY AMERICA
9.  NLS_NUMERIC_CHARACTERS .,
10. NLS_CHARACTERSET WE8MSWIN1252
11. NLS_CALENDAR GREGORIAN
12. NLS_DATE_FORMAT DD-MON-RR
13. NLS_DATE_LANGUAGE AMERICAN
14. NLS_SORT BINARY
15. NLS_TIME_FORMAT HH.MI.SSXFF AM
16. 
17. PARAMETER VALUE
18. ---------------------------------------- ----------------------------------------
19. NLS_TIMESTAMP_FORMAT DD-MON-RR HH.MI.SSXFF AM
20. NLS_TIME_TZ_FORMAT HH.MI.SSXFF AM TZR
21. NLS_TIMESTAMP_TZ_FORMAT DD-MON-RR HH.MI.SSXFF AM TZR
22. NLS_DUAL_CURRENCY \$
23. NLS_COMP BINARY
24. NLS_LENGTH_SEMANTICS BYTE
25. NLS_NCHAR_CONV_EXCP FALSE
26. NLS_NCHAR_CHARACTERSET AL16UTF16
27. NLS_RDBMS_VERSION 11.2.0.3.0
28. 
29. 已选择20行。

PROD5的结果如下，此时PROD5显示正常
1.  \[oracle@oddpc ~\]\$ export NLS_LANG="SIMPLIFIED CHINESE_CHINA.UTF8"
2.  \[oracle@oddpc ~\]\$ sqlplus / as sysdba
3.  SQL\*Plus: Release 11.2.0.3.0 Production on 星期四 10月 13 15:46:36 2016
4.  
5.  Copyright (c) 1982, 2011, Oracle. All rights reserved.
6.  
7.  
8.  连接到:
9.  Oracle Database 11g Enterprise Edition Release 11.2.0.3.0 - Production
10. With the Partitioning, OLAP, Data Mining and Real Application Testing options
11. SQL\> show parameter db_name
12. 
13. NAME TYPE VALUE
14. ------------------------------------ --------------------------------- ------------------------------
15. db_name string PROD5
16. SQL\> select sysdate from dual;
17. 
18. SYSDATE
19. ------------
20. 13-10月-16
21. 
22. SQL\> show parameter lang
23. 
24. NAME TYPE VALUE
25. ------------------------------------ --------------------------------- ------------------------------
26. nls_date_language string SIMPLIFIED CHINESE
27. nls_language string SIMPLIFIED CHINESE

1.  SQL\> select \* from nls_database_parameters;
2.  
3.  PARAMETER VALUE
4.  ---------------------------------------- ----------------------------------------
5.  NLS_LANGUAGE AMERICAN
6.  NLS_TERRITORY AMERICA
7.  NLS_CURRENCY \$
8.  NLS_ISO_CURRENCY AMERICA
9.  NLS_NUMERIC_CHARACTERS .,
10. NLS_CHARACTERSET AL32UTF8
11. NLS_CALENDAR GREGORIAN
12. NLS_DATE_FORMAT DD-MON-RR
13. NLS_DATE_LANGUAGE AMERICAN
14. NLS_SORT BINARY
15. NLS_TIME_FORMAT HH.MI.SSXFF AM
16. 
17. PARAMETER VALUE
18. ---------------------------------------- ----------------------------------------
19. NLS_TIMESTAMP_FORMAT DD-MON-RR HH.MI.SSXFF AM
20. NLS_TIME_TZ_FORMAT HH.MI.SSXFF AM TZR
21. NLS_TIMESTAMP_TZ_FORMAT DD-MON-RR HH.MI.SSXFF AM TZR
22. NLS_DUAL_CURRENCY \$
23. NLS_COMP BINARY
24. NLS_LENGTH_SEMANTICS BYTE
25. NLS_NCHAR_CONV_EXCP FALSE
26. NLS_NCHAR_CHARACTERSET AL16UTF16
27. NLS_RDBMS_VERSION 11.2.0.3.0
28. 
29. 已选择20行。
总结：通过以上的实验可以看出，客户端展现是否乱码是由NLS_LANG决定，发生中文乱码的情况下，首先查看数据库的NLS_CHARACTERSET是否支持中文存储，如果不支持，无论如何设置均无法正常显示中文。Oracle官方文档上给出了各种语言的编码支持如下。

[http://docs.oracle.com/database/121/NLSPG/applocaledata.htm#NLSPG593<u>  
</u>](http://docs.oracle.com/database/121/NLSPG/applocaledata.htm#NLSPG593)
Table A-13 Languages and Character Sets Supported by LCSSCAN and GDK
Language Character Sets
|  |  |
|----|----|
| Arabic | AL16UTF16, AL32UTF8, AR8ISO8859P6, AR8MSWIN1256, UTF8 |
| Bulgarian | AL16UTF16, AL32UTF8, CL8ISO8859P5, CL8MSWIN1251, UTF8 |
| Catalan | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Croatian | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Czech | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Danish | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Dutch | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| English | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Estonian | AL16UTF16, AL32UTF8, NEE8IOS8859P4, UTF8 |
| Finnish | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| French | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| German | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Greek | AL16UTF16, AL32UTF8, EL8ISO8859P7, EL8MSWIN1253, UTF8 |
| Hebrew | AL16UTF16, AL32UTF8, IW8ISO8859P8, IW8MSWIN1255, UTF8 |
| Hindi | AL16UTF16, AL32UTF8, IN8ISCII, UTF8 |
| Hungarian | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Indonesian | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Italian | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Japanese | AL16UTF16, AL32UTF8, ISO2022-JP, JA16EUC, JA16SJIS, UTF8 |
| Korean | AL16UTF16, AL32UTF8, ISO2022-KR, KO16KSC5601, KO16MSWIN949, UTF8 |
| Latvian | AL16UTF16, AL32UTF8, NEE8ISO8859P4, UTF8 |
| Lithuanian | AL16UTF16, AL32UTF8, NEE8ISO8859P4, UTF8 |
| Malay | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Norwegian | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Persian | AL16UTF16, AL32UTF8, AR8MSWIN1256, UTF8 |
| Polish | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Portuguese | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Romanian | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Russian | AL16UTF16, AL32UTF8, CL8ISO8859P5, CL8KOI8R, CL8MSWIN1251, RU8PC866, UTF8 |
| Serbian | AL16UTF16, AL32UTF8, CL8ISO8859P5, CL8MSWIN1251, UTF8 |
| Simplified Chinese | AL16UTF16, AL32UTF8, HZ-GB-2312, UTF8, ZHS16GBK, ZHS16CGB231280 |
| Slovak | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Slovenian | AL16UTF16, AL32UTF8, EE8ISO8859P2, EE8MSWIN1250, UTF8 |
| Spanish | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Swedish | AL16UTF16, AL32UTF8, US7ASCII, UTF8, WE8ISO8859P1, WE8ISO8859P15, WE8MSWIN1252 |
| Thai | AL16UTF16, AL32UTF8, TH8TISASCII, UTF8 |
| Traditional Chinese | AL16UTF16, AL32UTF8, UTF8, ZHT16MSWIN950 |
| Turkish | AL16UTF16, AL32UTF8, TR8MSWIN1254, UTF8, WE8ISO8859P9 |
| Ukranian | AL16UTF16, AL32UTF8, CL8ISO8859P5, CL8MSWIN1251, UTF8 |
| Vietnamese | AL16UTF16, AL32UTF8, VN8VN3, UTF8 |

