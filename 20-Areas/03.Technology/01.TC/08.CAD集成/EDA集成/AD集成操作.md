---
title: AD集成操作
updated: 2026-06-06T10:08
created: 2018-03-14T21:09:43
---

<http://www.360doc.com/content/18/1229/17/26017337_805313190.shtml>
1、打开：teamcenter-打开（或从TC中选择数据集双击打开），打开系统内已存在的PCBA主或版本item，如果改文件在EDA登台目录中已存在，则无法打开。必须通过teamcenter-检出功能，修改后，点击teamcenter-保存，然后保存设计。
2、对系统内已有的文件进行修订或另存。-teamcenter--打开，teamcenter-修订（save as）
3、修改C:\plm\Siemens\TeamcenterEDA1\eda\psw\altium下的setting.ini，part.itemid=Description（，ID必须输入在Description中

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 5%" />
<col style="width: 35%" />
<col style="width: 7%" />
<col style="width: 14%" />
<col style="width: 19%" />
</colgroup>
<thead>
<tr>
<th><ol type="1">
<li><p></p></li>
</ol></th>
<th>Site</th>
<th>EDA_PreferredLocalTS</th>
<th>String</th>
<th>dispatcher转换</th>
<th>0</th>
</tr>
</thead>
<tbody>
<tr>
<td><ol start="2" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_CheckInOptionDefault</td>
<td>String</td>
<td>自动勾选签入</td>
<td>true</td>
</tr>
<tr>
<td><ol start="3" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_ComponentItemTypes</td>
<td>String</td>
<td>BOM导入检查的是否存在的元器件类型</td>
<td>LC3_EDAComp</td>
</tr>
<tr>
<td><ol start="4" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_PWBItemTypeDefault</td>
<td>String</td>
<td>默认的PCB类型</td>
<td>LC3_PCBPanel</td>
</tr>
<tr>
<td><ol start="5" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_PWBItemTypesAllowed</td>
<td>String</td>
<td>允许的PCB类型</td>
<td>LC3_PCBPanel</td>
</tr>
<tr>
<td><ol start="6" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_CCAItemTypeDefault</td>
<td>String</td>
<td>默认的PCBA类型</td>
<td>LC3_PCBCircuit</td>
</tr>
<tr>
<td><ol start="7" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_CCAItemTypesAllowed</td>
<td>String</td>
<td>允许的PCBA类型</td>
<td>LC3_PCBCircuit</td>
</tr>
<tr>
<td><ol start="8" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_CCAVariantItemTypeDefault</td>
<td>String</td>
<td>默认的PCBA变量类型</td>
<td>LC3_PCBCircuit</td>
</tr>
<tr>
<td><ol start="9" type="1">
<li><p></p></li>
</ol></td>
<td>Site</td>
<td>EDA_CCAVariantItemTypesAllowed</td>
<td>String</td>
<td>允许的PCBA变量类型</td>
<td>LC3_PCBCircuit</td>
</tr>
<tr>
<td>10</td>
<td></td>
<td>EDA_CCABaseItemTypeDefault</td>
<td></td>
<td></td>
<td>LC3_EDACCABase</td>
</tr>
<tr>
<td>11</td>
<td></td>
<td>EDA_CCABaseItemTypesAllowed</td>
<td></td>
<td></td>
<td>LC3_EDACCABase</td>
</tr>
</tbody>
</table>
EDA_CheckComponentExistence 值为1，BOM导入时检查元器件是否存在。
EDA_CombinedBOMOptionDefault 值为默认即可，测试都可以获取。
ICS_classifiable_types值增加LC3_EDAComp，LC3_EDACompRevision

4、位号：BOM属性中的引用指示符。Bl_ref_designator。对应元器件的designator属性。
![image1](90cd83251fd24c4bbb8b1de11bdc1026.png)
5.EDA集成 元器件相同编号 合并成一行BOM行 引用指示符合并到一个格子里
— —BOM_Enable_Ref_Designator_Value_Packing修改这个首选项改为true。但必须查找编号一致才可以自动打包。
查找编号不自增的首选项：PS_new_seqno_mode，设置为existing
![image2](23e46a3e1559435fa1febadd1f5e2f4c.png)

![image3](878539d99f0743e4829f1b1161b1f3bd.png)
6、修改EDA集成首选项，必须点击Teamcenter-logout，再重新登录。
7、如果引用标识符为连续的，如C010 C011 C012，打包后会显示为C010-C012，不连续的会以逗号隔开。
8、从原理图映射到PCB，菜单栏-设计Update。。。
![image4](8e08b812a9e8431bad7483f128797e09.png)
9、AD导出excel
打开原理图或PCB，报告-bill of Material
![image5](013f854a6334472a8334a9fb62bb556c.png)
引入了一个名为EDA_ForceCheckInOptionDefault的新首选项。 当此首选项设置为true时，签入选项复选框被禁用，以强制使用首选项EDA_CheckInOptionDefault。 尚未安装（或升级到）TC11.4的用户可以在服务器上手动创建此首选项，也可以使用eda_preferences.xml（请参阅下面的B. 1a节“EDA首选项”）。

EDA_RemoveWorkingFilesOptionDefault 默认unchecked，默认不勾选，设置保存时是否默认勾选“从本地移除关联的设计文件”
<span style='color:#FA0000'>**EDA_BOMExcludeItemId 设置为TP.\*，bom更新时排除itemid为TP开头的元器件，不要漏了星号前面的.**</span>
<span style='color:#FA0000'>**EDA_BOMExcludeRefDes 设置为TP.\* ，bom更新时排除引用指示符为TP开头的元器件,不要漏了.**</span>
<span style='color:red'></span>
**EDA_CCAVariantItemTypeDefault ,默认的变量PCBA零组件类型。**
**EDA_CCAVariantItemTypesAllowed值与上面的一样。**
**EDA_CheckInOptionDefault默认为true 自动签入**
<span style='color:#FA0000'>**EDA_CombinedBOMOptionDefault设置为ForceFromSchematic 强制从原理图读取bom**</span>
**EDA_CombinedViewableOptionDefault设置为ForceFromPCB强制保存PCB可查看（PCB转换XFATF）选项**
<span style='color:red'>**EDA_ControlSavedVariants**设置为true，如果设置为true，EDA到Teamcenter时，可以独立保存某一个或几个变量PCBA，而不是必须所有变量全部保存到系统中，通过选中对应的变量条目，点击创建。默认false，全部保存。</span>
**EDA_DefaultSavedQuery可以设置为TC中用户自己已保存的查询**
EDA_DefinePWBWith默认schematic，指PCBA另存时，是否将原理图设计或PCB电路板设计复制到新版本。如果设置为none，则新生成的PCBA无原理图和PCB图
EDA_DesignReviseSync默认False，PCBA另存时是否自动修订PCBA或PCBA基座。
EDA_FutureVariantName默认futureVariant，设置保存时默认的变量名称。
EDA_PcbBOMOptionDefault默认空，签入、另存或保存时是否执行保存BOM
EDA_PcbLockingDynamic默认True，签出PCB时，同时锁定PCBA版本
**EDA_PcbViewableOptionDefault设置为ForceWithViewable，另存时PCB强制设置为保存可查看的。**
**EDA_PreferredLocalTS设置为0，不使用本地转换，远程转换。**
EDA_SaveIntermediateDS默认0，PCB转换XFATF，不保存中间文件。
EDA_SchematicBOMOptionDefault默认无，原理图设计签入、保存、另存时是否保存BOM。
EDA_SchematicItemTypeDefault默认EDASchem，原理图零组件的默认零组件类型。--不清楚原理图零组件是什么鬼。
<span style='color:red'>EDA_SearchList,查询列表清单--必须配置查询名称的英文名称（如果主站点语言是英文）</span>
EDA_SharePWB默认false，PCB电路设计版是否可以由多个PCBA借用共享。
<span style='color:red'>EDA_Workflows设置ABC样流程。在EDA环境下发起流程的流程模板清单。必须先打开tc中的设计才能使用此功能</span>
EDAGenPCBCAD
**EDA_SaveAsForceVariant：--将系统中非变量设计的PCBA强制转换为变量设计的方法（自动生成一个PCBA基础）**
1\. 将 EDA_SaveAsForceVariant 首选项的值更新为 true。该值指定使用 EDA 变量对象模型在
Teamcenter 中保存先前未在Teamcenter 中保存的非变量ECAD 设计。
2\. 更新 EDA_FutureVariantName 首选项的值。默认值为 futureVariant。
当您将非变量设计保存至 Teamcenter 并且 EDA_SaveAsForceVariant 的值为 true 时，
EDA_FutureVariantName 首选项的值会作为 PCA 变量对话框中的变量名称。PCA 变量对话框中
变量名称的值不能更改。
指定新的非变量ECAD 设计应通过另存为（新）命令在Teamcenter 中作为变量设计保存

PS_Reference_Designator_Validation首选项设置为true，验收引用指示符必须按照大写字母+数字格式，或大写字母+数字+大写字母+数字的格式。如C100或ZK10ZK20，如果出现其他则报错。
BOM_Enable_Quantity_Validation_Against_Ref_Designator首选项设置为true，验证数量与引用指示符数量一一对应。如当一行数量为空或为1时，引用指示符也必须只有一个，如果有多个则报错。

定制用户界面中的缩略词
默认情况下，EDA 在用户界面中使用以下缩略词代指电子设计对象：
• PCA,即PCBA(Printed Circuit Board Assembly)印制电路板装配或印制电路板总成
) 代表印刷电路装配。 该词在早期版本的 EDA 中显示为 CCA（电路卡装配）。
• PCABase 代表印刷电路装配基础。该词在早期版本的 EDA 中显示为 CCABase。
• PWB （printed wiring board）及PCB，代表印刷电路板。
如果您的ECAD 设计人员使用不同的缩略词，Teamcenter 管理员可通过创建
TC_ROOT\lang\textserverlocale\eda0_text_locale.xml 文件的定制文本副本覆盖默认值。对于每
个 custom-name_text_locale.xml 文件，找到文件中的以下行并根据需要编辑显示文本：
\<key id="Eda0_PCA"\>PCA\</key\>
\<key id="Eda0_PCAToolTip"\>Printed Circuit Assembly\</key\>
\<key id="Eda0_PCABase"\>PCABase\</key\>
\<key id="Eda0_PCABaseToolTip"\>Printed Circuit Assembly Base\</key\>
\<key id="Eda0_PWB"\>PWB\</key\>
\<key id="Eda0_PWBToolTip"\>Printed Wire Board\</key\>

另存界面选择变量创建：选择某一个变量，点击创建。
![image6](cc29ab7599fc4e7e8a747f9c860ca149.png)

存在变量时，一直提示系统内不存在对应零组件。检查变量设置时，用于替换的元器件是否description也同样设置了对应编号。工程--安装变量
![image7](309233d24602461b98b86bd60b23886f.png)

默认原理图及PCB图
![image8](69f0ae9f69304639a0ef05459d46e479.png)
从上到下分别对应BMIDE中的PCBFATF（轻量化转换的PCB文件）、EDAGenPCBCAD（PCB图）、EDADesAltiumBrd（原理图）三种类型
修改集成保存时的上述原理图、PCB图的类型，只能修改原理图类型，PCB图类型修改后，PCB图进不了系统。
![image9](5cde7ad565094c008cd0cb9318b0a6f3.png)

![image10](c541f730c9a6440fa97bda1b890a1a57.png)

PCB转换如果dispatcher中提示无结果，需修改D:\Apps\Dispatcher\Module\conf\translator.xml，转换路径改成如下，然后重启三个服务。
![image11](b1ec4d6bfec448de98ada20370cc5ae2.png)

使用AD中菜单Teamcenter-revise，修订时，上一版本必须发布，否则界面没有修订菜单。

变量设计后替换的元器件在BOM中体现还是在全局备选件中体现
![image12](0efa9e0ddce241298ea981b6e3fc5be1.png)

以下两个EDA集成的区别
![image13](22d539202d524571ba4885a80217e531.png)
<span style='color:#FA0000'>1）Altium是专门针对AD的集成开发组件，EDA是各个电器设计软件通用的功能。安装Altium1.0之前必须先按照EDA客户端。</span>

**PCBA装配基座**
--选配PCBA装配版本--变量一
--PCB空板
--选配后元器件
--选配PCBA装配版本--变量二
--PCB空板
--选配后元器件
--PCB空板版本
--原理图零组件版本
--PCB图文件
--原理图文件
--视图（配置BOM）
--PCB空板
--全配置元器件

![image14](d4fe8b6ff1bf4559a21c9405d36e3f47.png)

