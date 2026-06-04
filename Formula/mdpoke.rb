class Mdpoke < Formula
  desc "Terminal Markdown viewer for poking around long Markdown documents"
  homepage "https://github.com/BumpeiShimada/mdpoke"
  url "https://github.com/BumpeiShimada/mdpoke/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9033a3e3598610258f3848ce1c9be8ad002a4c431be2648ee1c1fcd74c1e3d21"

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
