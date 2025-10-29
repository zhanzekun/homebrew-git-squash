<img align="right" height="250" src="https://i.imgur.com/4iAqPLR.jpg">

# git squash [![Maintenance](https://img.shields.io/maintenance/yes/2021.svg?maxAge=2592000)]()

Locally squash commits on a branch, without needing to resolve any conflicts 🧈

It works just like GitHub's "Squash and merge" or GitLab's "Squash commits".

## Installation

With [Homebrew](https://brew.sh/) on MacOS and Linux:

```
brew install zhanzekun/homebrew-git-squash/git-squash
```

Or with `curl` on MacOS and Linux, including Windows Subsystem for Linux:

```
curl https://raw.githubusercontent.com/zhanzekun/git-squash/master/git-squash > /usr/local/bin/git-squash && chmod a+x /usr/local/bin/git-squash
```

## Usage

### Squash on current branch (default behavior)

```sh
# This tool requires that target branch is mergable to current one
# The easiest way to ensure it is to merge it and resolve any conflicts
git merge master
# Squash all changes on current branch that happened since master branch
git squash master
```

### Create a new branch with squashed result

Use `-n` or `--new-branch` to create a new branch with the squashed commits instead of modifying the current branch:

```sh
# Create a new branch with auto-generated name (current-branch-name-squashed)
git squash master -n

# Create a new branch with custom name
git squash master -n my-squashed-feature

# You can also use the long form
git squash master --new-branch my-squashed-feature
```

## License

MIT
