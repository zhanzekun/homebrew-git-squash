class GitSquash < Formula
  desc "Locally squash commits on a branch, without needing to resolve any conflicts"
  homepage "https://github.com/zhanzekun/homebrew-git-squash"
  url "https://github.com/zhanzekun/homebrew-git-squash/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "c89e1769227ed953970055489f8557608521abff150fdd32a999e7acd5048671"
  license "MIT"

  def install
    bin.install "git-squash"
  end

  test do
    system "#{bin}/git-squash"
  end
end

