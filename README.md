# create-nodejs-project

## What does this tool do?

It bootstraps a new Node.js project with:

- Code formatting config
- Code syntax and style config
- Continuous integration config
- Open source hygiene - license, Contributor Convenant
- npm configuration
- Git config

## Requirements

- Bash
- Git
- Node.js
  - npm - typically bundled with Node.js
  - npx - bundled with `npm`
- jq

## Configure npm init defaults

```sh
npm set init-author-name "$YOUR_NAME"
npm set init-author-email "$YOUR_EMAIL_ADDRESS"
npm set init-author-url "$YOUR_WEBSITE"
npm set init-license "MIT"
npm set init-version "1.0.0"
```

# Set a global git config (~/.gitconfig)

```dosbat
[init]
  defaultBranch = main
[user]
  email = $YOUR_EMAIL_ADDRESS
  name = $YOUR_NAME
[core]
  editor = vim
```

## Usage

```sh
npx github:simonplend/create-nodejs-project
```

## Tools

- [Mrm]((https://mrm.js.org/)
- [Prettier](https://prettier.io/)
- [ESLint](https://eslint.org/)
- [lint-staged](TODO:)

## Inspiration

- https://philna.sh/blog/2019/01/10/how-to-start-a-node-js-project/
- https://www.netlify.com/blog/2021/03/03/shipping-node.js-at-netlify/

## Implementation approaches

Reasons for using a shell script + `mrm` + this in a package:

- Scripting file system stuff in Node.js, Python etc. requires quite a bit of cruft
- Create an npm initializer package seems painful - https://docs.npmjs.com/cli/v6/commands/npm-init
- Having this in a package with the `mrm` dependencies installed means I can pin
things to a specific version

## TODOs

- [ ] Bootstrap: Customise Prettier config
- [ ] Bootstrap: Customise ESLint config
- [ ] Configure Dependabot or Renovate for this project
- [ ] Bootstrap: Configuration for dependency updates (e.g. Dependabot)

## Feature ideas

- Pull request template
- Issue template
- Type checking with `ts` and  - `npx mrm typescript`
- Integrate with the GitHub CLI?
