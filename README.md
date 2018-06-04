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

## Windows stuff:

The source script doesn't work on windows. Instead just copy the dotfiles you
want into ~.

Visual Studio code settings are in: `%APPDATA%\Code\User\settings.json`

