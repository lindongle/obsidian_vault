---
title: 修改DIPA的名称
updated: 2026-06-05T23:58:37
created: 2026-07-05T17:04:49
---

- **MEDynamicIPADisplayName**
  - 作用：决定在生成 **In-Process Assembly (IPA)** 时，使用前驱对象的哪个属性作为名称。
  - 有效值：
    - bl_item_object_name（工厂 BOP 行的物料对象名称）
    - bl_rev_object_name（工厂 BOP 行的物料版本对象名称）
  - 默认值取决于你的 BOP 行属性配置。
**修改方法**：
1.  让 Teamcenter 管理员在 **Teamcenter Rich Client** 中编辑偏好 MEDynamicIPADisplayName，改成你需要的值（bl_item_object_name 或 bl_rev_object_name）。
2.  确保该偏好已加入 **AWC_Startup_preference**。
3.  保存并重启客户端或刷新 AWC，之后生成的 DIPA 会使用新属性作为名称
