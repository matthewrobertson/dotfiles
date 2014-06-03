#!/bin/sh

cd "$HOME/fbobjc"

echo 'fetching origin/master'
git fetch origin master

echo 'begining rebase'
git rebase origin/master


conflict_files=`git diff --name-only | sort | uniq`
while [ "$conflict_files" == 'Apps/FBMessenger/FBMessenger.xcodeproj/project.pbxproj' ]
do
  echo "conflict in .pbxproj, running buck-project"
  Tools/buck-project.py Apps/FBMessenger
  git add Apps/FBMessenger/FBMessenger.xcodeproj/project.pbxproj
  git rebase --continue
  conflict_files=`git diff --name-only | sort | uniq`
done

echo `git status`
