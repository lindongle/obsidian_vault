---
title: LDAP 同步组织结构
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:50
---

LDAP syncrhonization concepts
Objects synchronized by the ldapsync utility
The objects synchronized by the ldapsync utility are users and their associated persons, groups, roles, and group memberships. Teamcenter uses preferences set at the user location to control the synchronization process, providing flexibility in how the ldapsync utility modifies the Teamcenter database.
The ldapsync utility does not change the LDAP repository, only the Teamcenter database when differences exist between the two. The utility can generate an extensive log file that tracks objects that are modified and any error conditions encountered during execution.
Users that you synchronize with the ldapsync utility must be authenticated through Teamcenter Security Services; therefore, you must have Security Services installed.
Object nodes
The ldapsync utility recognizes the following four types of entries or nodes in an LDAP repository:
- user
- group
- role
- undefined
<img src="1ceae9f089ee9.png" alt="image1" />
Object nodes
The first three map directly to their equivalent objects in Teamcenter, with user nodes mapping to both Teamcenter person and Teamcenter user objects. The ldapsync utility also constructs group memberships from the combination of a user, role, and group node.
Undefined nodes are useful within LDAP for providing clarity to the overall structure. For example, nodes of object class ou (organizational unit) can be used to segregate users by geographical location without affecting the ldapsync utility output.
Direct and indirect memberships
Direct or indirect membership describes how parent modes trace a path to their children. In a direct membership, each child has exactly one parent and that parent-child relationship conforms to parent-child connections in the LDAP repository. In an indirect membership, a specific child node may have multiple parents, that is, more than one parent node can point the same child node.
Indirect membership is recognized by the ldapsync utility but not by the LDAP server. This type of membership is represented in the ldapsync utility by the LDAP_member_type_attr and LDAP_member_list_attr preferences at the site location. If the LDAP_member_type_attr preference value is set to true, the ldapsync utility uses the values in the LDAP_member_list_attr preference as a list of child distinguished names (DNs). Therefore, a specific child node can be included multiple times, for example, if a person (represented by a user node) belongs to several project teams (represented by group nodes) each group node can point to the same user node, rather than requiring a duplicate user node for each group’s use.
There is no way to easily determine how many indirect parents a node may have; however, this information has no known value at this time.
Internal and external objects
The ldapsync utility manages objects as internal or as external objects. Teamcenter creates all internally managed objects and only Teamcenter can modified them. The ldapsync utility can create and modify externally manage objects. An internally managed object can become externally managed. Teamcenter users, groups, roles, and group memberships are flagged as either internal or external objects.
Group membership
The ldapsync utility determines group memberships by mapping user, group, and role nodes, on a one-to-one basis, to their appropriate Teamcenter objects. Group memberships result from the relationship of these nodes in the LDAP repository. The minimum requirement for a group membership is a group node and a user node. If a default role for a group is specified, a role node is optional. The parent→child→grandchild relationship in LDAP is represented as group→optional-role-node→user. Intervening undefined nodes, such as organizational units (ou) are ignored in the path, an example of this in the LDAP repository is: group→ou1→ou2→role→ou3→user
Configuring the ldapsync utility
Configure the connection to an LDAP server
In the rich client interface, choose Edit→Options and set the following preferences under the Configuration.LDAP.Connection category:
- LDAP_admin_dn
Defines the LDAP administrator's name. Set this value to the DN of an LDAP user who has search and read permissions in the LDAP directory service.
- LDAP_admin_pw
Specifies the password for the LDAP administrator identified by the LDAP_admin_dn preference. If you do not set this preference, you must include a password using the –l argument for the ldapsync utility. Because this password is stored in the database in plain text, it is recommended that the associated account have read-only access to the LDAP.
- LDAP_cert_db_path
Specifies the path to the directory containing the cert8.db (certification database) file. the ldapsync utility uses this value only when the LDAP_use_ssl preference is set to true.
- LDAP_port_number
Defines the port number used when connecting to the LDAP directory server. It is used with the value set in the LDAP_service_hosts preference to define an LDAP directory server connection.
- LDAP_service_hosts
Lists the host or hosts that provide LDAP directory services for this installation. Valid inputs are host names or IP addresses. This value is used with the value set in the LDAP_port_number preference to define LDAP directory server connections.
- LDAP_use_ssl
Specifies whether a connection to the LDAP directory uses SSL encryption. This preference contains a logical value set to false by default. If you set this preference to true, you must also set the LDAP_cert_db_path preference.
Configure the ldapsync utility for SSL
It is recommended that you have the ldapsync utility fully functional in non–SSL mode before you configure it for secure socket layer (SSL) use. After you have the utility functioning properly, configure it to work with SSL, as follows:
- Obtain a certificate.
- Start the SSL port on the directory server.
- Verify the SSL port can be accessed using an LDAP browser utility.
- Register the directory server as a trusted server.
- Configure the ldapsync utility to use the trusted store.
Your network security administrator must perform the first three steps and they may assist you with step four. To register the directory server as trusted (step 4):
注释
For information about how to perform any of these steps, see the Mozilla web site.
- Download the certutil executable from the Mozilla web site. The executable is packaged in the NSS and NSF download packages.
- Install the certutil executable.
- Create a trusted store.
- Add the server certificate to the trusted store.
To configure the ldapsync utility to use the trusted store:
- Set the LDAP_port_number preference at the site location, for example: LDAP_port_number: 10636
- Set the LDAP_use_ssl preference at the site location, for example: LDAP_use_ssl: TRUE
- Set the LDAP_cert_db_path preferences, for example:
LDAP_cert_db_path: trusted-store-path
User and person mapping
The Teamcenter user and person objects are both mapped from the LDAP person object. When the ldapsync utility identifies an LDAP person object for synchronization, it creates both a user object and a person object in Teamcenter. The inetOrgPerson class is the standard LDAP person object class for a Sun ONE Directory Server, but you can configure this to a different class.
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image2.png" style="width:2.82292in;height:1.125in" />
LDAP person object mapping
User and person mapping preferences
These preferences are in the Configuration.LDAP.User and Person Mapping preferences category.
• LDAP_attribute_mapping
Defines the mapping of LDAP objects to Teamcenter user attributes using sets of three strings, for example:
LDAP_attribute_mapping=
LDAPPersonName
cn
%REPLACE_ME%
LDAPEngUserId
uid
%REPLACE_ME%
LDAPLastUpdate modifyTimestamp
%REPLACE_ME%
LDAPOsUser uid
%REPLACE_ME%
LDAPUserGroup
%REPLACE_ME%
Engineering
LDAPUserRole
%REPLACE_ME%
%REPLACE_ME%
Each attribute map can contain string values for the following:
- Teamcenter attribute name o Mapped LDAP attribute
- Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null
Attribute name LDAP attribute Default value Description
<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 28%" />
<col style="width: 24%" />
<col style="width: 19%" />
</colgroup>
<thead>
<tr>
<th>LDAPEngUserId</th>
<th>uid</th>
<th><blockquote>
<p>Does not apply</p>
</blockquote></th>
<th>User ID</th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAPLastUpdate</td>
<td>modifyTimestamp</td>
<td><blockquote>
<p>Does not apply</p>
</blockquote></td>
<td>Last update timestamp</td>
</tr>
<tr>
<td>LDAPOsUser</td>
<td>uid</td>
<td><blockquote>
<p>None</p>
</blockquote></td>
<td>Operating system user name.</td>
</tr>
<tr>
<td>LDAPPersonName</td>
<td>cn</td>
<td><blockquote>
<p>Does not apply</p>
</blockquote></td>
<td>Person name</td>
</tr>
<tr>
<td>LDAPUserGroup</td>
<td>Undefined</td>
<td style="text-align: center;">Engineering</td>
<td>Default group</td>
</tr>
<tr>
<td>LDAPUserRole</td>
<td>Undefined</td>
<td><blockquote>
<p>None</p>
</blockquote></td>
<td>Default role</td>
</tr>
<tr>
<td>The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter role object.</td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
注意
The LDAPUserGroup and LDAPUserRole attributes are required in Teamcenter. Therefore, you must specify either a mapped LDAP attribute or a default value for these attributes.
• LDAP_person_attr_mapping
Defines the mapping of LDAP objects to Teamcenter person attributes using sets of three strings, for example:
注释
This example uses generic person attribute values (PA1–PA10)
LDAP_person_attr_mapping=
LDAPPersonName
cn
%REPLACE_ME%
LDAPLastUpdate
modifyTimestamp
%REPLACE_ME%
PA1 postaladdress %REPLACE_ME%
PA2 localityName %REPLACE_ME%
PA3 st
%REPLACE_ME%
PA4 postalCode %REPLACE_ME%
PA5 co
%REPLACE_ME%
PA6 o
%REPLACE_ME%
PA7 employeeNumber %REPLACE_ME%
PA8
physicalDeliveryOfficeName
%REPLACE_ME%
PA9 mail
%REPLACE_ME%
PA10 telephoneNumber %REPLACE_ME%
Each attribute map can contain string values for the following:
- Teamcenter attribute name o Mapped LDAP attribute
- Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null.
Default
Attribute name LDAP attribute value Description
| LDAPPersonName | cn | Does not apply | Person name |
|----|----|----|----|
| LDAPLastUpdate | modifyTimestamp | None | Last update timestamp |
| PA1 | postaladdress | None | Address |
| PA2 | localityName | None | City |
| PA3 | st | None | State |
| PA4 | postalcode | None | Zip code |
Default
Attribute name LDAP attribute value Description
| PA5 | co | None | Country |
|----|----|----|----|
| PA6 | o | None | Organization |
| PA7 | employeeNumber | None | Employee number |
| PA8 | physicalDeliveryOfficeName | None | Internal mail code |
| PA9 | mail | None | email address |
| PA10 | telephoneNumber | None | Telephone number |
| The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter role object. |  |  |  |
- LDAP_base_dn
Defines the distinguished name (DN) of one or more nodes in the external LDAP directory where the user and person synchronization process starts. Use this to limit the extent of the ldapsync utility user and person search for performance reasons or to partition users in a single LDAP directory server instance for use with multiple Teamcenter installation. If the LDAP directory server does not have this type of organization, set this value to the lowest level DNs that encompass all Teamcenter users.
The following are examples of a high level DN and a more specific DN, respectively:
dc=siemens,dc=com
ou=Engineering Groups,ou=specials users,db=siemens,dc=com
- LDAP_ignore_users
Defines Teamcenter user IDs that the ldapsync utility does not process. The default value is infodba.
注释
The ldapsync utility never processes the infodba user even if it is not included in this list.
This allows you to include a list of user IDs that exist in Teamcenter for administrative purposes that do not have corresponding entries in the LDAP repository.
- LDAP_user_object_class
Defines the LDAP object class you use to indicate Teamcenter users to synchronize. If you use multiple classes to represent Teamcenter users, specify the common base class. The default value is inetOrgPerson.
- LDAP_user_query_filter
Defines the set of conditions an LDAP object must satisfy to match a Teamcenter user object for synchronization. Use LDAP query filter syntax for this preference value. The default value is uid=\*.
Group and role mapping
You can map the Teamcenter group and role objects from the LDAP group object and a mapped default role attribute. You can also specify roles in their own LDAP group object. A user is typically assigned a role within a group. Groups can also be nested. The standard LDAP group object class is groupOfUniqueNames, but you can configure a different class for each object type.
The standard LDAP role object is not supported for mapping to Teamcenter because LDAP roles are global and attached to the person object. Teamcenter requires role constructs that are configured specifically within the context of a group. If you require non-default roles, you may have to alter the LDAP schema.
<img src="73ae787eaa8f7.jpg" alt="image3" />
LDAP group and role object mapping
Three new LDAP object attributes are required to support group and role object mapping. Add these to the standard LDAP group object schema. Although all three attributes are optional, the following are required to support LDAP object membership models:
<table style="width:99%;">
<colgroup>
<col style="width: 52%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th>object_type</th>
<th><blockquote>
<p>Specifies a string attribute that allows Teamcenter to distinguish groupOfUniqueNames class instances represent Teamcenter groups or roles. Valid values of this attribute are group and role. The default value is group. An alternative to using this attribute is to create separate groupOfUniqueNames subclasses for Teamcenter groups and roles to differentiate them.</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>member_type</td>
<td><blockquote>
<p>Specifies a logical attribute that allows Teamcenter to distinguish the membership model to use to determine the children of this group or role. Valid values are True (indicates indirect) or False (indicates direct). The default value is True.</p>
</blockquote></td>
</tr>
</tbody>
</table>
memberDNs Specifies a list of string attributes that allow Teamcenter to find the children member DNs for the group or role for an indirect membership type. This is not valid for direct membership type.
Group mapping preferences
These preferences are in the Configuration.LDAP.Group Mapping preferences category.
• LDAP_group_attr_mapping
Defines the mapping of LDAP objects to Teamcenter group attributes using sets of three strings, for example:
LDAP_group_attr_mapping=
LDAPGroupName
cn
%REPLACE_ME%
LDAPGroupDesc description %REPLACE_ME%
LDAPLastUpdate modifyTimestamp
%REPLACE_ME%
LDAPGroupDBA
%REPLACE_ME%
0
LDAPGroupRole
%REPLACE_ME%
%REPLACE_ME%
Each attribute map can contain string values for the following:
- Teamcenter attribute name o Mapped LDAP attribute
- Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null
Default
Attribute name LDAP attribute value Description
LDAPGroupDBA Undefined None Group DBA
privilege
LDAPGroupDesc description None Group
description
LDAPGroupName cn Does not Group name
apply
LDAPGroupRole Undefined None Default role
LDAPLastUpdate modifyTimestamp Does not Last update apply timestamp
The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter role object.
- LDAP_group_base_dn
Defines the distinguished name (DN) of one or more nodes in the external LDAP directory where the group synchronization process starts. Use this to limit the extent of the ldapsync utility group search for performance reasons or to partition groups in a single LDAP directory server instance for use with multiple Teamcenter installation. If the LDAP directory server does not have this type of organization, set this value to the lowest level DNs that encompasses all Teamcenter groups.
The following are examples of a high level DN and a more specific DN, respectively:
dc=siemens,dc=com
ou=Engineering Groups,ou=groups,db=siemens,dc=com
- LDAP_group_object_class
Defines the LDAP object class you use to indicate Teamcenter groups to synchronize. If you use multiple classes to represent Teamcenter groups, specify the common base class. The default value is groupOfUniqueNames.
This allows you to define specific subclasses in LDAP to differentiate groups and roles. If your groups and roles have the same object class, use the LDAP_object_type_attr preference instead.
- LDAP_group_query_filter
Defines the set of conditions an LDAP object must satisfy to match a Teamcenter group object for synchronization. Use LDAP query filter syntax for this preference value. The default value is cn=\*.
Role mapping preferences
These preferences are in the Configuration.LDAP.Role Mapping preferences category.
• LDAP_role_attr_mapping
Defines the mapping of LDAP objects to Teamcenter role attributes using sets of three strings, for example:
LDAP_role_attr_mapping=
LDAPRoleName
cn
%REPLACE_ME% LDAPRoleDesc description %REPLACE_ME%
LDAPLastUpdate modifyTimestamp %REPLACE_ME%
Each attribute map can contain string values for the following:
- Teamcenter attribute name o Mapped LDAP attribute
- Default value used if there is no mapped LDAP attribute or if the mapped LDAP attribute value is null
Attribute name LDAP attribute Default value Description
LDAPLastUpdate modifyTimestamp None Last update
timestamp
LDAPRoleDesc description None Role
description
LDAPRoleName cn None Role name
The LDAPLastUpdate attribute is used for synchronization checks but is not set in the Teamcenter group object.
- LDAP_role_object_class
Defines the LDAP object class you use to indicate the Teamcenter roles to synchronize. If you use multiple classes to represent Teamcenter roles, specify the common base class. The default value is groupOfUniqueNames.
This allows you to define specific subclasses in LDAP to differentiate groups and roles. If your groups and roles have the same object class, use the LDAP_object_type_attr preference instead.
- LDAP_group_query_filter
Defines the set of conditions an LDAP object must satisfy to match a Teamcenter role object for synchronization. Use LDAP query filter syntax for this preference value. The default value is cn=\*.
Data synchronization preferences
LDAP data synchronization uses three preference types:
- Indirect membership preferences (LDAP_member_list_attr and LDAP_member_type_attr) These provide a link to another LDAP tree structure.
- Object type preference (LDAP_object_type_attr) This distinguish a group or role object
- Synchronization flags preferences (LDAP_sync_flag-name_flags) These provide system-wide decisions about synchronization.
These preferences are in the Configuration.LDAP.Synchronization preferences category.
- LDAP_member_list_attr
Defines the LDAP attribute containing a list of member DNs for this object. The ldapsync utility uses this value only when the LDAP_member_type_attr is set. This preference is set to uniqueMember by default.
- LDAP_member_type_attr
Defines the LDAP attribute that contains membership type (indirect or direct) for this object. The LDAP object must have an attribute that matches the value of this preference that contains a logical value indicating whether the object has indirect (false) or indirect (true) children. For example, if you set this to memberType, the LDAP object must have an attribute by that name that is set to true for indirect children or false for direct children.
This preference applies to objects representing either groups or roles defined in LDAP.
If you set this preference, you must also set the LDAP_member_list_attr preference.
- LDAP_object_type_attr
Defines an LDAP attribute that contains the object type for this object. This applies to group or role objects defined in LDAP. The object name must reference a string attribute defined in the LDAP group object that is set to either group or role. For example, if you set the preference value to objectType, your LDAP must have an attribute by that name that is set to either group or role.
- LDAP_sync_group_flags
Defines the synchronization for groups using the flags described in the following table. The deactivate flag is not valid for this preference. The default value is scue.
- LDAP_sync_member_flags
Defines the synchronization for members using the flags described in the following table. The deactivate flag is not valid for this preference. The default value is scue.
- LDAP_sync_role_flags
Defines the synchronization for roles using the flags described in the following table. The deactivate flag is not valid for this preference. The default value is scue.
- LDAP_sync_user_flags
Defines the synchronization for users using the flags described in the following table. The default value is scdue.
Flag Action Description
| c | Create | Allows creation of externally managed objects in Teamcenter. |
|----|----|----|
| d | Deactivate | Allows deactivation of externally managed objects in Teamcenter. |
| e | Externalize | Allows conversion of internally managed Teamcenter objects that have corresponding objects in LDAP to externally managed objects. |
| s | Synchronize | Enables synchronization. |
| u | Update | Allows updates to externally managed objects in Teamcenter. |
Differentiate groups and roles
There are two ways to indicate to the ldapsync utility that an object is a group or role.
You can assign a unique object class for each or use the LDAP_object_type_attr preference.
To assign a unique object class:
- Add a new object class in the LDAP server. For example, extent the groupOfUniqueNames class by adding the unique groupOfUniqueGroupNames class for groups and the groupOfUniqueRoleNames class for roles.
- Add the unique object class to the group or role that you want to define.
- Set the ldapsync preferences. For this example, set the following preferences:
LDAP_group_object_class: groupOfUniqueGroupNames LDAP_role_object_class: groupOfUniqueRoleNames
To use the LDAP_object_type_attr preference:
- Use the same object class when defining both groups and roles.
- Define a unique attribute within the object class in the LDAP server. For example, add the objectType attribute to the groupOfUniqueNames object class.
- Set the LDAP_group_object_class, LDAP_role_object_class, and LDAP_object_type_attr preferences. For this example, set the preferences as follows:
LDAP_group_object_class: groupOfUniqueNames
LDAP_role_object_class: groupOfUniqueNames LDAP_object_type_attr: objectType
Link to separate LDAP directories
The ldapsync utility reads a directory structure starting at the specified baseDN directory and continues until it has read all of the child nodes. If separate directory structures must be searched that are not under the baseDN directory, configure LDAP member attributes as follows:
- Add a unique attribute to the LDAP server, such as the LDAP_child attribute.
- Add the attribute to a group or role with the attribute value set to the other DN directory. You can configure multiple LDAP_child attributes under each group or role.
注意
To avoid an infinite loop, ensure the DN you provide in the LDAP_child attribute does not point back to the original DN.
3. Set the LDAP_member_type_attr attribute as for direct or indirect searching and the LDAP_member_list_attr attribute to the unique attribute. For example, if you add the LDAP_child attribute and are using indirect searching:
LDAP_member_type: true
LDAP_member_list_attr: LDAP_child
Synchronize Teamcenter to an LDAP repository
注释
The utility must be run from a command prompt with the proper environment settings.
1. Open a command prompt.
On Windows systems, open a command prompt with the proper Teamcenter environment settings by clicking the Start button and choosing the following menu commands:
Programs→UGS Teamcenter 11.2→Teamcenter
11.2→ service-name_configuration-ID Command Prompt
Replace service-nameand configuration-IDwith the Teamcenter service name and configuration ID you entered during installation.
2. Enter the following command to synchronize Teamcenter to your LDAP repository:
ldapsync –u=userid -p=password —g=group —l=ldap-password
Replace useridand passwordwith a Teamcenter administrative user ID and password. Replace ldap-passwordwith the password for the DN of an LDAP user who has search and read permissions in the LDAP directory service.
注释
«span style='font-size:11.0pt;background: \#EFEFEF'»The –l=«/span»ldap-passwordargument is not required for the ldapsync utility if you set the LDAP_admin_pw preference.
ldapsync utility troubleshooting
Reset an external user
Use the make_user utility to fix an object incorrectly set to internally or externally managed. The –datasource=0 argument resets the object to internally managed or the –datasource=1 sets it to externally managed. You can set the data source for users, groups, roles, persons, and group members. To set the data source for a group member, you use the –user, –role, and –group arguments together. For example, to set a user to internally managed, type:
make_user -user=user2 -datasource=0
To set a group member to externally managed, type:
make_user -user=user2 –role=role2 –group=group2 -datasource=1
ldapsync cannot find nodes
Search limitations for ldapsync
The ldapsync utility uses two kinds of LDAP searches; a base-level search (only search the current node), and a one-level search (search the current node and all nodes one level under the current node). If any of the nodes have an LDAP access control list (ACL) that prevents searches on that node, the ldapsync utility cannot analyze it and the utility cannot continue searching on any of its children. To check for an ACL that prevents searches, use an LDAP directory search tool, such as ldapsearch.
Search the base DN and one level under it
To search the base DN and one level under it, type:
ldapsearch -b o={baseDN} -h "{host-name}" -p 389 -s one "(cn=\*)"
Search the base DN only
To search the base DN only on a Sun ONE Directory Server, type: ldapsearch -b o={baseDN}
-h "{host-name}" -p 389 -s base "(cn=\*)"
Sun ONE Directory Server
The following table provides an example of configuring Teamcenter preferences to synchronize a Sun ONE Directory Server to the Teamcenter database.
Preference list Sun ONE Directory Server values
<table>
<colgroup>
<col style="width: 54%" />
<col style="width: 45%" />
</colgroup>
<thead>
<tr>
<th>LDAP_admin_dn</th>
<th>cn=Directory-Manager</th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAP_admin_pw</td>
<td>password</td>
</tr>
<tr>
<td>LDAP_attribute_mapping</td>
<td><p>LDAPPersonName</p>
<p>cn</p>
<p>%REPLACE_ME%</p>
<p>LDAPEngUserId</p>
<p>uid</p>
<p>%REPLACE_ME%</p>
<p>LDAPLastUpdate modifyTimestamp</p>
<p>%REPLACE_ME%</p>
<p>LDAPOsUser uid</p>
<p>%REPLACE_ME%</p>
<p>LDAPUserGroup</p>
<p>%REPLACE_ME%</p>
<p>Engineering</p>
<p>LDAPUserRole</p>
<p>%REPLACE_ME%</p>
<p>Designer</p></td>
</tr>
<tr>
<td>LDAP_base_dn</td>
<td>dc=company-name, dc=com</td>
</tr>
</tbody>
</table>
LDAP_cert_db_path
<table>
<colgroup>
<col style="width: 53%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th>LDAP_group_attr_mapping</th>
<th><p>LDAPGroupName</p>
<p>cn</p>
<p>%REPLACE_ME%</p>
<p>LDAPGroupDesc description %REPLACE_ME%</p>
<p>LDAPLastUpdate modifyTimestamp</p>
<p>%REPLACE_ME%</p>
<p>LDAPGroupDBA</p>
<p>%REPLACE_ME%</p>
<p>0</p>
<p>LDAPGroupRole</p>
<p>%REPLACE_ME%</p>
<p>Designer</p></th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAP_group_base_dn</td>
<td>dc=company-name, dc=com</td>
</tr>
<tr>
<td>LDAP_group_object_class</td>
<td>groupOfUniqueNames</td>
</tr>
<tr>
<td>LDAP_group_query_filter</td>
<td>(cn=*)</td>
</tr>
<tr>
<td>LDAP_ignore_users</td>
<td>infodba</td>
</tr>
<tr>
<td><p>LDAP_member_list_attr</p>
<p>LDAP_member_type_attr</p></td>
<td>uniqueMember</td>
</tr>
<tr>
<td>LDAP_object_type_attr</td>
<td>Object-type</td>
</tr>
<tr>
<td>LDAP_person_attr_mapping</td>
<td><p>LDAPPersonName</p>
<p>cn</p>
<p>%REPLACE_ME%</p>
<p>LDAPLastUpdate modifyTimestamp</p>
<p>%REPLACE_ME%</p>
<p>PA1 postalAddress %REPLACE_ME%</p>
<p>PA2 localityName %REPLACE_ME%</p>
<p>PA3 st</p>
<p>%REPLACE_ME%</p>
<p>PA4 postalCode %REPLACE_ME%</p></td>
</tr>
</tbody>
</table>
PA5 co
%REPLACE_ME%
PA6 o
%REPLACE_ME%
<table>
<colgroup>
<col style="width: 52%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th>LDAP_port_number</th>
<th>port-number</th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAP_role_attr_mapping</td>
<td><p>LDAPRoleName</p>
<p>cn</p>
<p>%REPLACE_ME% LDAPRoleDesc description %REPLACE_ME%</p>
<p>LDAPLastUpdate modifyTimestamp</p>
<p>%REPLACE_ME%</p></td>
</tr>
<tr>
<td>LDAP_role_object_class</td>
<td>groupOfUniqueNames</td>
</tr>
<tr>
<td>LDAP_role_query_filter</td>
<td>(cn=*)</td>
</tr>
<tr>
<td>LDAP_service_hosts</td>
<td>LDAP-hostname</td>
</tr>
<tr>
<td>LDAP_sync_group_flags</td>
<td>scue</td>
</tr>
<tr>
<td>LDAP_sync_member_flags</td>
<td>scde</td>
</tr>
<tr>
<td>LDAP_sync_role_flags</td>
<td>scue</td>
</tr>
<tr>
<td>LDAP_sync_user_flags</td>
<td>scdue</td>
</tr>
<tr>
<td>LDAP_use_ssl</td>
<td>FALSE</td>
</tr>
<tr>
<td>LDAP_user_object_class</td>
<td>inetOrgPerson</td>
</tr>
</tbody>
</table>
PA7 employeeNumber %REPLACE_ME%
PA8
physicalDeliveryOfficeName
%REPLACE_ME%
PA9 mail
%REPLACE_ME%
PA10 telephoneNumber %REPLACE_ME%
LDAP_user_query_filter (uid=\*)
Microsoft Active Directory
The following table provides an example of configuring Teamcenter preferences to synchronize a Microsoft Active Directory LDAP server to the Teamcenter database.
Preference list Active Directory values
<table>
<colgroup>
<col style="width: 52%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th>LDAP_admin_dn</th>
<th><blockquote>
<p>test-admin@domain.com</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAP_admin_pw</td>
<td><blockquote>
<p>password</p>
</blockquote></td>
</tr>
<tr>
<td>LDAP_attribute_mapping</td>
<td><blockquote>
<p>LDAPPersonName</p>
<p>cn</p>
<p>%REPLACE_ME%</p>
<p>LDAPEngUserId sAMAccountName %REPLACE_ME%</p>
<p>LDAPLastUpdate whenChanged %REPLACE_ME%</p>
<p>LDAPOsUser sAMAccountName %REPLACE_ME%</p>
<p>LDAPUserGroup</p>
<p>%REPLACE_ME%</p>
<p>Engineering</p>
<p>LDAPUserRole</p>
<p>%REPLACE_ME%</p>
<p>Designer</p>
</blockquote></td>
</tr>
<tr>
<td><p>LDAP_base_dn</p>
<p>LDAP_cert_db_path</p></td>
<td style="text-align: right;">dc=company-name, dc=com</td>
</tr>
<tr>
<td>LDAP_group_attr_mapping</td>
<td><blockquote>
<p>LDAPGroupName</p>
<p>cn</p>
<p>%REPLACE_ME%</p>
<p>LDAPGroupDesc description %REPLACE_ME%</p>
<p>LDAPLastUpdate whenChanged %REPLACE_ME%</p>
<p>LDAPGroupDBA</p>
<p>%REPLACE_ME%</p>
<p>0</p>
<p>LDAPGroupRole</p>
</blockquote></td>
</tr>
</tbody>
</table>
Active Directory values
%REPLACE_ME%
Designer
<table>
<colgroup>
<col style="width: 48%" />
<col style="width: 51%" />
</colgroup>
<thead>
<tr>
<th>LDAP_group_base_dn</th>
<th>dc=company-name, dc=com</th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAP_group_object_class</td>
<td>groupOfUniqueNames</td>
</tr>
<tr>
<td>LDAP_group_query_filter</td>
<td>(cn=*)</td>
</tr>
<tr>
<td>LDAP_ignore_users</td>
<td>infodba</td>
</tr>
<tr>
<td><p>LDAP_member_list_attr</p>
<p>LDAP_member_type_attr</p></td>
<td>uniqueMember</td>
</tr>
<tr>
<td>LDAP_object_type_attr</td>
<td>Object-type</td>
</tr>
<tr>
<td>LDAP_person_attr_mapping</td>
<td><p>LDAPPersonName</p>
<p>cn</p>
<p>%REPLACE_ME%</p>
<p>LDAPLastUpdate modifyTimestamp</p>
<p>%REPLACE_ME%</p>
<p>PA1 postaladdress %REPLACE_ME%</p>
<p>PA2 localityName %REPLACE_ME%</p>
<p>PA3 st</p>
<p>%REPLACE_ME%</p>
<p>PA4 postalCode %REPLACE_ME%</p>
<p>PA5 co</p>
<p>%REPLACE_ME%</p>
<p>PA6 o</p>
<p>%REPLACE_ME%</p>
<p>PA7</p>
<p>employeeNumber %REPLACE_ME%</p>
<p>PA8</p>
<p>physicalDeliveryOfficeName</p>
<p>%REPLACE_ME%</p>
<p>PA9 mail</p>
<p>%REPLACE_ME%</p></td>
</tr>
</tbody>
</table>
Active Directory values
PA10 telephoneNumber %REPLACE_ME%
<table>
<colgroup>
<col style="width: 52%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr>
<th>LDAP_port_number</th>
<th>port-number</th>
</tr>
</thead>
<tbody>
<tr>
<td>LDAP_role_attr_mapping</td>
<td><p>LDAPRoleName</p>
<p>cn</p>
<p>%REPLACE_ME% LDAPRoleDesc description %REPLACE_ME%</p>
<p>LDAPLastUpdate whenChanged %REPLACE_ME%</p></td>
</tr>
<tr>
<td>LDAP_role_object_class</td>
<td>groupOfUniqueNames</td>
</tr>
<tr>
<td>LDAP_role_query_filter</td>
<td>(cn=*)</td>
</tr>
<tr>
<td>LDAP_service_hosts</td>
<td>LDAP-hostname</td>
</tr>
<tr>
<td>LDAP_sync_group_flags</td>
<td>scue</td>
</tr>
<tr>
<td>LDAP_sync_member_flags</td>
<td>scde</td>
</tr>
<tr>
<td>LDAP_sync_role_flags</td>
<td>scue</td>
</tr>
<tr>
<td>LDAP_sync_user_flags</td>
<td>scdue</td>
</tr>
<tr>
<td>LDAP_use_ssl</td>
<td>FALSE</td>
</tr>
<tr>
<td>LDAP_user_object_class</td>
<td>user</td>
</tr>
<tr>
<td>LDAP_user_query_filter</td>
<td>(sAMAccountName=*)</td>
</tr>
</tbody>
</table>
