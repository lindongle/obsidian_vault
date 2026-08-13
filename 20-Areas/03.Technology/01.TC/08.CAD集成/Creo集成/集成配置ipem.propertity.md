---
title: 集成配置ipem.propertity
updated: 2026-06-06T10:05
created: 2018-03-11T12:47:09
---

window.alwaysOnTop = true
设置窗口一直之前，不会被其他应用程序遮挡。
checkin.require.unique.dataset = false
控制是否保存验证新模型在Teamcenter中创建唯一数据集名称和类型的选项。 如果设置为true，则如果Teamcenter中的数据集名称和类型存在于现有项目ID，则将无法保存保存到新Item Id的模型。 如果设置为false，则不会执行验证。 应该注意，验证是针对单个站点的。 Teamcenter ODS未检查。 因此，跨站点可能会发生重复的数据集名称和类型。
checkin.after = keep
＃使用“保存”和“全部保存”命令时，保存对话框的默认“保存后”选项。 允许的值为“checkout”，“delete”，“keep”和“readonly”。 默认值为“keep”
![image1](4b0d5baf62f84b218f11d78731f0c7ec.gif)
iman.bomrevisionrule.latest
修订规则，确定项目的哪个版本是最新的。 允许的值是Teamcenter修订规则的名称，例如Alpha Rev Order中的最新版本。 如果未指定，则使用Teamcenter的内置条件来确定最新版本。 这会影响表列，指示模型的更新版本是否可用：当表中的模型属于不是最新的版本时，列将显示图标。
checkin.cadversion.ignore = always
用于控制某些尚未选择保存的模型的保存操作是否可以继续进行选择的选项，如果尚未保存到Teamcenter的更改。允许的值为“always”，“never”和“prompt”。如果“始终”，可以继续保存操作，无论“保存”对话框中的任何模型是否显示为不会保存到Teamcenter的更改。如果“从不”，如果保存对话框中的模型出现更改，并且未选择保存到Teamcenter，则无法继续保存操作。如果“提示”，当没有选择要保存的模型时，询问用户是否继续保存操作。请注意，这些测试仅涉及“保存”对话框中显示的模型。可能存在未保存更改但未包含在“保存”对话框中的其他本地模型将被忽略。还请注意，“checkin.cadversion.ignore.all”选项可确定这些未保存更改的这些测试是否适用于“保存”对话框中的所有模型，或者仅适用于直接引用或直接依赖选择进行保存的模型的模型。
checkin.model.preview = true
鼠标悬停时显示模型预览
checkin.modelname.show = true
如果Pro / ENGINEER模型名称字段显示在“注册新建”和“保存”对话框中，则此首选项将进行控制。 如果为false，则模型名称字段不会出现在对话框中。 当为false时，注册新建将导致与项目ID相同的模型名称。 保存对话框将根据自动重命名首选项设置处理型号名称。 如果设置为true，则对话框中将显示模型名称字段。 当为true时，该值将使用默认值填充，但用户可以修改该值。
![image2](ba047f58569a4157a540faed9acd50e4.gif)
checkin.pdmversion.ignore = prompt
控制是否可以在Teamcenter中已有的模型自从被抓取以来发生更改后，可以继续保存操作的选项。 允许的值为“always”，“never”和“prompt”。 如果“始终”，可以继续保存操作，无论“保存”对话框中的任何模型是否显示为在Teamcenter中具有较新版本。 如果“从不”，如果“保存”对话框中的模型已在Teamcenter中已有较新版本，则无法继续保存操作。 如果出现“提示”，则会询问用户是否在Teamcenter中检测到较新的型号版本时继续保存操作。 请注意，“checkin.pdmversion.ignore.all”选项决定了Teamcenter中较新版本的测试是否适用于“保存”对话框中的所有模型，或仅适用于选择保存的模型。
eai.jtenabled = false
界面上保存JT是否默认勾选保存。
![image3](7e622c27417845b093e4164a2eb5036b.gif)
iman.datasetdescdefault = From iPEM
设置保存或新建界面的默认数据集的描述值。
registernew.enable.manual.itemid = false
设置新建时，itemid只允许点击按钮，不允许手动输入。
registernew.enable = prompt
新建item时，提示是否在tc中管理模型，设置为never则不提示
jt.assembly.monolithic=true
设置组件转为独立的JT文件，在结构管理器中不跟随子件勾选而变化
