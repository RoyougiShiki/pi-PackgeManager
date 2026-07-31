# Pi PackageManager

Pi 包管理器，统一管理 Pi Web 和 Pi 扩展。

## 功能

- 📦 统一管理 pi-web 和 bundle 扩展
- 🔄 版本检查和一键更新
- ➕ 添加/移除包
- 📋 状态查看

## 安装

```bash
# 克隆仓库
git clone https://github.com/YOUR_USERNAME/pi-PackgeManager.git
cd pi-PackgeManager

# 运行安装脚本
chmod +x install.sh
./install.sh
```

## 使用

```bash
pi-ctl status              # 显示所有包的版本状态
pi-ctl update              # 更新所有包
pi-ctl update <包名>       # 更新指定包
pi-ctl install             # 安装所有配置的包
pi-ctl add <包名> [版本]   # 添加包到配置
pi-ctl remove <包名>       # 从配置移除包
pi-ctl list                # 列出所有配置的包
pi-ctl clean-cache         # 清理版本缓存
```

## 配置

编辑 `packages.json` 管理包列表：

```json
{
  "packages": {
    "@agegr/pi-web": {
      "version": "latest",
      "type": "tool",
      "description": "Pi Web UI",
      "extensions": ["pi-web"],
      "installTarget": "npm-global"
    },
    "pi-mcp-adapter": {
      "version": "^2.6.0",
      "type": "extension",
      "description": "MCP 适配器",
      "extensions": ["pi-mcp-adapter"],
      "installTarget": "bundle"
    }
  }
}
```

### 字段说明

| 字段 | 说明 |
|------|------|
| `version` | npm 版本范围，支持 `^1.0.0`, `latest`, `github:user/repo` |
| `type` | `tool`=独立工具, `extension`=Pi 扩展 |
| `extensions` | 包内包含的扩展名列表 |
| `installTarget` | `npm-global` 或 `bundle` (~/.pi/bundle) |

## 包的分类

### installTarget

| 目标 | 安装位置 | 适用场景 |
|------|----------|----------|
| `npm-global` | npm 全局 | 独立工具如 pi-web |
| `bundle` | ~/.pi/bundle | Pi 扩展 |

## 当前管理的包

| 包 | 类型 | 描述 |
|----|------|------|
| @agegr/pi-web | tool | Pi Web UI |
| @juicesharp/rpiv-ask-user-question | extension | 问用户问题 |
| @juicesharp/rpiv-todo | extension | 任务管理 |
| @narumitw/pi-goal | extension | 目标管理 |
| pi-edit-hooks | extension | 编辑钩子 |
| pi-hashline-edit | extension | Hashline 编辑 |
| pi-mcp-adapter | extension | MCP 适配器 |
| pi-web-access | extension | Web 访问 |

## 依赖

- `jq` - JSON 处理
- `npm` - Node.js 包管理器