# YARN-BUMP

This is a fork of [npm-bump](https://github.com/vincenthardouin/npm-bump). I find it very useful so as a yarn user on some project i wanted to have the same.

yarn-bump is a Bash Script to bump package version with [yarn version 1](https://github.com/yarnpkg/yarn).

My goal is to do the same for [yarn version 2](https://github.com/yarnpkg/berry) as yarn change a lot of thing in this version 2 it will be done via a yarn plugin wich is a new feature of version 2.

It exists because task of update packages are frequent and boring.
This script bump versions of packages that have no tests issues.

## Installation

### With make

```bash
make install
```

### Classic method

1. Clone repository

```bash
git clone https://github.com/Thomasevano/yarn-bump.git
```

2. Go in directory

```bash
cd yarn-bump
```

3. Add permission

```bash
chmod 777 yarn-bump
```

4. Create symlink

```bash
ln -sf ${PWD}/yarn-bump /usr/local/bin
```

## Usage

On directory where you have `package.json` and `yarn.lock`
Run :

```bash
yarn-bump
```

:warning: If you use Jest put `--watchAll=false` a the end of test script line in `package.json`, so it doesn't enter in interactive mode

And wait :hourglass: with :coffee:

### Optional arguments

```bash
  -h, --help                show this help message and exit
  -m, --markdown            display updated packages in markdown table
  -e, --exclude             exclude package name seprated by a comma (e.g -e lodash,mocha)
  -nt, --no-test            does not run test command when update package
``` 
```

## Features

- Script available globally
- Verify outdated package
- Use `yarn add` instead of `yarn upgrade`
- Try to install latest version of each package
- Run `yarn test` after each `yarn add` to verify exit code
- Create bump commit for each package
- Show updated packages and packages not updated at the end
