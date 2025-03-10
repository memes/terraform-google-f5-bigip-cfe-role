# How to contribute

I welcome contributions to this repo, but I do have a few guidelines for
contributors.

## Open an issue and pull request for changes

All submissions, including those from project members, are required to go through
review. I use GitHub Pull Requests for this workflow, which should be linked with
an issue for tracking purposes.
See [GitHub](https://help.github.com/articles/about-pull-requests/) for more details.

## Pre-Commit

[Pre-commit](https://pre-commit.com/) is used to ensure that all files have
consistent formatting and to avoid committing secrets. Please install and
integrate the tool before pushing changes to GitHub.

<!-- spell-checker: ignore venv -->
1. Install `pre-commit` in venv or globally: see [instructions](https://pre-commit.com/#installation)
2. Fork and clone this repo
3. Install `pre-commit` hook to git

   ```shell
   pip install -r requirements-dev.txt
   pre-commit install --hook-type commit-msg --hook-type pre-commit
   ```

   The hook will ensure that `pre-commit` will be run against all staged changes
   during `git commit`.
