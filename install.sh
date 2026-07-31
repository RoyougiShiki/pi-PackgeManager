#!/usr/bin/env bash
# Pi 包清单：复用安装入口
# 日常管理请用 Pi Web GUI 或 Pi Agent；本脚本用于新机器初始化与清单对齐
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.npm-global/bin"
BUNDLE_DIR="${HOME}/.pi/bundle"

echo "=== Pi PackageManager 安装 ==="
echo "定位: 复用安装 + packages.json 追溯记录"
echo "日常增删改请用 Pi Web / Pi Agent"
echo ""

mkdir -p "$BIN_DIR" "$BUNDLE_DIR"

# 软链脚本命令
ln -sf "$REPO_DIR/scripts/pi-ctl" "$BIN_DIR/pi-ctl"
ln -sf "$REPO_DIR/scripts/piweb" "$BIN_DIR/piweb"
ln -sf "$REPO_DIR/scripts/piweb-stop" "$BIN_DIR/piweb-stop"
chmod +x "$REPO_DIR/scripts/pi-ctl" "$REPO_DIR/scripts/piweb" "$REPO_DIR/scripts/piweb-stop"
echo "✓ pi-ctl → $BIN_DIR/pi-ctl"
echo "✓ piweb → $BIN_DIR/piweb"
echo "✓ piweb-stop → $BIN_DIR/piweb-stop"

echo ""
echo "按 packages.json 安装..."
"$BIN_DIR/pi-ctl" install

echo ""
echo "=== 完成 ==="
echo "  pi-ctl list     # 查看清单"
echo "  pi-ctl status   # 版本对比"
echo "  pi-ctl update   # 按清单更新"
echo "  piweb           # 启动 Pi Web"
echo "  piweb update    # 更新 Pi Web"
echo "  piweb-stop      # 停止 Pi Web"
echo ""
echo "日常管理: Pi Web GUI 或与 Pi Agent 对话"
echo "本仓库: 新机器复用 + 记录追述"