---
created: 2026-09-04T16:43:30
updated: 2026-09-04T16:43:53
---
## 具体操作步骤

1. **打开普通操作系统命令提示符**（注意：是**非** Teamcenter 命令提示符），导览至 STAGE 目录
    
    ：

```
cd TC_ROOT\aws2\stage
```

2. **Windows 下运行 initEnv 脚本初始化开发环境**（Linux 无需此步）
    
    ：

```
initenv.cmd
```

3. 然后即可执行 `aw start` 等命令 ：

```
aw start --port=3001 --gateway=http://10.16.68.16:3000
```