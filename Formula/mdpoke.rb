class Mdpoke < Formula
  desc "Terminal Markdown viewer for poking around long Markdown documents"
  homepage "https://github.com/BumpeiShimada/mdpoke"
  url "https://github.com/BumpeiShimada/mdpoke/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "e72ba12b13c315d1258642aeb348625712d7b2c881d00e341e38a1adeb98c2a9"

  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"mdpoke", "./cmd/mdpoke"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nWorld\n")
    assert_match "Usage:", shell_output(bin/"mdpoke")
    assert_match "mdpoke #{version}", shell_output("#{bin}/mdpoke --version")
  end
end
