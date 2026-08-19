---
title: AWC表属性渲染
updated: 2026-08-19T14:17:59
created: 2026-07-05T17:04:47
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

<column width="60%">

<section >

<tableProperty name="y6_MaterialTAB">

<property name="y6_ProcurementType"/>

<property name="y6_SPProcurementType"/>

<property name="y6_NDPDStatus"/>

<property name="y6_MateriaExID"/>

<property name="y6_Factory"/>

</tableProperty>

</section>

</column>
```xml
<column width="60%">
<!-- 表属性1，可以复制，新增直接表中新增，没有导出功能，需要点击编辑显示相关按钮 -->
          <section >
            <tableProperty name="y6_MaterialTAB">            
                <property name="y6_ProcurementType"/>             
                <property name="y6_SPProcurementType"/>            
                <property name="y6_NDPDStatus"/>            
                <property name="y6_MateriaExID"/>  
                <property name="y6_Factory"/>    
            </tableProperty>   
            </section>
        </column>
        <!-- <column width="100%">
            <inject type="dataset" src="Awp0GlobalAlternatesProvider"/>
        </column> -->
        <column width="100%">
        <!-- 表属性2，不能复制，新增弹出新建界面，有导出功能 -->
            <objectSetSection titleKey="tc_xrt_TABMaterial" source="y6_MaterialTAB.Y6_TAB_Material" defaultdisplay="tableDisplay" showConfiguredRev="true">
                <tableDisplay>
                    <property name="y6_ProcurementType"/>
                    <property name="y6_SPProcurementType"/>
                    <property name="y6_NDPDStatus"/>
                    <property name="y6_MateriaExID"/>
                    <property name="y6_Factory"/>
                </tableDisplay>
                <thumbnailDisplay/>
            </objectSetSection>
```
以下对应效果图：
![[Pasted image 20260818151857.png]]