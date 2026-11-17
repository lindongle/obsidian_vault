---
created: 2026-11-17T17:53:11
updated: 2026-11-17T18:01:05
---
![[WXWorkCapture_17949075826313.png]]![[4bad33614c9a126be5dc5b518ae5d215.png]]![[e1118f0385855585ff4195d8cc0ad70f.png]]![[WXWorkCapture_17949082035219.png]]![[WXWorkCapture_17949091115524.png]]![[WXWorkCapture_1794909125803.png]]
# MEMBOM_Mirror_AlignProperties
这段文字描述的是 Teamcenter 首选项 **`MEMBOM_Mirror_AlignProperties`** 的配置规则。它的核心作用是：在使用 `me_create_mbom` 工具从 EBOM 镜像生成 MBOM 时，**因为 MBOM 中的“自制件（Make）”节点类型与原始 EBOM 节点类型不同**，所以需要通过这套规则来指定：**哪些属性和关系应当从 EBOM 对齐（复制）到 MBOM 的自制件及其版本上** 。[](https://www.plmvision.top:8080/documentation/external/PL20241125556497283/zh-CN/tc_help/plm00260/dns1737324710883/xid918126.html)[](https://www.plmvision.top:8080/zh-CN/doc/282219420/PL20241125556497283.plm00260.pdf?dest=M8.newlink.xid973548#13#17#13)[](https://docs.tech-plm.ru/documentation/external/PL20221031257051471/en-US/tc_help_sc/tc/14.3/tc_help_sc/en-US/pmphelp/xid950613/id211501/xid958950/xid918126.html)

### 三种配置格式解析

配置值使用冒号 `:` 作为分隔符，支持以下三种规则：

**1. Relation（关系处理规则）**

- **格式**：`Relation:<内部关系名>:<二级类型列表>:<Skip/Reference>`
    
- **含义**：决定特定关系（如 `IMAN_Rendering`）在 MBOM 节点上是**跳过（Skip）** 还是**保留为引用（Reference）**。
    
- **关键点**：仅对指定的**确切二级类型**生效，不包含其子类型。如果不写二级类型，则匹配该关系下的所有类型。支持使用 `*` 作为通配符。多个 Relation 规则之间有顺序优先级。
    

**2. Item（零组件属性对齐规则）**

- **格式**：`Item:[EBOM零组件类型,MBOM零组件类型:(EBOM属性名,MBOM属性名)+]`
    
- **含义**：当 EBOM 与 MBOM 的零组件（Item）底层属性类型匹配时，将 EBOM 属性值对齐到 MBOM 对应属性上。
    
- **示例**：`Item:Item,Document:fnd0is_monolithic,fnd0is_monolithic` 表示将 EBOM 中 `Item` 类型的 `fnd0is_monolithic` 属性，对齐到 MBOM 中 `Document` 类型的同名属性。
    

**3. Revision（版本属性对齐规则）**

- **格式**：`Revision:[EBOM版本类型,MBOM版本类型:(EBOM属性名,MBOM属性名)+]`
    
- **含义**：当 EBOM 与 MBOM 的零组件版本（Item Revision）底层属性类型匹配时，进行属性值的对齐。
    
- **示例**：`Revision:ItemRevision,DocumentRevision:ebomRevProp,mbomRevProp` 表示将 EBOM 的 `ItemRevision` 上的 `ebomRevProp` 值，复制到 MBOM 的 `DocumentRevision` 的 `mbomRevProp` 属性中。