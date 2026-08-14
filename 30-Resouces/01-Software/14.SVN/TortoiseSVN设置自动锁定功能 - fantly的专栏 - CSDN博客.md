---
title: TortoiseSVN设置自动锁定功能 - fantly的专栏 - CSDN博客
updated: 2026-06-06T00:25:01
created: 2026-07-05T17:04:55
---

TortoiseSVN设置自动锁定功能 - fantly的专栏 - CSDN博客
星期五, 七月 26, 2019
3:21 下午
已剪辑自: <https://blog.csdn.net/fantly/article/details/88051169>
步骤如下：
1：在任意文件夹下右击空白处，弹出的菜单选择【TortoiseSVN】–\>【设置】
2：在弹出的对话框中选择右边的【编辑】按钮后弹出一个文本对话框
3：将以下内容拷贝到文本的\[auto-props\]里面
enable-auto-props = yes
\*.\* = svn:needs-lock=\*
\* = svn:needs-lock=\*
4：保存后确定
