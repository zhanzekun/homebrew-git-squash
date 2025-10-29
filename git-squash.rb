class GitSquash < Formula
  desc "Locally squash commits on a branch, without needing to resolve any conflicts"
  homepage "https://github.com/zhanzekun/homebrew-git-squash"
  url "https://github.com/zhanzekun/homebrew-git-squash/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "53af50c9c8e3c6e1517be1ff41d82a022d51ca95d851001b4eee82c43731bd47" # Run: curl -L https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz | sha256sum
  license "MIT"

  def install
    bin.install "git-squash"
  end

  test do
    system "#{bin}/git-squash"
  end
end

