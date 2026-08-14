---
title: 使用CAE Manager的基本概念和任务
updated: 2026-06-06T10:05:37
created: 2026-07-05T17:04:45
---

**基本概念**
使用CAE管理器视角，您可以识别用于分析的产品数据，并创建和管理相应的CAE数据。 这个观点包括以下三个主要观点：
•产品：您可以交互式识别由CAEModel零组件引用的产品层次结构。
•模型：您可以交互式地定义和操作可引用目标CAD模型和源CAD或CAE几何的CAE模型层级。
•分析：您可以交互式地定义和填充可引用定义的CAEModel零组件的CAE分析零组件版本。 您还可以管理解算器的执行结果，将结果与CAE分析零组件相关联，并分配定义CAE分析的其他分析输入。
使用CAE管理器，您可以在“产品”视图中查看和管理非CAE零组件版本或产品层级结构。 您还可以在“分析”视图中查看、创建和管理CAE分析零组件或在“模型”视图中查看、创建和管理CAEModel零组件。
**CAE管理器对象**
•CAEGeometry（零组件类型）
包含用于生成用于执行工程分析的模型数据的理想化几何。
CAEGeometry零组件的内容可以从包含在非CAE项目修订中的几何体创建。它通常可以进行简化，例如对原始产品几何特征进行抑制以便于分析过程。 CAE几何作为CAE模型构建的源头表示。
•CAEModel（零组件类型）
定义用于执行工程分析的模型。在有限元分析的情况下，这个模型很可能是网格数据的形式。一般来说，支持任何类型的模型。
CAEModel版本零组件可以与目标产品版本有关系。它也可以与源CAEGeometry零组件版本或源非CAE零组件版本有关系。 CAEModel项目可以参与定义CAE结构的层级结构。附加到CAEModel零组件版本的数据集存储在总成或组件的网格表示中。
•CAE分析（零组件类型）
定义要完成的分析类型和用于执行分析的求解器。
CAEAnalysis零组件版本包含解算器参数以及与CAEModel和CAEResult零组件版本的关系。附加到CAEAnalysis零组件版本的数据集存储在特定于求解器的输入文件夹和/或特定于工具的模拟文件。
•CAEResult（零组件类型）
用于管理来自不同求解器的CAE分析结果。 CAEResult零组件版本可能与驱动CAEResult零组件版本版有关系。
•Target Product（零组件类型）
将CAEModel，CAEGeometry或CAEAnalysis零组件版本与一个代表产品几何的非CAE零组件版本相关联。
•Source Representation（零组件类型）
将CAEModel零组件版本与一个提供产品几何的非CAE零组件版本或CAEGeometry零组件版本相关联。
•Model Reference（零组件类型）
将CAEAnalysis零组件版本与CAEModel零组件版本相关联。
•Include Reference（零组件类型）
将CAEA分析零组件版本与另一个CAEA分析零组件版本相关联。
•Result Reference（零组件类型）
将CAEA分析零组件版本与另一个CAE分析零组件版本相关联。
•CAEGeom（数据集类型）
包含理想化的几何文件。
•CAESolution（数据集类型）
包含一个模拟文件。
•CAESolver（数据集类型）
包含一个求解器特定的数据卡片。
•CAEMesh（数据集类型）包含网格文件。
•CAEResult（数据集类型）
包含定义分析的结果文件。
![image1](9ce4f0439ff6442488ee669de1871bdc.png)

