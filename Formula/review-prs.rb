class ReviewPrs < Formula
  desc "Pick open GitHub PRs and fan out parallel reviews into new terminal tabs"
  homepage "https://github.com/venabots/review-prs"
  url "https://github.com/venabots/review-prs/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "d9cb537835f4efb5a38f93912ba69d4b1e2280edf1da44f722221254d168400c"
  head "https://github.com/venabots/review-prs.git", branch: "main"
  license "MIT"

  depends_on "gh"
  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "review-prs"
  end

  test do
    assert_predicate bin/"review-prs", :executable?
  end
end
