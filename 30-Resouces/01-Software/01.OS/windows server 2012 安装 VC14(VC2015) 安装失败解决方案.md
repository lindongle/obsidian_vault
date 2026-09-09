---
title: windows server 2012 安装 VC14(VC2015) 安装失败解决方案
updated: 2026-06-06T10:05
created: 2019-10-10T22:52:03
---

windows server 2012 安装 VC14(VC2015) 安装失败解决方案
星期四, 十月 10, 2019
2:52 下午
已剪辑自: <http://www.mamicode.com/info-detail-2553351.html>
原文地址：https://www.cnblogs.com/huoniao/articles/6186021.html
系统环境如下：cmd命令行-输入 systeminfo 如下图
![image1](a20b64e40e6a46cb8aa62de1b24a5695.png)

\- The VC14 builds require to have the Visual C++ Redistributable for Visual Studio 2015[x86 or x64](https://www.microsoft.com/en-us/download/details.aspx?id=48145)installed
下载链接
[http://www.microsoft.com/en-us/download/details.aspx?id=48145](https://www.microsoft.com/en-us/download/details.aspx?id=48145)

安装如下：
![image2](e71c0e4a830249fc805a1a3bf68b5997.png)

错误日志：Windows8.1-KB2999226-x64.msu 安装失败
![image3](63c95bd8e68e43ff923590181fa2e0d2.png)

我们找到这个文件夹，手动安装一下看看效果，如下：
![image4](0f301d3d6a1f4c5c9e1bb2a329963672.png)

解决方案如下：
先安装补丁KB2919442[立即下载基于 x64 的 Windows Server 2012 R2 的KB2919442补丁](https://www.microsoft.com/zh-cn/download/details.aspx?id=42153)。
下载地址<https://www.microsoft.com/zh-cn/download/details.aspx?id=42153>

KB2919442 安装完成后，继续安装Windows Server 2012 R2 Update (KB2919355) 所有补丁，如下
下载地址 [立即下载基于 x64 的 Windows Server 2012 R2 更新软件包。](https://www.microsoft.com/downloads/details.aspx?FamilyId=373b1bb0-6d55-462e-98b7-6cb7d9ef1448)

![image5](0e5d63477b2f4421b5b8f9af235c7f5b.png)

![image6](b251358292b54302b9314730174c8c04.png)

注意:必须按以下顺序安装更新:
clearcompressionflag.exe　　　　　　　　　　　　38 KB　　　　　　管理员身份运行，没有界面，后台运　　　　
Windows8.1-KB2919355-x64.msu 　　　　　　　690.8 MB　　　　　安装完成后，需要重起，这个安装过程根据你的硬件配置和网络决定安装速度。
Windows8.1-KB2932046-x64.msu 　　　　　　　48.0 MB
Windows8.1-KB2934018-x64.msu 　　　　　　　126.4 MB
Windows8.1-KB2937592-x64.msu 　　　　　　　303 KB
Windows8.1-KB2938439-x64.msu 　　　　　　　19.6 MB
Windows8.1-KB2959977-x64.msu 　　　　　　 2.8 MB

所有更新包安装完成后，接下来我们继续安装 Microsoft Visual C++ 2015 Redistributable (x64) - 14.0.23026
下载链接
[http://www.microsoft.com/en-us/download/details.aspx?id=48145](https://www.microsoft.com/en-us/download/details.aspx?id=48145)
如图：
![image7](39799af5b63b4f32a4914e37fb4c130c.png)

![image8](22488540692746959d6392e04ce9a77e.png)

![image9](e6f35cffce414fb48ad7a50c3a6fda13.png)

结束
[windows server 2012 安装 VC14(VC2015) 安装失败解决方案](http://www.mamicode.com/info-detail-2553351.html)
原文地址：https://www.cnblogs.com/caiyt/p/10122571.html
