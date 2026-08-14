---
title: eclipse中SVN的安装 - 风清云淡 - CSDN博客
updated: 2026-06-06T10:05:34
created: 2026-07-05T17:04:55
---

eclipse中SVN的安装 - 风清云淡 - CSDN博客
2019年7月27日
6:55

已剪辑自: <https://blog.csdn.net/qq_34975710/article/details/84929940>
进行版本控制可以有SVN、Git等等，具体使用哪个看公司了。  
实际开发中会存在一些需求，如备份、协同修改、查看历史版本等等，要是靠每个开发人员自己解决肯定不现实，到时候会出现五花八门的情况，这就需要版本管理。不多说，首先来看看SVN在eclipse上的安装。
### <span style='color:#5B9BD5'>一、安装</span>
1、点击eclipse菜单栏上的help —\> Eclipse Marketplace
![image1](71ca419619074ce4bc9a404f74007e8e.png)
2、在弹出的窗口中搜索subclipse，然后install
![image2](caaa001d959a436b939aebe1b0f0c77d.png)
3、点击comfirm
![image3](e545469240cf49af8bcb0be2d387bf43.png)
4、I accept，然后finish，等待安装完成，安装完成后重启eclipse
![image4](87b5d0ec9eb24072a30dec8471d35f2f.png)
5、检查是否安装成功  
点击菜单栏Window—\>Preferences，然后找到Team点开，看到有SVN就说明插件安装成功。
![image5](b3e5b3fcf0ea40188551a0a9fa76e53a.png)
### <span style='color:#5B9BD5'>二、使用</span>
首先可以提前创建好一个工程。
#### *<span style='color:#5B9BD5'>1、准备</span>*
1、打开SVN资源库视图窗口  
window —\> show view —\> other —\> svn,点击svn资源库
![image6](44c8637fe4e44eed8661d5011aca18cc.png)
2、新建资源库位置  
因为你是后面是要把工程提交到SVN服务器的，也要从SVN服务器上获取工程，所以先要创建一个资源库位置，也就是指定工程的路径。当然有个前提就是自己需要现在SVN的版本库根目录创建这个工程对应的版本库目录。  
在svn资源库视图窗口空白处右键单击 —\> 新建 —\> 资源库位置
![image7](7863074f3a804b5a8308be3e8e81a347.png)
OA就是svn版本库根目录下与工程工程对应的版本库子目录
![image8](45a1216634724a068969ca78228598e0.png)
#### *<span style='color:#5B9BD5'>2、提交</span>*
右键单击工程 --\> team --\> shared projects
![image9](e2eee9be0f9c48da86d515a2a255bc1d.png)

![image10](ea8172600b78410f97ef07a93bad79db.png)

![image11](d32bdeaf615b4976a682c3e62e4ea2a6.png)
若出现[svn 认证失败请看解决办法](https://blog.csdn.net/qq_34975710/article/details/85175659)
![image12](be60eed8ee3843fb8ba1a3e7c9d1f701.png)

![image13](da56143ebbb94aa98bd0d97343d4f646.png)
提交完后若要查看提交的情况，如下：
![image14](3201a99f9b82489c83b01582d0bf8566.png)

![image15](9258fbc6da164000a37f919a3a9284e8.png)
#### *<span style='color:#5B9BD5'>3、检出</span>*
第一次从SVN获取工程时叫检出（check out），import找到svn
![image16](d7ebbfef31ed4a509f5209d41bdccfc8.png)
选着资源库位置，第一次需要新建位置，跟上面提交工程时创建位置一样，其实就是设定所要检出的目标工程的位置，next
![image17](1e8cf32c323c44cd89cfe44474818ae1.png)
再next
![image18](089a9b6fd07545e3a045c2072a600d1f.png)
next
![image19](e5c5c33bef4d4f4aa31e48de82315bfa.png)
finish
![image20](a2e56240af1b4523a67b19acb58584d4.png)
#### *<span style='color:#5B9BD5'>4.更改后提交</span>*
更改内容后，同样右键单击工程 --\> team --\> 提交即可，后续步骤一样
#### *<span style='color:#5B9BD5'>5.更新</span>*
工程已经检出后，若若要获取最新的版本则只需更新即可，右键单击工程 --\> team --\> 更新
