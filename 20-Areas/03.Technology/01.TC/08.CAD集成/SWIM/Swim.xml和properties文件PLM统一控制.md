---
title: Swim.xml和properties文件PLM统一控制
updated: 2026-06-06T10:08:52
created: 2026-07-05T17:04:44
---

The swim.properties and swim.xml files can be centrally managed in Teamcenter, instead of locally on each integration client. To manage settings in Teamcenter, attach SOLIDWORKS Integration Settings datasets to items named SW2_Properties and SW2_XML, then upload the configuration files as named references of the datasets. During login, the integration client will look for the items and datasets by name, and if found, will download and use them.
Either or both of the swim.properties and swim.xml files can be managed in this way, but neither is required.If a managed preference file is not found in Teamcenter, then the local file in the client installation directory will be used.The following steps describe how to upload the swim.properties file:
1\. Create an Item with Item ID = SW2_Properties. The initial Item Revision is automatically created by Teamcenter. The Item may be revised any number of times, as settings change, and the integration will always find and retrieve the file from the latest available revision
2\. Under the Item Revision, create a dataset of type SOLIDWORKS Integration Settings named SW2_Properties (remove the /{RevisionID} extension from the dataset name).
3\. Import the swim.properties file as a named reference of the dataset.
4\. Advise users to restart their sessions, to use the managed copy of swim.properties

swim.properties 和 swim.xml 文件可以在 Teamcenter 中进行集中管理，而不是在每个集成客户端上进行本地管理。要管理 Teamcenter 中的设置，请将 SOLIDWORKS 集成设置数据集附加到名为 SW2_Properties 和 SW2_XML 的项目，然后将配置文件作为数据集的命名引用上传。在登录期间，集成客户端将按名称查找项目和数据集，如果找到，将下载并使用它们。
可以通过这种方式管理swim.properties和swim.xml文件中的一个或两个文件，但两者都不是必需的。如果在 Teamcenter 中找不到托管首选项文件，则将使用客户端安装目录中的本地文件。以下步骤描述了如何上传 swim.properties 文件：
1\. 创建ItemID = SW2_Properties 的Item。初始Item版本由 Teamcenter 自动创建。随着设置的更改，Item可能会被修改任意次数，并且集成将始终从最新的可用修订版中查找和检索文件
2\. 在Item版本下，创建名为 SW2_Properties 的 SOLIDWORKS 集成设置类型的数据集（从数据集名称中删除 /{RevisionID} 扩展名）。
3\. 导入 swim.properties 文件作为数据集的命名引用。
4\. 建议用户重新启动其会话，以使用 swim.properties 的托管副本
![image1](0686ecce3ce641d6adf1067b41f45e1b.png)

![image2](5ed6ee0aa47f4797858cdcff1ab71c3b.png)
The following steps describe how to upload the swim.xml file:
1\. Create an Item with Item ID = SW2_XML. The initial Item Revision is automatically created by Teamcenter. The Item may be revised any number of times, as settings change, and the integration will always find and retrieve the file from the latest available revision.
2\. Under the Item Revision, create a dataset of type SOLIDWORKS Integration Settings named SW2_XML (remove the /{RevisionID} extension from the dataset name).
3\. Import the swim.xml file as a named reference of the dataset.
4\. Advise users to restart their sessions, to use the managed copy of swim.xml.
以下步骤介绍如何上传 swim.xml 文件：
1\. 创建ItemID= SW2_XML 的项目。初始Item版本由 Teamcenter 自动创建。随着设置的更改，Item可能会被修改任意次数，并且集成将始终从最新的可用修订版中查找和检索文件。
2\. 在Item版本下，创建名为 SW2_XML 的 SOLIDWORKS 集成设置类型的数据集（从数据集名称中删除 /{RevisionID} 扩展名）。
3\. 导入 swim.xml 文件作为数据集的命名引用。
4\. 建议用户重新启动会话，以使用 swim.xml 的托管副本。
![image3](4b2db64eb5bc43e784302118bd78db20.png)

前后端分离:
![image4](883d585dc34647fbb822132b8e465f0f.png)

![image5](4f1fca0ffbce4bfda0ca72aeec317b6d.png)

