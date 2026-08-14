---
title: EDA集成配置
updated: 2026-06-06T10:09:06
created: 2026-07-05T17:05:04
---

![image1](24c78452c3004fb5bfc0d062919313fe.png)
D:\Siemens\TeamcenterEDA6\eda\orcad_schematic_config.xml

2.  \<PartInBom id="Part Number" name="Value" refdes="Reference"/\>
定义保存时，弹出的BOM对比界面上列与Orcad属性的映射
![image2](5a85cf808884412b9be5d439e32eaa6e.png)

![image3](cd3da6d567684ed6921968d764579ff8.png)
id - 定义元件编号的元件参数(零组件编号)
name - 定义组件名称的组件参数（零组件名称）
refdes - 定义参考指示器的元件参数（引用指示符，位号）
1.  根据位号过滤不需要导入BOM的位号，如以下，TP开头的不需要导入（测试用），与首选项**EDA_BOMExcludeRefDes功能类似**
\<BomFilter field="Reference"\>
\<Exclude\>TP\*\</Exclude\>
\</BomFilter\>
2.  \<BomCompare dialog="g2" item_query="Item Revision..."/\>
如果未设置，则使用来自连接器的 BOM 比较对话框，这对应于默认设置 g2 。 ■ 如果设置为 true ，则使用来自 EDA 网关的 BOM 比较对话框。 ■ 如果设置为 false ，则不使用 BOM 比较对话框。
3.  根据id过滤不需要的组件
\<BomFilter field="id"\>
\<Exclude\>TP\*\</Exclude\>
\</BomFilter\>
field：定义组件参数的名称。 ■ Include：定义组件参数中具有此值的 BOM 项，以将其包含在 BOM 中。 ■ Exclude：定义组件参数中具有此值的 BOM 项，以将其从 BOM 中排除。
4.  定义没有设置零件号时，默认零件号
\<BomReplaceMissingPartNumbers
missing_part_number="00001234"
item_query="Item - simple"
ignore_missing="true"
/\>
5.  定义原理图或layout图中为机械件的标识，即元器件属性包含参数MECH_PN则设置为机械件
\<MechPartNumber
field="^MECH_PN"
/\>
定义一个正则表达式，从某个部件的参数表中选择包含机械部件编号的参数，编号为 PART1 的组件包含参数 MECH_PN1。此参数用于保存机械组件的编号。正则表达式 ^MECH_PN 选择以 MECH_PN 开头的所有参数，并将它们作为组件 PART1 的机械组件添加到 BOM 中
6.  控制提取元器件的哪些属性，以提高性能，默认全部属性
\<RDNAttributes value="all"/\>

\<RDNAttributes value="minimal"/\>

\<RDNAttributes\>
\<RDNAttribute
name="Cost"
tc_name="tce_custom_cost"
instance_attr="false"
/\>
\</RDNAttributes\>
使用此设置，仅提取已定义的组件属性和必需的属性。要在 BOM 比较对话框中显示和比较这些属性，请添加以下选项：
tc_name : 定义 Teamcenter 中的属性字段
name：组件属性被视为实例属性，并显示在 BOM 比较对话框的 Refdes BOM 选项卡中，元器件属性
instance_attr="false"：组件属性不被视为实例属性，并显示在 BOM 比较对话框的“数量 BOM”选项卡中
7.  关联Layout图的位置
\<CollaborationFiles default-dir = "{design.dir}/brd" default-file = "{design.name}\_INCREMENTAL_DATA.idx"/\>

\<INSTALL_DIR\>\\product\>\config\ivs.properties
配置错误发送邮件

配置语言
默认情况下，集成使用与环境变量 TCEDAECAD_LANGUAGE 中为 EDA Gateway 定义的语言相同的语言。 但是，您可以配置集成以使用特定语言。编辑目录 \<INSTALL_DIR\>\\PRODUCT\>\config\environments 中的文件 init_env.bat，并在文件末尾使用 SET INTEGRATE_LANG=\<language code\> 设置新语言，然后重新启动 IVS。或者，您也可以在 Windows 下设置变量 INTEGRATE_LANG。
![image4](ad9cf554bfff474290c8fafc5607136d.png)

![image5](ada1b192d47d496f9bc3c243452555ac.png)

