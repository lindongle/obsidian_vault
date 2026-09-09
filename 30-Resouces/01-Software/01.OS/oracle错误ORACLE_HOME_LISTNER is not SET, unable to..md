---
title: oracle错误:ORACLE_HOME_LISTNER is not SET, unable to...
updated: 2026-06-06T00:28
created: 2019-09-20T00:49:16
---

oracle错误:ORACLE_HOME_LISTNER is not SET, unable to auto-start Oracle Net Listener - weixin_33725239的博客 - CSDN博客
已剪辑自: <https://blog.csdn.net/weixin_33725239/article/details/89825850>
oracle错误:ORACLE_HOME_LISTNER is not SET, unable to auto-start Oracle Net Listener
解决方法  

安装好Oracle数据库后:  

执行
和dbshut会提示：  

<table>
<colgroup>
<col style="width: 3%" />
<col style="width: 96%" />
</colgroup>
<thead>
<tr>
<th><p>1</p>
<p>2</p>
<p>3</p></th>
<th><p>[oracle@oracle11g~]$dbstart</p>
<p>ORACLE_HOME_LISTNERisnotSET,unabletoauto-startOracleNetListener</p>
<p>Usage:/u01/app/oracle/oracle/product/10.2.0/db_1/bin/dbstartORACLE_HOME</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
错误原因 dbstart和dbshut脚本文件中ORACLE_HOME_LISTNER的设置有问题  

解决方法 分别打开两个文件找到：
| 1   | ORACLE_HOME_LISTNER=\$1 |
|-----|-------------------------|
,修改为
| 1   | ORACLE_HOME_LISTNER=\$ORACLE_HOME |
|-----|-----------------------------------|
然后修改/home/oracle/.bash_profile  

添加export ORACLE_HOME_LISTNER=\$ORACLE_HOME一句  

生效变量：
| 1   | \[root@oracle01~\]# source/home/oracle/.bash_profile |
|-----|--------------------------------------------------------|
参考：http://www.phperz.com/article/14/1216/41431.html
星期四, 九月 19, 2019
4:49 下午
