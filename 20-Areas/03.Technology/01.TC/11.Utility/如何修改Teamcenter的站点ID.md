---
title: 如何修改Teamcenter的站点ID
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:46
---

如何修改Teamcenter的站点ID
2019年7月10日
0:19

How to change Teamcenter Site ID

After cloning the production environment to update a development environment the customer had a need to access both environments with the same client. Both environments having the same Site ID caused FMS issues.
Two sites having the same Site ID could result in customer data being written to the wrong location and possible data corruption.
In Tc10.1.4 and later, you can create a new FMS enterprise ID for your cloned environment which let FMS support to switch between cloned and original environments.
All Teamcenter related services must be stopped.
In a Teamcenter command window execute the generate_site_id utility.

![image1](ec225cfffcb04d6aa7ab74dc206396e7.png)
Execute install -set_internal_site using the new site id.

![image2](2f2ccae0e4a045889cc9d62a14b89c79.jpg)
Execute the backup_xmlinfo utility
![image3](e609ad64a5004620a60925caee8ecfdc.png)
Locate backup.xml file created from working directory
Open this file to validate new Enterprise ID

![image4](8f3a2db604434b37bdc304a92d4dbed0.png)
Update the fmsmaster file(s), including the enterprise id, with the information from the backup.xml file that was created by the backup_xmlinfo utility.
![image5](b1048fdecc1b4f1192ed5eccb5f2b5e9.jpg)
Restart all Teamcenter services.
Logon and test Teamcenter file access.
[Change-Teamcenter-Site-ID.docx](5968b2b1c1914d8bba44f6506efb9389.docx)

