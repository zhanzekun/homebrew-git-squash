class GitSquash < Formula
  desc "Locally squash commits on a branch, without needing to resolve any conflicts"
  homepage "https://github.com/zhanzekun/homebrew-git-squash"
  url "https://github.com/zhanzekun/homebrew-git-squash/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "1fd34648b18cd723c61a8fdc20da9ab8470aa571726c6a232f5523dfaeb7e390"
  license "MIT"

  def install
    bin.install "git-squash"
  end

  test do
    system "#{bin}/git-squash"
  end
end

