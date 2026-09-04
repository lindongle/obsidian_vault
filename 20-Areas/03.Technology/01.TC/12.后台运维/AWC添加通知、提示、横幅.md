---
created: 2026-08-29T13:02:18
updated: 2026-09-04T16:09:35
---
![[d05cac842188c8fec99cd266e8dbbce0.png]]![[02fe862e9f394fa4d881ee80f43c3f3a.png]]

## 用途

创建一条显示在 Active Workspace 用户界面中的横幅（Banner），用于向所有用户传达消息，例如停机维护通知。

## 配置规则

要显示横幅，必须设置 **AW_Banner 站点首选项** 的值，需指定：

- **text**：消息文本（必填）
- **type**：消息类型（必填，决定显示样式）
- **startDate**：开始显示的日期时间（必填）
- 可选：设置 **endDate**（结束时间）或持续时间
    

## 类型（type）示例

```
startDate:2024-05-17 17:00
type:INFO
text:An informational message.
```

（普通信息消息）

```
startDate:2024-05-17 17:00
type:SUCCESS
text:Updates completed successfully.
```

（成功提示，带 ✓ 样式）

```
startDate:2024-05-17 17:00
type:WARN
text:A warning message.
```

（警告消息，带 ⚠️ 警告样式）

## 对照你的截图

你图中的配置正是标准用法：

```
type:WARNING
text: 通知: 2026.08.21 (周五) 今日晚上21:00停机维护TC正式环境，预计停机至23点，请提前保存数据
startDate:2026-08-21 00:00
endDate:2026-08-22 00:00
```

即从 2026-08-21 00:00 起，AWC 界面顶部会以警告样式（黄色警告条）向所有用户显示这条停机维护通知，直至 2026-08-22 00:00 自动消失。作为站点（Site）范围的字符串型首选项，所有连接到该站点的 Active Workspace 用户都会看到。