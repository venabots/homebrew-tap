# Homebrew Tap

Custom Homebrew formulas by [venabots](https://github.com/venabots).

## Installation

```sh
brew tap venabots/tap
```

## Formulas

| Formula                                              | Description                                                              |
| ---------------------------------------------------- | ------------------------------------------------------------------------ |
| [dash-p](https://github.com/venabots/dash-p)         | A single CLI for any coding agent                                        |
| [review-prs](https://github.com/venabots/review-prs) | Pick open GitHub PRs and fan out parallel reviews into new terminal tabs |

### Install a formula

```sh
brew install venabots/tap/dash-p
```

## Automated bumps

Each source repo bumps its own formula here. On a `v*` tag push, a `bump-tap`
workflow in the source repo checks out this tap, rewrites the `url` and
`sha256` lines of `Formula/<name>.rb`, and pushes the commit.

The source repo needs a `HOMEBREW_TAP_TOKEN` secret: a PAT with write access to
`venabots/homebrew-tap`.
