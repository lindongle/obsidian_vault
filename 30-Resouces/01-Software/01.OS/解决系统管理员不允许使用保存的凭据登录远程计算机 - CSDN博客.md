---
title: 解决系统管理员不允许使用保存的凭据登录远程计算机 - CSDN博客
updated: 2026-06-06T00:03
created: 2018-05-20T08:20:43
---

上午
已剪辑自: <https://blog.csdn.net/icewizardry/article/details/17265045>
<img src="c325389056ea45ada8693289e2417098.png" alt="image1" />
<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th>一台加入到 ActiveDirectory（活动目录 – AD，注：WinSRV2008）的 Windows 7 客户端，使用 Remote Desktop<br />
登录 AD 内部的计算机时能够使用已保存的凭据进行自动验证。但是 AD 外部的计算机即使保存了登录凭据，在连接时仍然会提示输入密码，如下图所示： Remote<br />
Desktop 会提示“<strong>系统管理员不允许使用保存的</strong>凭据登录远程计算机，原因是未完全验证其标识。请输入新凭据。”！这是出于安全考虑的设计，当然我们可以进行修改使加入到<br />
AD 内的系统能够保存 AD 外部计算机的凭据。 为此，在运行中输入 gpedit.msc，启动本地组策略编辑器。定位到 计算机配置 - 管理模板 - 系统 -<br />
凭据分配，打开右边窗体的“允许分配保存的凭据用于仅 NTLM 服务器身份验证”，如下图所示： 启用“允许分配保存的凭据用于仅 NTLM<br />
服务器身份验证”，并点击“将服务器添加到列表：显示”，在服务器列表中添加允许保存凭据的服务器名称和类型，如 dc.contoso.com<br />
上的终端服务器，即“TERMSRV/dc.contoso.com”。当然也可以输入“TERMSRV/*”允许保存所有计算机的远程终端凭据。 最后执行<br />
gpupdate /force 使修改的组策略生效，即可！</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
