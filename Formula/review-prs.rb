class ReviewPrs < Formula
  desc "Pick open GitHub PRs and fan out parallel reviews into tabs or headless workers"
  homepage "https://github.com/venabots/review-prs"
  url "https://github.com/venabots/review-prs/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "d9cb537835f4efb5a38f93912ba69d4b1e2280edf1da44f722221254d168400c"
  head "https://github.com/venabots/review-prs.git", branch: "main"
  license "MIT"

  depends_on "rust" => :build
  depends_on "gh"
  depends_on "gum"
  # jq is review-prs-only; the rust autoreview parses JSON natively.
  depends_on "jq"
  # autoreview's built-in reviewer runs through dash-p.
  depends_on "venabots/tap/dash-p"

  def install
    # autoreview is the rust crate at the repo root.
    system "cargo", "install", *std_cargo_args

    # review-prs is bash and resolves the shared lib/ next to its real file
    # after following symlinks, so both go to libexec and bin gets a symlink.
    libexec.install "review-prs", "lib"
    bin.install_symlink libexec/"review-prs"
  end

  test do
    assert_predicate bin/"review-prs", :executable?
    assert_predicate bin/"autoreview", :executable?
    assert_match "review open PRs headlessly", shell_output("#{bin}/autoreview --help")
  end
end
