---
title: PDF工具（Word转PDF）ds4_print_pdf.exe
updated: 2026-09-02T16:30:07
created: 2026-07-05T17:05:02
---

1.  Introduction
    1.  最初的实现使用 TcVisualization 的 prepare.exe 来处理所有办公文档。对于 MSWord 文档的转换，决定使用自定义工具来确保书签保留在生成的 PDF 文档中。
    2.  因此，该工具是使用 Microsoft Office Interop 功能创建的，用于执行此步骤。
2.  ds4_print_pdf
    1.  Visual Basic 源代码和项目可以在 X:\CreateImage4Office\ds4_print_pdf 下找到。
    2.  该工具接受以下参数
| **Parameter** | **Description** | **Required / Default** |
|----|----|----|
| -input | 定义要转换为 PDF 格式的 MSWord 文档。 | Required |
| -output | 定义输出 PDF 文件 | Required |
| -markup | 如果设置为否，则 MSWord 文档中的标记不会包含在 PDF 输出中。 | yes |

