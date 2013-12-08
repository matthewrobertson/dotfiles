# My dotfiles

## Installation

```bash
git clone git@github.com:matthewrobertson/dotfiles.git
cd dotfiles
source bootstrap.sh
git submodule init
git submodule update
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

