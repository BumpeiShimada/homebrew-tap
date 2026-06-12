class Mdpoke < Formula
  desc "Terminal Markdown viewer for poking around long Markdown documents"
  homepage "https://github.com/BumpeiShimada/mdpoke"
  url "https://github.com/BumpeiShimada/mdpoke/archive/refs/tags/v1.1.8.tar.gz"
  sha256 "c0c6a8df7100b1335de40850269a4ecda38bfcdf72a377f0b5cf6e32d24d0b01"

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
