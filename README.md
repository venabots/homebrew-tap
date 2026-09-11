# Homebrew Tap

Custom Homebrew formulas by [venabots](https://github.com/venabots).

## Installation

```sh
brew tap venabots/tap
```

## Formulas

| Formula                                              | Description                                                                      |
| ---------------------------------------------------- | -------------------------------------------------------------------------------- |
| [autoreview](https://github.com/venabots/autoreview) | Automated code review: watch a repo's PRs and review each with a panel of models |
| [dash-p](https://github.com/venabots/dash-p)         | A single CLI for any coding agent                                                |

`autoreview` installs three binaries: `autoreview`, `panel`, and `review-prs`.

### Install a formula

```sh
brew install venabots/tap/autoreview
brew install venabots/tap/dash-p
```

## Automated bumps

Each source repo bumps its own formula here. On a `v*` tag push, a `bump-tap`
workflow in the source repo checks out this tap, rewrites the `url` and
`sha256` lines of `Formula/<name>.rb`, and pushes the commit.

The source repo needs a `HOMEBREW_TAP_TOKEN` secret: a PAT with write access to
`venabots/homebrew-tap`.
