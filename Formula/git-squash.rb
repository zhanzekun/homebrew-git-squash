class GitSquash < Formula
  desc "Locally squash commits on a branch, without needing to resolve any conflicts"
  homepage "https://github.com/zhanzekun/git-squash"
  url "https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "TBD" # Run: curl -L https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz | sha256sum
  license "MIT"

  def install
    bin.install "git-squash"
  end

  test do
    system "#{bin}/git-squash"
  end
end

