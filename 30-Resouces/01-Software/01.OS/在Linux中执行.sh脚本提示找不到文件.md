---
title: 在Linux中执行.sh脚本提示找不到文件
updated: 2026-06-06T00:28:12
created: 2026-07-05T17:04:53
---

使用windows环境编辑的，复制到Linux，导致不识别。
查看方式
使用vi命令查看文件
输入:set ff
显示set ff=dos，则为windows下的
格式转换：
VI模式下输入:set ff=unix
然后输入:wq保存即可。
