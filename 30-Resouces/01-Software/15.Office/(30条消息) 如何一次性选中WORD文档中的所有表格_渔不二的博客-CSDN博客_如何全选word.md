---
title: (30条消息) 如何一次性选中WORD文档中的所有表格_渔不二的博客-CSDN博客_如何全选word...
updated: 2026-06-06T00:21:37
created: 2026-07-05T17:04:55
---

(30条消息) 如何一次性选中WORD文档中的所有表格_渔不二的博客-CSDN博客_如何全选word里的多个表格
星期三, 十一月 9, 2022
2:32 下午
已剪辑自: <https://blog.csdn.net/u014546553/article/details/84872213>
Sub SelectAllTables()
 Dim tempTable As Table   
 Application.ScreenUpdating = False   
 '判断文档是否被保护  
 If ActiveDocument.ProtectionType = wdAllowOnlyFormFields Then  
 MsgBox "文档已保护，此时不能选中多个表格！"  
 Exit Sub  
 End If  
 '删除所有可编辑的区域  
 ActiveDocument.DeleteAllEditableRanges wdEditorEveryone  
 '添加可编辑区域  
 For Each tempTable In ActiveDocument.Tables  
 tempTable.Range.Editors.Add wdEditorEveryone  
 Next  
 '选中所有可编辑区域  
 ActiveDocument.SelectAllEditableRanges wdEditorEveryone  
 '删除所有可编辑的区域  
 ActiveDocument.DeleteAllEditableRanges wdEditorEveryone   
 Application.ScreenUpdating = True   
End Sub
