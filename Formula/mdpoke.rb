class Mdpoke < Formula
  desc "Terminal Markdown viewer for poking around long Markdown documents"
  homepage "https://github.com/BumpeiShimada/mdpoke"
  url "https://github.com/BumpeiShimada/mdpoke/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "5376646314d93657780b53b5adae1c6ca070ead910e51638ffa35bad4c9a7e42"

  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"mdpoke", "./cmd/mdpoke"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nWorld\n")
    assert_match "Usage:", shell_output(bin/"mdpoke")
  end
end
