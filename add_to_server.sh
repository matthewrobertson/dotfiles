#!/usr/bin/env bash

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
  --exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude ".gitmodules" \
  --exclude "add_to_server.sh" -av --no-perms . $1:~

if [[ -f ~/.bash_profile ]]; then
  source ~/.bash_profile
fi

echo "You should do $ source ~/.zshrc"
