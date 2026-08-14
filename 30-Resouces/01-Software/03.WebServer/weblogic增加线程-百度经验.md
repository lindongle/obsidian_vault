---
title: weblogic增加线程-百度经验
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:54
---

weblogic增加线程-百度经验
2019年9月18日
4:58

已剪辑自: <https://jingyan.baidu.com/article/f3e34a12aacac0f5eb6535d9.html>
weblogic增加线程的方法我在这里收集了一下，一共有三种给大家分享一下
## <span style='color:#2E75B5'>第一种修改配置文件config.xml</span>
1.  1
安装weblogic，然后找到weblogic安装目录，找到配置文件，文件路径：D:\bea\user_projects\domains\mydomain\config
![image1](bcc047553c304509a9544b69480e8a0c.jpg)
[步骤阅读](http://jingyan.baidu.com/album/f3e34a12aacac0f5eb6535d9.html?picindex=1)
2.  2
在CONFIG.XML中的 \<server\>     \<name\>Adminserver\</name\>     \<self-tuning-thread-pool-size-min\>1000\</self-tuning-thread-pool-size-min\>     \<self-tuning-thread-pool-size-max\>1000\</self-tuning-thread-pool-size-max\>     ...  \</server\>
添加
![image2](38095f0195f944619b98808b6d40ac4b.jpg)
[步骤阅读](http://jingyan.baidu.com/album/f3e34a12aacac0f5eb6535d9.html?picindex=2)
END
## <span style='color:#2E75B5'>直接在启动命令里加上</span>
1.  1
在D:\bea\user_projects\domains\mydomain\bin 中的setDomainEnv.sh文件中找到JAVA_OPTIONS，然后在其上添加 -Dweblogic.threadpool.MinPoolSize=800 -Dweblogic.threadpool.MaxPoolSize=800
注意命令行前的“-”
![image3](6b73682df88d48c18ca3469fdf6b6ed5.jpg)
[步骤阅读](http://jingyan.baidu.com/album/f3e34a12aacac0f5eb6535d9.html?picindex=3)
2.  2
.sh后缀是linux服务器上的，如果是windows,在startweblogic.cmd脚本中加入一下java启动参数：-Dweblogic.configuration.schemaValidationEnabled=false
END
经验内容仅供参考，如果您需解决具体问题(尤其法律、医学等领域)，建议您详细咨询相关领域专业人士。
举报*作者声明：*本篇经验系本人依照真实经历原创，未经许可，谢绝转载。
