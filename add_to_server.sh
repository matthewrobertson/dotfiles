#!/usr/bin/env bash

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
  --exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude ".gitmodules" \
  --exclude "add_to_server.sh" -av --no-perms . $1:~
