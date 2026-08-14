---
title: LDAP同步用户/人员
updated: 2026-06-13T22:07:03
created: 2026-07-05T17:04:56
tags:
  - 联创
---

# <span style='color:#1E4E79'>具体配置方式：</span>
## 1、必须安装安全服务。
## 2、配置LDAP连接信息。
编辑站点级首选项：
1）LDAP_admin_dn：域管理员账号（有查询AD权限的）的DN名称。如infodba@ldl.com（优先用这个）或ldl.com/sotos/TC/infodba或cn=infodba,ou=TC,ou=sotos,dc=ldl,dc=com（未验证）
![image1](e67164f621c642c9b3f6d483837db10b.png)
2）LDAP_admin_pw，域管理员账户的密码。如infodba
3）LDAP_cert_db_path，不使用SSL，可以不用配置。如果LDAP_use_ssl为false，此首选项不会起作用
4）LDAP_port_number，LDAP端口号，不使用SSL，填写389。
5）LDAP_service_hosts，LDAP服务器的主机名或ip，如192.168.1.110
6）LDAP_use_ssl：不使用SSL，填写false。默认即可
## 3、配置用户及人员映射
编辑站点级首选项：
1）LDAP_attribute_mapping：配置用户的映射关系。可以直接使用默认首选项值，不进行修改。每个属性使用三个组（TC属性名称、LDAP对应名称、默认值，如果三个中其中任何一个没有值则用%REPLACE_ME%代替）。例如
LDAPPersonName（TC人员姓名）
cn（LDAP人员姓名）
%REPLACE_ME%（默认值，无）
LDAPEngUserId（TC用户的ID）
sAMAccountName（LDAP中用户的登录账号，必须修改原uid为此值）
%REPLACE_ME%（默认值，无）
LDAPLastUpdate（TC中最后同步更新时间，通过此时间差来自动更新）
modifyTimestamp（LDAP中最后同步更新时间）
%REPLACE_ME%（默认值，无）
LDAPOsUser（TC中操作系统名称）
sAMAccountName（LDAP中用户的登录账号，必须修改原uid为此值）
%REPLACE_ME%（默认值，无）
LDAPUserGroup（TC中用户的组名）
%REPLACE_ME%（LDAP用户组名不用定义，无）
Engineering（默认值，工程组，也可以定义为无，用%REPLACE_ME%代替）
LDAPUserRole（TC中用户角色名）
%REPLACE_ME%（LDAP用户角色名不用定义，无）
<span style='font-family:Calibri;color:red'>Designer</span>«span style='font-family: "Microsoft YaHei"'»（默认值，必须要包含一个默认值，不能为空）«/span»

![image2](a915ed46e701430ead8365edc6cd4470.png)
注：cn表示AD中对象的显示名称，sAMAccountname表示AD中用户的登录账号（不带.com后缀）。
2）LDAP_person_attr_mapping，配置人员的映射关系。方式同上面用户映射关系。不用改
LDAPPersonName（人员姓名）
cn
%REPLACE_ME%
LDAPLastUpdate（最后同步更新时间）
modifyTimestamp
%REPLACE_ME%
PA1（地址）
postaladdress
%REPLACE_ME%
PA2（城市）
localityName
%REPLACE_ME%
PA3（省/自治区/直辖市）
st
%REPLACE_ME%
PA4（邮政编码）
postalCode
%REPLACE_ME%
PA5（国家/地区）
co
%REPLACE_ME%
PA6（组织）
o
%REPLACE_ME%
PA7（员工编号）
employeeNumber
%REPLACE_ME%
PA8（内部邮件代号）
physicalDeliveryOfficeName
%REPLACE_ME%
PA9（邮件地址）
mail
%REPLACE_ME%
PA10（电话号码）
telephoneNumber
%REPLACE_ME%
3）LDAP_base_dn：需要同步的组织单位范围的DN。即要同步LDAP中哪些路径下的账户。多个范围，填写多行。如：
dc=siemens,dc=com，表示整个Siemens.com下的所有用户。
ou=Engineering Groups,ou=specials users,db=siemens,dc=com，表示Siemens.com下Engineering Groups和specials users两个组织单位下的用户。
这里填写的是ou=TC,dc=ldl,dc=com，即只同步ldl.com域下TC组织单位下的用户。
<span style='color:red'>注：创建及更新会从这个范围中查找，但停用会停用所有跟TC中存在相同用户名的用户，因此，建议将LDAP_sync_user_flags首选项默认值cdesu，改为cesu。不进行同步停用。</span>
![image3](ddd19cffd6ca427f9df5fd06f6e8e110.png)
4）LDAP_ignore_users，不同步或修改更新哪些用户。默认管理账户infodba。即上述同步范围中哪些用户不需要同步更新到TC。首选项就是不填写值，系统也不会同步更新、或停用infodba账号。保持OOTB默认即可。
5）LDAP_user_object_class，要同步的用户的类型，通常有两种，即User或inetOrgPerson，只能写一个类型，这里根据企业修改为Uesr。
![image4](492fa35178874132a141e358c30a0d8e.png)
注：首选项的值为AD架构中的类user的名称。也可以在AD中此类上可以定义用户的自定义属性，来定义该用户属于哪个组或哪个角色。在首选项LDAP_attribute_mapping中为LDAPUserGroup和LDAPUserRole添加对应的AD的该自定义属性的映射。
![image5](c8f69fcd44164c30a5a367ce15cf1810.png)

5）LDAP_user_query_filter，用户在LDAP中的某些属性满足某一条件的用户进行同步。默认为(sAMAccountName=\*),即全用户同步。条件的编写语法与LDAP查询过滤的语法一致。修改原uid为sAMAccountName。
<span style='font-size:12.0pt;color:#4F4F4F;background:white'>(& (...K1...) (...K2...))</span><span style='font-size:11.0pt'>表示且，</span><span style='font-size:12.0pt; color:#4F4F4F;background:white'>(\| (...K1...) (...K2...))</span><span style='font-size:11.0pt'>表示或。</span>
*来自 \< <https://blog.csdn.net/jbgtwang/article/details/39180915>\>*
6）LDAP_sync_user_flags，值改为cesu
## 6、执行同步
打开TC的命令窗口，输入一下内容。如果设置LDAP_admin_pw首选项，则-I参数可以不用
直接输入ldapsync -u=infodba -p=infodba -g=dba，回车，（注：这里的-u -p只TC中具有dba权限的系统管理员账号和密码，跟AD没有关系）即可执行同步。可以把这个命令写成bat文件，放到Windows计划任务按照周期配置定期执行。
bat文件写法，新建txt文档，修改后缀名为bat，用记事本打开，编写一下内容：
SET TC_ROOT=D:\Siemens\Teamcenter11
SET TC_DATA=D:\Siemens\tcdata
call %TC_DATA%\tc_profilevars
cd /d %TC_ROOT%\bin
ldapsync -u=infodba -p=infodba -g=dba -v
