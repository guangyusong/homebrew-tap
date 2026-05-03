class Ropen < Formula
  desc "Open remote terminal paths locally on macOS"
  homepage "https://github.com/guangyusong/ropen"
  url "https://github.com/guangyusong/ropen/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2f4447499e328dc284515fe5a0b9abf5631a7138f72a377c20dbe06f49d83b59"
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
