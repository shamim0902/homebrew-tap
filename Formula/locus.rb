class Locus < Formula
  desc "AI memory engine. Store everything, find anything."
  homepage "https://github.com/shamim0902/locus"
  url "https://github.com/shamim0902/locus/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3d1b40d1695735b173a2fc1ecb433ce28cea8f64bf74e4e9e14fe16e198543b1"
  version "0.2.0"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-trimpath", "-ldflags", "-s -w",
           "-o", bin/"locus", "./cmd/locus/"
  end

  test do
    assert_match "locus v", shell_output("#{bin}/locus version")
  end
end
