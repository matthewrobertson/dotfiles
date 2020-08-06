# My dotfiles

## Installation

Set up vim plug: https://github.com/junegunn/vim-plug

```bash
git clone git@github.com:matthewrobertson/dotfiles.git
cd dotfiles
source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

## Install powerlevel10k

Clone it into zsh custom dir:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

**NOTE: make sure you have already loaded your zshrc because it sets `ZSH_CUSTOM`**

Configure it:

```bash
p10k configure
```

Up to date instructions are here: https://github.com/romkatv/powerlevel10k

## Install nvm

```bash
brew install nvm
mkdir ~/.nvm
```

## Windows stuff:

The source script doesn't work on windows. Instead just copy the dotfiles you
want into ~.

Visual Studio code settings are in: `%APPDATA%\Code\User\settings.json`

