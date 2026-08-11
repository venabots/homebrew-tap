class ReviewPrs < Formula
  desc "Pick open GitHub PRs and fan out parallel reviews into new terminal tabs"
  homepage "https://github.com/venabots/review-prs"
  url "https://github.com/venabots/review-prs/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "b7f08045a6b8b26962147cb769df938dfacf83cd42bb06ec1ff074aec557ccc8"
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
