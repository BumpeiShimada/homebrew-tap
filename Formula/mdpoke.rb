class Mdpoke < Formula
  desc "Terminal Markdown viewer for poking around long Markdown documents"
  homepage "https://github.com/BumpeiShimada/mdpoke"
  url "https://github.com/BumpeiShimada/mdpoke/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ここにsha256"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"mdpoke", "./cmd/mdpoke"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nWorld\n")
    assert_match "Usage:", shell_output("#{bin}/mdpoke")
  end
end

