class Autoreview < Formula
  desc "Automated code review: watch a repo's PRs and review each with a panel of models"
  homepage "https://github.com/venabots/autoreview"
  # url and sha256 are rewritten by the repo's bump-tap workflow on every tag
  # push. They point at the first tag under the new name; until that tag
  # exists this formula cannot install, which is the same state the previous
  # one was already in -- it installed a bash script and a lib/ directory the
  # rust port deleted.
  url "https://github.com/venabots/autoreview/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "6be1b4873230987bc348dd29084526ac4c93eb97d005ba533143ff17548d232d"
  head "https://github.com/venabots/autoreview.git", branch: "main"
  license "MIT"

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
