---
title: LDAP组织同步问题
updated: 2026-06-06T10:08
created: 2018-04-25T11:25:57
---

在TC的CMD中使用LDAPSync -t -v，后面-t -v，可以输出对应日志到Tc_root\tc_menu\LDAPSyncLog.txt下
问题1：
Errors from LDAP server:
LDAP Error code: 1, error message: 000004DC: LdapErr: DSID-0C09072B, comment: In order to perform this operation a successful bind must be completed on the connection., data 0, v2580
LDAP Error2: Operations error
原因：查询连接有问题
将首选项LDAP_base_dn的值与LDAP_group_base_dn保持一致。
问题2：
SYNC_MODE_ADD: userID(dcproxy) sync_create_flag(set)
ERROR No role or default role provided, check preference parameters.

ERROR synchronizing user "dcproxy": 2 from ldapsync processAll.
原因：未配置默认角色
LDAP_attribute_mapping首选项中维护默认角色Designer或其他。

问题3：
ERROR setting OS user "dcproxy": 515122 from SA_set_os_user_name.

ERROR synchronizing user "dcproxy": 515122 from ldapsync processAll.
原因：LDAP_attribute_mapping中LDAPOsUser的映射无法映射到uid，将该首选项中的uid改为sAMAccountName即可。

OID:
![image1](8fa732f2abe04058ac949f6f22f57556.png)
1.2.840.113556.1.8000.2554.999999.1.1

问题4：
Unable to bind LDAP with hosts 172.16.254.200, and port 389.
Check values and verify port is not blocked by firewall
Admin DN is dias.com.cn/dias/users/Application_Accont/PLM.
解决：将首选项ldap_admin_dn的值有DN值改为XXX@xxx.xx的方式，如改变原ldl.com/sotos/TC/infodba改为infodba@dias.com.cn

