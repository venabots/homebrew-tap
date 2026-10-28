class DashP < Formula
  desc "Single CLI for any coding agent"
  homepage "https://github.com/venabots/dash-p"
  url "https://github.com/venabots/dash-p/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "463c74bfc2bfe3ba0e3a231a1cce247243da5b7ce10256cec67a37e3cca25ac3"
  head "https://github.com/venabots/dash-p.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "dash-p #{version}", shell_output("#{bin}/dash-p --version")
  end
end
