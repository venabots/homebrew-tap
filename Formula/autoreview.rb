class Autoreview < Formula
  desc "Review your team's PRs and handle your own, from one terminal view"
  homepage "https://github.com/venabots/autoreview"
  # Rewritten by the repo's bump-tap workflow on every tag push.
  url "https://github.com/venabots/autoreview/archive/refs/tags/v0.28.0.tar.gz"
  sha256 "9aead6b3ae9671bb770b0265386b80bf261c45037572f89e4731e65e8ee2a260"
  license "MIT"
  head "https://github.com/venabots/autoreview.git", branch: "main"

  depends_on "go" => :build
  depends_on "gh"
  # The built-in reviewer runs through dash-p.
  depends_on "venabots/tap/dash-p"

  def install
    # One binary. The reviewer skills are embedded in it.
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/autoreview"
  end

  test do
    assert_match "autoreview #{version}", shell_output("#{bin}/autoreview --version")
    assert_match "review your team's PRs and handle your own", shell_output("#{bin}/autoreview --help")
  end
end
