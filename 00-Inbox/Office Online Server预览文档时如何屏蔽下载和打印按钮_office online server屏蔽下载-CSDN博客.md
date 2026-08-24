---
author: 成就一亿技术人!
source: CSDN
url: https://blog.csdn.net/zgr456/article/details/128644532#:~:text=%E4%BD%BF%E7%94%A8Office%20online%20server%E9%A2%84%E8%A7%88%E6%96%87%E6%A1%A3%E6%97%B6%EF%BC%8C%E8%8B%A5%E8%A6%81%E9%9A%90%E8%97%8F%E4%B8%8B%E8%BD%BD%E3%80%81%E6%89%93%E5%8D%B0%E7%AD%89%E6%93%8D%E4%BD%9C%E6%8C%89%E9%92%AE%EF%BC%8C%E5%8F%AF%E9%80%9A%E8%BF%87%E4%BF%AE%E6%94%B9%E9%A2%84%E8%A7%88%E7%95%8C%E9%9D%A2%E7%9A%84CSS%E6%A0%B7%E5%BC%8F%E5%AE%9E%E7%8E%B0%E3%80%82%20%E5%A6%82Word%E6%96%87%E4%BB%B6%E5%8F%AF%E4%BF%AE%E6%94%B9WordViewer.css%EF%BC%8CPPT%E5%92%8CExcel%E6%96%87%E4%BB%B6%E5%88%86%E5%88%AB%E5%AF%B9%E5%BA%94stylesRead.css%E5%92%8CExcelFrame.css%EF%BC%8C%E4%BF%AE%E6%94%B9%E6%96%B9%E5%BC%8F%E5%9F%BA%E6%9C%AC%E4%B8%80%E8%87%B4%E3%80%82,%E5%9C%A8%E4%BD%BF%E7%94%A8Office%20online%20server%E9%A2%84%E8%A7%88%E6%96%87%E6%A1%A3%E7%9A%84%E6%97%B6%E5%80%99%EF%BC%8C%E4%BC%9A%E5%87%BA%E7%8E%B0%20%E4%B8%8B%E8%BD%BD%EF%BC%8C%E6%89%93%E5%8D%B0%EF%BC%8C%E6%90%9C%E7%B4%A2%E8%BF%98%E6%9C%89%E6%9B%B4%E5%A4%9A%E7%AD%89%E6%93%8D%E4%BD%9C%E6%8C%89%E9%92%AE
Created: 2026-08-19 13:35:42
tags:
  - 笔记同步助手
id: 3a63a3a5-809b-472d-a02b-316e949e6367
created: 2026-08-24T13:20:30
updated: 2026-08-24T13:20:31
---

最新推荐文章于 2025-07-30 20:46:24 发布

原创 最新推荐文章于 2025-07-30 20:46:24 发布 · 1.7k 阅读

· ![[99-Assets/fc8f6df7a228828427fe5dbceb83d37d_MD5.png|Image]] 1

· ![[99-Assets/fddfcfe15d4eab62e243e1c316ede490_MD5.png|Image]] 4 ·

本内容遵循CC 4.0 BY-SA版权协议

版权声明：本文为博主原创文章，遵循 [CC 4.0 BY-SA](http://creativecommons.org/licenses/by-sa/4.0/) 版权协议，转载请附上原文出处链接和本声明。

在使用Office online server预览文档的时候，会出现 下载，打印，搜索还有更多等操作按钮  
![[99-Assets/7a9cd037a288d31b5dc3e3a110162538_MD5.png|在这里插入图片描述]]

但是现在有个需求，不显示这些操作按钮。  
咨询过官方未得到答案，后来经过一番查找，原来可以通过修改预览界面的css样式。  
在office online的机器上，找到目录

```
C:\Program Files\Microsoft Office Web Apps\WebWordViewer\Resources\2052
```

在目录下找到文件WordViewer.css，可以在里面找到.cui-ribbonTopBars，在样式内添加 display:none;  
这样可以达到目的，但是连文档的名字也就不显示了。  
如果想显示名字的话，可以在该css样式文件末尾，添加

```
.cui-viewerchrome .cui-toolbar-singledock .cui-toolbar-buttondock a.cui-ctl, .cui-viewerchrome .cui-toolbar-singledock .cui-toolbar-buttondock a.cui-ctl-medium, .cui-viewerchrome .cui-herodock a.cui-ctl, .cui-viewerchrome .cui-herodock a.cui-ctl-medium{display:none;}
```

这个样式，是可以通过f12开发者工具，找到元素样式；然后可以在修改样式，查看效果，达到满意后，将修改的css代码，粘贴到这个css文件内就可以了。  
但是这个只能处理Word文件的预览。

PPT文档的预览样式在另外一个目录下面。

```
C:\Program Files\Microsoft Office Web Apps\WebPPTViewer\pptresources\2052
```

在目录下找到样式文件stylesRead.css

Excel文档的预览样式在这个目录下面

```
C:\Program Files\Microsoft Office Web Apps\ExcelServicesWfe\_layouts\Resources\2052
```

找到样式文件ExcelFrame.css  
修改样式的方式基本一致。

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/13017721_1787117741292?u=https%3A%2F%2Fblog.csdn.net%2Fzgr456%2Farticle%2Fdetails%2F128644532%23%3A%7E%3Atext%3D%25E4%25BD%25BF%25E7%2594%25A8Office%2520online%2520server%25E9%25A2%2584%25E8%25A7%2588%25E6%2596%2587%25E6%25A1%25A3%25E6%2597%25B6%25EF%25BC%258C%25E8%258B%25A5%25E8%25A6%2581%25E9%259A%2590%25E8%2597%258F%25E4%25B8%258B%25E8%25BD%25BD%25E3%2580%2581%25E6%2589%2593%25E5%258D%25B0%25E7%25AD%2589%25E6%2593%258D%25E4%25BD%259C%25E6%258C%2589%25E9%2592%25AE%25EF%25BC%258C%25E5%258F%25AF%25E9%2580%259A%25E8%25BF%2587%25E4%25BF%25AE%25E6%2594%25B9%25E9%25A2%2584%25E8%25A7%2588%25E7%2595%258C%25E9%259D%25A2%25E7%259A%2584CSS%25E6%25A0%25B7%25E5%25BC%258F%25E5%25AE%259E%25E7%258E%25B0%25E3%2580%2582%2520%25E5%25A6%2582Word%25E6%2596%2587%25E4%25BB%25B6%25E5%258F%25AF%25E4%25BF%25AE%25E6%2594%25B9WordViewer.css%25EF%25BC%258CPPT%25E5%2592%258CExcel%25E6%2596%2587%25E4%25BB%25B6%25E5%2588%2586%25E5%2588%25AB%25E5%25AF%25B9%25E5%25BA%2594stylesRead.css%25E5%2592%258CExcelFrame.css%25EF%25BC%258C%25E4%25BF%25AE%25E6%2594%25B9%25E6%2596%25B9%25E5%25BC%258F%25E5%259F%25BA%25E6%259C%25AC%25E4%25B8%2580%25E8%2587%25B4%25E3%2580%2582%2C%25E5%259C%25A8%25E4%25BD%25BF%25E7%2594%25A8Office%2520online%2520server%25E9%25A2%2584%25E8%25A7%2588%25E6%2596%2587%25E6%25A1%25A3%25E7%259A%2584%25E6%2597%25B6%25E5%2580%2599%25EF%25BC%258C%25E4%25BC%259A%25E5%2587%25BA%25E7%258E%25B0%2520%25E4%25B8%258B%25E8%25BD%25BD%25EF%25BC%258C%25E6%2589%2593%25E5%258D%25B0%25EF%25BC%258C%25E6%2590%259C%25E7%25B4%25A2%25E8%25BF%2598%25E6%259C%2589%25E6%259B%25B4%25E5%25A4%259A%25E7%25AD%2589%25E6%2593%258D%25E4%25BD%259C%25E6%258C%2589%25E9%2592%25AE&s=obsidian)