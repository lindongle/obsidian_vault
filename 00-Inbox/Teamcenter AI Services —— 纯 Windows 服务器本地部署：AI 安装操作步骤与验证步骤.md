# Teamcenter AI Services —— 纯 Windows 服务器本地部署：AI 安装操作步骤与验证步骤

> 来源：Teamcenter AI Services – Local Infrastructure Setup using Ollama（April 2026，Unpublished work © 2026 Siemens）
> 适用：纯 Windows 服务器环境下的 AI 本地（私有化）部署，后端基于 Ollama + OpenSearch

---

## 一、整体架构与组件

本文档覆盖 Teamcenter AI Services 的本地基础设施搭建，目标是让各组件正常通信，并确认 Teamcenter AI 端到端集成状态为健康可用。整个部署包含三大组件：

1. **OpenSearch（2.16.0）**：向量数据库，端口 9200
2. **OpenSearch Dashboard（2.16.0）**：可视化与管理界面，端口 5601
3. **Ollama**：本地大模型运行环境，端口 11434
4. **Teamcenter AI Microservices**：通过 Deployment Center 安装并配置 AI 功能

---

## 二、Section 1：OpenSearch 安装（Windows）

### 2.1 下载与解压

1. 通过以下链接下载 OpenSearch（2.16.0）zip 包：

```
https://artifacts.opensource.org/releases/bundle/opensource/2.16.0/opensource-2.16.0-windows-x64.zip
```

2. 将其解压到你希望安装 OpenSearch 的目标位置。

### 2.2 设置环境变量（Windows）

在使用 OpenSearch 之前，需设置以下环境变量。若未永久设置，则每次新开命令提示符都必须重新设置（永久设置可进入系统设置中配置）：

```
set KNN_LIB_DIR=<opensearch-knn 插件内 lib 文件夹的路径>
```

- 同时把上述路径加入 `PATH` 变量，并将 `opensearchknn_common.dll` 所在路径一并加入 PATH（该 dll 也位于 opensearch-knn 插件的 lib 文件夹内）。
- 注意：若 PATH 中环境变量过多，会导致无法识别 `opensearchknn_common.dll`，OpenSearch 将启动失败；应移除不必要的多余环境变量。

其余环境变量：

```
set OPENSEARCH_HOME=<OpenSearch 根目录路径>
set OPENSEARCH_PATH_CONF=<OpenSearch yml 所在目录，即 config 目录>
set OPENSEARCH_JAVA_HOME=<OpenSearch 目录内 jdk 的路径>
set OPENSEARCH_INITIAL_ADMIN_PASSWORD=<自定义 admin 密码>
```

**密码复杂度要求**：最少 8 个字符，包含 1 个大写字母、1 个小写字母、1 个数字和 1 个特殊字符。

请记录该密码，供 Teamcenter AI Services 使用：**[Input 1：OpenSearch Password]**

### 2.3 安装安全配置并测试

3. 运行 OpenSearch 之前，必须先运行以下安全批处理文件：

```
opensearch-2.16.0\plugins\opensearch-security\tools\install_demo_configuration.bat
```

4. 运行 opensearch-2.16.0 文件夹内的 `OPENSEARCH-WINDOWS-INSTALL.BAT` 测试安装，该脚本会安装带基本 HTTP 认证的安全插件。

5. 打开新的命令提示符，向 OpenSearch 的 9200 端口发送请求（Windows 需使用 curl 或任意 REST 客户端）：

```
curl.exe -X GET https://localhost:9200 -u "admin: <your_password>" --insecure
```

期望返回包含 `cluster_name`、`cluster_uid`、`version`（distribution=opensearch、number=2.16.0、build_type=zip 等）、`tagline: The OpenSearch Project: https://opensearch.org/` 的 JSON 响应。

6. 查询插件：

```
curl.exe -X GET https://localhost:9200/_cat/plugins?v -u "admin: <your_password>" --insecure
```

示例插件（均为 2.16.0）：opensearch-alerting、opensearch-anomaly-detection、opensearch-index-management、opensearch-ml、opensearch-security 等。

记录 OpenSearch 用户名 **[Input 2：OpenSearch Username]**，默认用户名为 `admin`。

### 2.4 配置 opensearch.yml（原文中配置文件名写作 opensearch.xml）

7. 打开 `opensearch-2.16.0\config` 内的配置文件，添加以下基础初始化配置（均为默认值；Discovery 之后不要修改文件中任何内容）：

```yaml
cluster.name: <name-of-your-cluster>

# ---------------------------------- Node ----------------------------------
node.name: <name-of-your-node>
node.rules: [cluster_manager,data,ingest,search,ml]
node.search.cache.size: 512m

# ---------------------------------- Paths ----------------------------------
path.data: path/to/data     # 集群数据存储路径
path.logs: path/to/logs     # 日志存储路径

# ---------------------------------- Memory ----------------------------------
bootstrap.memory_lock: true

# ---------------------------------- Network ----------------------------------
network.host: 0.0.0.0
http.port: 9200

# ---------------------------------- Discovery ----------------------------------
discovery.seed_hosts: ["127.0.0.1"]
discovery.type: single-node
```

8. 记录主机名：**[Input 3：OpenSearch Host — 使用机器 hostname 或 IP 作为 Endpoint URL]**

9. 在 `path.logs` 与 `path.data` 中填入你希望保存数据的实际路径。

10. 打开 config 文件夹内的 `jvm.options`，将堆大小设置为机器总内存的一半。例如机器为 8 GB 内存，则设置：

```
-Xms4g
-Xmx4g
```

（"-" 前缀必需。）

### 2.5（可选）用户与角色管理 —— Windows

该节为可选，仅在需要修改或创建用户/角色时使用：

1. 若要在创建集群期间更改用户名和密码，需修改 `internal_users.yml`。
2. 运行 `opensearch-windows-install.bat` 后，会在 `internal_users.xml/yml` 中创建若干 demo 用户；如需新增用户，格式如下。
3. 生成密码 hash：在命令提示符中进入 `plugins\opensearch-security\tools`，运行：

```
Hash.bat
```

4. 输入要生成 hash 的密码（例如 `index@dmin`）。
   - `reserved: true` —— 不能通过 REST API 修改
   - `hidden: true` —— 不能通过 REST API 返回

---

## 三、OpenSearch Dashboard 安装（Windows）

1. 下载 OpenSearch Dashboard（2.16.0）：

```
https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/2.16.0/opensearch-dashboards-2.16.0-windows-x64.zip
```

2. 在**管理员 PowerShell** 中执行（启用长路径支持）：

```powershell
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Type DWord -Value 1 -Force
```

3. 打开 `opensearch-dashboards-2.16.0\config\opensearch_dashboards.yml`，添加/确认以下配置：

```yaml
server.port: 5601
server.host: "0.0.0.0"
opensearch.hosts: ["https://localhost:9200"]
opensearch.ssl.verificationMode: none
opensearch.username: "kibanaserver"
opensearch.password: "kibanaserver"
opensearch.requestHeadersWhitelist: ["authorization", "securitytenant"]
opensearch_security_multitenancy.enabled: true
opensearch_security_multitenancy.tenants.preferred: ["Private", "Global"]
opensearch_security_readonly_mode.rules: ["kibana_read_only"]
opensearch_security_cookie.secure: false
```

4. 进入 bin 文件夹，双击运行 `opensearch-dashboards.bat` 启动（会打开一个运行 Dashboard 实例的命令提示符）。停止方式：按 `Ctrl+C`，或直接关闭命令提示符/PowerShell 窗口。

5. 浏览器访问 `http://localhost:5601`，使用 `admin` 与你设置的密码登录（需 OpenSearch 处于运行状态）。

> 注意：admin 用户名与密码为安装期 demo 值，应通过修改 `opensearch-security` 配置与 `internal_users.yml` 进行更改。

---

## 四、Section 2：Ollama 安装与配置（Windows）

### 4.1 Step 1：下载并安装 Ollama

1. 前往 Ollama 官网，下载 Windows 版 Ollama（要求 Windows 10 或更高版本）。
2. 下载完成后运行安装程序。
3. 安装完成后 Ollama 会自动启动：
   - 在系统托盘（右下角）检查 Ollama 图标；
   - 右键并选择退出，可临时停止应用以便进行配置。

### 4.2 Step 2：配置环境变量

以**管理员身份**打开命令提示符，设置以下环境变量：

```
set OLLAMA_DEBUG=1
set OLLAMA_HOST=0.0.0.0:11434
set OLLAMA_MAX_LOADED_MODELS=3
set OLLAMA_KEEP_ALIVE=-1
set OLLAMA_NUM_PARALLEL=3
set OLLAMA_FLASH_ATTENTION=1
set OLLAMA_LLM_LIBRARY=CUDA       （或 cuBLAS，取决于你的 GPU）
set OLLAMA_CONTEXT_LENGTH=64000
```

记录 Ollama 主机地址：**[Input 4：Ollama Host — 使用机器 hostname 或 IP 作为 Endpoint URL]**

**说明：**

- `OLLAMA_MAX_LOADED_MODELS` 控制可并行运行的模型数量。
- `OLLAMA_CONTEXT_LENGTH` 应根据 GPU 容量与模型要求调整。例如 llama3.3:70B 通常需约 50 GB VRAM，llama4:scout 可能需 64 GB+；不要超过模型支持的最大上下文长度。
- 生产环境中不要手动设置 `OLLAMA_MAX_LOADED_MODELS`，可能影响性能，建议让 Ollama 依据系统自动确定最优值。
- 生产使用请在“系统属性 → 环境变量”中永久设置上述变量。

### 4.3 Step 3：（可选）配置 KV Cache 类型

```
set OLLAMA_KV_CACHE_TYPE=q4_0     （GPU ≤ 16 GB VRAM）
set OLLAMA_KV_CACHE_TYPE=q8_0     （GPU > 16 GB VRAM）
```

该设置基于可用 GPU 显存（而非算力）选择，以优化本机性能。

### 4.4 Step 4：下载所需模型

参考最新的 Teamcenter Platform Matrix 中 AI Stack 章节（认证模型与版本列表），从认证列表中部署模型与版本：

```
ollama pull llama3
ollama pull llama3.3:70b
ollama pull llama4:scout
ollama pull nomic-embed-text
ollama pull bge-m3
```

查看已下载模型：

```
ollama list
```

记录列表中的名称：

- **[Input 5：LLM Name]**
- **[Input 6：Embedding Model Name]**

可在 https://ollama.com/library 探索更多模型。

### 4.5 Step 5：（可选）加载自定义 GGUF 模型

可从 Hugging Face 自带模型：

1. 从 Hugging Face 下载 GGUF 量化模型文件（如 `Meta-Llama-3-8B-Instruct-Q4_K_M.gguf`）。
2. 创建 Modelfile，格式如下：

```
FROM path/to/your/model.gguf
```

示例：

```
FROM C:\Users\<user>\Downloads\Meta-Llama-3-8B-Instruct-Q4_K_M.gguf
```

3. 创建模型：

```
ollama create mymodel -f Modelfile
```

示例：

```
ollama create llama3instruct -f C:\Users\<user>\Desktop\all-mpnet\llama3instruct.modelfile
```

输出示例：transferring model data → using existing layer sha256:... → using autodetected template llama3-instruct → creating new layer → writing manifest → success

### 4.6 Step 6：启动 Ollama Server

```
ollama run llama3
ollama run llama3.3:70b
ollama run llama4:scout
ollama serve
```

启动后 Ollama 服务地址为：`http://localhost:11434`，应用程序即可向该本地服务发起 API 调用。

> 说明：通常使用 1 个主 LLM（如 llama3.3:70B）做推理，1 个 embedding 模型（如 bge-m3 或 nomic-embed-text）做向量检索。可随时用 `OLLAMA_DEBUG=1` 开启调试。

查看运行参数帮助：

```
ollama run --help
```

（常用 flag：`--format`、`--insecure`、`--keepalive`、`--nowordwrap`、`--verbose`；环境变量 `OLLAMA_HOST` 默认 127.0.0.1:11434。）

---

## 五、Section 3：硬件要求（概要）

- llama3.3:70B 通常需要约 50 GB VRAM；
- llama4:scout 可能需要 64 GB 以上显存；
- 上下文长度与显存存在对应关系（详见文档 Table 1：LLaMA 3.3 (70B) & LLaMA 4 Scout —— Context Length vs. Hardware Requirements）；
- 设置 Context Length 与 KV Cache 类型时，应以可用 GPU 显存为依据。

---

## 六、Section 4：安装与配置 Teamcenter AI Services

需安装 Teamcenter AI 微服务并配置相应 AI 功能。

- 在 Deployment Center 中安装 Teamcenter AI Microservices 的详细步骤，请参考《Install Teamcenter Artificial Intelligence Services using Deployment Center》。
- 配置 Teamcenter Copilot 与 Natural Language Search，请参考《Understanding Teamcenter AI Services》。

### 6.1 安装过程中记录的输入项 → Deployment Center 字段映射

| Input | 值说明 | Deployment Center 字段 |
|---|---|---|
| Input 1 | OpenSearch admin 密码（通过 OPENSEARCH_INITIAL_ADMIN_PASSWORD 设置） | Password |
| Input 2 | OpenSearch admin 用户名（默认 admin，或在 internal_users.yml 中配置） | Username |
| Input 3 | OpenSearch URL —— https://<host>:9200 | Endpoint URL |
| Input 4 | Ollama server URL —— http://<host>:11434/v1 | LLM Endpoint URL |
| Input 5 | LLM 模型名称（取自 `ollama list`） | LLM Name |
| Input 6 | Embedding 模型名称（取自 `ollama list`） | Embedding Model Name |

---

## 七、Section 5：安装后验证（Post-Setup Verification）

验证目标：确认所有组件（OpenSearch、OpenSearch Dashboard、Ollama、Teamcenter AI Services）均已正确安装、配置并按预期响应。

### 7.1 验证 1：OpenSearch

**目标**：确认 OpenSearch 正在运行且可访问。

- 浏览器访问：`https://localhost:9200`
- 应返回包含 cluster name、status、version 的 JSON 响应。
- 示例片段（Windows 实测）：

```json
{
  "name" : "smoketestnode",
  "cluster_name" : "opensearch",
  "cluster_uid" : "uwVPP4g6QZaQkrzrn-jl0w",
  "version" : {
    "distribution" : "opensearch",
    "number" : "2.16.0",
    "build_type" : "zip",
    "build_hash" : "f84a26e76807ea67a69822c37b1a1d89e7177d9b",
    "build_date" : "2024-08-06T20:32:32.086481300Z",
    "build_snapshot" : false,
    "lucene_version" : "9.11.1",
    "minimum_wire_compatibility_version" : "7.10.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "The OpenSearch Project: https://opensearch.org/"
}
```

也可使用命令：

```
curl.exe -X GET https://localhost:9200 -u "admin: <your_password>" --insecure
```

### 7.2 验证 2：OpenSearch Dashboard

**目标**：确认 Dashboard UI 可访问且可操作。

- 浏览器访问 `https://localhost:5601`（默认端口），打开 OpenSearch Dashboards 登录页。
- 使用 admin 凭据登录。
- 在 “Index Management” 下确认索引模式（index patterns）可见。
- 侧边导航可见：Home、Recently viewed、Security Analytics、Search Relevance、Machine Learning、Management（Overview / Index Management / Snapshot Management / Integrations / Dashboards Management）、Security、Notifications、Dev Tools 等。

### 7.3 验证 3：Ollama 设置（Infra / Admin）

**目标**：确认 Ollama 服务与模型推理正常工作。

确保 Ollama 服务正在运行，并执行：

```
ollama --version
ollama list
```

Windows 实测示例：

```
C:\Users\pl>ollama --version
ollama version is 0.6.4

C:\Users\pl>ollama list
NAME              ID            SIZE     MODIFIED
mistral:latest    f974a74358d6  4.1 GB   6 months ago
```

即：版本号正常返回，且已安装模型列表可见 —— 视为 Ollama 验证通过。

### 7.4 验证 4：Teamcenter AI Services 集成（功能 / 最终用户）

**目标**：确认 Teamcenter 与后端 AI 服务之间的端到端 AI 流程按预期工作。

**步骤：**

1. 启动 Teamcenter 应用程序。
2. 进入 “Indexer and Search Administration Dashboard”。
3. 点击 “Teamcenter AI Services” 标签页。
4. 确认所有 AI 服务均显示为 “OK”。界面 “Health Status” 区域应显示：

```
FMS Status: OK
Teamcenter Data Vectorization Service: OK
Vector DB Connection: OK
Embedding Model Connection: OK
Teamcenter Language Model Invocation Service: OK
Large Language Model Connection: OK
```

5. 测试推理：点击应用界面中的 **Copilot 图标**，进行实际问答/推理验证。

以上全部为 “OK” 且 Copilot 能正常推理，即完成 Teamcenter AI 端到端集成的验证。

---

## 八、关键注意事项汇总

1. 严格遵循环境变量设置与密码复杂度要求（≥8 位，含大小写、数字、特殊字符）。
2. 依据 Teamcenter Platform Matrix 的认证模型列表部署模型，以保障生产环境性能。
3. OpenSearch 的 PATH 中不要有过多环境变量，否则 `opensearchknn_common.dll` 无法识别。
4. OpenSearch 配置文件在 Discovery 之后不要再做修改。
5. JVM 堆大小设为机器总内存的一半（如 8GB → `-Xms4g / -Xmx4g`）。
6. Dashboard 在 Windows 上需先启用 LongPathsEnabled。
7. 生产环境永久设置 Ollama 环境变量，并避免手动设置 OLLAMA_MAX_LOADED_MODELS。
8. 各组件访问地址：OpenSearch `https://localhost:9200`、Dashboard `https://localhost:5601`、Ollama `http://localhost:11434`。

---

*本文档依据知识库内《Local Infrastructure Setup 2606.pdf》（Teamcenter AI Services – Local Infrastructure Setup using Ollama，April 2026）整理，仅覆盖纯 Windows 服务器部署路径。*
