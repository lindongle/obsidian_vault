---
title: (4条消息)JIRA+MySQL配置的实际操作流程与注意事项 - JIRA、Confluence中文...
updated: 2026-06-06T00:26
created: 2019-07-27T09:20:03
---

(4条消息)JIRA+MySQL配置的实际操作流程与注意事项 - JIRA、Confluence中文官方技术博客 - CSDN博客
星期六, 七月 27, 2019
1:20 上午
已剪辑自: <https://blog.csdn.net/atlassian2013/article/details/14453737>
**买JIRA上CSDN，特殊折扣购买通道：<http://atlassian.csdn.net/module/btc/atlassian/prduct_detail?project_id=445&module=34&product=9>**

以下的文章主要讲述的是JIRA+MySQL配置的实际操作流程以及在其实际操作中我们要用到代码示例，还有对在实际操作中值得我们大家注意的事项描述，下面就是文章的详细内容讲述，望大家会有所收获。
1、JDK、JIRA、MySQL安装完毕，停止JIRA服务
创建数据库：
1.  mysql 
2.  create database jiradb character set 'UTF8';
创建用户并赋与权限：
1.  createuserjirauseridentifiedby‘jira’; 
2.  grantallprivilegeson\*.\*to‘jirauser’@'%’identifiedby‘jira’withgrantoption; 
3.  grantallprivilegeson\*.\*to‘jirauser’@'localhost’identifiedby‘jira’withgrantoption; 
4.  flushprivileges;
2、修改JIRA端口
JIRA是集成在Tomcat上面的，所以修改端口的方法和Tomcat修改端口的方法是一样的。
3、JIRA默认使用的数据库是HSql，如果要迁移到MySQL，可以通过以下的JIRA+MySQL配置改动。
1)修改server.xml (路径:/jira/conf/server.xml)
第13行:
1.  username=”jirauser” 
2.  password=”780824″ 
3.  driverClassName=”com.mysql.jdbc.Driver” 
4.  url=”jdbc:mysql://localhost:3306/jiradb?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=UTF8″ 
5.  (删除minEvictableIdleTimeMillisandtimeBetweenEvictionRunsMillis项) 
6.  maxActive=”20″ 
7.  validationQuery=”select1″/\>
注：以上“localhost”可不该，也可改为主机名或设为”主机IP:端口“，mysql端口号为”3306“。
b)修改entityengine.xml (路径：/jira/atlassian-jira/WEB-INF/classes/entityengine.xml）
第100行修改为：
1.  \<datasourcename=”defaultDS”field-type-name=”mysql” 
2.  删除schema-name=”PUBLIC”
4、安装连接驱动包 Mysql JDBC Driver
1.  cpmysql-connector-java-5.1.7-bin.jar/jira/common/lib/
5、启动JIRA服务 。
现在JIRA的数据库已经是MySQL了。
如果希望更进一步，将JIRA服务的依赖服务中加上MySQL服务，可以在注册表中更新
1.  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\JIRA240209102746
JIRA240209102746由于是JIRA服务名太长而在注册表中随机生成的名字,在基中添加一个DependOnService多文本键值,把MySQL服务名添加进去就行了
这样的结果是JIRA依赖于MySQL,JIRA会在MySQL启动后启动,如果MySQL停止,JIRA会先于MySQL停止。
以上的相关内容就是对JIRA+MySQL配置的介绍，望你能有所收获。
