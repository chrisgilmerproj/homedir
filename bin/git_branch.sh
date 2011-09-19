#! /bin/bash

# Script to ensure making a branch in a repo is done from master
# Ends by creating new branch and checking it out

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` {branch_name}"
  exit 1
fi

cd $(git rev-parse --show-toplevel)
git co master
git branch $1
git co $1
