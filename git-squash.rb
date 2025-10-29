class GitSquash < Formula
  desc "Locally squash commits on a branch, without needing to resolve any conflicts"
  homepage "https://github.com/zhanzekun/homebrew-git-squash"
  url "https://github.com/zhanzekun/homebrew-git-squash/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d5b685ba84e418110e81190faa6b3e60f9faf95a14d9b7747ed060dc4df8fd85" # Run: curl -L https://github.com/zhanzekun/git-squash/archive/refs/tags/v1.0.0.tar.gz | sha256sum
  license "MIT"

  def install
    bin.install "git-squash"
  end

  test do
    system "#{bin}/git-squash"
  end
end

