class Locus < Formula
  desc "AI memory engine. Store everything, find anything."
  homepage "https://github.com/shamim0902/locus"
  url "https://github.com/shamim0902/locus/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c5ac558a2294750a8c8db49a4b4310655e0122fa17dc0524474215ddcfea85ac"
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
