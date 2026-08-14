---
title: CRI（CreateImageServer）
updated: 2026-06-05T23:47:03
created: 2026-07-05T17:04:50
---

作为发布过程的一部分创建所需的文档，然后可用于不同类型的进一步使用。 Create Image 解决方案支持将 2D 工程图从 CAD 系统 NX、Solid Edge 和 I-DEAS 创建为 HPGL/2 或 CGM 文件，作为 Teamcenter 发布流程的一部分。一项可选功能允许使用 Acrobat Distiller（仅适用于 Windows——由客户提供）或 Ghostscript 将这些 2D 绘图转换为 TIFF-G4、Postscript 或 PDF。

使用 NX 时也可以进行 DXF 转换，前提是已安装 NX 转换器 ugto2d 和 dxfdwg。然后可以将所有创建的对象存储在一个目录中或导入回 Teamcenter。

可以选择为中性格式提供图章，例如 TIFF 和 PDF（例如“草稿”或“无效”）。然后，这些文件也可以存储在一个目录中或导入回 Teamcenter。

Teamcenter 也可用于根据单个 NX 零件和模块的 3D 数据创建 JT 文件。

DXF 和 JT 转换不适用于 I-DEAS。
