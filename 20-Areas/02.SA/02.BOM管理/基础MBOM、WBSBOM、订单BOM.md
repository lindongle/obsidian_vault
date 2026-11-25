---
created: 2026-11-25T10:31:08
updated: 2026-11-25T10:31:16
---
从 SAP 系统设计和业务逻辑看，这三种 BOM 解决的是不同层面的问题：**基础 MBOM 管“物料永久怎么做”，订单 BOM 管“这一单怎么改”，WBS BOM 管“这个项目怎么配”**。三者的宿主对象、成本归集和库存隔离方式完全不同。

### 基础 MBOM（物料 BOM，CS01）

**SAP 定位**：挂在物料主数据下的标准制造结构，是 MRP 展开的默认基线。

- **系统逻辑**：BOM 只存直接子件，下级结构通过子件自身的 MBOM 递归读取。改一处，所有引用它的订单/项目下次跑 MRP 时自动取新版，**没有快照问题**。
    
- **业务适用**：定型产品、通用半成品。SAP 官方明确，物料 BOM 用于“与订单无关的装配”——你不会为某一单去改的结构。[](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/af7b53c5551645ef806bdca5d990bac5/33caba538c95b54ce10000000a174cb4.html?locale=zh-CN&version=2025.001&q=+Intelligent+Scenario+Management+Roles)
    
- **局限**：如果每个客户都要微调下层，靠新增顶层物料来区分，主数据会膨胀。
    

### 订单 BOM（CS61）

**SAP 定位**：依附于**销售订单行项目**的变体 BOM，唯一标识是“销售订单号 + 行项目 + 物料号”。[](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/af7b53c5551645ef806bdca5d990bac5/33caba538c95b54ce10000000a174cb4.html?locale=zh-CN&version=2025.001&q=+Intelligent+Scenario+Management+Roles)

- **原生行为**：从 MBOM 复制时，如果选择多级展开，系统会把整棵结构复制成独立副本。此后改订单 BOM 不影响原 MBOM，原 MBOM 变更也不回写订单 BOM——这就是**快照固化**。
    
- **SAP 设计意图**：用于按订单生产（MTO）中“这一单的装配需要特殊处理，但不想新建物料号”的场景。典型是变式配置产品，每个客户配置不同，系统生成订单 BOM 来承载这一单的特定结构。[](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/af7b53c5551645ef806bdca5d990bac5/33caba538c95b54ce10000000a174cb4.html?locale=zh-CN&version=2025.001&q=+Intelligent+Scenario+Management+Roles)
    
- **关键约束**：订单 BOM 的 MRP 展开是否优先于物料 BOM，取决于后台配置。系统可以设定优先展开销售订单 BOM，否则仍读标准 MBOM。[](https://www.cnblogs.com/mikemao/p/18998815#1)
    

### WBS BOM（CS71）

**SAP 定位**：依附于 **WBS 元素**的项目专用 BOM，逻辑与订单 BOM 对称，但宿主从销售订单换成了项目结构。

- **系统逻辑**：同样从物料 BOM 复制生成，同样可以做成全层级快照或只取一级。SAP 的 WBS BOM 浏览器支持多级展开和导航，下层装配可以引用物料 BOM 或自身的 WBS BOM。[](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/af7b53c5551645ef806bdca5d990bac5/b482c1536ca9b54ce10000000a174cb4.html?locale=zh-CN&version=2022.latest)
    
- **与订单 BOM 的本质差异不在 BOM 展开，而在“归属”**：
    
    - **成本对象**：订单 BOM 归集到销售订单；WBS BOM 归集到 WBS 元素。
        
    - **库存隔离**：WBS BOM 配合项目库存（特殊库存标识 Q），物料出入库都绑定到 WBS，适合总包项目、多台设备并行、预算需单独核算的场景。订单 BOM 则配合 E 订单库存。[](https://help.sap.com/docs/SAP_ERP/3b297153215b4a3f94867c83a466107f/baceb65334e6b54ce10000000a174cb4.html?locale=en-US&version=6.03.latest)
        
- **业务适用**：按订单设计（ETO）或项目型制造，一个项目下有多台设备需要分别配置、分别核算。
    

### 选型判断（从 SAP 功能角度）

- **能不动订单/WBS BOM 就不动**：SAP 原生复制展开下级就是快照。快照多了，基准 MBOM 改了存量单据不跟，仓库容易错发料。定型工况用多套基础 MBOM 最干净。
    
- **要用就用“一级选配”模式**：复制时只拉一级子件，下层靠 MRP 递归读基准 MBOM。但 SAP **没有开关锁住下层**，必须靠权限+校验增强+流程约束来防止用户误写二级以下。这是系统能力缺口，不是配置能解决的。
    
- **选订单还是选 WBS**：差异在销售订单层面、按单核算 → 订单 BOM；差异在项目层面、需要项目库存隔离和预算管控 → WBS BOM。两者在“仅一级可改”管控下的 MRP 展开逻辑完全一样。