---
title: (4条消息)使用war包部署在Tomcat中运行 - 恋、鑫如雨 - CSDN博客
updated: 2026-06-06T10:05
created: 2019-07-31T01:28:17
---

(4条消息)使用war包部署在Tomcat中运行 - 恋、鑫如雨 - CSDN博客
星期二, 七月 30, 2019
5:28 下午
已剪辑自: <https://blog.csdn.net/qq_40062320/article/details/81393326>
**准备工具，Tomcat ，eclipse**

**1 选择你要导出的war包，选择你要的项目然后按照我圈起来的去操作**
![image1](17cfceaebd6b4f258230127346c13066.png)

**2，然后找到Web包，web下面还有一个WAR.file点击进去，找不到就在上面可以搜索的**
![image2](4b266cb754e548b1953fafe29b624e42.png)

**3 第一个是你导出去的war包名称，第二个是你war包路径**
![image3](d0eaea14f5c0456fb7298324c40ac2d6.png)

**4 这里我是导入在E盘中的**
![image4](6abed2b746d64a368f22d49eafcbf6b3.png)

**5 把这个war包复制，然后去找你Tomcat的安装地址**
![image5](5786a70acdf9429da8f63bffd1672864.png)

**6 然后点击Tomcat进去，找到一个叫做webapps的文件夹**
![image6](ab7cc683454744c18ee9290c45c996a9.png)

**7 把你刚刚导出来的war包复制在这里就行啦**
![image7](f69b5ce8632e40ef994bba22785aa7e1.png)

**8 返回你的上一层找到你的bin,点击进去**
![image8](53f6e0c7ca3a406c800c382ed75f3217.png)

**9 找到 startup.bat 点击运行这个**
![image9](11aa7c2661a04248a916bcedf1c96010.png)

**10 运行就是这样的，就说明运行成功啦**
![image10](928ccb0ecaa94e5ba4b0db603c3608df.png)

**11 然后去一个浏览器打上你的地址 localhost：你的端口号/你的项目名称，你要运行的jsp，下面就是运行结果，我的端口号给我改过不是默认的端口号**
![image11](3e148fa82eb64c489b74f523476e189d.png)
