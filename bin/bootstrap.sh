#! /usr/bin/env bash

set -x

# TODO: Check for `git`
# TODO: Check for `node`
# TODO: Check for `npx`
# TODO: Check for `jq`

# Initialise git repo
# Note: This needs to happen before Husky is installed by `mrm lint-staged`
# so we don't get a distracting "Failed to install" error.
git init

# TODO: Temporarily disable package-lock.json creation? No need to `rm` later on.

# Create a `package.json`
npm init -y
# TODO: Set `type` to `"module"` in `package.json` so this project uses ESM
# TODO: Set `engines.node` to current `node` version in `package.json`
# TODO: Remove / customise `main.js`

# Add .gitignore (default one from `mrm-task-gitignore` is too sparse)
npx gitignore node
# Add EditorConfig
npx mrm editorconfig

# Add and configure Prettier
npx mrm prettier
# Add and configure ESLint
npx mrm eslint
# Add and configure lint-staged
npx mrm lint-staged

# TODO: Configure ESLint and Prettier to work together with `eslint-config-prettier eslint-plugin-prettier`

# Generate a basic `README.md`
# TODO: Write my own mrm task for this
# npx mrm readme --config:readmeFile "README.md"
echo -e "# $(jq -r '.name' package.json)\n\n..." > README.md

# Add a LICENSE.md
npx mrm license --config:licenseFile "LICENSE.md"

# Add a Contributor Covenant
npx covgen "$(npm get init-author-email)"

# Add a GitHub Actions CI workflow
# TODO: Change workflow filename to ci.yml
# TODO: Figure out why branch name is empty in the config
npx mrm ci

# ----

# TODO: Run Prettier?

# Commit all changes so far, except package-lock.json
rm package-lock.json
git add -A
git commit -m "chore: Add base project files"

# Install dev dependencies and generate `package-lock.json`
npm install

# Commit `package-lock.json`
git add package-lock.json
git commit -m "chore: Add npm lockfile"

# TODO: Set git upstream

# TODO:
# git push -u origin main
