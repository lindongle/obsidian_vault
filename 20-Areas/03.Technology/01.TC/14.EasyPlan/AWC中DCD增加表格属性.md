---
title: AWC中DCD增加表格属性
updated: 2026-06-13T15:22:41
created: 2026-07-05T17:04:48
---

1.创建表对象，添加定制属性
![image1](d66eea480eec405d8129d53378fc98a7.png)
2.定制对象下新建表格属性
![image2](551f0fd4702c4a0bb98984d031dcc8f0.png)
3.根据已有的渲染创建定制渲染
![image3](62d1090f7fe246ab975e959269b08035.png)
\<objectSetSection titleKey="tc xrt MEDCDTable" source="y6_MEDCDTable.Y6_TAB_MEDCD" defaultdisplay="tableDisplay” showConfiguredRev="true"\>  
\<tableDisplay\>  
\<property name="y6_current'/\>  
\<property name="y6_voltage"/\>  
\<property name="y6_gasflow"/\>  
\<property name="y6_weldwire"/\>  
\<property name="y6_protectgas"/\>  
\<property name="y6_soldertoe"/\>  
\<property name="y6_weldwidth"/\>  
\</tableDisplay\>  
\<treeDisplay\>  
\<property name="y6_current"/\>  
\<property name="y6_voltage"/\>  
\<property name="y6_gasflow"/\>  
\<property name="y6_weldwire"/\>  
\<property name="y6_protectgas"/\>  
\<property name="y6_soldertoe"/\>  
\<property name="y6_weldwidth"/\>  
\<thumbnailDisplay/\>  
\</treeDisplay\>  
\<listDisplay/\>  
\<command actionKey="newBusinessObjectContextualAction" commandld="com.teamcenter.rac.common.AddReference" renderingHint="commandbutton"/\>  
\<command actionKey="pasteAction" commandld="com.teamcenter.rac.viewer.pastewithContext" renderingHint="commandbutton"/\>  
\<command actionKey="cutAction" commandld="org.eclipse.ui.edit.cut" renderingHint="commandbutton"\>  
\<parameter name="localSelection" value="true"/\>  
\</command\>  
\</section\>
效果：
![image4](9eed3c3fb11146688e3c4fbe2eb3fcdd.png)
4.表创建渲染
![image5](1743a7c3c50b4505b53f2e121917b1d9.png)

效果：
![image6](faae30adb5fd488592dae6fb396854f0.png)
5.创建定制首选项
![image7](95eadf9187bc4922815bae77574557b9.png)

