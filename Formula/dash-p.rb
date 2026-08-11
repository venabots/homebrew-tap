class DashP < Formula
  desc "A single CLI for any coding agent"
  homepage "https://github.com/venabots/dash-p"
  url "https://github.com/venabots/dash-p/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "60f5ead0b2394210d8e7c22820ddc316f167e346e6cb21586177a7a13b2874e3"
  head "https://github.com/venabots/dash-p.git", branch: "main"

  # The v0.3.0 source still builds the `anyagent` binary from the pre-move
  # crate. `brew install` works once the crate is renamed to `dash-p` and a new
  # tag lands; the bump-tap workflow then overwrites url + sha256.

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "dash-p #{version}", shell_output("#{bin}/dash-p --version")
  end
end
