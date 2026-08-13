---
title: EWI用户帮助手册的配置
updated: 2026-06-06T10:08
created: 2020-03-17T08:14:48
tags:
  - TC
---

EWI用户帮助手册的配置
2020年3月17日
8:14

## <span style='color:#2E75B5'>EWI用户帮助手册的配置 </span>
![image1](a4972531d5b74b70aa930cbecc8d90e0.gif)
«span style='font-weight:bold;background: \#59C3F9'»作者：王怀金 审校：刘杰«/span»
**系统版本：TC 10.1.5、EWI 3.3**

EWI(Electronic Work Instructions，电子作业指导书)部署后，生产现场的工人可以通过浏览器、移动端查看结构化工艺及工艺文件的内容；在显示面板中可以通过配置展示自定义的EWI-用户帮助手册。

![image2](291a2c9d138841a3ae8e8264c6da968c.png)
<span style='color:#3F3F3F;text-align:center'>**配 置 过 程**</span>
![image2](291a2c9d138841a3ae8e8264c6da968c.png)
![image3](e798e653a71c4923bf632a2bc427f7df.png)
找到TC_ROOT\install\ewi0electronicwi\data\EwiGatewayTiles
Cots_Install.xml,去掉上述红框内的注释标签，修改RoleScope role，将Operator修改为允许查看“EWI-用户帮助手册”的角色，此处改为DBA。
![image4](fa09f5321e044470869591edb08081f4.jpg)
**图1**
![image3](e798e653a71c4923bf632a2bc427f7df.png)
在tc命令行执行
aws2_install_tilecollections -u=infodba -p=infodba -g=dba
-mode=add - file=D:\Siemens\Teamcenter10\install\\
ewi0electronicwi \data\\ EwiGatewayTilesCots_Install.xml
![image5](09d0026dfa6d4b1aa058a810b1522ea8.jpg)
**图2**
![image3](e798e653a71c4923bf632a2bc427f7df.png)
用解压工具打开TC_ROOT\aws2\stage\out\awc.war，在\assets1529593293108\docs\zh_CN下，将“EWI_UserAssistance.pdf”替换成我们编辑好的用户帮助手册。
![image6](957372f9560b4aec924ebc66832b5aef.png)
**图3**
![image7](9b3dff125a694b008829ad1306caea17.jpg)
**图4  **

![image3](e798e653a71c4923bf632a2bc427f7df.png)
登录weblogic更新awc部署
![image8](3fda6da141db44b99a17c99efa33f1aa.jpg)
**图5**
![image9](b04d07c73ba7469ab599b44396926bfe.jpg)
**图6**
![image3](e798e653a71c4923bf632a2bc427f7df.png)
重新登录awc,可以在开始面板看到“EWI用户帮助手册”，点击打开后可以看到我们自定义的手册内容。
![image10](53c1788b9258497dbb34a35b68cb6647.png)
**图7**
![image11](8ba2013bed2f4cd5b346b879211747d6.jpg)
**图8**
<span style='color:#FEFEFE;text-align:center'>**关注我们**</span>
![image12](44dc9a2f70ed408c923a0fc9ddd2aa39.png)
![image13](5c0a01efc80c47a3856b27a1e9c2d464.jpg)
阅读
在看
已同步到看一看[写下你的想法](javascript:;)
前往“发现”-“看一看”浏览“朋友在看”
![image14](8606612127634a8cb5be0f7da099853f.png)
前往看一看
**看一看入口已关闭**
在“设置”-“通用”-“发现页管理”打开“看一看”入口
[我知道了](javascript:;)
已发送
取消
#### *<span style='color:#5B9BD5'>发送到看一看 </span>*
发送
EWI用户帮助手册的配置
最多200字，当前共字
发送中
相关阅读
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
[更多文章](javascript:;)
[查看更多相关内容](javascript:;)
正在加载
以上推荐为优质及原创文章

微信扫一扫  
关注该公众号

微信扫一扫  
使用小程序
[取消](javascript:void(0);) [允许](javascript:void(0);)
[取消](javascript:void(0);) [允许](javascript:void(0);)
[知道了](javascript:;)
**长按识别前往小程序**

[\<From: http://mp.weixin.qq.com/s?\_\_biz=MzAwMTAxMTY1NQ==&mid=2655045703&idx=5&sn=73bba2973fb23f7413977e5e73b4038e&chksm=815452efb623dbf98e6e25f8730a1d19a0c5fd1ed421f1dafde0e6a28386ce51a91a733ac3a5&mpshare=1&scene=1&srcid=&sharer_sharetime=1584404084534&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd\>](http://mp.weixin.qq.com/s?__biz=MzAwMTAxMTY1NQ==&mid=2655045703&idx=5&sn=73bba2973fb23f7413977e5e73b4038e&chksm=815452efb623dbf98e6e25f8730a1d19a0c5fd1ed421f1dafde0e6a28386ce51a91a733ac3a5&mpshare=1&scene=1&srcid=&sharer_sharetime=1584404084534&sharer_shareid=c56166e7a99de9453eabeabfa769295f#rd)
