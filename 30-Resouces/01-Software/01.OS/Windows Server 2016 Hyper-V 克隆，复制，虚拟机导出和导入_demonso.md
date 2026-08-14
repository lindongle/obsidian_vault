---
title: Windows Server 2016 Hyper-V 克隆，复制，虚拟机导出和导入_demonso...
updated: 2026-06-06T10:05:33
created: 2026-07-05T17:04:53
---

Windows Server 2016 Hyper-V 克隆，复制，虚拟机导出和导入_demonson的专栏-CSDN博客_hyperv复制虚拟机
已剪辑自: <https://blog.csdn.net/demonson/article/details/81873201>
点“开始”-“Windows管理工具”-“Hyper-V管理器”，打开“Hyper-V管理器”，或者打开“服务器管理器”-“工具”-“Hyper-V管理器”，打开“Hyper-V管理器”  

![image1](cc53b46b9a604fec9d0e4d3daaccf0d2.png)
我们打开“Hyper-V管理器”后，看到已经创建了一台虚拟机，选中虚拟机，右击虚拟机选择“导出”  

![image2](ea5ac40cc2744c72bfce7ce6aebe053b.png)
指定导出的位置，我们把位置指定在E:\Hyper-V\template的文件夹中，点“导出”  

![image3](e5f6100905624f62a631fc5e8dba130a.png)
打开导出的文件目录，可以看到导出的Server文件夹，就是我们刚才导出的，导出虚拟机完成  

![image4](b1ca18ee0c4b4987bbe4521d4d237faa.png)
我们依然回到“Hyper-V管理器”，里面已经有一台Server虚拟机，我们把它重命名为Server1，然后进行导入，点击“导入虚拟机”  

![image5](4198dc465b524061aea8daa295e0582b.png)
运行“导入虚拟机”向导，点击“下一步”  

![image6](abddaf2b6aed4e45a199f9e546a21d2f.png)
定位文件夹，就是要找到导出的虚拟机目录，这里点“浏览”  

![image7](74c8b91346ec436da4fa64a39402bac1.png)
找到我们之前导出的虚拟机文件目录，点击“选择文件夹”  

![image8](9c859ca5b7474ec89f118efe855fbf4c.png)
点击“下一步”  

![image9](b0f7434886904f7f957509003d71a95b.png)
选择虚拟机，里面默认就只有一台虚拟机，点击“下一步”  

![image10](5e0b42bce00e4b5084474fe89383b35f.png)
选择导入类型，我这里选择“复制虚拟机（创建新的唯一ID）”，当然也可以根据需要选择导入类型，然后点击“下一步”  

![image11](c8147a3cfdca4f15a267129d2c576b6a.png)
选择目标就是将虚拟机文件存放在什么位置，我这里都指定在E\Hyper-V\Server2文件夹，当然也可以默认，但我觉得这样不规范，点击“下一步”  

![image12](36b0869eb7c64f86ad59aa85da9f4ead.png)
设置虚拟机硬盘的存放位置，我存放在E:\Hyper-V\Server2\Virtual Hard Disks\文件位置，点击“下一步”  

![image13](7c7c3f19c2bf4c679d3d8402ca1601dc.png)
确认配置，点击“完成”  

![image14](735fc771a92b42edb36d42ed37033b6d.png)
这时我们在Hyper-V管理器中可以看到导入的虚拟机Server了，导入虚拟机完成  

![image15](df28b1957c774fae890b66e124b56203.png)
星期二, 五月 11, 2021
1:44 下午
