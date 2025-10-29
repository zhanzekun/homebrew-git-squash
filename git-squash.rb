class GitSquash < Formula
  desc "Locally squash commits on a branch, without needing to resolve any conflicts"
  homepage "https://github.com/zhanzekun/homebrew-git-squash"
  url "https://github.com/zhanzekun/homebrew-git-squash/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "7c90fe3f47cb2f8e8fc293276bb8d1c885d543a33ab8bf4d0bfdd46fc1693a90"
  license "MIT"

  def install
    bin.install "git-squash"
  end

  test do
    system "#{bin}/git-squash"
  end
end

