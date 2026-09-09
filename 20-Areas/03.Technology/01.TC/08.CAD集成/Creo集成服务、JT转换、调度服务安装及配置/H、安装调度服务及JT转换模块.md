---
title: H、安装调度服务及JT转换模块
updated: 2026-06-06T10:05
created: 2018-03-11T13:13:39
---

前提：在dba角色下新建dcproxy账户。
![image1](7facfbcf177144a5bbf7b0b6833e9618.gif)
1、管理员身份运行TEM，维护现有配置-添加/移除功能部件。点击下一步。
2、搜索中输入“调度”，点击搜索，勾选调度服务端、调度客户端，在企业知识基础中勾选Dispatcher Client for Rich Client点击下一步。
![image2](0eca91c95eb2480ead10873447d44d36.gif)

![image3](be022ab633c745b6b347078f8fbe9f95.gif)
3、弹出关闭服务的提示消息，点击OK。
![image4](be69ee043d574bf787fad6de57119082.gif)
4、输入infodba密码，点击下一步。
![image5](bd7f33c122bb4db8a3dacbc7c4cada61.gif)
5、输入操作系统的密码，点击下一步。
![image6](1390ddbad2fc4a639b59dc01ec5d01a9.gif)
6、默认，点击下一步。
![image7](d94a52569ca4457099bde45fbd8a1de0.gif)
7、默认点击下一步。
![image8](f283d9ccd0434a57bfedc18144be6999.gif)
8、输入调度服务的安装路径，并勾选安装模块、安装管理客户端。点击下一步。
![image9](0100af3eefef4135b3b9b17da7f1621c.gif)
9、勾选启动调度服务，其他默认，点击下一步。
![image10](468af7c7b9a746c987ce23feac054e3f.gif)
10、勾选ProE转换器，两个都选择，点击下一步。
![image11](8d65a55361864b3a947234f034ec9bfe.gif)
11、转换器主目录，选择JT转换的安装目录。D:\apps\Creo2jt，服务守护程序路径选择nmsd.exe的位置。D:\PTC\Creo 2.0\Common Files\M230\x86e_win64\nms\nmsd.exe，点击下一步。
![image12](061cf2a9021e41289102304f60567cc9.gif)
12、如果提示转换目录必须包含proetojt.bat，需要按照F安装转换服务的最后一步进行重命名。
13、输入dcproxy账户的密码，两遍。可以修改轮询时间间隔（即多久遍历一次调度任务）点击下一步。
![image13](54f1d9245bf740539a54df3c18296437.gif)
14、默认，点击下一步。
![image14](7411fb2ff8a049279ae102af6d9f7470.gif)
15、勾选使用当前的FCC，点击下一步。
![image15](9108b1d2a433405fa77b0bbae6a2ca84.gif)
16、默认，点击下一步。
![image16](1e83d74cc1aa4b26b562612bbaf70285.gif)
17、默认，点击下一步。
![image17](5f25c25f7f204727beaf896b91cae80b.gif)
18、点击开始，进行安装，安装完成后，点击关闭即可。
![image18](dceb7bd878334826ac4ea91e016089fd.gif)

