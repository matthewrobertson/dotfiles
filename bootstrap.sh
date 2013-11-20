#!/usr/bin/env bash
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
  --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
source ~/.bash_profile
