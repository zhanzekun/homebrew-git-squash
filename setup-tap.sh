#!/bin/bash

# 设置 Homebrew tap 的脚本

set -e

echo "🚀 设置 Homebrew Tap for git-squash"
echo ""

# 检查是否已有 tag
TAG=$(git describe --tags --exact-match 2>/dev/null || echo "")
if [ -z "$TAG" ]; then
    echo "⚠️  还未创建 Git tag，建议先创建："
    echo "   git tag v1.0.0"
    echo "   git push origin v1.0.0"
    echo ""
    read -p "继续吗? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 获取版本号
VERSION=${1:-"v1.0.0"}
echo "📦 使用版本: $VERSION"
echo ""

# 创建临时目录
TAP_DIR=~/git-squash-tap
echo "📁 创建 tap 目录: $TAP_DIR"

if [ -d "$TAP_DIR" ]; then
    echo "  目录已存在"
else
    mkdir -p "$TAP_DIR"
fi

cd "$TAP_DIR"

# 初始化 git（如果还没有）
if [ ! -d .git ]; then
    git init
    git branch -M main
fi

# 复制 formula 文件
cp ~/Documents/wxcode/lib/git-squash/git-squash.rb .

# 计算 SHA256
echo "🔐 计算 SHA256..."
echo ""

# 构建 URL
URL="https://github.com/zhanzekun/git-squash/archive/refs/tags/$VERSION.tar.gz"

# 下载并计算 SHA256
SHA256=$(curl -L -s "$URL" | shasum -a 256 | awk '{print $1}')

echo "✅ SHA256: $SHA256"
echo ""

# 更新 formula 中的版本和 SHA256
sed -i '' "s/version \".*\"/version \"${VERSION#v}\"/" git-squash.rb
sed -i '' "s/sha256 \".*\"/sha256 \"$SHA256\"/" git-squash.rb

echo "📝 更新后的 formula:"
echo ""
cat git-squash.rb
echo ""

read -p "📤 提交并推送到 GitHub? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # 添加远程（如果还没有）
    if ! git remote | grep -q origin; then
        git remote add origin git@github.com:zhanzekun/homebrew-git-squash.git
    fi
    
    # 提交
    git add .
    git commit -m "Update git-squash to $VERSION"
    
    # 推送
    git push -u origin main
    
    echo ""
    echo "✅ 完成！用户现在可以通过以下命令安装："
    echo "   brew install zhanzekun/homebrew-git-squash/git-squash"
fi

