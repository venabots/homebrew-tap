class Autoreview < Formula
  desc "Automated code review: watch a repo's PRs and review each with a panel of models"
  homepage "https://github.com/venabots/autoreview"
  # Rewritten by the repo's bump-tap workflow on every tag push.
  url "https://github.com/venabots/autoreview/archive/refs/tags/v0.17.3.tar.gz"
  sha256 "1963d46e87fab5ebde8a033cdaf27475d33a0555f35866d7b372595f74ae7ac8"
  license "MIT"
  head "https://github.com/venabots/autoreview.git", branch: "main"

  depends_on "rust" => :build
  depends_on "gh"
  # gum drives the interactive picker only; a sweep never reaches it.
  depends_on "gum"
  # The built-in reviewer runs through dash-p.
  depends_on "venabots/tap/dash-p"

  def install
    # One crate, three binaries: autoreview, panel and review-prs.
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "review open PRs headlessly", shell_output("#{bin}/autoreview --help")
    assert_match "several models at once", shell_output("#{bin}/panel --help")
    assert_match "fan out a review per PR", shell_output("#{bin}/review-prs --help")
  end
end
