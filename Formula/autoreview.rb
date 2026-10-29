class Autoreview < Formula
  desc "Review your team's PRs and handle your own, from one terminal view"
  homepage "https://github.com/venabots/autoreview"
  # Rewritten by the repo's bump-tap workflow on every tag push.
  url "https://github.com/venabots/autoreview/archive/refs/tags/v0.32.0.tar.gz"
  sha256 "8a5429da336a1146fc8759d573f13e3809af9ef69dcca6a3662086278a676194"
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
