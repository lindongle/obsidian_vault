---
title: Swim.properties关键配置
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:44
---

**registernew.enable.manual.itemid =** true
此首选项控制是否允许用户在从 SOLIDWORKS® 中创建新的 Teamcenter 项目时分配自己选择的项目 ID。将此首选项更改为 false 将强制用户从 Teamcenter 分配项目 ID，通常是为了满足命名规则要求。
**SW2_CacheFolder = \${USERPROFILE}\\Siemens\\swcache**
所有用户工作区都在指定的产品配置位置下创建和管理。此首选项的 OOTB 值为 %USERPROFILE%\Siemens\swcache
**iman.workspace.maxnumberfiles = 5000**
为了获得最佳性能，重要的是要防止任何单个托管工作区的文件数量增长过大。工作区中的文件数量过多会降低缓存管理器启动和刷新的性能。此首选项允许站点管理员将工作区的大小限制为能够容纳预期保存到 Teamcenter 或从中打开的最大装配体的大小。默认5000
**iman.bomrevisionruledefault**
从tc中打开时的默认版本规则
**iman.bomrevisionrule.allowed**
当此首选项保持未设置时，Teamcenter 中定义的所有修订规则都可从“打开”对话框的下拉选择列表中获得。站点管理员可以通过为该首选项分配以冒号分隔的值来控制可用修订规则集。此外，下拉列表中可用修订规则的排序将与分配给首选项的值的排序相匹配。
![image1](6205a6cdbed340c3a1a078658923626a.png)
**checkin.after = keep**
使用“另存为”、“全部保存”和“签入”命令时，“保存时操作”对话框的默认“保存时操作”选项。允许的值为“签出”、“删除”和“保留”。此选项仅适用于选择保存的模型。
![image2](14f63d920bcb4cca9c43c9812ec7d9f8.png)
**sw.default.model.permission = readonly**
\# 控制尚未在 Teamcenter 中检出的 SolidWorks 模型的默认文件权限的选项。 如果设置为“只读”，用户将无法通过 Solidworks 保存模型。 用户必须先通过任务窗格签出模型，然后才能将修改保存到磁盘。 如果设置为“读写”，用户将能够将模型保存到磁盘，而无需在Teamcenter中签出模型。
**\# sw.checkout.reminder = true**
\# 此首选项用于启用模型的签出提醒。
默认值 true 会导致当用户在 SolidWorks 中修改模型时出现签出提醒对话框。 设置为 false 时，在尝试修改模型时，不会要求用户签出模型。
设置为 true 时，集成窗口将是所有应用程序中最顶层的窗口。
**iman.autorename.itemid = true**
控制在 swimrename实用程序重命名模型时是否自动更改零组件的 ID 以匹配 SolidWorks 模型名称的选项。 允许的值为真或假。 如果为 true，则与模型的旧名称匹配的零组件 ID 将自动更改以匹配新名称。 如果为 false，则当 swimrename更改模型名称时，零组件 ID 不会自动更改。

**\# iman.autorename.itemname = false**
\# 选项，用于控制当 swimrename 实用程序更改 SolidWorks 模型的名称时，或者在“保存”中更改项目 ID 时，是否自动更改零组件名称
对话。 允许的值为真或假。 如果为 true，则当 swimrename 实用程序重命名模型时，与模型的旧名称匹配的零组件名称将自动更改以匹配模型的新名称;如果在“保存和管理新 ID”对话框中更改了零组件 ID，则与零组件的旧 ID 匹配的零组件名称将自动更改为与新 ID 匹配。 如果为 false，则在以下情况下，零组件名称不会自动更改 模型名称或物料 ID 更改。
**\# iman.autorename.other = true**
\# 选项，用于控制当 swimrename 实用程序更改 SolidWorks 模型的名称时，是否自动重命名项目或项目修订中的“其他”对象。 “其他”对象的示例包括表单和非 SolidWorks 数据集。允许的值为真或假。 如果为 true，则与模型的旧名称匹配的对象名称将自动更改以匹配新名称。 如果为 false，则当 swimrename 更改模型名称时，其他对象的名称不会自动更改。 用于确定模型名称是否与另一个对象的名称匹配的规则由 iman.autorename.other.exactlength 选项设置。
**\# iman.autorename.other.exactlength = false**
\# 选项，用于确定当 iman.autorename.other 选项允许重命名数据集、表单和其他对象时如何匹配名称。 允许的值为真或假。 在确定 SolidWorks 模型名称是否与 Teamcenter 中对象的名称匹配时，true 表示如果名称长度完全相同且字符与字符匹配，则名称匹配，忽略大小写。 False 表示如果对象的名称以模型名称开头，则名称匹配，忽略大小写。 为
例如，假设一个模型名为“WIDGET”，而 iman.autorename.other.exactlength 为 true。 名为“WIDGET”的数据集将与模型名称匹配，但名为“WIDGET/A”的数据集与模型名称不匹配。 如果 iman.autorename.other.exactlength 为 false，则 “WIDGET/A” 也将与模型名称匹配。
**checkin.ignoremissing = prompt**
客户的 CAD 装配体通常包含对过时依赖项的引用，或对 SOLIDWORKS® 会话不可用的模型的引用。将装配体保存到 Teamcenter 时，集成将发现这些并将其报告为缺失参考，并询问用户是否继续保存。一些客户在这种情况下拥有如此多的数据，以至于他们不想在每次保存时看到警告对话框，这可以通过将首选项从提示更改为始终来配置。
用于控制当选择保存的模型依赖于不在 SolidWorks 会话中且不在 Teamcenter 中的另一个模型时，保存操作是否可以继续的选项。 允许的值为“always”、“never”和“提示”。 当“always”时，无论是否缺少任何依赖项，始终允许保存操作继续进行。 如果为“prompt”，则如果选择保存的任何模型依赖于不在 SolidWorks 会话中且不在 Teamcenter 中的另一个模型，则保存操作无法继续。 当“提示”时，系统会询问用户在缺少依赖项时是否继续保存操作。
**checkin.model.preview = true**
当用户将鼠标悬停在保存对话框的“项目 ID/修订项目名称”列上时，此首选项控制预览的显示。 如果为 true，则将鼠标悬停在列上时将显示模型的预览。 如果设置为 false，则不会显示预览。
**checkin.modelname.show = false**
此首选项控制 SolidWorks 模型名称字段是否显示在“新建”和“保存”对话框中。 如果为 false，则模型名称字段不会显示在对话框中。 如果为 false，则“新建”将导致模型名称与项 ID 相同。 如果为 true，则用户可以看到该字段。 模型名称字段的默认值由 iman.autorename.model 控制。
**checkin.multimodel.lov.enable = false**
此首选项确定在其中一个保存对话框中选择多行时是否可以指定 LOV 属性值。 默认值 false 可防止将 LOV 属性值分配给多个选定行。 当此首选项更改为 true 时，可以将 LOV 属性值分配给多个选定行，但前提是所有选定模型都属于相同的项目类型。 包含多个项目类型的选择仍不符合 LOV 属性值分配的条件。 分配的属性值的验证仅在多个模型中的一个上执行，在某些情况下，它可能对选择中的其他模型无效，从而导致意外结果。 在将此首选项更改为 true 之前，客户必须在其 Teamcenter 数据模型的上下文中评估其配置的项目类型，如 swim.xml 文件的dataset_map部分中的 allowed_item_types 标记所指定。 每个客户必须自行决定允许将 LOV 属性值分配给多个选定模型是否安全，因为分配的属性值将仅针对多个选定模型中的一个进行验证。
**checkin.pdmversion.ignore = prompt**
用于控制当 Teamcenter 中已有的模型自获取以来似乎已发生更改时，保存操作是否可以继续。 允许的值为“always”、“never”和“prompt”。 如果为“始终”，则无论“保存”对话框中的任何型号在 Teamcenter 中是否具有较新版本，都可以继续保存操作。 如果为“从不”，则当“保存”对话框中的模型在 Teamcenter 中已有较新版本时，保存操作将无法继续。 如果为“提示”，则在 Teamcenter 中检测到较新的模型版本时，系统会询问用户是否继续执行保存操作。 请注意，“checkin.pdmversion.ignore.all”选项确定Teamcenter中较新版本的测试是应用于“保存”对话框中的所有模型，还是仅应用于选择保存的模型。
**checkin.pdmversion.ignore.all = false**
用于确定是将 Teamcenter 中较新版本模型的测试应用于“保存”对话框中的所有模型，还是仅应用于选择保存的模型的选项。 允许的值为“true”表示测试所有模型，“false”表示仅测试选择保存的模型。
**checkin.require.unique.dataset = true**
用于控制“保存”是否验证新模型是否在 Teamcenter 中创建唯一数据集名称和类型的选项。如果设置为 true，则当 Teamcenter 中存在现有项 ID 的数据集名称和类型时，将无法保存保存到新项 ID 的模型。如果设置为 false，则不会执行任何验证。应该注意的是，验证是针对单个站点的。未选中团队中心 ODS。因此，跨站点可能会出现重复的数据集名称和类型。
**checkin.saveas.add.related.drawings = prompt**
为 3D 模型指定新条目或修订时，此选项将验证相关图纸是否包含在对话框中。 当该选项设置为默认值“提示”时，将进行验证，用户可以选择返回对话框以添加图形。当选项设置为值“从不”时，将进行项目分配而不考虑图纸。
**checkin.saveas.select.implied.drawings = prompt**
为三维模型指定新项目时，此选项将验证隐含图纸是否包含在要指定新项目的模型选择中。 当该选项设置为默认值“提示”时，将进行验证，用户可以选择返回对话框以选择图纸。 当选项设置为值“从不”时，将进行项目分配而不考虑图纸。
**checkin.saverelated.drawings.enabled = true**
修改要保存的 3D 模型时，该选项将控制与该 3D 模型相关的图形是否自动包含在保存操作中。 当设置为 true 默认值时，进程中或工作文件夹中的图形将添加到操作中。 当设置为假图纸时，不会为修改的模型添加图纸。
**checkin.saverelated.drawings.rebuild = always**
用于控制在将选择保存的相关图形上载到 Teamcenter 之前是否重新构建相关图形的选项。 当设置为默认的“始终”时，将始终重建相关图形，确保图形是最新的。 重建图形确实需要时间。 不在 SolidWorks 会话中的相关图形将在重建之前加载。 如果设置为“从不”，则永远不会重新构建图形，即使它们已在 SoldWorks 进程中也是如此。 假定用户将根据需要重新生成图形。 要让用户选择重新构建图形，请将此选项设置为“提示”。
**checkin.silent.enable = true**
此首选项控制用户选择保存或保存所有已修改菜单时保存对话框的外观。 设置为 true 时，如果检出所有修改的模型，则不会显示该对话框。 模型将保存到Teamcenter。 设置为 false 时，对话框将始终出现，用户可以选择进行更改。 默认值为 true。
**eai.jtenabled = true**
“保存”对话框中“保存 JT 文件”选项的默认值。 允许的值为真和假。 如果为 true，JT 文件将按照辅助文件映射的指示生成和/或保存到 Teamcenter。 如果为 false，则忽略辅助文件映射中的 JT 条目。
![image3](2ac41b66ce1b4f5c85c536ba600bb7f6.png)
**iman.addonlynewtoselected = true**
确定在保存操作期间是仅将新项目（勾选的）还是所有项目添加到用户选择的文件夹中的选项。 允许的值为真和假。 如果为 true，则仅当在保存操作期间创建项目时，才会将项目添加到用户选择的文件夹中。 如果为 false，则保存的所有项目都将添加到用户选择的文件夹中。
**iman.autorename.configurations = never**
**多配置或变形件使用**
控制是否将所有配置都包含在更改物料 ID 的操作中的选项。 允许的值为“始终”、“从不”和“提示”。 当为“始终”时，在“保存”对话框中更改任何配置或其 SolidWorks 文档的项目 ID 始终包括操作中的其他配置和文档，从而可以在一次操作中为所有配置分配新的项目 ID。 如果为“从不”，则在“保存”对话框中更改配置或文档的物料 ID 永远不会将其他配置或文档带入操作。 当“提示”时，将询问用户在更改其中任何一个配置和文档时是否应包含其他配置和文档。 此选项仅适用于分配有“新建”和“替换”按钮的项目 ID。 通过在项 ID 列中直接键入新 ID 来更改模型的项 ID 仅影响该模型，而不考虑此选项的设置方式。
**iman.autorename.model = always**
将将模型的名称重命名为item_id
控制在模型的项 ID 更改时是否重命名模型的选项。 允许的值为“始终”、“从不”和“提示”。 如果为“always”，则在“保存”对话框中更改项目 ID 始终会重命名模型以匹配新的项目 ID。 如果为“从不”，则在“保存”对话框中更改项目 ID 永远不会重命名模型。 当“提示”时，系统将提示用户决定是否重命名模型以匹配新的项目 ID。 如果将“{item_id}”以外的模式分配给 iman.autorename.model.pattern 选项，也可以使用新项 ID 以外的其他名称重命名模型。
**iman.autorename.model.pattern = {item_id}**
用于在项目 ID 更改时重命名模型的模式（如果 iman.autorename.model 为“始终”或“提示符”）。 允许的值是用于模型新名称的字符串。 该字符串可能包含以下列表中的替换关键字：{item_id} 替换为模型的新项 ID。 {item_name} 替换为模型的项名称。 例如，默认模式“{item_id}”会导致重命名模型以匹配其 Teamcenter 项目 ID，而模式（如“{item_id}-{item_name}”）将使用模型的项目 ID 和项目名称重命名模型。 在后一种情况下，分配了新物料 ID “P1234567”且物料名称为“BRACKET”的模型将重命名为“P1234567-BRACKET”。
![image4](a21a4aba4c224491b4f929a1067c93a5.png)
**iman.bom.add.excluded = false**
用于控制保存装配体是否将在 Teamcenter BOM 表中为 SolidWorks 实例创建材料明细表线的选项，这些实例在零部件属性上设置了从材料明细表中排除属性。如果为 true，则排除的实例将添加到 BOM 表中，并且对于添加的 BOMLine，SW2BOMExclude 设置为 true。如果为 false，则不会为排除的实例创建 BOMLines。 而是创建一个Sw2_BOMExclude GRM 来跟踪关系。 默认值为 false。

**iman.datasetdescdefault = From SolidWorks**
**iman.itemrevdescdefault =**
**iman.itemdescdefault = From SolidWorks**
数据集和item、Item版本描述的默认值，用于区分是否SW集成创建或更新的数据；
**checkout.datasettype.priority.drawing = true**
当用户在打开的对话框中选择的项目修订中有多个数据集类型时，集成必须选择要选择的类型。 当此首选项设置为 true 时，集成将选择工程图而不是装配体或零件。 当此首选项设置为 false 时，集成将选择装配体或零件，而不是工程图。

**checkout.info.prompt = true**
控制是否提示用户为检出的模型输入注释的选项。 允许的值为真和假。 如果为 true 并且至少选择一个模型要检出，则“打开”对话框或“打开依赖项”对话框关闭后将显示“检出注释”对话框。 如果为 false，则不会显示“检出注释”对话框，这意味着用户在检出模型时无法输入注释。
**checkout.sw.open.mode = Default**
当选择装配体或工程图时，此首选项控制“打开”对话框中“打开模式”选择器的默认值。 允许的值为“**Default**”和“Lightweight”。 有关打开模式的详细信息，请参阅用户指南。 建议使用轻量级值，以便在打开大型装配体时获得更好的 Solidworks 性能。 轻量级打开装配体时，不执行 BOM 属性映射。
**iman.autorevise.item = always**
控制在“打开依赖关系”对话框中选择模型的不同修订版本是否同时为具有相同项 ID 的任何其他模型选择该修订版本的选项。 允许的值为“始终”、“从不”和“提示”。 如果为“always”，则在“打开依赖关系”对话框中选择不同的修订版本也会为具有相同项目 ID 的其他模型选择该修订版本。 如果为“从不”，则在“打开依赖关系”对话框中选择其他修订不会更改具有相同项目 ID 的其他模型的修订。 当“提示”时，将询问用户是否应为具有相同物料 ID 的所有模型选择相同的修订版。

**iman.queries.allclasses = true**
为“高级搜索”对话框选择查询的选项。 允许的值为真和假。 如果为 true，则在 Teamcenter 中定义的所有查询都可以在“高级搜索”对话框中使用，无论它们是否可以找到 SolidWorks 模型。 如果为 false，则仅显示查找文件夹、项目、项目修订或数据集的查询（这些是唯一可以在搜索期间指向 SolidWorks 模型的类）。 此选项与 iman.queries.allow 选项结合使用，因此，仅当 **iman.queries.allow** 选项也允许 iman.queries.allow 时，iman.queries.allclasses 允许的查询才会在“高级搜索”对话框中可用。
**iman.queries.allowed**
列出“高级搜索”对话框中允许的查询名称的选项。 允许的值是以冒号分隔的查询名称列表。 例如，包含三个名称的列表，例如Dataset...:Item - simple:Item…
**iman.queries.hidden = false**
根据“高级搜索”对话框的名称是否以下划线开头来选择查询的选项。 允许的值为真和假。 如果为 true，则“隐藏”查询将包含在“高级搜索”对话框中。 隐藏查询是名称以下划线开头的查询。 如果为 false，则名称以下划线开头的查询不会显示在“高级搜索”对话框中。 iman.queries.allow 选项优先于此选项，这样，在 iman.queries.allow 列表中指定的查询将显示在“高级搜索”对话框中，而不在列表中的查询将被排除，无论其名称是否以下划线开头，也无论 iman.queries.hidden 是真还是假。 换句话说，iman.queries.hidden 仅在未指定 iman.queries.allow 时才有效。
**registernew.enable = prompt**
首选项，允许用户在使用 SolidWorks 文件\>新操作创建新的 SolidWorks 模型时将新模型注册到 Teamcenter 中。 当设置为默认值提示时，系统将提示用户在 Teamcenter 中注册模型。 如果设置为始终，用户将始终看到在 Teamcenter 中注册模型的对话框，并且只能使用取消按钮绕过。 如果设置为“从不”，则在执行 Teamcenter 保存之前，用户不必将模型注册到 Teamcenter。
**table.columns.std = itemrev:documentname:reservedby:releasestatus**
如果未为特定对话框指定选项，则显示表时要显示的默认列列表（请参阅 table.columns.bom、table.columns.cancelcheckout、table.columns.checkout 和 table.columns.update 选项）。 table.columns.checkin 必须用于配置“保存”对话框的列列表。 table.columns.std 是以下列表中以冒号分隔的名称字符串：

**checkin.modelname.show = false**
此首选项控制 SolidWorks 模型名称字段是否显示在“新建”和“保存”对话框中。 如果为 false，则模型名称字段不会显示在对话框中。 如果为 false，则“新建”将导致模型名称与项 ID 相同。 如果为 true，则用户可以看到该字段。 模型名称字段的默认值由 iman.autorename.model 控制。

**checkin.saverelated.drawings.rebuild = always**
用于控制在将选择保存的相关图形上载到 Teamcenter 之前是否重新构建相关图形的选项。 当设置为默认的“始终”时，将始终重建相关图形，确保图形是最新的。 重建图形确实需要时间。 不在 SolidWorks 会话中的相关图形将在重建之前加载。 如果设置为“从不”，则永远不会重新构建图形，即使它们已在 SoldWorks 进程中也是如此。 假定用户将根据需要重新生成图形。 要让用户选择重新构建图形，请将此选项设置为“提示”。

