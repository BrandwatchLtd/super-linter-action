# Brandwatch Superlinter Action

This repo houses a github action that can be used from to validate PR changes against linting rules contained here.

This allows us to maintain a centralised set of rules for the organisation instead of having them distributed across multiple repositories, avoiding rules becoming out of sync.

This is an extension of the [github super-linter action](https://github.com/github/super-linter) and is intended for use on Brandwatch repositories.

Github Super-linter contains default rules for a wide variety of [linters](https://github.com/github/super-linter#supported-linters). These rules for a particular linter can be overriden by adding an appropriately named file to the [rules](rules/) directory of this repository. 

Default rules can be found here: [https://github.com/github/super-linter/tree/master/TEMPLATES](https://github.com/github/super-linter/tree/master/TEMPLATES)

## Why is this repository public?
Github actions do not currently support actions contained within private repositories. As this repository contains no sensitive data, only linting rules it is made public. If Github enable the ability to use private repositories in actions then this will likely be made private. 

## How do I add this to my repository
All you need to do is add a `linter.yml` file to the `.github/workflows/` directory of your repository with the following configuration.
```
---
name: Lint Code Base

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    name: Lint Code Base
    runs-on: ubuntu-latest

    steps:
      # checkout the repo to be linted
      - name: Checkout Code
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      # run the linter
      - name: Lint Code Base
        uses: BrandwatchLtd/super-linter-action@HEAD #@HEAD ensures you always use the latest rules
        env:
          VALIDATE_ALL_CODEBASE: false
          DEFAULT_BRANCH: master
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
See [Github Actions Documentation](https://docs.github.com/en/actions/reference) for more detail or help with different configuration.

## Rule X is stupid!
If you are a Brandwatch employee and feel rules are too strict or incorrect, please feel free to raise a PR to change them. There maybe some debate as to whether your change is in line with the department's coding standards. If you are not a brandwatch employee, your opinion on our internal coding standards is considered moot and your PR will be ignored/rejected.

## I want to test some rule changes against a PR.
Simply create a branch with your rule changes on this repo or on your fork of this repository and change the repository/branch that the `Lint Code Base` step uses in your PR. E.g.
```
- name: Lint Code Base
        uses: BrandwatchLtd/super-linter-action@my-branch
```
or
```
- name: Lint Code Base
        uses: my-github-user/super-linter-action@my-branch
```
Your PR checks should now use the modified rules from your branch.