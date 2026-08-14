---
author: TcConsultant
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=Mzg3NDg2NDUzOQ==&mid=2247484366&idx=1&sn=5c42436e81c1b4950eca146cf278baac&chksm=cfc629a201386864cc126b177517091f5f1807ec6d6db4cb5e432a355274e3d17a7958ccd933&mpshare=1&scene=1&srcid=0808sWBtFZjOodO9BmexAJGl&sharer_shareinfo=dc5f71746256ca9f5a5c8c44ca8a7628&sharer_shareinfo_first=dc5f71746256ca9f5a5c8c44ca8a7628#rd
Created: 2026-08-08 18:22:26
tags:
  - awc
  - 系统配置
id: 39c4f12a-5c64-4c44-a02d-04eca1b0930e
title: 导入结构
created: 2026-08-08T23:07:43
updated: 2026-08-09T22:16:51
---

公众号名称：PLM菜鸟

作者名称：TcConsultant

发布时间：2026-08-08 15:30

Active Workspce 2512的导入结构和复制结构界面，在后台运行选项为默认勾选，代表调用Dispatcher服务进行操作，后台处理好后会给用户发送通知，这在处理大型BOM时可以让用户进行其他操作同时防止前台处理超时。

当业务BOM较小时，建议取消勾选在后台运行，防止用户忘记查看通知，毕竟AWC处理BOM的速度已经非常快了，用户可以很快看到BOM。

# 导入结构

打开src/repo/occmgmt/src/assets/viewmodel下的Awb0ImportFromExcelDataViewModel.json

将runInBackgroundExcel的dbValue由true改为false

![[99-Assets/7579e283e2d942aeff58e2aa7a59d6c6_MD5.png]]

# 复制结构

打开src/repo/occmgmt/src/assets/viewmodel下的OccMgmtDuplicateTaskbarViewModel.json

将runInBackgroundCheckBox的dbValue由true改为false

打开src/repo/occmgmt/src/assets/js下的occMgmtDuplicateViewService.js

将runInBackgroundValue的dbValue由true改为false

![[99-Assets/d4efa7114249306f6906de049f50b619_MD5.png]]

修改完后awbuild即可生效

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/7f0e5545_1786184545412?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzg3NDg2NDUzOQ%3D%3D%26mid%3D2247484366%26idx%3D1%26sn%3D5c42436e81c1b4950eca146cf278baac%26chksm%3Dcfc629a201386864cc126b177517091f5f1807ec6d6db4cb5e432a355274e3d17a7958ccd933%26mpshare%3D1%26scene%3D1%26srcid%3D0808sWBtFZjOodO9BmexAJGl%26sharer_shareinfo%3Ddc5f71746256ca9f5a5c8c44ca8a7628%26sharer_shareinfo_first%3Ddc5f71746256ca9f5a5c8c44ca8a7628%23rd&s=obsidian)