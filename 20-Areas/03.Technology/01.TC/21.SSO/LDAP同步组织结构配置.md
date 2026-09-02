---
title: LDAP同步组织结构配置
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:50
---

# 有两种方式：
1、使用ldapsync批处理程序，已经被废弃。将来会在新版本中删除。
![image1](d4e07640dad84787b6b5d2a4b7de0535.png)
2、在首选项中配置，通过DataExchange+ldapsync的方式同步。
[[LDAP同步组织结构配置]]
3、AD 对象只有组、用户可以同步到TC，组织单位是不能同步的，但可以辅助企业在AD中搭建组织结构，组织单位主要用于搭建结构，而组主要用于控制权限。
4、如果只同步用户信息，则只需要配置以下1、2、3部分即可，但必须要有默认的组和角色，且为系统中已经存在的。
# 具体配置方式：
## 1、必须安装安全服务。
## 2、配置LDAP连接信息。
编辑站点级首选项：
1）LDAP_admin_dn：域管理员账号（有查询AD权限的）的DN名称。如infodba@dias.com.cn
ldl.com/sotos/TC/infodba或cn=infodba,ou=TC,ou=sotos,dc=ldl,dc=com（未验证）
![image2](0a5ffcdf721245b599bec0d517ebc6ef.png)
2）LDAP_admin_pw，域管理员账户的密码。如infodba
3）LDAP_cert_db_path，不使用SSL，可以不用配置。如果LDAP_use_ssl为false，此首选项不会起作用
4）LDAP_port_number，LDAP端口号，不使用SSL，填写389。
5）LDAP_service_hosts，LDAP服务器的主机名或ip，如192.168.1.110
6）LDAP_use_ssl：不使用SSL，填写false。
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
Designer«span style='font-family: "Microsoft YaHei"'»（默认值，必须要包含一个默认值，不能为空）«/span»

![image3](e2161cf8c4b146369bd97f29acf57fcb.png)
注：cn表示AD中对象的显示名称，sAMAccountname表示AD中用户的登录账号（不带.com后缀）。
2）LDAP_person_attr_mapping，配置人员的映射关系。方式同上面用户映射关系。
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
注：创建及更新会从这个范围中查找，但停用会停用所有跟TC中存在相同用户名的用户，因此，建议将LDAP_sync_user_flags首选项默认值cdesu，改为cesu。不进行同步停用。
![image4](ea17d2b4b2c74c21b1d534e35bf2e380.png)
4）LDAP_ignore_users，不同步或修改更新哪些用户。默认管理账户infodba。即上述同步范围中哪些用户不需要同步更新到TC。首选项就是不填写值，系统也不会同步更新、或停用infodba账号。保持OOTB默认即可。
5）LDAP_user_object_class，要同步的用户的类型，通常有两种，即User或inetOrgPerson，只能写一个类型，这里根据企业修改为Uesr。
![image5](e9d33a9e636340828c5e531d8078d147.png)
注：首选项的值为AD架构中的类user的名称。也可以在AD中此类上可以定义用户的自定义属性，来定义该用户属于哪个组或哪个角色。在首选项LDAP_attribute_mapping中为LDAPUserGroup和LDAPUserRole添加对应的AD的该自定义属性的映射。
![image6](eb186651ff5c4a6eaa39d7f94427f620.png)

5）LDAP_user_query_filter，用户在LDAP中的某些属性满足某一条件的用户进行同步。默认为(sAMAccountName=\*),即全用户同步。条件的编写语法与LDAP查询过滤的语法一致。修改原uid为sAMAccountName。
(& (...K1...) (...K2...))表示且，(\| (...K1...) (...K2...))表示或。
*来自 \< <https://blog.csdn.net/jbgtwang/article/details/39180915>\>*
## 4、配置组及角色映射--方式同用户及人员的映射。
编辑站点级首选项：
1）LDAP_group_attr_mapping，组映射关系
LDAP_group_attr_mapping=
LDAPGroupName
cn
%REPLACE_ME%
LDAPGroupDesc
description
%REPLACE_ME%
LDAPLastUpdate
modifyTimestamp
%REPLACE_ME%
LDAPGroupDBA
%REPLACE_ME%
0
LDAPGroupRole
%REPLACE_ME%
%REPLACE_ME%
![image7](73b3304de5ac42bc8893d2a3a57200ec.png)
2）LDAP_group_base_dn，查找组的范围，与LDAP_base_dn要一致
3）LDAP_group_object_class，组的类名，值使用默认groupOfUniqueNames（AD中的组对象）即可。如果为group，则表示AD中的组织单位对象。
4）LDAP_group_query_filter，查询条件，语法规则同LDAP_user_query_filter
5）LDAP_role_attr_mapping，角色的映射关系。
LDAP_role_attr_mapping=
LDAPRoleName
cn
%REPLACE_ME%
LDAPRoleDesc
description
%REPLACE_ME%
LDAPLastUpdate
modifyTimestamp
%REPLACE_ME%
![image8](33c41d46eae04b8abb2c48c36c1dce30.png)
6）LDAP_role_object_class，角色的类名，AD中不分角色和组，这里值跟LDAP_group_object_class一致，为groupOfUniqueNames。
7）LDAP_role_query_filter，查询条件，语法规则同LDAP_user_query_filter
## 5、配置组及角色、成员关系映射
编辑站点级首选项：
**1）LDAP_member_type_attr：**定义在AD中的对象上的自定义属性（AD自定属性添加方式，在类groupOfUniqueNames上增加该属性），如首选项的值设置为自定义属性memberType，用于区分该组织单元在TC中有直接下级还是间接下级。当AD中某一组织单元的该属性设置为True时，表示有直接的下级，如果设置为False，则表示有间接下级。即如有有直接下级则为角色（在AD中中为组对象）下面只有用户，如果有间接下级，则该对象为组，下面有下级组或角色（在AD中中为组对象）。
![image9](d133c9a3e5654e11a9357e652d1483a5.png)
**2）LDAP_member_list_attr：**表示含有能表示DN集合的一个属性（uniqueMember，必须维护这个属性的值为该对象的子级DN名称的集合。或member,可以通过直接添加对象的方式添加到组的成员中），默认uniqueMember（AD中自带的可分辨名称属性列），当LDAP_member_type_attr设置值后，此首选项才起作用。

![image10](3e0fc40837cc422c9b96f8bd84baefe5.png)

![image11](873886d5866f48eeaaff057873ee119e.png)
**3）LDAP_object_type_attr：**定义在AD组对象上的自定义属性（如首选项的值为ObjectType），因为AD本身没有角色用来区分是组还是角色。在AD的组织单元的该属性需要填写group或role。使用这种方式区分组还是角色的话，需要将LDAP_role_object_class和LDAP_group_object_class的值均设置为AD中的类groupOfUniqueNames（该名称为AD的组对象，类group表示组织单位对象）。
![image12](4f9ac028bc594543851b05548fdef5ad.png)

**4）LDAP_sync_member_flags**与LDAP_sync_user_flags定义用户与人员的同步方式。有5中。
为cdesu。LDAP_sync_user_flags首选项默认值为cdesu，其他默认cesu
c，创建，允许将AD的组织对象创建到TC
d，停用，允许AD端停用TC中的用户，只有用户会用到该值，如果存在d，表示如果TC中已有AD要同步的用户名，则同步后TC的对应用户会变为非活动状态。尽量LDAP_sync_user_flags的值也用cesu。
e，外部转化，允许TC的组织对象转换为AD中的对象。
s，同步，启用同步。
u，更新，允许AD更新TC中的组织对象
## 6、执行同步
打开TC的命令窗口，输入一下内容。如果设置LDAP_admin_pw首选项，则-I参数可以不用
直接输入ldapsync -u=infodba -p=infodba -g=dba，回车，（注：这里的-u -p只TC中具有dba权限的系统管理员账号和密码，跟AD没有关系）即可执行同步。可以把这个命令写成bat文件，放到Windows计划任务按照周期配置定期执行。
bat文件写法，新建txt文档，修改后缀名为bat，用记事本打开，编写一下内容：
SET TC_ROOT=D:\Siemens\Teamcenter11
SET TC_DATA=D:\Siemens\tcdata
call %TC_DATA%\tc_profilevars
cd /d %TC_ROOT%\bin
ldapsync -u=infodba -p=infodba -g=dba -v
