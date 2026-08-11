class ReviewPrs < Formula
  desc "Pick open GitHub PRs and fan out parallel reviews into new terminal tabs"
  homepage "https://github.com/venabots/review-prs"
  url "https://github.com/venabots/review-prs/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "28285135589f788cd612e50adcaf422cfb4ee4fc09fabc4ac0c810c3720ece80"
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
