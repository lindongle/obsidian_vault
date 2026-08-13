---
title: AWC表属性渲染
updated: 2026-08-13T16:05:20+08:00
created: 2024-09-10T18:06:57
---

表属性渲染，点击==编辑==后，会自动出现添加/移除/复制按钮
```html
<section titleKey="tc_xrt_FirstTrial" initialstate="collapsed">
   <tableProperty name="y6_CRFirstReview">
		<property name="y6_IDX" width="65"/>
		<property name="y6_ReviewDepartment"/>
		<property name="y6_ReviewPeople"/>
		<property name="y6_ReviewResult"/>
		<property name="y6_ReviewerComment"/>
		<property name="y6_ReviewerDate"/>
	</tableProperty>
	<break/>                
</section>
```


![image1](f7964748a57344aa8d6c4e7793559fe2.png)
··
```html
<page title = "Table Property" visibleWhen="object_type=A2_newRevision">         
  <section title ="Employee Information - Definition Details"> 
     <tableProperty name=“a2myTestTable">            
      <property name="a2FirstName"/>             
      <property name="a2LastName"/>            
      <property name="a2EmployeeID"/>            
      <property name="a2LoginID"/>     
     </tableProperty>    
  </section>      
 </page>
```

![[Pasted image 20260812110957.png]]
![[Pasted image 20260813152020.png]]
![[企业微信截图_17866054782301.png]]