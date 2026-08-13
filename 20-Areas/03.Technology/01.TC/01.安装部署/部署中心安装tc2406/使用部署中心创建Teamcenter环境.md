---
title: 使用部署中心创建Teamcenter环境
updated: 2026-06-06T10:09
created: 2024-09-13T14:22:05
tags:
  - TC安装部署
---

1.  将 Teamcenter 软件添加到存储库；
    1.  将软件介质解压后放到部署中心软件存储目录中，D:\DeploymentCenter\repository\software；
    2.  ![image1](3171e1af54a446e7ba6b2231f06f866f.png)
    3.  登录部署中心，点击软件存储库；
    4.  ![image2](f9ff37eab39541c08c367a1ed46df088.png)
    5.  软件存储库页面打开存储库的活动介质选项卡，并显示软件介质表；
    6.  验证添加的软件是否出现在可用软件列表中。列表可能需要几分钟才能更新
2.  创建环境并选择软件
    1.  在部署中心中，单击“环境”。
    2.  在命令栏下方最右侧，单击“添加环境”， 新环境将在“所有环境”列表中突出显示。
    3.  要查看新环境的属性，请选择“概览”。<span style='color:#FA0000'>注：类型根据实际情况选择</span>
    4.  ![image3](0fb3ba449bfa4d52a3e7ee157d4d4350.png)
    5.  选择“部署软件”以返回到软件任务

3.  ![image4](1cb5988a39144555a39dcc3a87e6819a.png)

4.  ![image5](60d432589756489b93b990a6332a6009.png)

5.  ![image6](e404aa01da50433092a279ee87811501.png)

6.  ![image7](0f52dbaa7b414d0da997a048d5f47c7e.png)
7.  设置单箱式后，所有填写主机名的地方都会自动同一使用相同主机名，尽量使用IP，修改任何配置都会自动修改所有主机名配置的地方；
8.  ![image8](a88c38ca580d42d2a3cd995e5cea07c8.png)

9.  ![image9](47206f97d92c41868a89e833667be1bf.png)
10. 添加以下内容：
Data Discovery Services/3D Visualization/Access Manager Active Workspace/Active Content/Active Workspace Assistant/Active Workspace Visualization 2D Viewer/Audit/Client Configuration/Document Management/ Change Management/Dispatcher Client for Rich Client/Active Workspace User Management/Dispatcher/Integration Framework Core/Integration Framework for Applications/Integration for NX Foundation/ NX Integration/NX Foundation/ NX Manager for Rich Client/Teamcenter Integration for NX Change Management/NX Part Family Classification Integration/Logical Object/MCAD Integration/Markup/ PLM XML Export and Import/preference Management/Reuse and Standardization/Teamcenter Gateway for EDA/Teamcenter Gateway for EDA Library/EDA Translation/ EDA for Business Modeler IDE/Cadence Orcad CIS Integration/Reporting/Teamcenter Gateway for SAP Business Suite and S/4HANA/4Tier Gateway Service Client (SAP)/T4S4 Gateway Service/T4S Demonstration Template/Teamcenter Gateway for SAP PLMSI/ Visualization Extension
11. ![image10](b5df498dfae64a8cb8592e194fd2cfb9.png)

12. ![image11](c2987afe1d284ceba6d71d37ac69c13e.png)
13. 添加：Business Modeler IDE 2 tier/Rich client four-tier/Teamcenter Management Console/Teamcenter Integration for NX Prerequisites，注不要添加volume，是单独安装额外卷时所需。企业层安装时会自动安装默认卷
14. ![image12](51fc5ddf909c443cb23c1e90b16e78f0.png)
15. 点击小眼睛可以显示所有配置参数：
![image13](e0a01f09c1cb4e2099de9e44f3afe2da.png)

16. ![image14](dfea50a38e1a49409bdedd2d85043f5c.png)

17. ![image15](a3df9161f6e94cf7aeda105b1a148bbf.png)

18. ![image16](fb4b22e7755846418510ef0edbc5448a.png)

19. ![image17](c857eb9109d2426f85ec13f6eda5645b.png)

20. ![image18](b48e0277a18649a2ac8229cb37fefed0.png)

21. ![image19](ba37655ab06849549c2e8e5515c935ad.png)

22. ![image20](942032651d8c494797de14462794fa5c.png)

23. ![image21](97c35044719a401ea7495549f977ab31.png)

24. ![image22](f8fba7d4fbec42c0b12081bfa34a14b9.png)

25. ![image23](df9569a65c324d01ab968e489bb097c0.png)

26. ![image24](e68dba87962f4f11b7f1c00cfb14993e.png)

27. ![image25](071833c85fdd46efb26aefe1f1585c7e.png)
28. 注意用户名前加主机名
29. ![image26](200312d02df245d48f4d3ee43088e6e9.png)

30. ![image27](7ec453d4d2104d4195384ab76f3e7b41.png)

31. ![image28](402bd688b6a74235a96aa2a9145bbe0c.png)

32. ![image29](32268a7eee99432bb21b8ec2f7414c73.png)

33. ![image30](e7446e9ac9de46cbaa9a25f08421f020.png)

34. ![image31](9c88021f202f4db38b1b7df482407193.png)

35. ![image32](12d5b7c23de945dea25f68c5df193598.png)

36. ![image33](7b7abf7ca86b463bad78e35db0311fca.png)

37. ![image34](89a2ebf02ce14e41a3bea7ba4af42346.png)

38. ![image35](8e2bb83a4ea149d9a47f42b15cbae08d.png)

39. ![image36](f6857b119c214ca88090226872aa00cd.png)

40. ![image37](e498c28cd1ab41b18972549da9a27baa.png)

41. ![image38](0dd7be56e91846fc97864aa9a464a165.png)

42. ![image39](7a40eb5228af4526bb53f5f72b50d39d.png)

43. ![image40](9405e3b9fc7644ba92dac0e3aa1b125f.png)
44. 
45. ![image41](e8bd0d9e66d14bafbcc6c1d9889d8ae9.png)

46. ![image42](0d7ee92107cd4b88b306bcf1428ac103.png)
47. 添加转换器：Async Service Translator
48. ![image43](fa74151ae09b42b99167f93533ec5e42.png)

49. ![image44](60eabeac2d684020b2ab63e17f7e51be.png)

50. ![image45](cf10125ab76e4076b4420e08fb23ecdc.png)

51. ![image46](9c6e1e5a351b4d4a92355fa7f463edb1.png)

52. ![image47](190c77656c69404c9d91f15a8cb60ff9.png)
