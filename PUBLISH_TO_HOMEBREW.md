# 如何发布到 Homebrew

## 步骤 1: 在 GitHub 上创建个人 Tap 仓库

1. 登录 GitHub，创建一个新仓库，命名为 `homebrew-git-squash`
   - 仓库名格式：`<username>/homebrew-git-squash`
   - 必须是 Public
   - 不需要 README.md

## 步骤 2: 准备 Formula 文件

Formula 文件已经准备好：`git-squash.rb`

### 获取 SHA256 哈希值

首次发布需要更新 SHA256。运行以下命令获取：

```bash
# 下载 tarball 并计算 SHA256
curl -L https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz | sha256sum

# 或者使用 shasum（Mac）
curl -L https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256

# 更新 git-squash.rb 中的 sha256 字段
```

## 步骤 3: 创建个人 Tap 仓库

```bash
# 创建新目录
mkdir ~/git-squash-tap
cd ~/git-squash-tap

# 初始化 git 仓库
git init

# 复制 formula 文件
cp /Users/zekun/Documents/wxcode/lib/git-squash/git-squash.rb .

# 创建 README（可选）
cat > README.md <<EOF
# git-squash

Git-squash 的 Homebrew tap

## Installation

\`\`\`bash
brew install zhanzekun/homebrew-git-squash/git-squash
\`\`\`

或者：

\`\`\`bash
brew tap zhanzekun/homebrew-git-squash
brew install git-squash
\`\`\`
EOF

# 提交
git add .
git commit -m "Add git-squash formula"

# 推送到 GitHub（使用你的 GitHub 用户名）
git remote add origin git@github.com:zhanzekun/homebrew-git-squash.git
git push -u origin main
```

## 步骤 4: 更新主仓库的安装说明

更新 `README.md` 中的安装说明，替换 Homebrew 安装方式：

\`\`\`bash
# 使用新 tap 安装
brew install zhanzekun/homebrew-git-squash/git-squash
\`\`\`

## 步骤 5: 首次发布

```bash
# 1. 在 git-squash 仓库创建 tag
cd /Users/zekun/Documents/wxcode/lib/git-squash
git tag v1.0.0
git push origin v1.0.0

# 2. 更新 Formula 使用 tag 而不是 master
# 修改 Formula/git-squash.rb:
# url "https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz"
# sha256 "xxxxx" # 运行: curl -L https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz | sha256sum

# 3. 提交更新到 homebrew-tap 仓库
cd ~/homebrew-git-squash
# 更新 git-squash.rb
git commit -am "Update to v1.0.0"
git push
```

## 步骤 6: 后续更新

每次发布新版本时：

```bash
# 1. 在主仓库创建本地 tag 并生成 tarball 计算 sha256
cd /Users/zekun/Documents/wxcode/lib/git-squash
git tag v1.0.1
# 使用 git archive 创建本地 tarball 来计算 sha256（在 push tag 之前）
git archive --format=tar.gz --prefix=git-squash-v1.0.1/ v1.0.1 > /tmp/v1.0.1.tar.gz
shasum -a 256 /tmp/v1.0.1.tar.gz
# 记录计算出的 sha256 值

# 2. 更新 tap 中的 formula（在 push tag 之前准备好）
cd ~/homebrew-git-squash
vim git-squash.rb
# 在 git-squash.rb 中修改：
# - version: "1.0.1"
# - url: "https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.1.tar.gz"
# - sha256: "步骤1中计算出的值"

# 3. 先提交并 push formula 更新（可选，也可以后面一起 push）
# git commit -am "Update to v1.0.1"
# git push

# 4. 然后 push tag 到 GitHub
cd /Users/zekun/Documents/wxcode/lib/git-squash
git push origin v1.0.1

# 5. 如果步骤3还没做，现在提交并 push formula 更新 
cd ~/homebrew-git-squash
git commit -am "Update to v1.0.1"
git push
```

## 验证安装

```bash
brew tap zhanzekun/git-squash
brew install git-squash
# 或者 brew install zekunzhan/git-squash/git-squash
git squash --help  # 测试是否安装成功
```

