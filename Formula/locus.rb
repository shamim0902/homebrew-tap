class Locus < Formula
  desc "AI memory engine. Store everything, find anything."
  homepage "https://github.com/shamim0902/locus"
  url "https://github.com/shamim0902/locus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "965ca22db260e143c20ed41c06da8f31358b60d74aadeb83f502e7c31037e5e9"
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
