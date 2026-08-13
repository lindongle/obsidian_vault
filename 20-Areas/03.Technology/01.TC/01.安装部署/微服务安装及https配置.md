---
title: 微服务安装及https配置
updated: 2026-06-05T23:16
created: 2021-03-12T10:14:28
tags:
  - TC安装部署
---

«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»在安装微服务之前，请查看«/span»[«span style='font-family:"Microsoft YaHei";background:white'»微服务和«/span»<span style='font-family:arial;background:white'> Teamcenter </span>«span style='font-family:"Microsoft YaHei";background:white'»微服务框架«/span»](https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1801671)«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»。«/span»
1.  «span style='font-family:"Microsoft YaHei";background:white'»启动«/span»<span style='font-family:arial;background:white'> Teamcenter </span>«span style='font-family:"Microsoft YaHei";background:white'»环境管理器«/span»<span style='font-family:arial;background:white'> (TEM)</span>«span style='font-family: "Microsoft YaHei";background:white'»。«/span»
2.  «span style='font-family:"Microsoft YaHei";background:white'»如果以前未在主机上将微服务框架包添加到«/span»<span style='font-family:arial;background:white'> TEM</span>«span style='font-family: "Microsoft YaHei";background:white'»，则使用«/span»«span style='font-weight:bold; font-family:"Microsoft YaHei";background:white'»介质位置«/span»«span style='font-family:"Microsoft YaHei";background:white'»面板添加微服务框架包。«/span»
3.  <span style='background: white'>前进至</span><span style='font-weight:bold;background:white'>功能部件</span><span style='background:white'>面板。在</span><span style='font-weight:bold;background: white'>微服务</span><span style='background:white'>下，选择</span><span style='font-weight:bold;background:white'>微服务框架</span><span style='background: white'>和要安装的微服务。</span>
4.  <span style='background: white'>前进至</span><span style='font-weight:bold;background:white'>微服务框架</span><span style='background:white'>面板并指定值。</span>
1.  «span style='color:#333333'»选择要安装的节点类型，可以是**主节点**或**工作线程节点**。  
    一个环境中需要一个*主*（管理器）微服务节点。«/span»
2.  «span style='font-family:"Microsoft YaHei";background:white'»如果要安装«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";background:white'»主«/span»«span style='font-family:"Microsoft YaHei";background:white'»微服务节点，则输入用于生成«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>.p12</span><span style='font-family: arial;background:white'></span>«span style='font-family:"Microsoft YaHei"; background:white'»文件的«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei"; background:white'»密钥存储密码«/span»«span style='font-family:"Microsoft YaHei"; background:white'»，该文件包含用于签署和验证身份验证令牌的密钥。这些令牌标识登录的«/span»<span style='font-family:arial;background:white'> Teamcenter </span>«span style='font-family:"Microsoft YaHei";background:white'»用户。«/span»
<table style="width:91%;">
<colgroup>
<col style="width: 45%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th><ol start="3" type="a">
<li><p><span style='color:#666666'>注释</span></p></li>
</ol></th>
<th><ol start="4" type="a">
<li><p><span style='color:#333333'>记录密码并保持密码的安全，以便在您要打开和编辑密钥时使用。</span></p></li>
</ol></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
5.  «span style='font-family:"Microsoft YaHei";background:white'»如果要安装«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";background:white'»工作线程«/span»«span style='font-family:"Microsoft YaHei";background:white'»微服务节点，则在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»密钥存储«/span»<span style='font-weight:bold;font-family:arial;background:white'> ZIP </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»文件«/span»«span style='font-family:"Microsoft YaHei";background:white'»中，输入安装«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";background:white'»主«/span»«span style='font-family:"Microsoft YaHei";background:white'»节点时生成的«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>keys.zip</span><span style='font-family: arial;background:white'></span>«span style='font-family:"Microsoft YaHei"; background:white'»文件的位置。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»密钥存储«/span»<span style='font-family:arial;background:white'> ZIP </span>«span style='font-family: "Microsoft YaHei";background:white'»文件«/span»<span style='font-family:arial; background:white'> (</span><span style='font-weight:bold;font-family:arial; background:white'>keys.zip</span><span style='font-family:arial;background: white'>) </span>«span style='font-family:"Microsoft YaHei";background:white'»已复制到«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";background:white'»主«/span»«span style='font-family:"Microsoft YaHei";background:white'»微服务节点主机的«/span»<span style='font-family:arial;background:white'></span><span style='font-style: italic;font-family:arial;background:white'>TC_ROOT/</span><span style='font-weight:bold;font-family:arial;background:white'>jwt_config_tool</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»目录。为了在您安装«/span»«span style='font-style: italic;font-family:"Microsoft YaHei";background:white'»工作线程«/span»«span style='font-family:"Microsoft YaHei";background:white'»微服务节点时提供方便，将该文件复制到本地计算机上的某个位置，然后在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»密钥存储«/span»<span style='font-weight:bold;font-family:arial;background:white'> ZIP </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»文件«/span»«span style='font-family:"Microsoft YaHei";background:white'»中指向该本地副本。«/span»
<table style="width:91%;">
<colgroup>
<col style="width: 45%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th><ol start="6" type="a">
<li><p><span style='color:#666666'>提示</span></p></li>
</ol></th>
<th><ol start="7" type="a">
<li><p><span style='color:#333333'>为了安全起见，最好的做法是在<em>工作线程</em>节点安装完成后从本地计算机中删除<strong>keys.zip</strong>的副本。</span></p></li>
</ol></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
8.  «span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»输入服务调度程序和服务注册表的参数值。«/span»  
    «span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»如果安装的是«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";font-size:9.75pt; background:white'»主«/span»«span style='font-family:"Microsoft YaHei"; font-size:9.75pt;background:white'»微服务节点，则会预先选择且需要服务调度程序和服务注册表。如果安装的是«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";font-size:9.75pt; background:white'»工作线程«/span»«span style='font-family:"Microsoft YaHei"; font-size:9.75pt;background:white'»节点，则若要安装服务调度程序和服务注册表以进行故障转移或增加可扩展性，可选中相应的复选框。«/span»  
    «span style='font-weight:bold;font-family:"Microsoft YaHei";font-size:9.75pt; background:white'»调度程序端口«/span»«span style='font-family:"Microsoft YaHei"; font-size:9.75pt;background:white'»是将在此主机上运行的服务的端口。«/span»  
    «span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»服务调度程序和服务注册表的«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";font-size:9.75pt; background:white'»其他«/span»<span style='font-weight:bold;font-family:arial; font-size:9.75pt;background:white'> URL</span><span style='font-family:arial; font-size:9.75pt;background:white'></span>«span style='font-family:"Microsoft YaHei"; font-size:9.75pt;background:white'»值标识环境中各自组成服务的实例。包括所有实例的«/span»<span style='font-family:arial;font-size:9.75pt;background:white'> URL</span>«span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»。使用逗号分隔列表中的«/span»<span style='font-family:arial;font-size:9.75pt;background:white'> URL</span>«span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»。«/span»  
    «span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»服务注册表的«/span»<span style='font-family:arial;font-size:9.75pt;background:white'> URL </span>«span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»形式为：«/span»  

    «span style='font-family:"courier new"; font-size:10.0pt;background:white'»http://«/span»«span style='font-style:italic; font-family:"courier new";font-size:10.0pt;background:white'»\<host\>:port«/span»«span style='font-family:"courier new";font-size:10.0pt;background:white'»/eureka/v2/«/span»  
    «span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»其中，«/span»<span style='font-family:arial;font-size:9.75pt;background:white'>\<host\></span>«span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»是主机名、完全限定域名或«/span»<span style='font-family:arial;font-size:9.75pt;background:white'> IP </span>«span style='font-family:"Microsoft YaHei";font-size:9.75pt;background:white'»地址。«/span»
5.  «span style='font-family:"Microsoft YaHei";background:white'»前进至«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»服务«/span»«span style='font-family:"Microsoft YaHei";background:white'»面板。查看您希望在此节点上运行的每个服务的实例数量。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»通常情况下，«/span»<span style='font-family:arial;background:white'>Teamcenter </span>«span style='font-family:"Microsoft YaHei";background:white'»微服务是多线程的，因此一个节点上仅需要一个微服务实例。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»当环境中包含«/span»<span style='font-family:arial;background:white'> Windows </span>«span style='font-family:"Microsoft YaHei";background:white'»主机的多个微服务节点时，您可能只想在某个给定节点上运行一部分微服务。在这种情况下，对于您不想在该节点上安装的微服务，将实例值设为零。«/span»
6.  «span style='font-family:"Microsoft YaHei";background:white'»继续浏览其余的面板，并根据«/span»<span style='font-family:arial;background:white'> TEM </span>«span style='font-family: "Microsoft YaHei";background:white'»的提示指定所选微服务的配置信息。«/span»
7.  «span style='color:#333333'»查看**确认**面板，然后单击**开始**以开始安装。  
    框架和微服务得以安装。如果要安装*主*节点，则会生成签名者和验证者密钥。«/span»
8.  <span style='background: white'>安装完成后，仔细查看所有消息，以确定需要哪些安装后步骤。</span>
9.  «span style='font-family:"Microsoft YaHei";color:#333333;background:white'»根据«/span»<span style='font-family:arial;color:#333333;background:white'></span>[<span style='font-family:arial;background:white'>Java EE</span>](https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1848891:xid1761839)<span style='font-family:arial;color:#333333;background:white'></span>«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»或«/span»<span style='font-family:arial;color:#333333;background:white'></span>[<span style='font-family:arial;background:white'>.NET</span>](https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1848891:xid1761840)<span style='font-family:arial;color:#333333;background:white'>web </span>«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»层架构的适用情况，将微服务支持添加到«/span»<span style='font-family:arial;color:#333333;background:white'> Teamcenter web </span>«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»层。«/span»

*来自 \< <https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1848891:xid1848895>\>*

«span style='font-family:"Microsoft YaHei";background:white'»使用以下步骤将微服务框架支持添加到«/span»<span style='font-family:arial;background:white'> Teamcenter Java EE </span>«span style='font-family:"Microsoft YaHei";background:white'»架构«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»层«/span»<span style='font-family:arial; background:white'> WAR </span>«span style='font-family:"Microsoft YaHei"; background:white'»文件。«/span»
10. «span style='font-family:"Microsoft YaHei";background:white'»安装微服务框架«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";background:white'»主«/span»«span style='font-family:"Microsoft YaHei";background:white'»节点。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»在«/span»«span style='font-style:italic;font-family:"Microsoft YaHei";background:white'»主«/span»«span style='font-family:"Microsoft YaHei";background:white'»微服务节点主机的«/span»<span style='font-family:arial;background:white'></span><span style='font-style: italic;font-family:arial;background:white'>TC_ROOT/</span><span style='font-weight:bold;font-family:arial;background:white'>jwt_config_tool</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»目录中找到密钥存储«/span»<span style='font-family: arial;background:white'> ZIP </span>«span style='font-family:"Microsoft YaHei"; background:white'»文件«/span»<span style='font-family:arial;background:white'> (</span><span style='font-weight:bold;font-family:arial;background:white'>keys.zip</span><span style='font-family:arial;background:white'>)</span>«span style='font-family: "Microsoft YaHei";background:white'»。«/span»
11. «span style='font-family:"Microsoft YaHei";background:white'»将密钥存储«/span»<span style='font-family:arial;background:white'> ZIP </span>«span style='font-family: "Microsoft YaHei";background:white'»文件«/span»<span style='font-family:arial; background:white'> (</span><span style='font-weight:bold;font-family:arial; background:white'>keys.zip</span><span style='font-family:arial;background: white'>) </span>«span style='font-family:"Microsoft YaHei";background:white'»复制到本地计算机上的某个位置，并抽取«/span»<span style='font-family:arial;background:white'> ZIP </span>«span style='font-family: "Microsoft YaHei";background:white'»文件内容。«/span»  
    «span style='font-family:"Microsoft YaHei"; background:white'»密钥存储«/span»<span style='font-family:arial;background:white'> ZIP </span>«span style='font-family:"Microsoft YaHei";background:white'»文件包含一个名为«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>signer_config</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»的目录。«/span»
| <span style='color:#DA3800'>注意</span> | <span style='color:#333333'>保护密钥存储文件。最好的做法是在完成此步骤后将它们从临时位置移除。</span> |
|----|----|
12. <span style='background: white'>查找以下软件包：</span>
    - <span style='background:white'>Teamcenter 12.3</span>
    - <span style='background: white'>微服务框架</span>
13. «span style='font-family:"Microsoft YaHei";background:white'»使用相应的命令从安装位置启动«/span»<span style='font-family:arial;background:white'> Web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序管理器：«/span»
    - <span style='font-family:arial;background:white'>Windows </span>«span style='font-family:"Microsoft YaHei";background:white'»系统：«/span»<span style='font-weight:bold;font-family:arial;background:white'>insweb.bat</span>
    - <span style='font-family:arial;background:white'>Linux </span>«span style='font-family: "Microsoft YaHei";background:white'»系统：«/span»<span style='font-weight:bold; font-family:arial;background:white'>insweb.sh</span>
<img src="8c2c5e3247831.png" alt="image1" />
14. «span style='font-family:"Microsoft YaHei";background:white'»从软件包中复制«/span»<span style='font-family:arial;background:white'> ICD </span>«span style='font-family: "Microsoft YaHei";background:white'»文件。这将填充可供安装的解决方案列表。«/span»
15.  «span style='font-family:"Microsoft YaHei";background:white'»单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»复制«/span»<span style='font-weight:bold;font-family:arial;background:white'> ICD</span>«span style='font-family:"Microsoft YaHei";background:white'»。«/span»
16.  «span style='font-family:"Microsoft YaHei";background:white'»在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»复制«/span»<span style='font-weight:bold;font-family:arial;background:white'> ICD </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»文件«/span»«span style='font-family:"Microsoft YaHei";background:white'»对话框中，单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»浏览«/span»«span style='font-family:"Microsoft YaHei";background:white'»并浏览到以下位置：«/span»  
    <span style='font-style:italic;font-family:arial;background:white'>Teamcenter-kit</span><span style='font-weight:bold;font-family:arial;background:white'>\Web_tier\icd</span>
17.  «span style='font-family:"Microsoft YaHei";background:white'»单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»确定«/span»«span style='font-family:"Microsoft YaHei";background:white'»，从包中复制«/span»<span style='font-family:arial;background:white'> ICD </span>«span style='font-family: "Microsoft YaHei";background:white'»文件。«/span»
18.  «span style='font-family:"Microsoft YaHei";background:white'»重复步骤«/span»<span style='font-family:arial;background:white'> a </span>«span style='font-family: "Microsoft YaHei";background:white'»至«/span»<span style='font-family:arial; background:white'> c</span>«span style='font-family:"Microsoft YaHei"; background:white'»，指定微服务框架«/span»<span style='font-family:arial;background: white'> ICD </span>«span style='font-family:"Microsoft YaHei";background:white'»文件的路径：«/span»  
    <span style='font-style:italic;font-family:arial;background:white'>Microservices-Framework-kit</span><span style='font-weight:bold;font-family:arial;background:white'>\Web_tier\icd</span>
19.  «span style='font-family:"Microsoft YaHei";background:white'»单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»添加«/span»«span style='font-family:"Microsoft YaHei";background:white'»，开始创建新的«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序。«/span»
20.  «span style='font-family:"Microsoft YaHei";background:white'»在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»添加«/span»<span style='font-weight:bold;font-family:arial;background:white'> Web </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»应用程序«/span»«span style='font-family:"Microsoft YaHei";background:white'»对话框中，创建«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序：«/span»
21.  «span style='font-family:"Microsoft YaHei";background:white'»为«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序键入«/span»«span style='font-weight:bold; font-family:"Microsoft YaHei";background:white'»名称«/span»«span style='font-family:"Microsoft YaHei";background:white'»和«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»登台位置«/span»«span style='font-family:"Microsoft YaHei";background:white'»。«/span»
22.  <span style='background: white'>输入软件位置：</span>
23.  <span style='background: white'>单击</span><span style='font-weight:bold;background:white'>添加</span><span style='background:white'>。</span>
24.  <span style='background: white'>在</span><span style='font-weight:bold;background:white'>添加磁盘位置</span><span style='background:white'>对话框中，输入软件位置：</span>
25.  «span style='font-family:"Microsoft YaHei";background:white'»单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»浏览«/span»«span style='font-family:"Microsoft YaHei";background:white'»，从步骤«/span»<span style='font-family:arial;background:white'> 2 </span>«span style='font-family: "Microsoft YaHei";background:white'»中抽取的密钥存储«/span»<span style='font-family: arial;background:white'> ZIP </span>«span style='font-family:"Microsoft YaHei"; background:white'»文件浏览到«/span»<span style='font-family:arial;background:white'></span><span style='font-weight:bold;font-family:arial;background:white'>signer_config</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»目录，然后单击«/span»«span style='font-weight: bold;font-family:"Microsoft YaHei";background:white'»应用«/span»«span style='font-family:"Microsoft YaHei";background:white'»。«/span»
26.  <span style='background: white'>单击</span><span style='font-weight:bold;background:white'>浏览</span><span style='background:white'>，浏览到微服务框架包的位置，然后单击</span><span style='font-weight: bold;background:white'>应用</span><span style='background:white'>。</span>
27.  «span style='font-family:"Microsoft YaHei";background:white'»单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»浏览«/span»«span style='font-family:"Microsoft YaHei";background:white'»，浏览至«/span»<span style='font-family:arial;background:white'> Teamcenter 12.3 </span>«span style='font-family:"Microsoft YaHei";background:white'»包的位置，然后单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»确定«/span»«span style='font-family:"Microsoft YaHei";background:white'»。«/span»
28.  <span style='background: white'>选择解决方案：</span>
29.  <span style='background: white'>单击</span><span style='font-weight:bold;background:white'>解决方案</span><span style='background:white'>。</span>
30.  «span style='font-family:"Microsoft YaHei";background:white'»在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»选择解决方案«/span»«span style='font-family:"Microsoft YaHei";background:white'»对话框中，选择以下«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»层解决方案：«/span»
    - <span style='font-weight:bold;font-family:arial;background:white'>Teamcenter - Web </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»层基础结构«/span»
    - <span style='font-weight:bold;font-family:arial;background:white'>Teamcenter - Web </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»层核心应用程序«/span»
    - <span style='font-weight:bold;font-family:arial;background:white'>Teamcenter </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»微服务«/span»
31.  «span style='font-family:"Microsoft YaHei";background:white'»确认您的选择，然后单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»确定«/span»«span style='font-family:"Microsoft YaHei";background:white'»以继续创建«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序。«/span»
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image2.png" style="width:5in;height:3.57292in" />
32.  «span style='font-family:"Microsoft YaHei";color:#333333;background:white'»在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";color:#333333;background: white'»修改所需的关联参数«/span»«span style='font-family:"Microsoft YaHei";color:#333333; background:white'»对话框中，确保以下关联参数的值正确：«/span»  
    **MICROSERVICE_ENABLED  **
    «span style='font-family:"Microsoft YaHei";color:#333333;background:white'»设为«/span»<span style='font-family:arial;color:#333333;background:white'></span><span style='font-weight:bold;font-family:arial;color:#333333;background:white'>true</span>«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»。«/span»  
    **MICROSERVICE_ADDRESS  **
    «span style='font-family:"Microsoft YaHei";color:#333333;background:white'»指定以下形式的服务调度程序«/span»<span style='font-family:arial;color:#333333;background:white'> URL </span>«span style='font-family:"Microsoft YaHei";color:#333333;background:white'»的逗号分隔列表：«/span»  
    [<span style='font-weight:bold;font-family:arial; color:#333333;background:white'>http://</span><span style='font-style:italic; font-family:arial;color:#333333;background:white'>host</span><span style='font-weight:bold;font-family:arial;color:#333333;background:white'>:</span><span style='font-style:italic;font-family:arial;color:#333333;background:white'>port</span>](http://host:port)
<img src="C:\Users\lindo\AppData\Local\Temp\东乐 的笔记本\pandoc/media/image3.png" style="width:5in;height:2.83333in" />
33.  «span style='font-family:"Microsoft YaHei";background:white'»单击«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»确定«/span»«span style='font-family:"Microsoft YaHei";background:white'»开始构建«/span»<span style='font-family:arial;background:white'> WAR </span>«span style='font-family: "Microsoft YaHei";background:white'»文件。«/span»  
    «span style='font-family:"Microsoft YaHei"; background:white'»当«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family:"Microsoft YaHei";background:white'»应用程序生成完成时，关闭«/span»<span style='font-family:arial;background:white'> Web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序管理器。«/span»
34.  «span style='font-family:"Microsoft YaHei";background:white'»在您指定的登台位置下的«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>deployment</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»目录中找到«/span»<span style='font-family:arial; background:white'> WAR </span>«span style='font-family:"Microsoft YaHei"; background:white'»文件«/span»<span style='font-family:arial;background:white'> (</span><span style='font-weight:bold;font-family:arial;background:white'>tc.war</span><span style='font-family:arial;background:white'>)</span>«span style='font-family: "Microsoft YaHei";background:white'»。«/span»
35.  «span style='font-family:"Microsoft YaHei";background:white'»在受支持的应用程序服务器上部署«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»应用程序，如«/span»<span style='font-family:arial; background:white'> Teamcenter </span>«span style='font-family:"Microsoft YaHei"; background:white'»帮助集中«/span»<span style='font-family:arial;background:white'></span><span style='font-style:italic;font-family:arial;background:white'>Web Application Deployment</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»所述。«/span»

*来自 \< <https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1848891:xid1761839>\>*

«span style='font-family:"Microsoft YaHei";background:white'»如果在«/span»<span style='font-family:arial;background:white'> Windows </span>«span style='font-family:"Microsoft YaHei";background:white'»主机上安装微服务框架节点，则可以临时更改该节点上的微服务实例数。«/span»
«span style='font-family:"Microsoft YaHei";background:white'»此方法简单快速，但只是临时的。您必须运行«/span»<span style='font-family:arial;background:white'> TEM </span>«span style='font-family: "Microsoft YaHei";background:white'»或部署中心才能配置在重新启动微服务管理器时启动的实例数，或将新的微服务添加到节点中。«/span»
6.  «span style='font-family:"Microsoft YaHei";background:white'»在运行微服务管理器的节点上，浏览到«/span»<span style='font-family:arial;background:white'></span>«span style='font-weight: bold;font-family:"Microsoft YaHei";background:white'»本地主机«/span»<span style='font-weight:bold;font-family:arial;background:white'>:8082</span>«span style='font-family:"Microsoft YaHei";background:white'»。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»默认的登录凭证是«/span»<span style='font-family:arial;background:white'> "manager" </span>«span style='font-family:"Microsoft YaHei";background:white'»和«/span»<span style='font-family:arial;background:white'> "manager"</span>«span style='font-family:"Microsoft YaHei";background:white'»。登录凭证可以在登录到管理界面后更改。«/span»
| <span style='color:#666666'>提示</span> | <span style='color:#333333'>如果端口 8082 不起作用，则通过在**serverPool.properties**文件中进行设置来检查端口。该文件存储在*TC_ROOT***\microservice_manager\\**目录中。</span> |
|----|----|
<span style='font-weight: bold;background:white'>代理视图</span><span style='background:white'>页面打开。</span>
7.  «span style='font-family:"Microsoft YaHei";background:white'»在«/span»«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»管理服务«/span»«span style='font-family:"Microsoft YaHei";background:white'»下，单击要管理的微服务页面的链接。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»例如，单击«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>id=hello_service</span>«span style='font-family:"Microsoft YaHei";background:white'»。«/span»  
    «span style='font-family:"Microsoft YaHei";background:white'»该服务的管理页面打开。«/span»
8.  «span style='font-family:"Microsoft YaHei";background:white'»要更改微服务实例的数量，可在页面底部«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>Change_Replicas</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»旁边的框中输入一个新值。«/span»
9.  «span style='font-family:"Microsoft YaHei";background:white'»要应用新值，请单击«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>Change_Replicas</span>«span style='font-family:"Microsoft YaHei";background:white'»。«/span»

*来自 \< <https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1845196>\>*

«span style='font-family:"Microsoft YaHei";background:white'»可以使用以下步骤为«/span»<span style='font-family:arial;background:white'> Teamcenter Java EE </span>«span style='font-family:"Microsoft YaHei";background:white'»架构«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»层和服务调度程序之间传输的数据配置«/span»<span style='font-family:arial;background:white'> HTTPS </span>«span style='font-family:"Microsoft YaHei";background:white'»加密。«/span»
10. «span style='font-family:"Microsoft YaHei";background:white'»获取适合与服务调度程序进行«/span»<span style='font-family:arial;background:white'> HTTPS </span>«span style='font-family:"Microsoft YaHei";background:white'»通信的证书。您可以从公共证书颁发机构«/span»<span style='font-family:arial;background:white'> (CA) </span>«span style='font-family: "Microsoft YaHei";background:white'»获取证书，也可以使用«/span»<span style='font-family: arial;background:white'> Open SSL </span>«span style='font-family:"Microsoft YaHei"; background:white'»等工具生成自己的自签名证书。«/span»
11. «span style='font-family:"Microsoft YaHei";background:white'»使用«/span»<span style='font-family:arial;background:white'> Java keytool </span>«span style='font-family:"Microsoft YaHei";background:white'»创建«/span»<span style='font-family:arial;background:white'> Java </span>«span style='font-family: "Microsoft YaHei";background:white'»密钥存储（«/span»<span style='font-family:arial; background:white'>jks </span>«span style='font-family:"Microsoft YaHei"; background:white'»或«/span»<span style='font-family:arial;background:white'> pkcs12</span>«span style='font-family:"Microsoft YaHei";background:white'»），并将私有证书放在该存储中。«/span»
12. <span style='background: white'>根据节点操作系统，将密钥存储放在正确的目录中。</span>
| <span style='color:#333333'>**OS**</span> | <span style='color:#333333'>**密钥存储位置**</span> |
|----|----|
| <span style='color:#333333'>Linux</span> | <span style='color:#333333'>在主微服务节点的 docker secrets 目录中。</span> |
| <span style='color:#333333'>Windows</span> | <span style='color:#333333'>在运行服务调度程序的每个微服务节点的*installation_root***\microservices\secrets**中的 secrets 文件夹中。</span> |
13. «span style='font-family:"Microsoft YaHei";background:white'»根据微服务节点主机«/span»<span style='font-family:arial;background:white'> OS</span>«span style='font-family: "Microsoft YaHei";background:white'»，编辑«/span»<span style='font-family:arial; background:white'></span><span style='font-weight:bold;font-family:arial; background:white'>service_dispatcher.json</span><span style='font-family:arial; background:white'></span>«span style='font-family:"Microsoft YaHei"; background:white'»文件«/span»<span style='font-family:arial;background:white'> (Windows) </span>«span style='font-family:"Microsoft YaHei";background:white'»或«/span»<span style='font-family:arial;background:white'></span><span style='font-weight: bold;font-family:arial;background:white'>tc_microservice_framework.yml</span><span style='font-family:arial;background:white'></span>«span style='font-family: "Microsoft YaHei";background:white'»文件«/span»<span style='font-family:arial; background:white'> (Linux) </span>«span style='font-family:"Microsoft YaHei"; background:white'»来扩展服务调度程序的«/span»<span style='font-family:arial;background: white'> ARGS </span>«span style='font-family:"Microsoft YaHei";background:white'»值，从而为以下参数提供值：«/span»
<table style="width:91%;">
<colgroup>
<col style="width: 47%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><span style='color:#333333'><strong>对于此参数</strong></span></th>
<th><span style='color:#333333'><strong>执行以下操作</strong></span></th>
</tr>
</thead>
<tbody>
<tr>
<td><span style='color:#333333'>protocol</span></td>
<td><span style='color:#333333'>使用<strong>https</strong>。</span></td>
</tr>
<tr>
<td><span style='color:#333333'>keystore</span></td>
<td><p><span style='color:#333333'>指定包含服务器端私钥（证书）的密钥存储（<strong>jks</strong>或<strong>pkcs12</strong>）的位置。</span></p>
<p><span style='color:#333333'>可以使用任何行业标准工具（如 Java "keytool" 命令）创建密钥存储。它可以包含 CA 签名（从证书颁发机构购买）或自签名（自生成）的证书。</span></p></td>
</tr>
<tr>
<td><span style='color:#333333'>Kspassword</span></td>
<td><span style='color:#333333'>输入密钥存储的密码。</span></td>
</tr>
<tr>
<td><span style='color:#333333'>keystoreType（如果不是 jks）</span></td>
<td><span style='color:#333333'>输入<strong>JKS</strong>（默认）或<strong>PKCS12</strong>，具体取决于信任存储的类型。</span></td>
</tr>
</tbody>
</table>
<span style='font-weight:bold;font-family:arial;background:white'>service_dispatcher.json</span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»（«/span»<span style='font-weight:bold;font-family:arial;background:white'>Windows </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»主机）«/span»
«span style='font-family:"Microsoft YaHei";background:white'»将安全属性添加到文件«/span»<span style='font-family:arial;background:white'></span><span style='font-style: italic;font-family:arial;background:white'>installation_path</span><span style='font-weight:bold;font-family:arial;background:white'>\microservices\services_config\service_dispatcher.json</span>«span style='font-family:"Microsoft YaHei";background:white'»。«/span»
<table>
<colgroup>
<col style="width: 21%" />
<col style="width: 78%" />
</colgroup>
<thead>
<tr>
<th><span style='color:#666666'>示例</span></th>
<th><p><span style='color:#333333'>原始文件内容，包括 ARGS 设置：</span></p>
<p></p>
<blockquote>
<p><span style='color:#333333'>{</span></p>
<p><span style='color:#333333'>"service_dispatcher":{</span></p>
<p><span style='color:#333333'>"image":"service_dispatcher-1.2.0",</span></p>
<p><span style='color:#333333'>"environment":[</span></p>
<p><span style='color:#333333'>"ARGS=-Dport=9090-Deureka.serviceUrl.default=http://msnode1:8080/eureka/v2"</span></p>
<p><span style='color:#333333'>]</span></p>
<p><span style='color:#333333'>}</span></p>
<p><span style='color:#333333'>}</span></p>
</blockquote>
<p><span style='color:#333333'>添加安全属性后的内容：</span></p>
<p></p>
<blockquote>
<p><span style='color:#333333'>{</span></p>
<p><span style='color:#333333'>"service_dispatcher":{</span></p>
<p><span style='color:#333333'>"image":"service_dispatcher-1.2.0",</span></p>
<p><span style='color:#333333'>"environment":[</span></p>
<p><span style='color:#333333'>"ARGS=-Dport=9090-Dprotocol=https-Dkeystore=<em>path_to_keystore_file</em></span></p>
<p><span style='color:#333333'>-Dkspassword=<em>keystore_password</em>-Deureka.serviceUrl.default=</span></p>
<p>«span style='color:#333333'» <a href="http://msnode1:8080/eureka/v2%22«/span">http://msnode1:8080/eureka/v2"«/span</a>»</p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<span style='font-weight:bold;font-family:arial;background:white'>tc_microservice_framework.yml</span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»（«/span»<span style='font-weight:bold;font-family:arial;background:white'>Linux </span>«span style='font-weight:bold;font-family:"Microsoft YaHei";background:white'»主机）«/span»
«span style='font-family:"Microsoft YaHei";background:white'»在服务调度程序«/span»<span style='font-family:arial;background:white'> (Eureka) Docker </span>«span style='font-family:"Microsoft YaHei";background:white'»容器中，将安全属性添加到文件«/span»<span style='font-family:arial;background:white'></span><span style='font-style: italic;font-family:arial;background:white'>installation-path</span><span style='font-weight:bold;font-family:arial;background:white'>/container/tc_microservice_framework.yml</span>«span style='font-family:"Microsoft YaHei";background:white'»。还必须将密钥存储文件作为机密添加。«/span»
<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 82%" />
</colgroup>
<thead>
<tr>
<th><span style='color:#666666'>示例</span></th>
<th><p><span style='color:#333333'>添加安全属性和密钥存储文件之前的文件内容</span></p>
<p></p>
<blockquote>
<p><span style='color:#333333'>service_dispatcher:</span></p>
<p><span style='color:#333333'>image:siemens/teamcenter/service_dispatcher:1.2.0</span></p>
<p><span style='color:#333333'>deploy:</span></p>
<p><span style='color:#333333'>replicas:1</span></p>
<p><span style='color:#333333'>environment:</span></p>
<p><span style='color:#333333'>-ARGS=-Dport=9090-Deureka.serviceUrl.default=http://eureka:8080/eureka/v2/</span></p>
<p><span style='color:#333333'>ports:</span></p>
<p><span style='color:#333333'>-9090</span></p>
<p><span style='color:#333333'>depends_on:</span></p>
<p><span style='color:#333333'>-eureka</span></p>
</blockquote>
<p><span style='color:#333333'>添加安全属性后的文件：</span></p>
<p></p>
<blockquote>
<p><span style='color:#333333'>service_dispatcher:</span></p>
<p><span style='color:#333333'>image:siemens/teamcenter/service_dispatcher:1.2.0</span></p>
<p><span style='color:#333333'>deploy:</span></p>
<p><span style='color:#333333'>replicas:1</span></p>
<p><span style='color:#333333'>environment:</span></p>
<p><span style='color:#333333'>-ARGS=-Dport=9090-Dprotocol=https-Dkeystore=<em>my_keystore_file</em></span></p>
<p><span style='color:#333333'>-Dkspassword=<em>keystore_password</em>-Deureka.serviceUrl.default=</span></p>
<p>«span style='color:#333333'» <a href="http://eureka:8080/eureka/v2/«/span">http://eureka:8080/eureka/v2/«/span</a>»</p>
<p><span style='color:#333333'>ports:</span></p>
<p><span style='color:#333333'>-9090</span></p>
<p><span style='color:#333333'>depends_on:</span></p>
<p><span style='color:#333333'>-eureka</span></p>
<p><span style='color:#333333'>secrets:</span></p>
<p><span style='color:#333333'>-&lt;keystore_file&gt;</span></p>
<p></p>
<p><span style='color:#333333'>secrets:</span></p>
<p><span style='color:#333333'>&lt;keystore_file&gt;:</span></p>
<p><span style='color:#333333'>file:./secrets/<em>my_keystore_file</em></span></p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
14. <span style='background: white'>如果使用自签名证书，则执行以下操作：</span>
1.  «span style='font-family:"Microsoft YaHei";background:white'»将公共证书放在«/span»<span style='font-family:arial;background:white'> web </span>«span style='font-family: "Microsoft YaHei";background:white'»层的信任存储中。«/span»
2.  «span style='font-family:"Microsoft YaHei";background:white'»如果信任存储尚未位于配置的位置中，则将信任存储放在之前在«/span»<span style='font-family:arial;background:white'>“DC </span>«span style='font-family: "Microsoft YaHei";background:white'»微服务通信设置«/span»<span style='font-family: arial;background:white'>”</span>«span style='font-family:"Microsoft YaHei"; background:white'»中配置的位置。«/span»

*来自 \< <https://docs.plm.automation.siemens.com/tdoc/aw/4.3/aw_html_collection#uid:xid1284832:index_Deployment:xid1759805:xid1762059>\>*

