class Ropen < Formula
  desc "Open remote terminal paths locally on macOS"
  homepage "https://github.com/guangyusong/ropen"
  url "https://github.com/guangyusong/ropen/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ee288ad325fc131d0a1413f2e28a5343a9cb3ed5023f7c65d354cf5d794d3786"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=homebrew
      -X main.date=unknown
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "ropen #{version}", shell_output("#{bin}/ropen --version")
    assert_match "Usage:", shell_output("#{bin}/ropen --help")
  end
end
