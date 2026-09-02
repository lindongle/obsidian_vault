---
title: BMIDE部署过程
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:45
---

**安装模板过程：**
要安装基础模板，您应该启动 TEM 向导并选择**创建此产品的新安装**。在**“解决方案”**面板中，选择**“企业服务器”**，然后继续其余配置页。
单击最后的“**确定**”按钮后，TEM 向导将安装所有选定的特征。请记住，每个包装 功能由安装源上的以下文件组成：
- **安装\模块\feature_base.xml**
- install\lang\en\TcBundle\_language-code_country-code.xml
- tc\foundation_template.zip
- tc\foundation \_install.zip
注意：
Foundation 特征文件称为**feature_base.xml**。
当管理用户选择**“公司服务器”**选项时，TEM 将执行以下作：
1.  将功能文件复制到*TC_ROOT***\install\module**目录。
2.  将捆绑文件复制到*TC_ROOT***\install\install\lang\\***lang*目录
3.  将**foundation_template.zip**文件的内容解压缩到*TC_ROOT***\install\foundation**目录。
4.  将**foundation_install.zip**的内容解压缩到*TC_ROOT***\install\foundation**目录。
5.  创建*TC_ROOT***\model**目录。
6.  创建*TC_DATA***\model\baselines**目录。
7.  TEM 执行 Foundation 功能文件的**\<pre-install\>**和**\<install\>**部分，执行以下作：
    1.  将**foundation_template.xml**和**foundation_dependency.xml**文件从*TC_ROOT***/install/foundation**目录复制到*TC_DATA***/model**目录。
    2.  将**foundation_tcbaseline.xml**文件从*TC_ROOT***\install\foundation**目录复制到*TC_DATA***/model/baselines**目录。
    3.  将基础模板添加到*TC_DATA***\model\master.xml**文件。
    4.  创建一个空的*TC_DATA***\model\model_backup.xml**文件，从数据库获取上一版本的model.xml文件写入**model_backup.xml**。
    5.  将当前最新项目中**master.xml**文件中列出的模板中的所有定义合并到*TC_DATA***\model\model.xml**文件。
    6.  «span style='color:#212529'»执行比较工具，将**model.xml**和**model_backup.xml**文件加载到 Java 模型中，比较两个模型，并编写包含两个模型之间差异的**delta.xml**文件。  
        注意：  
        首次安装时，**model.xml**文件包含基础模板扩展，而**model_backup.xml**文件不包含任何定义。但对于后续安装，**model_backup.xml**文件表示当前状态，**model.xml**文件表示安装后的预期状态。因此，差异 两个文件之间将是所有基金会模板定义。«/span»
    7.  执行**populate_new_db.default**脚本，该脚本读取**delta.xml**文件以填充数据库。

*From \< <https://docs.sw.siemens.com/documentation/external/PL20240523460057788/en-US/teamcenter/tc/2412/teamcenter/en-US/plm00071/id1637939/xid508112/xid508116/InstallFoundationTemplate.html>\>*

![image1](895a6b0203db4cb09dffdecf2b096897.png)
*实时更新*使 Business Modeler IDE 用户能够直接从 Business Modeler IDE 到正在运行的 Teamcenter 服务器。您可以通过以下方式运行实时更新 选择**BMIDE**→**Deploy 模板**。在大多数情况下，实时更新适用于企业 Modeler IDE 用户在将扩展投入生产之前正在开发和测试扩展。 但是，您也可以将某些类型的数据直接部署到生产服务器。
实时更新的优点是不需要打包的模板，并且可以部署 通过两层或四层环境。实时更新的一个缺点是 它不会执行**install\_***template-name.default*文件或**upgrade\_***template-name_version.default*文件中列出的额外实用程序。因此，如果您需要 Teamcenter 来处理升级或安装实用程序， 您必须打包模板并通过 TEM 进行安装。如果您只是制作 数据模型对模板的更改，并希望快速部署它们以测试更改， 您可以使用实时更新。实时更新的另一个缺点是只有会话 使更改可以看到更改。测试服务器的所有其他用户必须 注销并重新登录以查看数据模型更改。
部署向导执行以下作：
1.  将**master.xml**中列出的所有 XML 文件合并到单个*project***\output\packaging\\***template_name_template.xml*文件中。
2.  将*project***\extensions\dependency.xml**文件复制到*project***\output\packaging\\***template-name***\_dependency.xml**文件
3.  创建与指定服务器的 SOA（面向服务的架构）连接 使用登录凭据，并使用 FMS 将*template-name***\_template.xml**和*template-name***\_dependency.xml**发送到服务器。
4.  SOA 服务将文件写入*TC_DATA***\model**目录。
5.  如果尚未包含模板名称，SOA 服务会将模板名称添加到**TC_DATA\model\master.xml**文件中。
6.  删除现有*TC_DATA***\model\model_backup.xml**文件。
7.  将*TC_DATA***\model\model.xml**文件重命名为*TC_DATA***\model\model_backup.xml**。
8.  将**master.xml**文件中列出的模板中的所有定义合并到*TC_DATA***\model\model.xml**文件。
9.  «span style='color:#212529'»执行比较工具，将**model.xml**和**model_backup.xml**文件加载到 Java 模型中，比较两个模型，并编写包含两个模型之间差异的**delta.xml**文件。  
    注意：  
    **model.xml**文件包含最新的模板扩展名，**model_backup.xml**文件包含数据库中的先前定义。因此，差异 两个文件之间是两个较旧的客户模板之间的差异 和最新的客户模板。«/span»
10. 在日志文件中列出所有已执行的作。如果**delta.xml**文件中列出的任何元素执行失败，则失败的元素也会列在日志文件中。
11. 将数据库的数据模型内容提取到*TC_DATA***\model\model.xml**文件中，以便下一次实时更新能够计算与文件的差异 这反映了数据库的准确内容。仅当 增量文件中有未处理的元素。
12. 通过 SOA 服务将日志文件发送回，并将其放在*project***\output\packaging**目录中，并使用时间戳命名该文件。

*From \< <https://docs.sw.siemens.com/documentation/external/PL20240523460057788/en-US/teamcenter/tc/2412/teamcenter/en-US/plm00071/id1637939/xid508112/xid508116/AboutHotDeploy.html>\>*
---

---
基于数据库中的模型文件进行的下载后重命名。
数据库中的模型文件，进入TC，搜索文件夹Fnd0BMIDEResource
这下面有model.xml和model_lang.xml的数据集。
![image2](6a8aee8131f644a5adc65acafadee50d.png)

