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

ln -sf "$REPO_DIR/scripts/pi-ctl" "$BIN_DIR/pi-ctl"
chmod +x "$REPO_DIR/scripts/pi-ctl"
echo "✓ pi-ctl → $BIN_DIR/pi-ctl"

if command -v piweb >/dev/null 2>&1; then
  echo "✓ piweb 已存在（本仓库不内嵌启动脚本）"
else
  echo "ℹ piweb 未找到；安装 @agegr/pi-web 后可用官方 pi-web，或自行配置启动包装"
fi

echo ""
echo "按 packages.json 安装..."
"$BIN_DIR/pi-ctl" install

echo ""
echo "=== 完成 ==="
echo "  pi-ctl list     # 查看清单"
echo "  pi-ctl status   # 版本对比"
echo "  pi-ctl update   # 按清单更新"
echo ""
echo "日常管理: Pi Web GUI 或与 Pi Agent 对话"
echo "本仓库: 新机器复用 + 记录追述"
