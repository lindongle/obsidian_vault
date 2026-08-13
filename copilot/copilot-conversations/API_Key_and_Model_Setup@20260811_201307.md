---
epoch: 1786450387298
modelKey: "qwen-plus|3rd party (openai-format)"
topic: "API Key and Model Setup"



tags:
  - copilot-conversation
---

**user**: T4S
[Timestamp: 2026/08/11 20:13:07]

**ai**: 
<errorChunk>Something went wrong. Please check if you have set your API key.
Path: Settings > copilot plugin > Basic Tab > Set Keys.
Or check model config
Error Details: 401 Invalid API-key provided. For details, see: https://www.alibabacloud.com/help/en/model-studio/error-code#apikey-error

</errorChunk>
[Timestamp: 2026/08/11 20:13:17]

**user**: ww
[Timestamp: 2026/08/11 20:15:42]

**ai**: 
<errorChunk>Model request failed: No model configuration found for: qwen-turbo|3rd party (openai-format)</errorChunk>
[Timestamp: 2026/08/11 20:15:42]

**user**: 22
[Timestamp: 2026/08/11 20:15:55]

**user**: T4S
[Timestamp: 2026/08/11 20:16:08]

**user**: MIANFEI
[Timestamp: 2026/08/11 20:16:41]

**ai**: 
<errorChunk>Model request failed: Copilot Plus license key is not configured. Please enter your license key in the Copilot Plus section at the top of Basic Settings.</errorChunk>
[Timestamp: 2026/08/11 20:16:41]

**user**: 1
[Timestamp: 2026/08/11 20:18:52]

**ai**: It looks like your message contains only a citation instruction template and a single number “1”, with no actual context or question to answer.

Could you please clarify:
- What is the question you'd like answered?
- Or provide the context (e.g., text, notes, or source material) you'd like me to base the answer on?

I’m ready to help — just let me know!
[Timestamp: 2026/08/11 20:18:55]

**user**: T4S配置证书
[Timestamp: 2026/08/11 20:19:03]

**ai**: T4S 配置 SSL/HTTPS 证书需遵循以下关键步骤（依据官方配置文档）[^1]：

### ✅ 证书要求
- 必须使用 **`.pem`** 扩展名的 X.509 PEM 编码证书（其他扩展名如 `.crt` 或无扩展名将无法识别）[^1]；
- 证书文件必须**同时包含公钥（证书）和私钥**，且**私钥不得加密**（即不能设置密码短语）；
- 推荐做法：将 `yapp2021.pem`（证书）与 `yapp2021private.pem`（私钥）合并为一个文件，**私钥在前、证书在后**，保存为 `*.pem` 格式[^1]。

### ✅ 证书部署路径
- 将合并后的 `.pem` 文件分别复制到：
  - `<BGS_ROOT>/var/conf/cert/`
  - `<GS_ROOT>/var/conf/cert/`  
  （确保 BGS 和 GS 均可读取，用于 Admin UI 配置界面加载）[^1]

### ✅ 配置流程（以 BGS 为例）
1. 进入 BGS 管理控制台 → 选择服务器实例（如 `ADMIN_UI20`）→ 编辑；
2. 找到 **“服务器证书”** 行 → 点击右侧“编辑”按钮；
3. 从文件选择器中选取已放入 `cert/` 目录的 `.pem` 文件；
4. ⚠️ 注意：若证书未显示，可能是因证书条目超限 —— 可临时移除 `0*` 开头的旧证书后再加载；
5. 点击“应用”，并**按提示立即重启 BGS**（否则配置不生效）[^1]；
6. 同样流程配置 GS 服务（端口 `11321`）[^1]。

### ✅ 访问要求
- 使用 HTTPS 访问时，**URL 必须使用域名形式**（如 `https://plmqas.yapp.com:11320/`），**不可用 IP 地址**[^1]。

> 💡 提示：证书配置错误常见于私钥被加密、扩展名不符或路径未正确放置。若重启后仍无法启用 HTTPS，建议检查日志中 `SSL handshake failed` 类错误，并验证 `.pem` 文件是否符合“私钥+证书”顺序且无密码。

#### Sources  
[^1]: [[T4S-SSLHTTPS证书配置]]
[Timestamp: 2026/08/11 20:19:23]