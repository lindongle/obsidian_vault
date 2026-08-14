---
title: LDAP 同步组织结构
updated: 2026-06-13T15:25:42
created: 2026-07-05T17:04:50
---

<span style='color:#006487'>LDAP syncrhonization concepts</span>
<span style='color:#006487'>Objects synchronized by the ldapsync utility</span>
<span style='color:black'>The objects synchronized by the ldapsync utility are users and their associated persons, groups, roles, and group memberships. Teamcenter uses preferences set at the user location to control the synchronization process, providing flexibility in how the ldapsync utility modifies the Teamcenter database.</span>
<span style='color:black'>The ldapsync utility does not change the LDAP repository, only the Teamcenter database when differences exist between the two. The utility can generate an extensive log file that tracks objects that are modified and any error conditions encountered during execution.</span>
<span style='color:black'>Users that you synchronize with the ldapsync utility must be authenticated through Teamcenter Security Services; therefore, you must have Security Services installed.</span>
<span style='color:#006487'>Object nodes</span>
<span style='color:black'>The ldapsync utility recognizes the following four types of entries or nodes in an LDAP repository:</span>
- <span style='color:black'>user</span>
- <span style='color:black'>group</span>
- <span style='color:black'>role</span>
- <span style='color:black'>undefined</span>
<img src="1ceae9f089ee9.png" alt="image1" />
<span style='color:black'>Object nodes</span>
<span style='color:black'>The first three map directly to their equivalent objects in Teamcenter, with user nodes mapping to both Teamcenter person and Teamcenter user objects. The ldapsync utility also constructs group memberships from the combination of a user, role, and group node.</span>
<span style='color:black'>Undefined nodes are useful within LDAP for providing clarity to the overall structure. For example, nodes of object class ou (organizational unit) can be used to segregate users by geographical location without affecting the ldapsync utility output.</span>
<span style='color:#006487'>Direct and indirect memberships</span>
<span style='color:black'>Direct or indirect membership describes how parent modes trace a path to their children. In a direct membership, each child has exactly one parent and that parent-child relationship conforms to parent-child connections in the LDAP repository. In an indirect membership, a specific child node may have multiple parents, that is, more than one parent node can point the same child node.</span>
<span style='color:black'>Indirect membership is recognized by the ldapsync utility but not by the LDAP server. This type of membership is represented in the ldapsync utility by the LDAP_member_type_attr and LDAP_member_list_attr preferences at the site location. If the LDAP_member_type_attr preference value is set to true, the ldapsync utility uses the values in the LDAP_member_list_attr preference as a list of child distinguished names (DNs). Therefore, a specific child node can be included multiple times, for example, if a person (represented by a user node) belongs to several project teams (represented by group nodes) each group node can point to the same user node, rather than requiring a duplicate user node for each group’s use.</span>
<span style='color:black'>There is no way to easily determine how many indirect parents a node may have; however, this information has no known value at this time.</span>
<span style='color:#006487'>Internal and external objects</span>
<span style='color:black'>The ldapsync utility manages objects as internal or as external objects. Teamcenter creates all internally managed objects and only Teamcenter can modified them. The ldapsync utility can create and modify externally manage objects. An internally managed object can become externally managed. Teamcenter users, groups, roles, and group memberships are flagged as either internal or external objects.</span>
<span style='color:#006487'>Group membership</span>
<span style='color:black'>The ldapsync utility determines group memberships by mapping user, group, and role nodes, on a one-to-one basis, to their appropriate Teamcenter objects. Group memberships result from the relationship of these nodes in the LDAP repository. The minimum requirement for a group membership is a group node and a user node. If a default role for a group is specified, a role node is optional. The parent→child→grandchild relationship in LDAP is represented as group→optional-role-node→user. Intervening undefined nodes, such as organizational units (ou) are ignored in the path, an example of this in the LDAP repository is: group→ou1→ou2→role→ou3→user</span>
<span style='color:#006487'>Configuring the ldapsync utility</span>
<span style='color:#006487'>Configure the connection to an LDAP server</span>
<span style='color:black'>In the rich client interface, choose Edit→Options and set the following preferences under the Configuration.LDAP.Connection category:</span>
- <span style='color:black'>LDAP_admin_dn</span>
<span style='color:black'>Defines the LDAP administrator's name. Set this value to the DN of an LDAP user who has search and read permissions in the LDAP directory service.</span>
- <span style='color:black'>LDAP_admin_pw</span>
<span style='color:black'>Specifies the password for the LDAP administrator identified by the LDAP_admin_dn preference. If you do not set this preference, you must include a password using the –l argument for the ldapsync utility. Because this password is stored in the database in plain text, it is recommended that the associated account have read-only access to the LDAP.</span>
- <span style='color:black'>LDAP_cert_db_path</span>
<span style='color:black'>Specifies the path to the directory containing the cert8.db (certification database) file. the ldapsync utility uses this value only when the LDAP_use_ssl preference is set to true.</span>
- <span style='color:black'>LDAP_port_number</span>
<span style='color:black'>Defines the port number used when connecting to the LDAP directory server. It is used with the value set in the LDAP_service_hosts preference to define an LDAP directory server connection.</span>
- <span style='color:black'>LDAP_service_hosts</span>
<span style='color:black'>Lists the host or hosts that provide LDAP directory services for this installation. Valid inputs are host names or IP addresses. This value is used with the value set in the LDAP_port_number preference to define LDAP directory server connections.</span>
- <span style='color:black'>LDAP_use_ssl</span>
<span style='color:black'>Specifies whether a connection to the LDAP directory uses SSL encryption. This preference contains a logical value set to false by default. If you set this preference to true, you must also set the LDAP_cert_db_path preference.</span>
<span style='color:#006487'>Configure the ldapsync utility for SSL</span>
<span style='color:black'>It is recommended that you have the ldapsync utility fully functional in non–SSL mode before you configure it for secure socket layer (SSL) use. After you have the utility functioning properly, configure it to work with SSL, as follows:</span>
- <span style='color:black'>Obtain a certificate.</span>
- <span style='color:black'>Start the SSL port on the directory server.</span>
- <span style='color:black'>Verify the SSL port can be accessed using an LDAP browser utility.</span>
- <span style='color:black'>Register the directory server as a trusted server.</span>
- <span style='color:black'>Configure the ldapsync utility to use the trusted store.</span>
<span style='color:black'>Your network security administrator must perform the first three steps and they may assist you with step four. To register the directory server as trusted (step 4):</span>
<span style='background:#EFEFEF'>注释</span>
<span style='background:#EFEFEF'>For information about how to perform any of these steps, see the Mozilla web site.</span>
- <span style='color:black'>Download the certutil executable from the Mozilla web site. The executable is packaged in the NSS and NSF download packages.</span>
- <span style='color:black'>Install the certutil executable.</span>
- <span style='color:black'>Create a trusted store.</span>
- <span style='color:black'>Add the server certificate to the trusted store.</span>
<span style='color:black'>To configure the ldapsync utility to use the trusted store:</span>
- <span style='color:black'>Set the LDAP_port_number preference at the site location, for example: LDAP_port_number: 10636</span>
- <span style='color:black'>Set the LDAP_use_ssl preference at the site location, for example: LDAP_use_ssl: TRUE</span>
- <span style='color:black'>Set the LDAP_cert_db_path preferences, for example:</span>
<span style='color:black'>LDAP_cert_db_path: trusted-store-path</span>
<span style='color:#006487'>User and person mapping</span>
<span style='color:black'>The Teamcenter user and person objects are both mapped from the LDAP person object. When the ldapsync utility identifies an LDAP person object for synchronization, it creates both a user object and a person object in Teamcenter. The inetOrgPerson class is the standard LDAP person object class for a Sun ONE Directory Server, but you can configure this to a different class.</span>
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image2.png" style="width:2.82292in;height:1.125in" />
<span style='color:black'>LDAP person object mapping</span>
<span style='color:#006487'>User and person mapping preferences</span>
<span style='color:black'>These preferences are in the Configuration.LDAP.User and Person Mapping preferences category.</span>
<span style='color:black'>• LDAP_attribute_mapping</span>
<span style='color:black'>Defines the mapping of LDAP objects to Teamcenter user attributes using sets of three strings, for example:</span>
<span style='color:black'>LDAP_attribute_mapping=</span>
<span style='color:black'>LDAPPersonName</span>
<span style='color:black'>cn</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPEngUserId</span>
<span style='color:black'>uid</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPLastUpdate modifyTimestamp</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPOsUser uid</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPUserGroup</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>Engineering</span>
<span style='color:black'>LDAPUserRole</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>Each attribute map can contain string values for the following:</span>
- <span style='color:black'>Teamcenter attribute name o Mapped LDAP attribute</span>
- <span style='color:black'>Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null</span>
<span style='color:black'>Attribute name LDAP attribute Default value Description</span>
<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 28%" />
<col style="width: 24%" />
<col style="width: 19%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAPEngUserId</span></th>
<th><span style='color:black'>uid</span></th>
<th><blockquote>
<p><span style='color:black'>Does not apply</span></p>
</blockquote></th>
<th><span style='color:black'>User ID</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAPLastUpdate</span></td>
<td><span style='color:black'>modifyTimestamp</span></td>
<td><blockquote>
<p><span style='color:black'>Does not apply</span></p>
</blockquote></td>
<td><span style='color:black'>Last update timestamp</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAPOsUser</span></td>
<td><span style='color:black'>uid</span></td>
<td><blockquote>
<p><span style='color:black'>None</span></p>
</blockquote></td>
<td><span style='color:black'>Operating system user name.</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAPPersonName</span></td>
<td><span style='color:black'>cn</span></td>
<td><blockquote>
<p><span style='color:black'>Does not apply</span></p>
</blockquote></td>
<td><span style='color:black'>Person name</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAPUserGroup</span></td>
<td><span style='color:black'>Undefined</span></td>
<td style="text-align: center;"><span style='color:black;text-align: center'>Engineering</span></td>
<td><span style='color:black'>Default group</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAPUserRole</span></td>
<td><span style='color:black'>Undefined</span></td>
<td><blockquote>
<p><span style='color:black'>None</span></p>
</blockquote></td>
<td><span style='color:black'>Default role</span></td>
</tr>
<tr>
<td><span style='color:black'>The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter role object.</span></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<span style='background:#EFEFEF'>注意</span>
<span style='background:#EFEFEF'>The LDAPUserGroup and LDAPUserRole attributes are required in Teamcenter. Therefore, you must specify either a mapped LDAP attribute or a default value for these attributes.</span>
<span style='color:black'>• LDAP_person_attr_mapping</span>
<span style='color:black'>Defines the mapping of LDAP objects to Teamcenter person attributes using sets of three strings, for example:</span>
<span style='background:#EFEFEF'>注释</span>
<span style='background:#EFEFEF'>This example uses generic person attribute values (PA1–PA10)</span>
<span style='color:black'>LDAP_person_attr_mapping=</span>
<span style='color:black'>LDAPPersonName</span>
<span style='color:black'>cn</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPLastUpdate</span>
<span style='color:black'>modifyTimestamp</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA1 postaladdress %REPLACE_ME%</span>
<span style='color:black'>PA2 localityName %REPLACE_ME%</span>
<span style='color:black'>PA3 st</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA4 postalCode %REPLACE_ME%</span>
<span style='color:black'>PA5 co</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA6 o</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA7 employeeNumber %REPLACE_ME%</span>
<span style='color:black'>PA8</span>
<span style='color:black'>physicalDeliveryOfficeName</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA9 mail</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA10 telephoneNumber %REPLACE_ME%</span>
<span style='color:black'>Each attribute map can contain string values for the following:</span>
- <span style='color:black'>Teamcenter attribute name o Mapped LDAP attribute</span>
- <span style='color:black'>Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null.</span>
<span style='color:black'>Default</span>
<span style='color:black'>Attribute name LDAP attribute value Description</span>
| <span style='color:black'>LDAPPersonName</span> | <span style='color:black'>cn</span> | <span style='color:black'>Does not apply</span> | <span style='color:black'>Person name</span> |
|----|----|----|----|
| <span style='color:black'>LDAPLastUpdate</span> | <span style='color:black'>modifyTimestamp</span> | <span style='color:black'>None</span> | <span style='color:black'>Last update timestamp</span> |
| <span style='color:black'>PA1</span> | <span style='color:black'>postaladdress</span> | <span style='color:black'>None</span> | <span style='color:black'>Address</span> |
| <span style='color:black'>PA2</span> | <span style='color:black'>localityName</span> | <span style='color:black'>None</span> | <span style='color:black'>City</span> |
| <span style='color:black'>PA3</span> | <span style='color:black'>st</span> | <span style='color:black'>None</span> | <span style='color:black'>State</span> |
| <span style='color:black'>PA4</span> | <span style='color:black'>postalcode</span> | <span style='color:black'>None</span> | <span style='color:black'>Zip code</span> |
<span style='color:black'>Default</span>
<span style='color:black'>Attribute name LDAP attribute value Description</span>
| <span style='color:black'>PA5</span> | <span style='color:black'>co</span> | <span style='color:black'>None</span> | <span style='color:black'>Country</span> |
|----|----|----|----|
| <span style='color:black'>PA6</span> | <span style='color:black'>o</span> | <span style='color:black'>None</span> | <span style='color:black'>Organization</span> |
| <span style='color:black'>PA7</span> | <span style='color:black'>employeeNumber</span> | <span style='color:black'>None</span> | <span style='color:black'>Employee number</span> |
| <span style='color:black'>PA8</span> | <span style='color:black'>physicalDeliveryOfficeName</span> | <span style='color:black'>None</span> | <span style='color:black'>Internal mail code</span> |
| <span style='color:black'>PA9</span> | <span style='color:black'>mail</span> | <span style='color:black'>None</span> | <span style='color:black'>email address</span> |
| <span style='color:black'>PA10</span> | <span style='color:black'>telephoneNumber</span> | <span style='color:black'>None</span> | <span style='color:black'>Telephone number</span> |
| <span style='color:black'>The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter role object.</span> |  |  |  |
- <span style='color:black'>LDAP_base_dn</span>
<span style='color:black'>Defines the distinguished name (DN) of one or more nodes in the external LDAP directory where the user and person synchronization process starts. Use this to limit the extent of the ldapsync utility user and person search for performance reasons or to partition users in a single LDAP directory server instance for use with multiple Teamcenter installation. If the LDAP directory server does not have this type of organization, set this value to the lowest level DNs that encompass all Teamcenter users.</span>
<span style='color:black'>The following are examples of a high level DN and a more specific DN, respectively:</span>
<span style='color:black'>dc=siemens,dc=com</span>
<span style='color:black'>ou=Engineering Groups,ou=specials users,db=siemens,dc=com</span>
- <span style='color:black'>LDAP_ignore_users</span>
<span style='color:black'>Defines Teamcenter user IDs that the ldapsync utility does not process. The default value is infodba.</span>
<span style='background:#EFEFEF'>注释</span>
<span style='background:#EFEFEF'>The ldapsync utility never processes the infodba user even if it is not included in this list.</span>
<span style='color:black'>This allows you to include a list of user IDs that exist in Teamcenter for administrative purposes that do not have corresponding entries in the LDAP repository.</span>
- <span style='color:black'>LDAP_user_object_class</span>
<span style='color:black'>Defines the LDAP object class you use to indicate Teamcenter users to synchronize. If you use multiple classes to represent Teamcenter users, specify the common base class. The default value is inetOrgPerson.</span>
- <span style='color:black'>LDAP_user_query_filter</span>
<span style='color:black'>Defines the set of conditions an LDAP object must satisfy to match a Teamcenter user object for synchronization. Use LDAP query filter syntax for this preference value. The default value is uid=\*.</span>
<span style='color:#006487'>Group and role mapping</span>
<span style='color:black'>You can map the Teamcenter group and role objects from the LDAP group object and a mapped default role attribute. You can also specify roles in their own LDAP group object. A user is typically assigned a role within a group. Groups can also be nested. The standard LDAP group object class is groupOfUniqueNames, but you can </span><span style='color:#990000'>configure a different class for each object </span><span style='color:black'>type.</span>
<span style='color:black'>The standard LDAP role object is not supported for mapping to Teamcenter because LDAP roles are global and attached to the person object. Teamcenter requires role constructs that are configured specifically within the context of a group. If you require non-default roles, you may have to alter the LDAP schema.</span>
<img src="73ae787eaa8f7.jpg" alt="image3" />
<span style='color:black'>LDAP group and role object mapping</span>
<span style='color:black'>Three new LDAP object attributes are required to support group and role object mapping. Add these to the standard LDAP group object schema. Although all three attributes are optional, the following are required to support LDAP object membership models:</span>
<table style="width:99%;">
<colgroup>
<col style="width: 52%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>object_type</span></th>
<th><blockquote>
<p><span style='color:black'>Specifies a string attribute that allows Teamcenter to distinguish groupOfUniqueNames class instances represent Teamcenter groups or roles. Valid values of this attribute are group and role. The default value is group. An alternative to using this attribute is to create separate groupOfUniqueNames subclasses for Teamcenter groups and roles to differentiate them.</span></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>member_type</span></td>
<td><blockquote>
<p><span style='color:black'>Specifies a logical attribute that allows Teamcenter to distinguish the membership model to use to determine the children of this group or role. Valid values are True (indicates indirect) or False (indicates direct). The default value is True.</span></p>
</blockquote></td>
</tr>
</tbody>
</table>
<span style='color:black'>memberDNs Specifies a list of string attributes that allow Teamcenter to find the children member DNs for the group or role for an indirect membership type. This is not valid for direct membership type.</span>
<span style='color:#006487'>Group mapping preferences</span>
<span style='color:black'>These preferences are in the Configuration.LDAP.Group Mapping preferences category.</span>
<span style='color:black'>• LDAP_group_attr_mapping</span>
<span style='color:black'>Defines the mapping of LDAP objects to Teamcenter group attributes using sets of three strings, for example:</span>
<span style='color:black'>LDAP_group_attr_mapping=</span>
<span style='color:black'>LDAPGroupName</span>
<span style='color:black'>cn</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPGroupDesc description %REPLACE_ME%</span>
<span style='color:black'>LDAPLastUpdate modifyTimestamp</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>LDAPGroupDBA</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>0</span>
<span style='color:black'>LDAPGroupRole</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>Each attribute map can contain string values for the following:</span>
- <span style='color:black'>Teamcenter attribute name o Mapped LDAP attribute</span>
- <span style='color:black'>Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null</span>
<span style='color:black'>Default</span>
<span style='color:black'>Attribute name LDAP attribute value Description</span>
<span style='color:black'>LDAPGroupDBA Undefined None Group DBA</span>
<span style='color:black;text-align:right'>privilege</span>
<span style='color:black'>LDAPGroupDesc description None Group</span>
<span style='color:black;text-align:right'>description</span>
<span style='color:black'>LDAPGroupName cn Does not Group name</span>
<span style='color:black'>apply</span>
<span style='color:black'>LDAPGroupRole Undefined None Default role</span>
<span style='color:black'>LDAPLastUpdate modifyTimestamp Does not Last update apply timestamp</span>
<span style='color:black'>The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter role object.</span>
- <span style='color:black'>LDAP_group_base_dn</span>
<span style='color:black'>Defines the distinguished name (DN) of one or more nodes in the external LDAP directory where the group synchronization process starts. Use this to limit the extent of the ldapsync utility group search for performance reasons or to partition groups in a single LDAP directory server instance for use with multiple Teamcenter installation. If the LDAP directory server does not have this type of organization, set this value to the lowest level DNs that encompasses all Teamcenter groups.</span>
<span style='color:black'>The following are examples of a high level DN and a more specific DN, respectively:</span>
<span style='color:black'>dc=siemens,dc=com</span>
<span style='color:black'>ou=Engineering Groups,ou=groups,db=siemens,dc=com</span>
- <span style='color:black'>LDAP_group_object_class</span>
<span style='color:black'>Defines the LDAP object class you use to indicate Teamcenter groups to synchronize. If you use multiple classes to represent Teamcenter groups, specify the common base class. The default value is groupOfUniqueNames.</span>
<span style='color:black'>This allows you to define specific subclasses in LDAP to differentiate groups and roles. If your groups and roles have the same object class, use the LDAP_object_type_attr preference instead.</span>
- <span style='color:black'>LDAP_group_query_filter</span>
<span style='color:black'>Defines the set of conditions an LDAP object must satisfy to match a Teamcenter group object for synchronization. Use LDAP query filter syntax for this preference value. The default value is cn=\*.</span>
<span style='color:#006487'>Role mapping preferences</span>
<span style='color:black'>These preferences are in the Configuration.LDAP.Role Mapping preferences category.</span>
<span style='color:black'>• LDAP_role_attr_mapping</span>
<span style='color:black'>Defines the mapping of LDAP objects to Teamcenter role attributes using sets of three strings, for example:</span>
<span style='color:black'>LDAP_role_attr_mapping=</span>
<span style='color:black'>LDAPRoleName</span>
<span style='color:black'>cn</span>
<span style='color:black'>%REPLACE_ME% LDAPRoleDesc description %REPLACE_ME%</span>
<span style='color:black'>LDAPLastUpdate modifyTimestamp %REPLACE_ME%</span>
<span style='color:black'>Each attribute map can contain string values for the following:</span>
- <span style='color:black'>Teamcenter attribute name o Mapped LDAP attribute</span>
- <span style='color:black'>Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null</span>
<span style='color:black'>Attribute name LDAP attribute Default value Description</span>
<span style='color:black'>LDAPLastUpdate modifyTimestamp None Last update</span>
<span style='color:black;text-align:right'>timestamp</span>
<span style='color:black'>LDAPRoleDesc description None Role</span>
<span style='color:black;text-align:right'>description</span>
<span style='color:black'>LDAPRoleName cn None Role name</span>
<span style='color:black'>The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter group object.</span>
- <span style='color:black'>LDAP_role_object_class</span>
<span style='color:black'>Defines the LDAP object class you use to indicate the Teamcenter roles to synchronize. If you use multiple classes to represent Teamcenter roles, specify the common base class. The default value is groupOfUniqueNames.</span>
<span style='color:black'>This allows you to define specific subclasses in LDAP to differentiate groups and roles. If your groups and roles have the same object class, use the LDAP_object_type_attr preference instead.</span>
- <span style='color:black'>LDAP_group_query_filter</span>
<span style='color:black'>Defines the set of conditions an LDAP object must satisfy to match a Teamcenter role object for synchronization. Use LDAP query filter syntax for this preference value. The default value is cn=\*.</span>
<span style='color:#006487'>Data synchronization preferences</span>
<span style='color:black'>LDAP data synchronization uses three preference types:</span>
- <span style='color:black'>Indirect membership preferences (LDAP_member_list_attr and LDAP_member_type_attr) These provide a link to another LDAP tree structure.</span>
- <span style='color:black'>Object type preference (LDAP_object_type_attr) This distinguish a group or role object</span>
- <span style='color:black'>Synchronization flags preferences (LDAP_sync_flag-name_flags) These provide system-wide decisions about synchronization.</span>
<span style='color:black'>These preferences are in the Configuration.LDAP.Synchronization preferences category.</span>
- <span style='color:black'>LDAP_member_list_attr</span>
<span style='color:black'>Defines the LDAP attribute containing a list of member DNs for this object. The ldapsync utility uses this value only when the LDAP_member_type_attr is set. This preference is set to uniqueMember by default.</span>
- <span style='color:black'>LDAP_member_type_attr</span>
<span style='color:black'>Defines the LDAP attribute that contains membership type (indirect or direct) for this object. The LDAP object must have an attribute that matches the value of this preference that contains a logical value indicating whether the object has indirect (false) or indirect (true) children. For example, if you set this to memberType, the LDAP object must have an attribute by that name that is set to true for indirect children or false for direct children.</span>
<span style='color:black'>This preference applies to objects representing either groups or roles defined in LDAP.</span>
<span style='color:black'>If you set this preference, you must also set the LDAP_member_list_attr preference.</span>
- <span style='color:black'>LDAP_object_type_attr</span>
<span style='color:black'>Defines an LDAP attribute that contains the object type for this object. This applies to group or role objects defined in LDAP. The object name must reference a string attribute defined in the LDAP group object that is set to either group or role. For example, if you set the preference value to objectType, your LDAP must have an attribute by that name that is set to either group or role.</span>
- <span style='color:black'>LDAP_sync_group_flags</span>
<span style='color:black'>Defines the synchronization for groups using the flags described in the following table. The deactivate flag is not valid for this preference. The default value is scue.</span>
- <span style='color:black'>LDAP_sync_member_flags</span>
<span style='color:black'>Defines the synchronization for members using the flags described in the following table. The deactivate flag is not valid for this preference. The default value is scue.</span>
- <span style='color:black'>LDAP_sync_role_flags</span>
<span style='color:black'>Defines the synchronization for roles using the flags described in the following table. The deactivate flag is not valid for this preference. The default value is scue.</span>
- <span style='color:black'>LDAP_sync_user_flags</span>
<span style='color:black'>Defines the synchronization for users using the flags described in the following table. The default value is scdue.</span>
<span style='color:black'>Flag Action Description</span>
| <span style='color:black'>c</span> | <span style='color:black'>Create</span> | <span style='color:black'>Allows creation of externally managed objects in Teamcenter.</span> |
|----|----|----|
| <span style='color:black'>d</span> | <span style='color:black'>Deactivate</span> | <span style='color:black'>Allows deactivation of externally managed objects in Teamcenter.</span> |
| <span style='color:black'>e</span> | <span style='color:black'>Externalize</span> | <span style='color:black'>Allows conversion of internally managed Teamcenter objects that have corresponding objects in LDAP to externally managed objects.</span> |
| <span style='color:black'>s</span> | <span style='color:black'>Synchronize</span> | <span style='color:black'>Enables synchronization.</span> |
| <span style='color:black'>u</span> | <span style='color:black'>Update</span> | <span style='color:black'>Allows updates to externally managed objects in Teamcenter.</span> |
<span style='color:#006487'>Differentiate groups and roles</span>
<span style='color:black'>There are two ways to indicate to the ldapsync utility that an object is a group or role.</span>
<span style='color:black'>You can assign a unique object class for each or use the LDAP_object_type_attr preference.</span>
<span style='color:black'>To assign a unique object class:</span>
- <span style='color:black'>Add a new object class in the LDAP server. For example, extent the groupOfUniqueNames class by adding the unique groupOfUniqueGroupNames class for groups and the groupOfUniqueRoleNames class for roles.</span>
- <span style='color:black'>Add the unique object class to the group or role that you want to define.</span>
- <span style='color:black'>Set the ldapsync preferences. For this example, set the following preferences:</span>
<span style='color:black'>LDAP_group_object_class: groupOfUniqueGroupNames LDAP_role_object_class: groupOfUniqueRoleNames</span>
<span style='color:black'>To use the LDAP_object_type_attr preference:</span>
- <span style='color:black'>Use the same object class when defining both groups and roles.</span>
- <span style='color:black'>Define a unique attribute within the object class in the LDAP server. For example, add the </span><span style='color:#990000'>objectType </span><span style='color:black'>attribute to the groupOfUniqueNames object class.</span>
- <span style='color:black'>Set the LDAP_group_object_class, LDAP_role_object_class, and LDAP_object_type_attr preferences. For this example, set the preferences as follows:</span>
<span style='color:black'>LDAP_group_object_class: groupOfUniqueNames</span>
<span style='color:black'>LDAP_role_object_class: groupOfUniqueNames LDAP_object_type_attr: objectType</span>
<span style='color:#006487'>Link to separate LDAP directories</span>
<span style='color:black'>The ldapsync utility reads a directory structure starting at the specified baseDN directory and continues until it has read all of the child nodes. If separate directory structures must be searched that are not under the baseDN directory, configure LDAP member attributes as follows:</span>
- <span style='color:black'>Add a unique attribute to the LDAP server, such as the LDAP_child attribute.</span>
- <span style='color:black'>Add the attribute to a group or role with the attribute value set to the other DN directory. You can configure multiple LDAP_child attributes under each group or role.</span>
<span style='background:#EFEFEF'>注意</span>
<span style='background:#EFEFEF'>To avoid an infinite loop, ensure the DN you provide in the LDAP_child attribute does not point back to the original DN.</span>
<span style='color:black'>3. Set the LDAP_member_type_attr attribute as for direct or indirect searching and the LDAP_member_list_attr attribute to the unique attribute. For example, if you add the LDAP_child attribute and are using indirect searching:</span>
<span style='color:black'>LDAP_member_type: true</span>
<span style='color:black'>LDAP_member_list_attr: LDAP_child</span>
<span style='color:#006487'>Synchronize Teamcenter to an LDAP repository</span>
<span style='background:#EFEFEF'>注释</span>
<span style='background:#EFEFEF'>The utility must be run from a command prompt with the proper environment settings.</span>
<span style='color:black'>1. Open a command prompt.</span>
<span style='color:black'>On Windows systems, open a command prompt with the proper Teamcenter environment settings by clicking the Start button and choosing the following menu commands:</span>
<span style='color:black'>Programs→UGS Teamcenter 11.2→Teamcenter</span>
<span style='color:black'>11.2→ service-name_configuration-ID Command Prompt</span>
<span style='color:black'>Replace service-nameand configuration-IDwith the Teamcenter service name and configuration ID you entered during installation.</span>
<span style='color:black'>2. Enter the following command to synchronize Teamcenter to your LDAP repository:</span>
<span style='color:black'>ldapsync –u=userid -p=password —g=group —l=ldap-password</span>
<span style='color:black'>Replace useridand passwordwith a Teamcenter administrative user ID and password. Replace ldap-passwordwith the password for the DN of an LDAP user who has search and read permissions in the LDAP directory service.</span>
<span style='background:#EFEFEF'>注释</span>
«span style='font-size:11.0pt;background: \#EFEFEF'»The –l=«/span»<span style='font-size:11.5pt;background:#EFEFEF'>ldap-password</span><span style='font-size:11.0pt;background:#EFEFEF'>argument is not required for the ldapsync utility if you set the LDAP_admin_pw preference.</span>
<span style='color:#006487'>ldapsync utility troubleshooting</span>
<span style='color:#006487'>Reset an external user</span>
<span style='color:black'>Use the make_user utility to fix an object incorrectly set to internally or externally managed. The –datasource=0 argument resets the object to internally managed or the –datasource=1 sets it to externally managed. You can set the data source for users, groups, roles, persons, and group members. To set the data source for a group member, you use the –user, –role, and –group arguments together. For example, to set a user to internally managed, type:</span>
<span style='color:black'>make_user -user=user2 -datasource=0</span>
<span style='color:black'>To set a group member to externally managed, type:</span>
<span style='color:black'>make_user -user=user2 –role=role2 –group=group2 -datasource=1</span>
<span style='color:#006487'>ldapsync cannot find nodes</span>
<span style='color:#006487'>Search limitations for ldapsync</span>
<span style='color:black'>The ldapsync utility uses two kinds of LDAP searches; a base-level search (only search the current node), and a one-level search (search the current node and all nodes one level under the current node). If any of the nodes have an LDAP access control list (ACL) that prevents searches on that node, the ldapsync utility cannot analyze it and the utility cannot continue searching on any of its children. To check for an ACL that prevents searches, use an LDAP directory search tool, such as ldapsearch.</span>
<span style='color:#006487'>Search the base DN and one level under it</span>
<span style='color:black'>To search the base DN and one level under it, type:</span>
<span style='color:black'>ldapsearch -b o={baseDN} -h "{host-name}" -p 389 -s one "(cn=\*)"</span>
<span style='color:#006487'>Search the base DN only</span>
<span style='color:black'>To search the base DN only on a Sun ONE Directory Server, type: ldapsearch -b o={baseDN}</span>
<span style='color:black'>-h "{host-name}" -p 389 -s base "(cn=\*)"</span>
<span style='color:#006487'>Sun ONE Directory Server</span>
<span style='color:black'>The following table provides an example of configuring Teamcenter preferences to synchronize a Sun ONE Directory Server to the Teamcenter database.</span>
<span style='color:black'>Preference list Sun ONE Directory Server values</span>
<table>
<colgroup>
<col style="width: 54%" />
<col style="width: 45%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAP_admin_dn</span></th>
<th><span style='color:black'>cn=Directory-Manager</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAP_admin_pw</span></td>
<td><span style='color:black'>password</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_attribute_mapping</span></td>
<td><p><span style='color:black'>LDAPPersonName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPEngUserId</span></p>
<p><span style='color:black'>uid</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate modifyTimestamp</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPOsUser uid</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPUserGroup</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>Engineering</span></p>
<p><span style='color:black'>LDAPUserRole</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>Designer</span></p></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_base_dn</span></td>
<td><span style='color:black'>dc=company-name, dc=com</span></td>
</tr>
</tbody>
</table>
<span style='color:black'>LDAP_cert_db_path</span>
<table>
<colgroup>
<col style="width: 53%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAP_group_attr_mapping</span></th>
<th><p><span style='color:black'>LDAPGroupName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPGroupDesc description %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate modifyTimestamp</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPGroupDBA</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>0</span></p>
<p><span style='color:black'>LDAPGroupRole</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>Designer</span></p></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAP_group_base_dn</span></td>
<td><span style='color:black'>dc=company-name, dc=com</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_group_object_class</span></td>
<td><span style='color:black'>groupOfUniqueNames</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_group_query_filter</span></td>
<td><span style='color:black'>(cn=*)</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_ignore_users</span></td>
<td><span style='color:black'>infodba</span></td>
</tr>
<tr>
<td><p><span style='color:black'>LDAP_member_list_attr</span></p>
<p><span style='color:black'>LDAP_member_type_attr</span></p></td>
<td><span style='color:black'>uniqueMember</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_object_type_attr</span></td>
<td><span style='color:black'>Object-type</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_person_attr_mapping</span></td>
<td><p><span style='color:black'>LDAPPersonName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate modifyTimestamp</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA1 postalAddress %REPLACE_ME%</span></p>
<p><span style='color:black'>PA2 localityName %REPLACE_ME%</span></p>
<p><span style='color:black'>PA3 st</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA4 postalCode %REPLACE_ME%</span></p></td>
</tr>
</tbody>
</table>
<span style='color:black'>PA5 co</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA6 o</span>
<span style='color:black'>%REPLACE_ME%</span>
<table>
<colgroup>
<col style="width: 52%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAP_port_number</span></th>
<th><span style='color:black'>port-number</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAP_role_attr_mapping</span></td>
<td><p><span style='color:black'>LDAPRoleName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME% LDAPRoleDesc description %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate modifyTimestamp</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_role_object_class</span></td>
<td><span style='color:black'>groupOfUniqueNames</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_role_query_filter</span></td>
<td><span style='color:black'>(cn=*)</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_service_hosts</span></td>
<td><span style='color:black'>LDAP-hostname</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_group_flags</span></td>
<td><span style='color:black'>scue</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_member_flags</span></td>
<td><span style='color:black'>scde</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_role_flags</span></td>
<td><span style='color:black'>scue</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_user_flags</span></td>
<td><span style='color:black'>scdue</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_use_ssl</span></td>
<td><span style='color:black'>FALSE</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_user_object_class</span></td>
<td><span style='color:black'>inetOrgPerson</span></td>
</tr>
</tbody>
</table>
<span style='color:black'>PA7 employeeNumber %REPLACE_ME%</span>
<span style='color:black'>PA8</span>
<span style='color:black'>physicalDeliveryOfficeName</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA9 mail</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>PA10 telephoneNumber %REPLACE_ME%</span>
<span style='color:black'>LDAP_user_query_filter (uid=\*)</span>
<span style='color:#006487'>Microsoft Active Directory</span>
<span style='color:black'>The following table provides an example of configuring Teamcenter preferences to synchronize a Microsoft Active Directory LDAP server to the Teamcenter database.</span>
<span style='color:black'>Preference list Active Directory values</span>
<table>
<colgroup>
<col style="width: 52%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAP_admin_dn</span></th>
<th><blockquote>
<p><span style='color:black'>test-admin@domain.com</span></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAP_admin_pw</span></td>
<td><blockquote>
<p><span style='color:black'>password</span></p>
</blockquote></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_attribute_mapping</span></td>
<td><blockquote>
<p><span style='color:black'>LDAPPersonName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPEngUserId sAMAccountName %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate whenChanged %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPOsUser sAMAccountName %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPUserGroup</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>Engineering</span></p>
<p><span style='color:black'>LDAPUserRole</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>Designer</span></p>
</blockquote></td>
</tr>
<tr>
<td><p><span style='color:black'>LDAP_base_dn</span></p>
<p><span style='color:black'>LDAP_cert_db_path</span></p></td>
<td style="text-align: right;"><span style='color:black;text-align:right'>dc=company-name, dc=com</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_group_attr_mapping</span></td>
<td><blockquote>
<p><span style='color:black'>LDAPGroupName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPGroupDesc description %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate whenChanged %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPGroupDBA</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>0</span></p>
<p><span style='color:black'>LDAPGroupRole</span></p>
</blockquote></td>
</tr>
</tbody>
</table>
<span style='color:black;text-align:right'>Active Directory values</span>
<span style='color:black'>%REPLACE_ME%</span>
<span style='color:black'>Designer</span>
<table>
<colgroup>
<col style="width: 48%" />
<col style="width: 51%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAP_group_base_dn</span></th>
<th><span style='color:black'>dc=company-name, dc=com</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAP_group_object_class</span></td>
<td><span style='color:black'>groupOfUniqueNames</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_group_query_filter</span></td>
<td><span style='color:black'>(cn=*)</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_ignore_users</span></td>
<td><span style='color:black'>infodba</span></td>
</tr>
<tr>
<td><p><span style='color:black'>LDAP_member_list_attr</span></p>
<p><span style='color:black'>LDAP_member_type_attr</span></p></td>
<td><span style='color:black'>uniqueMember</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_object_type_attr</span></td>
<td><span style='color:black'>Object-type</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_person_attr_mapping</span></td>
<td><p><span style='color:black'>LDAPPersonName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate modifyTimestamp</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA1 postaladdress %REPLACE_ME%</span></p>
<p><span style='color:black'>PA2 localityName %REPLACE_ME%</span></p>
<p><span style='color:black'>PA3 st</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA4 postalCode %REPLACE_ME%</span></p>
<p><span style='color:black'>PA5 co</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA6 o</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA7</span></p>
<p><span style='color:black'>employeeNumber %REPLACE_ME%</span></p>
<p><span style='color:black'>PA8</span></p>
<p><span style='color:black'>physicalDeliveryOfficeName</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p>
<p><span style='color:black'>PA9 mail</span></p>
<p><span style='color:black'>%REPLACE_ME%</span></p></td>
</tr>
</tbody>
</table>
<span style='color:black;text-align:right'>Active Directory values</span>
<span style='color:black'>PA10 telephoneNumber %REPLACE_ME%</span>
<table>
<colgroup>
<col style="width: 52%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th><span style='color:black'>LDAP_port_number</span></th>
<th><span style='color:black'>port-number</span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:black'>LDAP_role_attr_mapping</span></td>
<td><p><span style='color:black'>LDAPRoleName</span></p>
<p><span style='color:black'>cn</span></p>
<p><span style='color:black'>%REPLACE_ME% LDAPRoleDesc description %REPLACE_ME%</span></p>
<p><span style='color:black'>LDAPLastUpdate whenChanged %REPLACE_ME%</span></p></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_role_object_class</span></td>
<td><span style='color:black'>groupOfUniqueNames</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_role_query_filter</span></td>
<td><span style='color:black'>(cn=*)</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_service_hosts</span></td>
<td><span style='color:black'>LDAP-hostname</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_group_flags</span></td>
<td><span style='color:black'>scue</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_member_flags</span></td>
<td><span style='color:black'>scde</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_role_flags</span></td>
<td><span style='color:black'>scue</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_sync_user_flags</span></td>
<td><span style='color:black'>scdue</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_use_ssl</span></td>
<td><span style='color:black'>FALSE</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_user_object_class</span></td>
<td><span style='color:black'>user</span></td>
</tr>
<tr>
<td><span style='color:black'>LDAP_user_query_filter</span></td>
<td><span style='color:black'>(sAMAccountName=*)</span></td>
</tr>
</tbody>
</table>
