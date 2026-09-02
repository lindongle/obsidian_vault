---
title: How to control default property value assignment w...
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

已剪辑自: <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8512888>
Teamcenter does not yet provide a way to assign a default value to a property based on user group, role or other conditional criteria. The most it will do is conditionally attach an LOV (List of Values) to a property. But customers with a large number of custom properties on their items, revisions, forms, etc. would like a way to pre-populate values in the Save interface with default values, and for those default values to change based on which site or group the current user is associated with.  

## Solution
This can be done with the integrations' attribute map, by adding a default tag as shown in the following example.  
Setup  
In this example, the customer has attached a custom property called Product Line to his custom item revision. A classic exhaustive LOV controls the allowed values for Product Line:
![image1](d3b3f1f3856b433c92ab6a314914274c.png)
LOV values:
![image2](410a61dc74b445ef915e2e47ccf3f516.png)
He wants the default value for group A to be Controls/Drivers, and the default value for group B to be Harnesses.  
Procedure  
Add an attribute map to swim.xml where pdm_name is the name of the Teamcenter property to be defaulted, and cad_name is a made-up name that will never actually exist as a CAD property. Assign the desired default value to the property in the default section1. The direction must be cadtopdm:  

![image3](040812b8e9aa4bf08339627621ffc5b2.png)
For group A, modify the startup batch file to copy the group-specific swim.xml file to the integration's client directory, so that each time the user starts SolidWorks, his swim.xml file will contain his group-specific attribute mapping. Do the same for group B, group C, etc. Each group's swim.xml file will have a different default value for the pa4ProductLine property.  
Whenever a new part of the designated type is created, the Teamcenter New and the Save dialogs will be automatically populated with the specified default value of the property:  

Group A Teamcenter New dialog:
![image4](557a3e5b31c44df1a51c1525124b14ab.png)
Group B Save dialog:  

![image5](cf638e03ef22423b99c99a9c34930c80.png)

## Hardware/Software Configuration
Platform: INTL64  
OS: windows  
OS Version: xp64  
Product: TEAMCENTER  
Application: INTEGRATIONS  
Version: V11.5.0  
Function: SOLIDWORKS  

Ref: 002-8512888  

