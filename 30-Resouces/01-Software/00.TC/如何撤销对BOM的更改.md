---
title: 如何撤销对BOM的更改
updated: 2026-06-13T22:08:30
created: 2026-07-05T17:04:52
tags:
  - TC
---

如何撤销对BOM的更改
2019年7月31日
0:44

## <span style='color:#2E75B5'>如何撤销对BOM的更改 </span>
<span style='color:black'>**适用版本：Teamcenter10**</span>
<span style='color:black'>在Teamcenter结构管理器中更新装配件时，用户因为某些原因执行了删除行操作，而现在又想在保存之前还原该删除的行，该如何实现呢？</span>
<span style='color:black'>以当前用户身份登录Teamcenter系统，搭建一个BOM，此时“还原所有已标记待处理编辑”按钮和“还原对已选中BOM行所做的已标记待处理编辑”按钮呈现灰色，如图1所示。</span>
![image1](4d464e3cde0043f5b44a3529d4c7757d.png)
<span style='color:red;text-align:center'>**图1**</span>
<span style='color:black'>在对装配件（BOM）进行更新时，为了能够轻松显示出新添加或者新删除零件，用户可以通过设置当前用户级别的首选项来显示结构管理器待处理编辑的标记。</span>
<span style='color:black'>点击菜单“编辑Ò选项”，如图2所示。</span>
![image2](55bea16586b34aa39419f9950d57d7f8.png)
<span style='color:red;text-align:center'>**图2**</span>
<span style='color:black'>左侧选项列表选择“产品结构”，然后勾选右侧“显示待处理编辑的批注”，然后点击“应用”，如图3所示。</span>
![image3](5a8f5b4bcfe34d39b29ec9bd754f9e54.jpg)
<span style='color:red;text-align:center'>**图3**</span>
<span style='color:black'>或者以管理员身份登录Teamcenter系统，点击菜单“编辑Ò选项”（图2），弹出选项窗口，点击下方“搜索”，输入关键字“PSE\_\*”，找到站点首选项</span><span style='font-weight:bold;color:#FF2941'>PSE_Display_Pending_Edits</span><span style='color:black'>，如图4所示。</span>
![image4](7cea747de1c24a8b9b43e7b2c691c754.jpg)
<span style='color:red;text-align:center'>**图4**</span>
<span style='color:black'>点击编辑，修改值为true，点击保存，如图5所示。</span>
![image5](ee574a8a97ec4594a89b071922c0d676.jpg)
<span style='color:red;text-align:center'>**图5**</span>
<span style='color:black'>一旦设置了首选项</span><span style='font-weight:bold;color:#FF2941'>PSE_Display_Pending_Edits=true</span><span style='color:black'>，那么所有用户在修改BOM结构的时候，可以将BOM结构中以高亮显示的尚未保存的修改撤销。</span>
<span style='color:black'>重新以普通用户登录登录Teamcenter系统，进入结构管理器，执行添加新行、移除BOM行操作。用户添加新BOM行的时候，新加零件显示为绿色；用户移除BOM行的时候，被移除BOM行显示为红色的中划线，如图6所示。</span>
![image6](3d33648ae4bf49fc95804ac4afb047a7.jpg)
<span style='color:red;text-align:center'>**图6**</span>
<span style='color:black'>然后用户选择新修改而尚未保存的BOM行。绿色表示的新增加的BOM行，红色中划线表示的删除的行，用户可选择一行或者多行。使用工具栏按钮“还原对已选中BOM行所做的已标记待处理编辑”</span>
![image7](4b428e9dd2944ded82a85edcb64536c3.png)
<span style='color:black'>（图7），在弹出的确认窗口下点击“是”，如图8所示。</span>
![image8](03df3a6f62af4050baedfbbf063c64ee.jpeg)

<span style='color:red;text-align:center'>**图7**</span>

![image9](ab3bc35ba9d9486899bdf5cf6f154ac9.png)
<span style='color:red;text-align:center'>**        图8        **</span>
<span style='color:black'>还原对已选中BOM行所做的已标记待处理编辑后，效果如图9所示。</span>
![image10](4cff81b767d2437eb8531cae963f48ca.jpg)
«span style='color:red;text-align:center'»**图9  **
«/span»
<span style='color:black'>如果用户点击“还原所有已标记待处理编辑”按钮</span>
![image11](8465024575634d28baf2c2e4132e0af1.png)
<span style='color:black'>，可以撤销当前页面高亮显示的所有尚未保存的修改（图10），在弹出的确认窗口下点击“是”，在如图11所示。</span>
![image12](49f03a52c76e4e20baac9af15f9d3623.jpeg)

<span style='color:red;text-align:center'>**图10**</span>
![image13](989eeea594f848c9ae21ca94a314e526.png)
<span style='color:red;text-align:center'>**图11   **</span>
<span style='color:black'>还原所有已标记待处理编辑后，效果如图12所示。</span>
![image14](905e57f09c73419091bc2f633bcf0eef.jpg)
<span style='color:red;text-align:center'>**图12**</span>
<span style='color:black'>显示待处理编辑的批注和还原已标记待处理编辑两者结合在一起使用，便于用户轻松查看对BOM行所做的更改，并且可以在保存之前及时撤销不正确或者不合理的BOM行操作</span>
