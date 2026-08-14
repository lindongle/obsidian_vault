---
title: 解除outlook附件大小限制
updated: 2026-06-06T00:20:40
created: 2026-07-05T17:04:56
---

1.  <span style='background: white'>退出 Outlook。</span>
2.  <span style='background: white'>启动注册表编辑器。</span>
3.  «span style='color:black'»找到并选择下面的注册表子项：  
    HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Preferences  
    注意：如果当前不存在该路径，请手动在注册表中创建路径。«/span»
4.  «span style='color:black'»在此子项下添加下面的注册表数据：  

    数值类型：DWORD（32位）«/span»
«span style='color:black'»值名称：MaximumAttachmentSize  
数值数据：指定允许的最大附件总大小的整数。例如，指定 30720（十进制）来配置 30 MB 的限制。  
注意«/span»
- <span style='background: white'>如果您不想为附件配置限制，请将值指定为零 (0)。</span>
- <span style='background: white'>如果您要将限制配置为小于默认值 20 MB 的值，则指定一个小于 20 MB 的值。</span>
5.  <span style='background: white'>退出注册表编辑器</span>
6.  <span style='background: white'>启动 Outlook。</span>

*来自 \< <https://support.microsoft.com/zh-cn/help/2222370/attachment-size-exceeds-the-allowable-limit-error-when-you-add-a-large>\>*
