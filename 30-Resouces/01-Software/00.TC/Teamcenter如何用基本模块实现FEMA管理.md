---
author: 上海熊老师
source: 微信公众号
url: https://mp.weixin.qq.com/s?__biz=MzA4ODAyNzk0Mg==&mid=2456021389&idx=1&sn=6b536f4200a0dbaf996f50963a8ff811&chksm=8649da7f2e7e9d0a3fdec4f69a6fad536e3a9854924f583ae6e76e5b967452121c3ada120806&mpshare=1&scene=1&srcid=0714Xp1QGyFzd61YnNaIfRq2&sharer_shareinfo=69368874aadf3a6a2c9172a55b7d7438&sharer_shareinfo_first=69368874aadf3a6a2c9172a55b7d7438#rd
Created: 2026-07-14 08:58:08
tags:
  - 笔记同步助手
id: 82689046-bc03-4822-8ee2-fe59c0fc3c15
title: 一、FMEA管理的痛，谁做谁知道
created: 2026-07-14T13:28:51+08:00
updated: 2026-07-15T10:25:11+08:00
---

公众号名称：PLMVision

作者名称：上海熊老师

发布时间：2026-07-14 08:35

# 一、FMEA管理的痛，谁做谁知道

如果你是PLM实施顾问，大概率遇到过这样的场景：

客户花了几百万上了Teamcenter，BOM管起来了，文档管起来了，变更流程也跑顺了。然后质量部门的人找过来了——"我们的FMEA还在Excel里，能不能也管起来？"

你问："你们买了FMEA模块吗？"

对方一脸茫然："还有这个模块？报价多少？采购流程走多久？"

然后就没有然后了。

**这不是个例，这是绝大多数企业的现状。** FMEA（失效模式与影响分析）作为IATF 16949、航空SAE ARP4761等标准的强制要求，理论上应该和设计过程深度绑定。但现实是：

**1\. 版本满天飞。** 一份DFMEA从初版到定版，经过五六轮评审，最终桌面上躺着"DFMEA\_发动机支架\_v1.xlsx""DFMEA\_发动机支架\_v2\_评审后.xlsx""DFMEA\_发动机支架\_v2\_最终版.xlsx""DFMEA\_发动机支架\_v2\_最终版\_改.xlsx"……谁也说不清哪个才是最新版。

**2\. 设计变更后FMEA更新滞后。** 设计工程师改了个壁厚参数，走完ECO发布新版图纸，但FMEA里对应的失效模式、S/O/D评分根本没人去复核。等审核员来查的时候才发现——设计都改了三个月了，FMEA还是老的。

**3\. 审批流程脱节。** FMEA的评审靠质量部门自己组织邮件评审或者线下签字，评审记录和TC里的正式审批流程是两套系统，追溯的时候找不到。

**4\. 多部门协作困难。** 一份FMEA需要设计、工艺、质量、制造多个部门协同填写。Excel传来传去，合并的时候不是漏行就是覆盖，一个"最终合并版"改了三天还没改完。

这些问题的根源只有一个：**FMEA数据是非结构化的，和产品数据是割裂的。**

---

# 二、解题思路：把FMEA变成TC的一等公民

## 核心理念：每条失效模式 = 一个TC业务对象

大多数企业管FMEA的方式，是把整份FMEA当成一个"文档"丢进TC的文档管理模块。这比纯Excel好了一点——至少有了版本控制。但本质上还是把结构化数据当非结构化文档在管，统计、查询、关联全靠人工。

我们的思路完全不同：**不要把FMEA当文档，要把FMEA当数据。**

具体来说：

-   **每一条失效模式**，不是Excel里的一行，而是一个TC的业务对象（Item Revision）。
-   **每一个S/O/D评分**，不是一个单元格，而是一个带有LOV约束的结构化属性。
-   **每一个改进措施**，不是一段自由文本，而是一个有责任人、有截止日期、有状态追踪的工作项。

这样做的好处是显而易见的：

| 维度 | Excel方案 | 自定义对象方案 |
| --- | --- | --- |
| 数据结构 | 非结构化，自由文本 | 结构化，类型约束 |
| 版本管理 | 靠文件名区分 | TC原生版本管理 |
| 关联设计数据 | 无法关联 | Relation直接关联 |
| 统计分析 | 手工筛选 | SOA/查询直接出 |
| 审批流程 | 线下签字 | TC工作流自动化 |
| 变更联动 | 无人知晓 | Where Used反查 |

## 为什么不用Classification？

有些朋友可能会问：TC的Classification模块不是也能给对象打标签吗？为什么不把失效模式挂在Classification树下？

原因很简单：

1.  **Classification是"分类"，不是"实例"。** Classification擅长的是"这个零件属于哪一类"，而不是"这条失效模式的具体评分是多少"。FMEA的每一条记录都有独立的属性值，Classification的属性是类级别的，不是实例级别的。
2.  **关联性弱。** Classification对象天然不支持和零部件Item Revision建立灵活的Relation。你没法方便地做到"查这个零件的所有FMEA"或者"查这条FMEA关联了哪些零件"。
3.  **工作流不友好。** Classification对象不在TC的标准工作流引擎管理范围内，你想给每条FMEA走审批流程，Classification做不到。

结论：**自定义Item + 自定义属性 + Relation + 工作流**，是TC基础能力范围内最优的FMEA实现方案。

---

# 三、详细实现步骤

下面进入实操环节。以下所有操作基于Teamcenter 13.x及以上版本，BMIDE（Business Modeler IDE）环境。

## Step 1：创建自定义Item类型

在BMIDE中，基于\`Item\`创建自定义业务对象：

```sql
Business Object Hierarchy:
├── Item
│   ├── FMEA_Item          （FMEA基类）
│   │   ├── DFMEA_Item     （设计FMEA）
│   │   └── PFMEA_Item     （过程FMEA）
```

**关键设计决策：** 为什么用Item而不是用ItemRevision作为顶层？

因为TC的版本管理天然挂在Revision层。我们设计的逻辑是：

-   **一个FMEA\_Item** = 一个FMEA分析对象（比如"发动机支架DFMEA"）
-   **一个FMEA\_Item Revision** = 该FMEA的一个版本（比如"A版""B版"）
-   但在实际使用中，我们会在一个FMEA\_Item下管理多条失效模式——每条失效模式是该Item的一个Revision

更常见的做法是：**一个FMEA\_Item = 一个子系统/零部件的FMEA集合**，其下挂载的Revision代表不同的失效模式。这样在结构上更清晰：

```sql
FMEA_Item: "发动机支架-DFMEA"
├── Rev A: 失效模式1 - 支架断裂
├── Rev B: 失效模式2 - 焊缝开裂
├── Rev C: 失效模式3 - 腐蚀穿孔
```

当然，你也可以选择另一种方案：每条失效模式是一个独立的FMEA\_Item，用命名规则和Relation来组织。两种方案各有优劣，我们在后面实施建议中会详细对比。

**BMIDE操作步骤：**

1.  打开BMIDE，选中Item节点
2.  右键 → Create Business Object Extension
3.  输入名称：\`FMEA\_Item\`，Display Name：\`FMEA分析项\`
4.  同样方式创建 \`DFMEA\_Item\`（父对象选FMEA\_Item）和 \`PFMEA\_Item\`
5.  为每个子类型设置不同的图标，方便在TC Rich Client中视觉区分

## Step 2：定义Properties（属性）

这是整个方案的核心。属性设计直接决定了FMEA数据的质量和可用性。

在BMIDE中，为\`FMEA\_Item\`添加以下持久化属性（Persistent Properties）：

| 字段名称 | TC属性名 | 数据类型 | 长度 | 必填 | 说明 |
| --- | --- | --- | --- | --- | --- |
| 失效模式 | fmea\_failure\_mode | String | 240 | ✅ | 描述失效现象，如"支架疲劳断裂" |
| 失效影响 | fmea\_failure\_effect | String | 500 | ✅ | 失效的最终后果，如"发动机脱落" |
| 失效原因 | fmea\_failure\_cause | String | 500 | ✅ | 根本原因，如"壁厚不足" |
| 现有预防措施 | fmea\_prevention | String | 500 | ❌ | 已有的预防手段 |
| 现有检测措施 | fmea\_existing\_detection | String | 500 | ❌ | 已有的检测手段 |
| 严重度(S) | fmea\_severity | Integer | — | ✅ | 1-10，引用LOV |
| 发生度(O) | fmea\_occurrence | Integer | — | ✅ | 1-10，引用LOV |
| 探测度(D) | fmea\_detection\_level | Integer | — | ✅ | 1-10，引用LOV |
| RPN值 | fmea\_rpn | Integer | — | — | S×O×D，自动计算 |
| 责任人 | fmea\_responsible\_user | User | — | ✅ | TC用户引用 |
| 完成日期 | fmea\_due\_date | Date | — | ✅ | 改进措施计划完成日期 |
| 状态 | fmea\_status | String | 40 | ✅ | 引用状态LOV |
| 改进措施 | fmea\_improvement\_action | String | 1000 | ❌ | 降低RPN的具体措施描述 |
| 改进后严重度 | fmea\_new\_severity | Integer | — | ❌ | 改进后的S评分 |
| 改进后发生度 | fmea\_new\_occurrence | Integer | — | ❌ | 改进后的O评分 |
| 改进后探测度 | fmea\_new\_detection | Integer | — | ❌ | 改进后的D评分 |
| 改进后RPN | fmea\_new\_rpn | Integer | — | — | 改进后自动计算 |
| 功能描述 | fmea\_function | String | 500 | ✅ | 被分析对象的功能要求 |
| 潜在失效模式编号 | fmea\_item\_id | String | 40 | ✅ | 编号，如FM-001 |

**属性设计的几个要点：**

-   \`fmea\_responsible\_user\` 的类型设为\`User\`，这样可以直接引用TC系统中的用户，后续可以基于这个属性做自动通知。
-   RPN相关属性不要手动填，用Handler自动计算（后面详述）。
-   改进前后对比是FMEA闭环管理的关键，所以改进后的S/O/D和RPN单独一套属性。

## Step 3：用LOV（值列表）约束输入

LOV（List of Values）是TC中控制属性取值范围的标准机制。不设LOV，用户可以输入任意值，数据质量就无从保障。

**LOV 1：fmea\_severity\_lov（严重度）**

| 序号 | 显示值 | 内部值 | 含义 |
| --- | --- | --- | --- |
| 1 | 1 - 无影响 | 1 | 无可见影响 |
| 2 | 2 - 轻微 | 2 | 轻微影响，客户不易察觉 |
| 3 | 3 - 低 | 3 | 轻微性能下降 |
| 4 | 4 - 中低 | 4 | 客户可能注意到 |
| 5 | 5 - 中等 | 5 | 客户不满 |
| 6 | 6 - 中高 | 6 | 性能明显下降 |
| 7 | 7 - 高 | 7 | 高度不满，部分功能丧失 |
| 8 | 8 - 很高 | 8 | 严重功能丧失 |
| 9 | 9 - 危险有警告 | 9 | 危及安全但有预警 |
| 10 | 10 - 危险无警告 | 10 | 危及安全且无预警 |

\`fmea\_occurrence\_lov\` 和 \`fmea\_detection\_level\_lov\` 结构类似，内部值都是1-10，显示值按AIAG FMEA手册的标准定义。 **LOV 2：fmea\_status\_lov（状态）**

| 显示值 | 内部值 |
| --- | --- |
| Open - 待编制 | Open |
| In Progress - 编制中 | InProgress |
| Under Review - 评审中 | UnderReview |
| Completed - 已完成 | Completed |
| Closed - 已关闭 | Closed |

**LOV 3：fmea\_failure\_mode\_lov（失效模式模板，可选）**

这个LOV不是强制的，但建议做。按行业预定义常见的失效模式清单，比如汽车行业的：

-   疲劳断裂
-   过度磨损
-   腐蚀/氧化
-   变形/蠕变
-   泄漏
-   电气短路/断路
-   信号干扰
-   ……

用户可以选择预定义值，也可以手动输入自定义值。实现方式是在属性上设置LOV模式为\`AllowFreeText\`（允许自由文本）。

**BMIDE中绑定LOV的操作：**

1.  在BMIDE中创建LOV对象
2.  将LOV绑定到对应的Property上
3.  设置LOV模式：S/O/D用\`OnlyLOV\`（只能选），失效模式用\`AllowFreeText\`

## Step 4：建立关联关系

FMEA数据如果不能和零部件关联，那和Excel没有本质区别。这一步是让FMEA"活"起来的关键。

**方案A：使用IMAN\_specification Relation**

TC内置的\`IMAN\_specification\`关系通常用于"文档描述Item"的场景。我们可以复用这个关系，将FMEA\_Item作为零部件Item Revision的Specification关联对象。

优点：不用自定义Relation，TC原生支持，SOA查询方便。

缺点：语义上不够精确，\`IMAN\_specification\`通常用于CAD模型、图纸等。

**方案B：自定义Relation（推荐）**

在BMIDE中创建自定义Relation：

```sql
Relation Name: FMEA_Specification
Primary Object: ItemRevision  （零部件）
Secondary Object: FMEA_Item   （FMEA分析项）
```

还可以创建反向Relation：

```sql
Relation Name: FMEA_Affected_Part
Primary Object: FMEA_Item
Secondary Object: ItemRevision
```

这样就实现了双向查询：

-   **正向：** 从零部件出发 → 查"这个零件有哪些FMEA"
-   **反向：** 从FMEA出发 → 查"这条FMEA影响了哪些零件"

**一对多关系的处理：**

一个零部件可以关联多条FMEA（不同的失效模式），一条FMEA也可以关联多个零部件（同一个失效模式可能影响多个零件）。TC的Relation天然支持多对多，不需要额外处理。

**Where Used反查的价值：**

当设计工程师发起设计变更（ECR/ECO）时，通过TC的Where Used功能可以自动查到该零部件关联的所有FMEA。在工作流中配置Handler，实现：

1.  ECR创建 → 系统自动检查受影响零部件的关联FMEA
2.  自动向FMEA责任人发送通知："您负责的FMEA \[xxx\] 关联的零部件 \[yyy\] 正在发起变更，请评估是否需要更新FMEA"
3.  在ECO审批节点，检查关联FMEA是否已同步更新（如果未更新，工作流不允许通过）

## Step 5：自定义Form（表单界面）

TC的Form机制可以为业务对象创建结构化的录入界面。我们在BMIDE中为FMEA\_Item创建自定义Form。

**表单布局设计（三段式）：**

```sql
┌─────────────────────────────────────────────┐
│  【失效信息区】                               │
│  编号: [FM-001    ]  功能描述: [__________]   │
│  失效模式: [____________________]             │
│  失效影响: [____________________]             │
│  失效原因: [____________________]             │
├─────────────────────────────────────────────┤
│  【SOD评分区】                                │
│  严重度(S): [▼ 7]  发生度(O): [▼ 3]          │
│  探测度(D): [▼ 5]  RPN值: [ 105 ] ← 自动计算  │
│                                               │
│  现有预防措施: [____________________]          │
│  现有检测措施: [____________________]          │
├─────────────────────────────────────────────┤
│  【措施跟踪区】                               │
│  改进措施: [____________________]              │
│  责任人: [▼ 选择用户]  完成日期: [📅 日期]      │
│  状态: [▼ Open]                               │
│                                               │
│  改进后S: [▼ 3]  改进后O: [▼ 2]               │
│  改进后D: [▼ 2]  改进后RPN: [ 12 ] ← 自动计算  │
│                                               │
│  RPN降幅: [ 88.6% ] ← 自动计算                │
└─────────────────────────────────────────────┘
```

**RPN自动计算的实现方式：**

有三种方案：

**方案1：Formula属性（最简单）**

在BMIDE中将\`fmea\_rpn\`定义为Formula属性：

```sql
fmea_rpn = fmea_severity * fmea_occurrence * fmea_detection_level
```

优点：零代码，配置即生效。

缺点：只在属性加载时计算，不支持复杂逻辑（如条件判断、高亮）。

**方案2：自定义Handler（推荐）**

开发一个TC Server Extension（Handler），监听S/O/D三个属性的变化事件：

```sql
public class FMEA_RPN_Handler extends AbstractAppExtension
implements ModelEventListener {
@Override
public void modelObjectChanged(ModelObjectChangedEvent event) {
// 检查是否为FMEA_Item类型
// 读取S、O、D值
int s = getIntProperty(modelObj, "fmea_severity");
int o = getIntProperty(modelObj, "fmea_occurrence");
int d = getIntProperty(modelObj, "fmea_detection_level");
// 计算RPN
int rpn = s * o * d;
setIntProperty(modelObj, "fmea_rpn", rpn);
// 高RPN预警标记
if (rpn > 200) {
setStringProperty(modelObj, "fmea_rpn_flag", "HIGH_RISK");
}
}
}
```

**方案3：RAC（Rich Client）端插件**

在TC Rich Client中通过ITK/Java插件实现实时计算和界面高亮。适合需要复杂交互逻辑的场景（如RPN>200时弹出警告对话框）。

## Step 6：工作流设计

FMEA的工作流是保证质量的最后一道防线。在TC的Workflow Designer中设计如下流程：

**标准FMEA审批流程：**

```sql
[开始] → [编制] → [质量工程师审核] → [会签] → [批准] → [发布]
↓
[驳回→回到编制]
```

**节点详细配置：**

| 节点 | 处理人 | 动作 | 超时设置 |
| --- | --- | --- | --- |
| 编制 | fmea\_responsible\_user属性指定的用户 | 填写所有必填属性 | 7天 |
| 质量审核 | 质量部门主管（按组分配） | 评审S/O/D评分合理性 | 3天 |
| 会签 | 设计+工艺+质量代表 | 并行会签，全部同意才通过 | 5天 |
| 批准 | 质量经理 | 最终批准 | 3天 |

**条件分支——高RPN额外审批：**

在"质量审核"节点之后添加条件判断：

```sql
if (fmea_rpn > 200) {
// 需要额外的管理者审批
route to [管理者审批节点]
} else {
// 直接进入会签
route to [会签节点]
}
```

管理者审批节点的处理人设为部门总监或总工程师级别。

**超时自动催办：**

在每个审批节点设置Escalation规则：

-   到期前1天：发送提醒邮件
-   到期当天：发送催办邮件，抄送节点处理人的上级
-   超期3天：自动升级到上级处理人

**工作流模板化：**

创建两个工作流模板：

-   \`DFMEA\_Approval\_Template\`：设计FMEA审批流程
-   \`PFMEA\_Approval\_Template\`：过程FMEA审批流程（会签节点增加制造部门代表）

---

# 四、关键控制点

光有数据模型和流程还不够，以下几个控制点是保证FMEA体系真正落地的关键：

## 控制点1：零部件发布卡点

**规则：关键零部件在发布（Release）时，必须关联至少一条FMEA。**

实现方式：在零部件的Release工作流中添加Handler检查：

```sql
// 伪代码
if (itemRevision.type == "零件") {
List fmeaRelations = getRelations(itemRevision, "FMEA_Specification");
if (fmeaRelations.isEmpty()) {
// 阻断工作流，提示"该零部件未关联FMEA，请先完成FMEA分析"
rejectTask("该零部件未关联FMEA，请先完成FMEA分析后再发布。");
}
}
```

注意：不是所有零件都需要FMEA，只对关键件（可以通过属性\`is\_critical\_part\`标识）做此检查。

## 控制点2：变更联动

**规则：设计变更发起时，系统自动检查受影响零部件的关联FMEA，并通知责任人。**

实现方式：在ECR（Engineering Change Request）的创建Handler中：

1.  获取ECR受影响的零部件列表
2.  遍历每个零部件，通过\`FMEA\_Specification\`关系查找关联的FMEA
3.  为每条关联FMEA创建一个Task（任务），分配给FMEA的\`fmea\_responsible\_user\`
4.  Task描述："因ECR \[编号\] 涉及零部件 \[零件号\]，请评估并更新相关FMEA"

## 控制点3：高RPN定期Review

建立周期性Review机制：

-   RPN > 200 的FMEA项：每月Review一次
-   RPN 100-200 的FMEA项：每季度Review一次
-   已完成改进的FMEA项：验证改进后RPN是否达标

实现方式：可以利用TC的Scheduled Job（定时任务），定期生成高RPN项的报表，自动发送给质量部门。

## 控制点4：FMEA报表

通过TC的SOA接口或直接在Rich Client中开发报表插件，支持以下统计：

-   **按RPN排序**：Top N高风险项一目了然
-   **按责任部门统计**：哪个部门的FMEA未完成最多
-   **趋势分析**：改进前后的RPN变化趋势
-   **覆盖率统计**：关键零部件的FMEA覆盖率

---

# 五、进阶扩展

## FMEA知识库与模板复用

当企业积累了足够多的FMEA数据后，可以将历史FMEA沉淀为模板：

1.  创建\`FMEA\_Template\`子类型（继承自\`FMEA\_Item\`）
2.  将经过验证的FMEA标记为模板，存入专门的模板库
3.  新项目启动时，工程师从模板库中选择相似的FMEA，一键复制并修改
4.  模板中包含预设的失效模式、常见S/O/D评分、推荐措施，大幅降低编制工作量

## 与变更管理深度集成

在ECR/ECO流程中嵌入FMEA检查点：

-   **ECR阶段**：评估变更对现有FMEA的影响，输出"FMEA影响评估报告"
-   **ECO执行阶段**：要求FMEA同步更新并走完审批，ECO才能关闭
-   **变更验证阶段**：确认改进后RPN是否达到预期目标

## FMEA Dashboard

在TC Active Workspace（AW）中利用Saved Search和自定义Dashboard实现FMEA可视化：

-   高RPN项热力图
-   FMEA编制进度看板
-   改进措施完成率统计
-   各产品线FMEA覆盖情况

---

# 六、实施建议与投入估算

## 分阶段推进

**第一阶段（1-2个月）：DFMEA基础功能**

-   创建FMEA\_Item自定义类型和属性
-   完成LOV和Form配置
-   实现FMEA与零部件的关联
-   部署标准审批工作流
-   覆盖1-2个核心产品的设计FMEA

人力投入：TC实施顾问1人 + BMIDE开发1人，约20-30人天。

**第二阶段（1-2个月）：PFMEA + 自动化**

-   扩展PFMEA\_Item子类型
-   开发RPN自动计算Handler
-   实现变更联动通知
-   高RPN预警和定期Review机制
-   覆盖关键工序的过程FMEA

人力投入：TC开发2人，约20-30人天。

**第三阶段（1-2个月）：深度集成 + 报表**

-   与ECR/ECO工作流深度集成
-   FMEA知识库与模板机制
-   Dashboard和报表开发
-   全面推广到所有产品线

人力投入：TC开发1人 + 前端开发1人，约15-25人天。

## 两种数据模型的对比

前面提到过两种建模方式，这里做详细对比：

| 方案 | 描述 | 优点 | 缺点 |
| --- | --- | --- | --- |
| 方案A：一个Item多条Rev | 一个FMEA\_Item下每条失效模式是一个Revision | 结构清晰，数量可控 | Revision编号语义不直观 |
| 方案B：每条失效模式独立Item | 每条失效模式是一个FMEA\_Item | 每条独立管理，版本独立 | Item数量膨胀 |

**推荐方案A**，配合自定义编号规则（如FM-001 Rev A）和命名规范，可以兼顾结构清晰和管理便利。

---

# 七、结论

回到文章开头的问题：Teamcenter没买FMEA模块，FMEA就只能散落在Excel里吗？

**答案是否定的。**

用TC的自定义对象、属性、LOV、Relation、Form、工作流这套基础能力，完全可以搭建一套结构化的FMEA管理体系。而且这套方案有一个商业FMEA模块不具备的优势：**它是和你的产品数据模型原生集成的。**

FMEA和零部件之间有Relation，设计变更时能自动反查，改进措施能走正式的审批流程，高RPN项能自动预警——这些能力不是因为FMEA模块多强大，而是因为FMEA数据和设计数据在同一个平台上，用同一套语言在对话。

**投入产出比：** 前面估算的三个阶段合计55-85人天，按一个TC顾问每天3000-5000元计算，总投入约15-40万。对比一个商业FMEA模块的许可费+实施费，这个方案的ROI是非常高的。

当然，如果你的预算充足、上线周期宽裕，购买成熟的FMEA模块肯定是最省心的选择。但对于大多数已经上了TC、FMEA还在Excel里挣扎的企业来说，用自定义对象方案先跑起来，再根据需要逐步升级，是最务实的路径。

**核心价值只有一句话：让FMEA不再是"墙上的证书"，而是和设计过程真正绑定的活数据。**

---

\*本文基于Teamcenter平台标准功能编写，具体实现细节可能因TC版本和许可证配置略有差异。建议在开发环境中先行验证。\*

---

内容效果不满意？[点此反馈](https://feedback.notebooksyncer.com/feedback/58dea931_1783990687365?u=https%3A%2F%2Fmp.weixin.qq.com%2Fs%3F__biz%3DMzA4ODAyNzk0Mg%3D%3D%26mid%3D2456021389%26idx%3D1%26sn%3D6b536f4200a0dbaf996f50963a8ff811%26chksm%3D8649da7f2e7e9d0a3fdec4f69a6fad536e3a9854924f583ae6e76e5b967452121c3ada120806%26mpshare%3D1%26scene%3D1%26srcid%3D0714Xp1QGyFzd61YnNaIfRq2%26sharer_shareinfo%3D69368874aadf3a6a2c9172a55b7d7438%26sharer_shareinfo_first%3D69368874aadf3a6a2c9172a55b7d7438%23rd&s=obsidian)