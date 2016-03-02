# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom

# Facebook Goodness
if id -u engshare >/dev/null 2>&1; then
  export ADMIN_SCRIPTS=~engshare/admin/scripts
  source "$ADMIN_SCRIPTS"/master.zshrc

  # symlink vim tools
  ln -Fs /home/engshare/hack-tools/vim/ ~/.vim/bundle/hack-vim

  # needed to get hive working on ipv6 server
  export HADOOP_OPTS='-Djava.net.preferIPv6Addresses=true'
fi

# Source devserver global definitions
if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi

# Source Facebook definitions
if [ -f /mnt/vol/engshare/admin/scripts/master.zshrc ]; then
  . /mnt/vol/engshare/admin/scripts/master.zshrc
fi

if [[ -a "$HOME"/.fbvoip.zshrc ]]; then
  source "$HOME"/.fbvoip.zshrc
fi

# Source devserver aliases
if [[ -a "$HOME"/.devservers.zshrc ]]; then
  source "$HOME"/.devservers.zshrc
fi
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tmux="tmux -2"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:/Users/mrobertson/opsrc/depot_tools
# export MANPATH="/usr/local/man:$MANPATH"

# make sure we use emacs key bindings
set -o emacs

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# never beep
setopt no_beep

# make sure ctrl-r works to search history
bindkey -v
bindkey '^R' history-incremental-search-backward
