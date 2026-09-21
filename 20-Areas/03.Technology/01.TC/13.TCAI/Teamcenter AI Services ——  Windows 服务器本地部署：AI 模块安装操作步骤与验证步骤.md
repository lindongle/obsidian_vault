---
created: 2026-09-21T10:03:36
updated: 2026-09-21T10:05:55
---


> **适用环境**：纯 Windows 服务器，Teamcenter 2606 主体已安装完毕（含 Active Workspace、索引编制引擎 Solr、TcFTSIndexer、FMS、Microservice Node 等），仅缺 **AI 模块（Teamcenter AI Services）** 未安装。
> **后端栈**：本地自建（Customer Datacenter / Self Managed）= Ollama（LLM + Embedding）+ OpenSearch（向量库）。
> **资料来源**：
> - 《Local Infrastructure Setup 2606.pdf》—— 本地基础设施（OpenSearch / Dashboard / Ollama）搭建与安装后验证 [pdf_1]
> - 《Teamcenter Installation Using Deployment Center.pdf》—— Deployment Center 中安装 AI 微服务的完整步骤 [pdf_3]
> - 《数据索引编制和搜索配置.pdf》—— AI 功能（Copilot、自然语言搜索）配置 [pdf_5]
> - 《Tc2606PlatformMatrix-2026-08-24.xlsx》—— 认证模型与版本 [excel_6]

---

## 一、认证版本与选型（先确认，再动手）

根据 Teamcenter 2606 平台认证矩阵 **AI Tech Stack** 工作表，**本地自建（On-Prem / Customer Datacenter）** 这一行的认证组合为 [excel_6]：

| 项 | 认证规格 |
|---|---|
| Teamcenter Deployment Mode | On-Prem |
| AI Tech Stack Location | Customer Datacenter（LLM、Embedding Model、Vector Database 全部在客户数据中心本地） |
| **LLM** | **Llama 3.3 70B 或 Llama 4.0 Scout** |
| **Embedding Model** | **nomic-embed-text 或 bge-m3**（bge-m3 推荐用于多语言支持） |
| **Vector Database** | **OpenSearch，版本 2.16.0 至 2.19.3** |

缩写含义（矩阵内）：**LLM = Large Language Model，EM = Embedding Model，VDB = Vector Database** [excel_6]。

> 对比：若选 AWS 方案为 `Claude Sonnet 4.5 + Titan Embedding + AWS OpenSearch`；Azure 方案为 `GPT 4.1/5.1/4o + text-embedding-3-large + Azure AI Search` [excel_6]。本文档走的是**本地 Ollama + OpenSearch** 这一行。

**矩阵维护记录**：10-Apr-2026 由 Rahul R 建立 2606 矩阵；24-Aug-2026 由 B Donovan 增补 AWS 相关内容 [excel_6]。

---

## 二、总体安装顺序（针对“主体已装、只补 AI”）

因为 Teamcenter 已装好，你**不需要**重做主体安装，只需按以下顺序补装：

1. 装 **OpenSearch 2.16.0**（向量库，端口 9200）
2. 装 **OpenSearch Dashboard 2.16.0**（端口 5601，可选但建议）
3. 装 **Ollama** + 拉取认证模型（端口 11434）
4. 在 **Deployment Center** 中添加 **Teamcenter AI Microservices + Microservice Node** 组件并填参数 → 生成并运行部署脚本
5. 配置 **AI 功能**（Copilot 知识库嵌入 / 自然语言搜索）
6. 执行**安装后验证**

> 前置检查（Deployment Center 已列明）：必须先 **Install the Indexing Engine and TcFTSIndexer**（索引编制引擎与索引器），并已Review 本地基础设施文档（Local Infrastructure Setup）[pdf_3]。你的环境已装，确认这两项在运行即可。

---

## 三、Section 1：OpenSearch 2.16.0 安装（Windows）

### 3.1 下载与解压
下载 zip 并解压到安装目录：

```
https://artifacts.opensource.org/releases/bundle/opensource/2.16.0/opensource-2.16.0-windows-x64.zip
```

### 3.2 设置环境变量
若未永久设置，每次新开命令提示符都要重设（生产建议在“系统属性→环境变量”永久设置）：

```
set KNN_LIB_DIR=<opensearch-knn 插件内 lib 文件夹路径>
set OPENSEARCH_HOME=<OpenSearch 根目录>
set OPENSEARCH_PATH_CONF=<OpenSearch config 目录>
set OPENSEARCH_JAVA_HOME=<OpenSearch 目录内 jdk 路径>
set OPENSEARCH_INITIAL_ADMIN_PASSWORD=<自定义 admin 密码>
```

**密码要求**：最少 8 字符，含 1 个大写、1 个小写、1 个数字、1 个特殊字符 [pdf_1]。

同时把上述 lib 路径加入 `PATH`（`opensearchknn_common.dll` 也在该 lib 目录）。**注意：PATH 中环境变量过多会导致该 dll 无法识别、OpenSearch 启动失败**，需移除多余项 [pdf_1]。

记下此密码 → **[Input 1：OpenSearch Password]**

### 3.3 装安全配置并测试
先运行安全批处理：

```
opensearch-2.16.0\plugins\opensearch-security\tools\install_demo_configuration.bat
```

再运行 `OPENSEARCH-WINDOWS-INSTALL.BAT` 测试安装（会安装带基本 HTTP 认证的安全插件）[pdf_1]。

新开命令提示符验证：

```
curl.exe -X GET https://localhost:9200 -u "admin: <your_password>" --insecure
```

期望返回 JSON 含 `cluster_name`、`version`（distribution=opensearch、number=2.16.0、build_type=zip）、`tagline: The OpenSearch Project` [pdf_1]。

查插件：

```
curl.exe -X GET https://localhost:9200/_cat/plugins?v -u "admin: <your_password>" --insecure
```

记下用户名（默认 `admin`）→ **[Input 2：OpenSearch Username]**

### 3.4 配置 opensearch.yml
在 `opensearch-2.16.0\config` 下配置（以下为默认初始化值；Discovery 之后不要再改文件其他内容）[pdf_1]：

```yaml
cluster.name: <name-of-your-cluster>
node.name: <name-of-your-node>
node.rules: [cluster_manager,data,ingest,search,ml]
node.search.cache.size: 512m
path.data: path/to/data
path.logs: path/to/logs
bootstrap.memory_lock: true
network.host: 0.0.0.0
http.port: 9200
discovery.seed_hosts: ["127.0.0.1"]
discovery.type: single-node
```

把 `path.data`、`path.logs` 换成实际路径。记下主机 → **[Input 3：OpenSearch Host（hostname 或 IP，用于拼 Endpoint URL）]**

### 3.5 配置 JVM 堆
打开 `config\jvm.options`，堆设为机器总内存的一半。例如 8 GB 内存：

```
-Xms4g
-Xmx4g
```

（`-` 前缀必需）[pdf_1]。

### 3.6（可选）用户/角色管理
仅在需改用户时用：改 `internal_users.yml`；在 `plugins\opensearch-security\tools` 下运行 `Hash.bat` 生成密码 hash。`reserved: true` 表示不能经 REST 改，`hidden: true` 表示不能经 REST 返回 [pdf_1]。

---

## 四、OpenSearch Dashboard 2.16.0（Windows）

1. 下载：
```
https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/2.16.0/opensearch-dashboards-2.16.0-windows-x64.zip
```

2. **管理员 PowerShell** 启用长路径：
```powershell
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Type DWord -Value 1 -Force
```

3. 配置 `opensearch-dashboards-2.16.0\config\opensearch_dashboards.yml`：
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

4. 进入 bin，双击 `opensearch-dashboards.bat` 启动（停止：Ctrl+C 或关窗口）。
5. 浏览器访问 `http://localhost:5601`，用 admin + 你的密码登录（需 OpenSearch 在运行）[pdf_1]。

> admin 为安装期 demo 值，生产应通过 `opensearch-security` 配置与 `internal_users.yml` 修改 [pdf_1]。

---

## 五、Section 2：Ollama 安装与模型下载（Windows）

### 5.1 下载安装
官网下载 Windows 版 Ollama（要求 Windows 10 或更高），运行安装程序，装完会自动启动（系统托盘有图标；可右键退出以便配置）[pdf_1]。

### 5.2 配置环境变量（管理员命令提示符）
```
set OLLAMA_DEBUG=1
set OLLAMA_HOST=0.0.0.0:11434
set OLLAMA_MAX_LOADED_MODELS=3
set OLLAMA_KEEP_ALIVE=-1
set OLLAMA_NUM_PARALLEL=3
set OLLAMA_FLASH_ATTENTION=1
set OLLAMA_LLM_LIBRARY=CUDA       （或 cuBLAS，取决于 GPU）
set OLLAMA_CONTEXT_LENGTH=64000
```

记下 Ollama 主机 → **[Input 4：Ollama Host（hostname 或 IP，用于拼 Endpoint URL）]** [pdf_1]

说明：
- `OLLAMA_MAX_LOADED_MODELS` 控制并行模型数；**生产环境不要手动设置**（可能影响性能，让 Ollama 自动定最优值）[pdf_1]。
- `OLLAMA_CONTEXT_LENGTH` 按 GPU 容量与模型要求调整（如 llama3.3:70B 约需 50 GB VRAM，llama4:scout 可能 64 GB+），不要超过模型支持的最大上下文 [pdf_1]。
- 生产请在系统属性中永久设置。

### 5.3（可选）KV Cache 类型
```
set OLLAMA_KV_CACHE_TYPE=q4_0     （GPU ≤ 16 GB VRAM）
set OLLAMA_KV_CACHE_TYPE=q8_0     （GPU > 16 GB VRAM）
```
依据可用 GPU 显存（非算力）选择 [pdf_1]。

### 5.4 下载认证模型
按矩阵认证列表（Llama 3.3 70B 或 Llama 4.0 Scout 作 LLM；nomic-embed-text 或 bge-m3 作 Embedding）[excel_6]，执行：

```
ollama pull llama3
ollama pull llama3.3:70b
ollama pull llama4:scout
ollama pull nomic-embed-text
ollama pull bge-m3
```

查看：`ollama list` [pdf_1]

记下列表中的名称：
- **[Input 5：LLM Name]**
- **[Input 6：Embedding Model Name]**

### 5.5（可选）加载自定义 GGUF
从 Hugging Face 下 GGUF（如 `Meta-Llama-3-8B-Instruct-Q4_K_M.gguf`），写 Modelfile：

```
FROM C:\Users\<user>\Downloads\Meta-Llama-3-8B-Instruct-Q4_K_M.gguf
```

创建：`ollama create llama3instruct -f C:\Users\<user>\Desktop\all-mpnet\llama3instruct.modelfile` [pdf_1]

### 5.6 启动服务
```
ollama run llama3
ollama run llama3.3:70b
ollama run llama4:scout
ollama serve
```

服务地址 `http://localhost:11434`；可随时用 `OLLAMA_DEBUG=1` 开调试 [pdf_1]。帮助：`ollama run --help`（`OLLAMA_HOST` 默认 `127.0.0.1:11434`）[pdf_1]。

---

## 六、Section 4（关键补充）：Deployment Center 安装 AI 微服务

> 这是你“只缺 AI 模块”场景的核心操作。以下为《Teamcenter Installation Using Deployment Center》中 “Install Teamcenter Artificial Intelligence Services using Deployment Center” 的完整流程 [pdf_3]。

### 6.1 前提条件（Prerequisites）
- **Install the Indexing Engine and TcFTSIndexer**（必须已装，你的环境已满足）[pdf_3]
- 已 Review 本地 AI 基础设施文档：**Local Infrastructure Setup**（即本文第三~五章已完成）[pdf_3]
- 已 Review 适用的 AWS 或 Azure 安全实践（AI/LLM/API key 相关）[pdf_3]
- 说明：Teamcenter AI Services 是**单独授权**的附加模块，其安装作用是让 Teamcenter 连接你的第三方向量数据库与模型；Siemens 仅对该接口连接提供支持 [pdf_3]

### 6.2 Procedure（完整步骤）
1. 登录 Deployment Center，选择要添加的环境 [pdf_3]。
2. 进入 **Applications** 选项卡，点击 **Add or Remove Selected Applications** [pdf_3]。
3. 在 **Available Applications** 面板中，用浏览器搜索找到并选中 **Teamcenter Copilot** 和 **Dispatcher**。该应用包含 Copilot、自然语言搜索和零件搜索的基础；还可按需额外选择附加应用 [pdf_3]：
   - Teamcenter Copilot BOM Add-on
   - Teamcenter Copilot MBSE Add-on
   - Teamcenter Copilot Quality Add-on
4. 点击 **Update Selected Applications**。Deployment Center 会自动勾选任何附加的依赖应用 [pdf_3]。
5. 进入 **Components** 选项卡 [pdf_3]。
6. 在 **Selected Components** 列表中，选中 **Teamcenter AI Microservices** 与 **Microservice Node** 组件 [pdf_3]。
7. 在 **Teamcenter AI Microservices** 面板，在 **AI Platform** 中选择一个选项，并填入配置参数。**对你这种本地自建（Self Managed），Vector Database Settings 为** [pdf_3]：

| 参数 | 说明 |
|---|---|
| **Endpoint URL** | 向量数据库接收请求的位置。**端口为 9200**。即 `https://<OpenSearch Host>:9200` |
| **User Name** | 有权限访问向量数据库的用户名（= Input 2） |
| **Password** | 该用户的密码（= Input 1） |

点 **Show all parameters** 可指定更多设置 [pdf_3]。

> 供对照（你不用）：Amazon AWS 用 Access Key / Secret Key / Region Name / IAM Role，且 AWS 的 LLM 与 Embedding **不需要** Endpoint URL；Microsoft Azure 用 Endpoint URL / API Key / LLM name / LLM endpoint URL / LLM API key / Embedding model name / Embedding endpoint URL / Embedding API key [pdf_3]。本地 Self Managed 走上面的 9200 + 用户名密码 + LLM/Embedding Endpoint URL 组合。

8. 在 **Dispatcher Module** 面板的 **Translators** 中，选中 **AI Services Indexing Translator** [pdf_3]。
9. 在 **Microservice Node** 面板，确认以下两个微服务各有一个实例在运行 [pdf_3]：
   - **Teamcenter Data Vectorizing Service**
   - **Teamcenter Language Model Invocation Service**
   点 **Show all parameters** 可指定附加设置 [pdf_3]。
10. 组件值填完后，点击 **Save Component Settings** [pdf_3]。
11. 在 Selected Components 列表中，检查是否还有组件配置状态未达 **100%**；逐个选中未完成的组件，填入所需参数并保存，直到**环境中所有组件配置状态均为 100%**。全部配置完成后，**Deploy 选项卡才会启用** [pdf_3]。
12. 进入 **Deploy** 选项卡，点击 **Generate Install Scripts** 生成用于更新目标机器的部署脚本；生成完成后注意 **Deploy Instructions** 面板中的特殊说明 [pdf_3]。
13. 找到部署脚本，**复制到目标机器并在目标机器上运行每个脚本**（运行方法参见“Deployment Center - 用法”）[pdf_3]。
14. 修改网络防火墙设置，允许 WebRTC，并允许 `*.sws.siemens.com` 域在 **443 端口的 UDP 流量** [pdf_3]。
15. 找到并打开相应的 TXP 配置文件：**Windows 为 `<TC_ROOT>\microservices\services_config\txp.json`**（Linux 为 `<TC_ROOT>/container/kubernetes/deployment/txp.yaml`）[pdf_3]。

### 6.3 安装后额外配置（What to do next）
- **主机名纠错**：若某微服务向 Service Registry 自注册了错误的 IP/主机名，可在 `<TC_ROOT>\microservices\services_config\*.json` 中定义 **MSF_HOST_OVERRIDE** 环境变量为正确的 IP 或主机名 [pdf_3]。
- **LLM 相关环境变量**：打开 `TC_ROOT\microservices\services_config\teamcenter_language_model_invocation_service.json`，添加以下变量并填值 [pdf_3]：
  - `LLM_CONTEXT_SIZE`：LLM 上下文窗口，因模型而异，按你使用的 LLM 设置
  - `SUMMARISE_TIMEOUT_IN_SECONDS`：Copilot 中对当前打开文档做摘要的最长等待时间
  - `LLM_TIMEOUT_IN_SECONDS`：等待 AI 服务功能返回结果的最长时间
  - `MAX_FILE_SIZE`：可被摘要的文件最大尺寸
- **重启微服务**（Restart microservices）[pdf_3]
- **配置你想用的 AI 功能**（详见第七章）[pdf_3]：
  - 为文档和需求配置 Copilot
  - 配置用于结构的 Copilot
  - Configure Natural Language Search
- 可选后续：配置帮助 Copilot [pdf_3]

### 6.4 本地 Input → Deployment Center 字段映射（速查）

| Input | 值 | Deployment Center 字段 |
|---|---|---|
| Input 1 | OpenSearch admin 密码（≥8 位含大小写/数字/特殊字符） | Password |
| Input 2 | OpenSearch admin 用户名（默认 admin） | User Name |
| Input 3 | `https://<OpenSearch Host>:9200` | Endpoint URL（Vector DB，端口 9200） |
| Input 4 | `http://<Ollama Host>:11434/v1` | LLM Endpoint URL |
| Input 5 | LLM 模型名（如 llama3.3:70b / llama4:scout，取自 `ollama list`） | LLM Name |
| Input 6 | Embedding 模型名（如 bge-m3 / nomic-embed-text） | Embedding Model Name |

---

## 七、配置 AI 功能（Copilot / 自然语言搜索）

### 7.1 前提与总要求
- 要把 **Teamcenter Copilot** 用于文档、需求和结构、自然语言搜索、零件搜索，**必须安装 Teamcenter AI 服务** [pdf_5]。
- 要获取帮助的 Copilot，必须安装 **Teamcenter Xcelerator Proxy 应用程序** [pdf_5]。
- 自然语言搜索前提：**已安装、配置并执行对象数据和文件内容索引编制** + **已安装 Teamcenter AI 服务** [pdf_5]。
- **零件搜索**：必须**使用 Microsoft Azure** 安装 Teamcenter AI 服务才能用 —— **你走本地 Ollama 方案，因此零件搜索不可用** [pdf_5]。

### 7.2 为文档和需求配置 Copilot
前提：已为对象数据和文件内容完成索引编制；已装 AI 服务 [pdf_5]。

步骤 [pdf_5]：
1. 在 **业务建模器 IDE (BMIDE)** 中，标识要嵌入 Copilot 的可编制索引属性。属性必须是字符串类型，或引用字符串属性的复合属性；将每个属性的 **Awp0PropIsEmbedded** 属性常数设为 `true`。
   - 注意：如新增属性并设该常数，必须**重新合并 Schema 并重新编制索引**。
2. 运行：
```
bmide_modeltool -u=<username> -p=<password> -g=<group> -tool=tc_embed_schema_gen -mode=upgrade -target_dir=<target directory>
```
3. **仅当**同时满足：从 2512 或更早升到 2606+，且早期装过 AI 服务，且早期嵌入过文档 —— 才需更新矢量架构：
```
runTcFTSIndexer -task=objdata:update_embeddings
```
（耗时可能很长）
4. **用高级搜索创建知识库**：
   - 访问“高级搜索”，选查询类型：常规查询（特定对象/属性）、数据集查询（一组文件内容）、或常规查询+需求版本类型 [pdf_5]。
   - 输入其他搜索准则 → 运行搜索 → 用可识别名称**保存搜索**，并选“允许其他人查看” [pdf_5]。
   - 重复创建多个知识库（如需求库、公司标准库、产品规格库）[pdf_5]。
5. 配置 **TC_AI_knowledge_bases** 首选项，格式：
```
<知识库名称>：<已保存的搜索名称>；<用户名>
```
例：`安全和规章:Safety_Reg;indexadmin`。多个知识库之间按 **Enter** 换行。用户名必须是创建该已保存搜索的用户，且索引用户需有读权限 [pdf_5]。
6. 若同步流在跑，先停：
```
runTcFTSIndexer -task=objdata:sync -stop
```
7. 运行嵌入流：
```
runTcFTSIndexer -task=objdata:embed
```
（该流嵌入来自知识库、已编制索引的对象数据和文件内容，供 Copilot 访问）[pdf_5]
8. 重启同步流：
```
runTcFTSIndexer -task=objdata:sync
```

**后续维护** [pdf_5]：
- BMIDE 数据模型变更（新增/禁用嵌入属性）后，需更新嵌入属性配置：停同步流后运行 `runTcFTSIndexer -task=objdata:embed_metadata_sync`
- 针对新增知识库单独跑嵌入：停同步流后运行
```
runTcFTSIndexer -task=objdata:embed -kbs="<new kb name 1>","<new kb name  2>"
```

### 7.3 配置自然语言搜索（NLS）
前提：已完成对象数据和文件内容索引编制 + 已装 AI 服务 [pdf_5]。

步骤 [pdf_5]：
1. 停同步流：
```
runTcFTSIndexer -task=objdata:sync -stop
```
2. 运行嵌入式架构流：
```
runTcFTSIndexer -task=objdata:embedschema
```
（该流嵌入已编制索引的对象数据）[pdf_5]
3. 重启同步流：
```
runTcFTSIndexer -task=objdata:sync
```
4. （可选）**TC_AI_natural_language_max_types** 首选项：定义 NLS 据以匹配并提供结果的对象类型数量；调大默认值**可能影响搜索性能** [pdf_5]。
5. （可选）**TC_AI_natural_language_threshold** 首选项：更改输入的搜索准则与为查找匹配项而必须满足的可用对象类型之间的**最低相似度分数** [pdf_5]。

### 7.4 配置帮助 Copilot（可选）
前提：必须安装 **Teamcenter Xcelerator Proxy 应用程序** [pdf_5]。

步骤 [pdf_5]：
1. 用经授权用于知识助手 Copilot 账户的 Siemens Webkey 登录 **Xcelerator 管理控制台**，用电子邮件地址创建具有管理员产品角色的用户。
2. 在控制台中单击 **帮助 > 如何操作 > 指派用户**。
3. 按说明在 Teamcenter Copilot 中为用户指派帮助功能的访问权限。
4. 将 **Siemens_AI_assisted_help_enabled** 首选项设为 `true`。

结果：Teamcenter 帮助 Copilot 可供用户使用 [pdf_5]。

---

## 八、Section 5：安装后验证（Post-Setup Verification）

目标：确认所有组件（OpenSearch、OpenSearch Dashboard、Ollama、Teamcenter AI Services）均已正确安装、配置并按预期响应 [pdf_1]。

### 8.1 验证 1：OpenSearch
- 浏览器访问 `https://localhost:9200`，应返回含 cluster name、status、version 的 JSON [pdf_1]。
- Windows 实测示例片段 [pdf_1]：
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
- 或命令：`curl.exe -X GET https://localhost:9200 -u "admin: <your_password>" --insecure` [pdf_1]

### 8.2 验证 2：OpenSearch Dashboard
- 浏览器访问 `https://localhost:5601`，打开 Dashboards 登录页，用 admin 凭据登录。
- 在 **Index Management** 下确认索引模式（index patterns）可见。
- 侧边导航应可见：Home、Recently viewed、Security Analytics、Search Relevance、Machine Learning、Management（Overview / Index Management / Snapshot Management / Integrations / Dashboards Management）、Security、Notifications、Dev Tools 等 [pdf_1]。

### 8.3 验证 3：Ollama（Infra / Admin）
确保服务在运行，执行 [pdf_1]：
```
ollama --version
ollama list
```
Windows 实测示例 [pdf_1]：
```
C:\Users\pl>ollama --version
ollama version is 0.6.4

C:\Users\pl>ollama list
NAME              ID            SIZE     MODIFIED
mistral:latest    f974a74358d6  4.1 GB   6 months ago
```
版本号正常返回 + 已装模型列表可见 = 通过 [pdf_1]。

### 8.4 验证 4：Teamcenter AI Services 集成（功能 / 最终用户）
目标：确认 Teamcenter 与后端 AI 服务之间的端到端 AI 流程按预期工作 [pdf_1]。

步骤 [pdf_1]：
1. 启动 Teamcenter 应用程序。
2. 进入 **“Indexer and Search Administration Dashboard”**。
3. 点击 **“Teamcenter AI Services”** 标签页。
4. 确认所有 AI 服务显示为 **“OK”**。“Health Status” 区域应显示：
```
FMS Status: OK
Teamcenter Data Vectorization Service: OK
Vector DB Connection: OK
Embedding Model Connection: OK
Teamcenter Language Model Invocation Service: OK
Large Language Model Connection: OK
```
5. 测试推理：点击应用界面中的 **Copilot 图标**进行实际问答/推理 [pdf_1]。

全部 OK 且 Copilot 能推理 = 端到端集成验证完成 [pdf_1]。

---

## 九、针对你环境的特别提示

1. **零件搜索不可用**：文档明确“必须使用 Microsoft Azure 安装 Teamcenter AI 服务才能使用 Teamcenter 零件搜索”，你走本地 Ollama 路线，故该功能不适用 [pdf_5]。
2. **Windows 微服务节点特性**：Windows 主机上，每个微服务框架节点包含一个 **Teamcenter Process Manager** 来管理该节点上的微服务（不像 Linux 需要 Docker/Kubernetes）；可在 Microservice Node 面板勾选 **“Install Process Manager as a Windows service”** 并指定服务名 [pdf_3]。Windows 微服务节点**无需** Mirantis Container Runtime 等第三方前置软件 [pdf_3]。
3. **防火墙别漏**：务必放通 WebRTC 与 `*.sws.siemens.com` 域 443 端口 UDP [pdf_3]。
4. **JVM / 上下文**：OpenSearch 堆为内存一半；`OLLAMA_CONTEXT_LENGTH`、`LLM_CONTEXT_SIZE` 需与所选模型（70B 约 50GB VRAM / Scout 可能 64GB+）匹配 [pdf_1]。
5. **PATH 陷阱**：OpenSearch 的 PATH 变量过多会导致 `opensearchknn_common.dll` 找不到而启动失败 [pdf_1]。
6. **配置齐全才出 Deploy**：所有组件配置状态必须 100%，Deploy 选项卡才启用 [pdf_3]。
