---
title: Adding custom fields for Schedules with Teamcenter...
updated: 2026-06-06T10:08:54
created: 2026-07-05T17:04:46
---

上午

已剪辑自: <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8608667?pid=sc%3Asr-open&index=content-external&audience=external>
**Adding custom fields to Schedules and Program Views with Teamcenter 10.1**
In this document, we will focus on how to create a new custom task attribute in BMIDE for use with Schedules and Program Views. This document assumes you have a working knowledge of BMIDE and does not provide an in-depth look at how to use BMIDE. We will add a new custom attribute for a task that you can view/edit in the schedule and also use for Program Views.
**1) Create your custom Schedule task attribute in BMIDE (BMIDE)**
Locate the Business Object “ScheduleTask”
Create a new task attribute (no extended tutorial here…)
![image1](5d4d1a75145c4a5ebdf21d58b02ee7e0.png)
**Figure 1**
![image2](3c86b7841fe144e09aa41bf83558b7d1.png)
**Figure 2**
![image3](b272494ab2534b7d873c3aceb41a6873.png)
**Figure 3**
a\. Add the new custom field as an “Operation Descriptor”
b\. Save Data Model
c\. Deploy Tempate
d\. Login to Rich Client
**2) Modify Preferences (Rich Client)**
*a. Schedules*
**Add {object_type}.{attribute_name} to this preference:**
ScheduleTaskAvailableAttributeswithRelations (for normal schedules)
![image4](ab728223c33445749bdec6ec8573249a.png)
NOTE: This is the “internal storage name” and NOT the “display name”. Refer to **Figure 2** above for details.
*b. Program View*
**Add {object_type}.{attribute_name} to these three preferences:**
ScheduleTaskAvailableAttributes (for Program View)
ProgramViewFilterProperties
ProgramViewGroupProperties
![image5](350e742118ca4102b2ecc15760830e63.png)
![image6](6b5c06b6082e432ead0900baead72ecc.png)
![image7](f735fd80c7ac4be98aadcf29eec06d56.png)
**\*\* Results you will see in Program View after modifying these preferences**
Can see the new custom task attribute in the Column Chooser
Can Group By or Filter By using the custom task attribute on a ScheduleTask
Go to section 4 for screenshots of Program View
**3) Modify Stylesheet if you want to edit/change this custom task attribute**
**from inside Schedule Manager (Rich Client)**
**Add {attribute_name} to the ScheduleTask XMLRenderingStylesheet**
![image8](5b28be6fa44d44adaa5e68ba0ab06c30.png)
I inserted this value:
**mw3SpecialComments**
**(internal name, NOT the display name)**
**RESTART THE RICH CLIENT NOW**
**4) Screenshots of new custom attribute in Schedule Manager and Program View (Rich Client)**
**a. Column Chooser in a schedule**
![image9](c14c1c3c6d124703ba1b7cb24a1cd994.png)
**b. Tree Table and task properties in a schedule**
![image10](f2f8450568754549b98ae72697256ccf.png)
When I click on OK or Apply, my new text would appear in the “Special Comments” field in the schedule.
**c. Program View Column Chooser and Program View Main View**
![image11](d94e3cab714e45ff8b7aac1c76926e6a.png)
**d. Program View “Group By”**
![image12](33f17682914047069a1e2febd4e85a95.png)
**e. Program View “Filter By”**
![image13](3603e5d68f7a4098a5c635ce20196685.png)
**NOTE: If you see an error about schema being out of date when you login to RAC, try this:**
![image12](33f17682914047069a1e2febd4e85a95.png)
There won’t be any positive feedback onscreen. This will allow things to “sync up” and you can log into the Rich Client without getting any “schema out of date” messages.
