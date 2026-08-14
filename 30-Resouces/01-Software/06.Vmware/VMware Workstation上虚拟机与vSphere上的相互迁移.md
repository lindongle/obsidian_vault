---
title: VMware Workstation上虚拟机与vSphere上的相互迁移
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:54
---

<span style='color:black'>**VMware Workstation上虚拟机与vSphere上的相互迁移**</span>
<span style='font-weight:bold;background:#F0F5F9'>1.在Workstation中更改虚拟机硬件版本</span>
<span style='background:#F0F5F9'>在Workstation中可以更改虚拟机的硬件版本，以适应其他版本的Workstation或vSphere。</span>
<span style='background:#F0F5F9'>（1）在Workstation中，用鼠标右键单击要更改的虚拟机（虚拟机要关闭电源），在弹出的快捷菜单中选择"管理→更改硬件兼容性"，如图1所示。</span>
![image1](cacc0123a684468a9082aae17dc46d51.png)
<span style='background:#F0F5F9'>图1 更改硬件兼容性</span>
<span style='background:#F0F5F9'>（2）在"选择虚拟机硬件兼容性"对话框中，在"硬件兼容性"列表中，选择新的硬件版本，在"兼容产品"处会显示当前选中版本所支持的vSphere版本，如图2所示。</span>
![image2](fc2054cad8f943b3ac23e012fd0948d9.png)
<span style='background:#F0F5F9'>图2 选择硬件兼容性</span>
<span style='background:#F0F5F9'>（3）在"转换前克隆"对话框，选择"更改此虚拟机"，如图3所示。</span>
![image3](c78b2e8017f047c1a5de296f2c18bc8d.png)
<span style='background:#F0F5F9'>图3 更改此虚拟机</span>
<span style='background:#F0F5F9'>（4）在"查看更改"对话框，显示应用的更改，单击"完成"按钮，如图4所示。</span>
![image4](f9f0a0ef70974f69b89d3c137bc9a304.png)
<span style='background:#F0F5F9'>图4 完成</span>
<span style='background:#F0F5F9'>（5）之后会开始转换虚拟机并完成虚拟机硬件的更改，如图5所示。</span>
![image5](24c0a57d944d4bb08e4c9aa3de64c038.png)
<span style='background:#F0F5F9'>图5 转换虚拟机完成</span>
<span style='font-weight:bold;background:#F0F5F9'>2 在Workstation中导出与导入OVF</span>
<span style='background:#F0F5F9'>在Workstation中导出与导入OVF，与在vSphere中类似，但比在vSphere中更简单，下面简要介绍。</span>
<span style='background:#F0F5F9'>（1）在Workstation中，选中导出为OVF的虚拟机（虚拟机要关闭电源），然后在"文件"菜单中选择"导出为OVF"，如图6所示。</span>
![image6](d920199d36d444b594976c7f26738986.png)
<span style='background:#F0F5F9'>图 6 导出为OVF文件</span>
<span style='background:#F0F5F9'>（2）在弹出的"将虚拟机导出为OVF"对话框中，选择保存OVF文件的位置，单击"保存"按钮，如图7所示。</span>
![image7](ec28ba28c93945489b3d51f8dcf54ec0.png)
<span style='background:#F0F5F9'>图 7 选择导出位置</span>
<span style='background:#F0F5F9'>如果要在Workstation中导入OVF，步骤如下。</span>
<span style='background:#F0F5F9'>（1）在Workstation中，从"文件"菜单选择打开"按钮"，如图8所示。</span>
![image8](6f5379ac9bc242f8870f4b722c2aaa92.png)
<span style='background:#F0F5F9'>图 8 打开</span>
<span style='background:#F0F5F9'>（2）在"打开"对话框中，浏览选择要导入的OVF文件，如图 9 所示。</span>
![image9](0944a30ba1814f78b0899fb6f4e9ca6e.png)
<span style='background:#F0F5F9'>图 9 选择要导入的文件</span>
<span style='background:#F0F5F9'>（3）在"导入虚拟机"对话框中，设置导入的虚拟机名称及保存位置，单击"导入"按钮，如图10所示，之后则完成虚拟机的导入。</span>
![image10](14d9c969a8bd462eb54e4575cd89f495.png)
<span style='background:#F0F5F9'>图 10 导入虚拟机</span>
<span style='font-weight:bold;background:#F0F5F9'>3 存储浏览器复制或下载</span>
<span style='background:#F0F5F9'>如果在两个vSphere之间互相传送虚拟机，而这vSphere又没有在同一个网络中，除了使用导出、导入OVF的方法外，还可以使用vSphere Client或vSphere Web Client，通过下载、上传虚拟机文件夹的方式交互。下面介绍这一方法。</span>
<span style='background:#F0F5F9'>3.1 从vSphere下载虚拟机</span>
<span style='background:#F0F5F9'>可以通过浏览ESXi的存储，下载虚拟机所在文件夹的方式，将虚拟机下载到本地，保存在活动硬盘，然后将此活动硬盘拿到另一个vSphere处，使用"上载文件夹"的方式，传送虚拟机。在vSphere中下载虚拟机文件夹的方法如下。</span>
<span style='background:#F0F5F9'>（1）使用vSphere Client登录到vCenter Server或ESXi，在左侧选中ESXi主机，在"配置→存储器"中，右击浏览保存虚拟机的存储器，在弹出的快捷菜单中选择"浏览数据存储"，如图3-1所示。</span>
![image11](ca0785be7c9345d3a92417d9cb012b18.png)
<span style='background:#F0F5F9'>图3-1 浏览数据存储</span>
<span style='background:#F0F5F9'>（2）在"数据存储浏览器"中，在右侧选择要下载的虚拟机文件夹（不要展开该虚拟机），单击工具栏上的"</span>
![image12](cdeba8dbfd1741788b94b1756e49a1fe.png)
<span style='background:#F0F5F9'>"按钮，将此虚拟机下载到本地计算机，如图3-2所示。</span>
![image13](62aaed5776c741118e2774bc3ba7285a.png)
<span style='background:#F0F5F9'>图3-2 下载文件夹</span>
<span style='background:#F0F5F9'>（3）在"浏览文件夹"对话框中，选中一个位置，保存要下载的文件夹，如图3-3所示。</span>
![image14](af1738b21dc742ca97663eba9eaaef6c.png)
<span style='background:#F0F5F9'>图3-3 选择保存位置</span>
<span style='background:#F0F5F9'>（4）之后vSphere Client将下载选定的文件（夹），如图3-4所示。</span>
![image15](790ac63713294946b13667328bccf60c.png)
<span style='background:#F0F5F9'>图3-4 下载文件</span>
<span style='background:#F0F5F9'>（5）下载之后，打开"资源管理器"，可以看到，下载的虚拟硬盘是"厚置备"格式，如图3-5所示。</span>
![image16](7a792ba707b6441abf80463e42a961ab.png)
<span style='background:#F0F5F9'>图3-5 厚置备格式</span>
<span style='background:#F0F5F9'>如果要在Workstation中使用此虚拟机，则在Workstation的"文件"菜单中选择"打开"命令，浏览选择下载后的虚拟机的配置文件（图3-5中的vmx文件）即可打开。</span>

*来自 \< <https://m.jb51.net/article/179911.htm>\>*

2020年8月26日
11:06
