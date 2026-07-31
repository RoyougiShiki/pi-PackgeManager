# Pi PackageManager

Pi 相关包的**复用安装清单**与**追溯记录**。

日常添加 / 移除 / 更新扩展，优先用：

- **Pi Web GUI**
- **Pi Agent 对话**

本仓库不提供 GUI，也不替代上述日常管理。

## 定位

| 用途 | 说明 |
|------|------|
| **复用安装** | 新机器 `clone + install.sh`，一次装好 pi-web 和当前扩展集合 |
| **记录追述** | `packages.json` + git history 记录“用过哪些 Pi 相关包” |

**不负责：**

- Pi 本体（`@earendil-works/pi-coding-agent`）安装与更新
- 日常 GUI 管理（由 Pi Web / Agent 完成）
- 全局 Skill（非 Pi 专用）

## 快速开始

```bash
git clone https://github.com/RoyougiShiki/pi-PackgeManager.git
cd pi-PackgeManager
chmod +x install.sh scripts/pi-ctl
./install.sh
```

安装后：

- `piweb`：启动 Pi Web（后台运行，自动检查更新）
- `piweb update`：更新 Pi Web 到最新版本
- `piweb-stop`：停止 Pi Web
- `pi-ctl`：包清单管理
- 扩展：安装到 `~/.pi/bundle/`
## 命令行备用

### pi-ctl（包清单管理）

```bash
pi-ctl list              # 查看清单
pi-ctl status            # 对比已装版本 vs 最新
pi-ctl update            # 按清单更新全部
pi-ctl update <包名>     # 更新单个包
pi-ctl install           # 按清单安装
pi-ctl add <包名>        # 写入清单
pi-ctl remove <包名>     # 从清单移除
```

### piweb（Pi Web 启动包装）

```bash
piweb           # 启动 Pi Web（后台运行，自动检查更新）
piweb update    # 更新到最新版本
piweb version   # 显示当前/最新版本
piweb-stop      # 停止 Pi Web
```

版本策略：清单统一使用 `latest`（GitHub 源包除外）。

版本策略：清单统一使用 `latest`（GitHub 源包除外）。

## packages.json

二维结构：**包 → 包内扩展**。

```json
{
  "packages": {
    "@agegr/pi-web": {
      "version": "latest",
      "type": "tool",
      "installTarget": "npm-global",
      "extensions": ["pi-web"]
    },
    "pi-mcp-adapter": {
      "version": "latest",
      "type": "extension",
      "installTarget": "bundle",
      "extensions": ["pi-mcp-adapter"]
    }
  }
}
```

| 字段 | 说明 |
|------|------|
| `type` | `tool` 独立工具 / `extension` Pi 扩展 |
| `installTarget` | `npm-global` 或 `bundle`（`~/.pi/bundle`） |
| `extensions` | 该包启用的扩展名 |
| `version` | 通常为 `latest` |

## 与其他仓库的关系

| 仓库 | 职责 |
|------|------|
| **pi-PackgeManager**（本仓库） | Pi Web + 扩展清单、复用安装、追溯 |
| **wsl2-dev-setup** | WSL2 整机环境；Pi 包部分引用本仓库 |
| **Pi 本体** | 单独用 npm 安装，不在本仓库管理 |

## 当前清单

| 包 | 类型 | 说明 |
|----|------|------|
| @agegr/pi-web | tool | Pi Web UI |
| @juicesharp/rpiv-ask-user-question | extension | 结构化问答 |
| @juicesharp/rpiv-todo | extension | 任务列表 |
| @narumitw/pi-goal | extension | 目标管理 |
| pi-edit-hooks | extension | 编辑钩子 |
| pi-hashline-edit | extension | Hashline 编辑 |
| pi-mcp-adapter | extension | MCP 适配器 |
| pi-web-access | extension | Web 搜索/抓取 |

## 依赖

- Node.js / npm

- Node.js / npm
- 可选：已有的 `piweb` 启动脚本（本仓库不内嵌 piweb 本体脚本）
