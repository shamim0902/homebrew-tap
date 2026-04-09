class Locus < Formula
  desc "AI memory engine. Store everything, find anything."
  homepage "https://github.com/shamim0902/locus"
  url "https://github.com/shamim0902/locus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ca3d6db646b10948472cd28ef5c795c7649db86ac31d00abeb4e346e382fe798"
  version "0.1.0"
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
