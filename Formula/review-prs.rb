class ReviewPrs < Formula
  desc "Pick open GitHub PRs and fan out parallel reviews into new terminal tabs"
  homepage "https://github.com/venabots/review-prs"
  url "https://github.com/venabots/review-prs/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "14c7bf3580743d8aa08872b86247c400060bcb8694724c39a6be560945401adc"
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
