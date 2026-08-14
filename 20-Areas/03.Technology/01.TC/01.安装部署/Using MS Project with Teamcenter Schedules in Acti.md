---
title: Using MS Project with Teamcenter Schedules in Acti...
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

Using MS Project with Teamcenter Schedules in Active Workspace 5.1 Symptom We are moving to Active Workspace 5.1 and we don't plan on using the Rich Client except for administrative work and some testing.
What steps do we need to support data exchange between Microsoft Project and Teamcenter schedules in Active Workspace?
Hardware/Software Configuration Platform: INTL64 OS: WINDOWS OS Version: 1064 Product: TEAMCENTER Application: ACTIVEWORKSPACE Version: V5.1 Function: SCHEDULE_MGR Solution There is no longer a standalone Microsoft Project plug-in that you can install "on its own" for use with Schedule Manager.
Starting with Teamcenter 11.4 or 11.5, Microsoft Project support for Teamcenter schedules is included in the "Client for Office" functionality.
Please start here: <https://docs.sw.siemens.com/en-US/product/282219420/doc/PL20200604175551201.Configuration/html/xid1599815> Integrating Microsoft Project with Teamcenter As a system administrator, complete the following tasks to support Active Workspace and Microsoft Project integration. This functionality is useful if there are employees in your organization who are responsible for updating schedule tasks but don't use Active Workspace or Schedule Manager.
Integrate Microsoft Project with Teamcenter Install Microsoft Project on your server.
Install Client for Office using the stand-alone installer. Select the Microsoft Project plugin in the Select Features dialog box.
Configure Teamcenter to support Microsoft Project Prevent updates of schedules or tasks in certain states.
Map custom schedule task properties between Microsoft Project and Teamcenter. This ensures that when a Microsoft Project schedule is imported into Teamcenter Schedule Manager, the custom property data is automatically transferred and does need to be manually reentered. This procedure is discussed in the Exchanging data between Microsoft Project and Schedule Manager section of the rich client Schedule Management documentation.
