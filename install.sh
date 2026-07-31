#!/bin/bash
# Pi 包管理器安装脚本
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.npm-global/bin"
BUNDLE_DIR="$HOME/.pi/bundle"

echo "=== Pi 包管理器安装 ==="

# 1. 确保 bin 目录存在
mkdir -p "$BIN_DIR"

# 2. 创建 pi-ctl symlink
ln -sf "$REPO_DIR/scripts/pi-ctl" "$BIN_DIR/pi-ctl"
echo "✓ 已创建 pi-ctl 命令链接"

# 3. 更新 piweb（如果存在）
if command -v piweb &>/dev/null; then
  echo "✓ piweb 命令已存在，保留"
fi

# 4. 确保 bundle 目录存在
mkdir -p "$BUNDLE_DIR"
if [[ ! -f "$BUNDLE_DIR/package.json" ]]; then
  cat > "$BUNDLE_DIR/package.json" << 'EOF'
{
  "name": "omi-toolkit",
  "version": "1.0.0",
  "private": true,
  "dependencies": {},
  "pi": {
    "extensions": []
  }
}
EOF
  echo "✓ 已初始化 bundle 目录"
fi

# 5. 安装所有配置的包
echo ""
echo "安装配置的包..."
"$BIN_DIR/pi-ctl" install

echo ""
echo "=== 安装完成 ==="
echo ""
echo "使用方法:"
echo "  pi-ctl status    # 查看包状态"
echo "  pi-ctl update    # 更新所有包"
echo "  pi-ctl list      # 列出配置的包"