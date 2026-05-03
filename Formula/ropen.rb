class Ropen < Formula
  desc "Open remote terminal paths locally on macOS"
  homepage "https://github.com/guangyusong/ropen"
  url "https://github.com/guangyusong/ropen/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f9bcb0a9d23f79f88ae0e18fb808752379e4aa604ab29bd4a090dd716e9411b4"
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
