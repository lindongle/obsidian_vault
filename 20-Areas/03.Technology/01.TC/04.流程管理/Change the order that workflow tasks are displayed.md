---
title: Change the order that workflow tasks are displayed...
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:42
---

- Change the order that workflow tasks are displayed on Assign All Tasks view
- Symptom
- ---------------  
  We would like to be able to change the order of and remove workflow tasks from  
  the list on the Assign All Tasks tab of the New Process Dialog when submitting  
  an object to workflow.
- Hardware/Software Configuration
- «span style='color:#333333'»Platform : INTEL  
  OS : 2008_R  
  OS Version : 2008_R2«/span»
- Solution
-  The tasks listed under resources in the Assign All Tasks are listed in the  
  order the Tasks are executed in the workflow.  

  To demonstrate, I created 4 DO tasks in a new workflow, 1-4.  
  I rearranged the tasks to execute as Start-3-2-4-1-Finish  

  Created a new Process and click on the Assign All Tasks tab and the Tasks are  
  listed in the following order  
  Do Task 3  
  Do Task 2  
  Do Task 4  
  Do Task 1  

  I took the workflow offline and changed the order of the tasks in the workflow.  

  Creating a new process showed the tasks listed in the new order.  

  Conditional tasks and/or Or tasks will not necessarily appear in the correct  
  order, as order is determined during Process Execution.  

  The order displayed in Assign All Tasks, is the same order that is displayed  
  in the Workflow Designer with the exception of Tasks that are not assigned to  
  people (such as OR tasks require no user intervention)

*来自 \< <https://solutions.industrysoftware.automation.siemens.com/view.php?sort=desc&q=Change+the+order+that+workflow+tasks+are+displayed+on+Assign+All+Tasks+view&file_type=html&i=001-6807157&k=2&o=0>\>*

