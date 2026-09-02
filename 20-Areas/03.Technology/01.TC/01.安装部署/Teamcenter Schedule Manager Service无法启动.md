---
title: Teamcenter Schedule Manager Service无法启动
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:09:03
tags:
  - TC安装部署
---

用户名必须是projproxy，在TC中创建改用户，且在tem中安装时，密码必须与tc中该用户的密码一致。

- Teamcenter Schedule Manager Service not starting. 
- Symptom
- Teamcenter Schedule Manager Service not starting. Giving below error:  

    

  Windows could not start the Teamcenter Schedule Management Service on Local  

  ANALYSIS:  

  This service is owned by ProjProxy user. Make sure ProjProxy user is created in Tc organization.
- Hardware/Software Configuration
- Platform: INTL64  
  OS: WINDOW  
  OS Version: 2008_R2  
  Product: TEAMCENTER  
  Application: SCHEDULE_MGR  
  Version: V10.1.7  
  Function: OTHER
- Solution
- Create Proproxy user in Teamcenter organization and then try to start Teamcenter schedule manager service.  

  This time service should start without any error.

*From \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&q=Teamcenter+Schedule+Management+Service&file_type=html&i=002-8001237&k=4&o=0>\>*

- Schedule Management Service Fails to start due to login failure.
- Symptom
- ---------------  
  Schedule Management Service Fails to start due to login failure.
- Hardware/Software Configuration
- Platform: INTL64  
  OS: WINDOW  
  OS Version: 764SP1  

  Family: TEAMCENTER  
  Application: INSTALL_CONFIG  
  Function: UNDETERMINED  
  Subfunction: ALL  
  Release: V10.1.3.2
- Solution
- The projproxy user needs to be manually created post TEM install. The schedule  
  management service uses only projproxy user for login and subsequent actions.  

  No other user will work for starting the schedule management service. The  
  projecttrans translator is totally independent of the schedule management  
  service and has a totally different purpose.  

  The schedule management service is a daemon that launches workflow on schedule  
  tasks based on the scheduled start date trigger type whereas the projecttrans  
  is an asynchronous translator required for certain business logic validation  
  invoked from the server. Changing the user in the projecttrans configuration  
  will have no impact on the startup of the schedule management service.

*From \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&q=Teamcenter+Schedule+Management+Service&p=2&file_type=html&i=001-7406475&k=0&o=20>\>*

