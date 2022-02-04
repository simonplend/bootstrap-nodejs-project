# bootstrap-nodejs-project

This is a command line tool for bootstrapping and configuring a new Node.js
project. It uses a Bash shell script and the configuration codemods tool
[Mrm](https://mrm.js.org/). I've chosen this setup because:

- Scripting the file creation aspects of new project configuration in Node.js, Python etc. feels clunky.
- Create an [npm initializer](https://docs.npmjs.com/cli/v6/commands/npm-init)
package seems painful too
- Having everything in a package allows dependencies to be pinned to specific
versions for stability.

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

- [Mrm](https://mrm.js.org/) - "Codemods for your project config files"
- [Prettier](https://prettier.io/) - TODO:
- [ESLint](https://eslint.org/) - TODO:
- [lint-staged](TODO:) - TODO:

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

## Inspiration

- https://philna.sh/blog/2019/01/10/how-to-start-a-node-js-project/
- https://www.netlify.com/blog/2021/03/03/shipping-node.js-at-netlify/
