---
title: BMIDE打包过程
updated: 2026-09-02T16:30:05
created: 2026-07-05T17:04:45
---

After you populate the template with extensions, you can package the template so that it can be installed to a server. Packaging refers to the bundling of the components in the template project. The template is packaged into a format that TEM recognizes so that TEM can install the template into the server, or for usage with the Business Modeler IDE client as a reference template.
如果要执行以下作之一，请使用打包向导：
- 使用 TEM 将模板安装或升级到测试或生产服务器中。
- 将模板分发给想要共享扩展的其他网站或客户。
要启动包向导，请选择**BMIDE**→**生成软件包**。
[打包模板](https://docs.sw.siemens.com/en-US/product/282219420/doc/PL20240523460057788.plm00071/html/xid352560)时，打包向导将执行以下作：
1.  提示用户将任何未保存的更改保存到扩展名中的所有源文件 目录。
2.  如果有任何生成的 C++，则使用 rtserver 功能更新功能文件 类或服务工件。
3.  将*template-name***\_config.json**和*template-name***DCBundle\_***language-code_country-code***.xml**文件复制到*project***\output\packaging**目录。
4.  将**feature\_***template-name***.xml**和*template-name***Bundle\_***language-code_country-code***.xml**文件复制到*project***\output\packaging**目录。
5.  使用以下过程创建*project***\output\packaging\\***template-name***\_template.zip**：
    1.  创建一个名为*template-name***\_template.xml**的新文件。此文件是通过读取*project***\extensions\master.xml**文件中列出的每个源文件的内容并附加到新的*template-name***\_template.xml**文件来生成的。
    2.  *project***\extensions\dependency.xml**文件将复制到名为*project***\output\packaging\\***template-name***\_dependency.xml**的新文件中。
6.  使用以下过程创建*project***\output\packaging\\***template-name***\_install.zip**：
    1.  将*project***\install\install\_***template-name*文件复制到 ZIP 文件中。
    2.  将所有*project***\install\upgrade\_***template-name_version*文件复制到 ZIP 文件中。
    3.  将*project***\install**目录中的任何其他数据文件复制到 ZIP 文件。
打包向导完成后，以下文件位于*project***\output\packaging**目录中：
- «span style='color:#212529'»**feature\_***模板名称***.xml  **
  该文件包含TEM识别模板和 如何处理模板进行安装和升级。«/span»
- «span style='color:#212529'»*template-name***Bundle\_***language-code_country-code***.xml  **
  此文件包含特征文件的本地化文本，以便 TEM 可以显示 本地化版本中的功能描述。«/span»
- «span style='color:#212529'»*模板名称***\_config.json  **
  此文件包含部署中心识别 模板以及如何处理模板进行安装和升级。«/span»
- «span style='color:#212529'»*template-name***DCBundle\_***语言code_country代码***.xml  **
  此文件包含功能文件的本地化文本，以便部署中心 可以在本地化版本中显示功能描述。«/span»
- «span style='color:#212529'»*template-name***\_icons.zip  **
  此 ZIP 文件包含所有图标文件。«/span»
- «span style='color:#212529'»*模板名称***\_template.zip  **
  此 ZIP 文件包含模板定义 （*template-name***\_template.xml**） 和依赖文件 （*template-name***\_dependency.xml**）。«/span»
- «span style='color:#212529'»*模板名称***\_install.zip  **
  此 ZIP 文件包含用于安装和升级模板的所有支持文件：«/span»
  - **install\_***模板名称***.xml**
  - 任何数据文件。
创建模板包后，必须将捆绑文件传输到 服务器，以便 TEM 或部署中心可以查找和安装模板。
如果您在安装或升级脚本中调用了任何自定义实用程序， 确保将这些实用程序的适当平台二进制文件放入 在使用TEM 或 Deployment Center 安装或升级模板之前，先找到**TC_ROOT\bin**目录。

*From \< <https://docs.sw.siemens.com/documentation/external/PL20240523460057788/en-US/teamcenter/tc/2412/teamcenter/en-US/plm00071/id1637939/xid508112/xid508116/TemplateFilesReference.html>\>*
