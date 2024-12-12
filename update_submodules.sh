#!/bin/zsh

# Sync submodules
git submodule sync --recursive

# Initialize and update all submodules
git submodule update --init --recursive

# Pull latest changes in all submodules
git submodule foreach 'git pull origin $(git rev-parse --abbrev-ref HEAD)'

echo "Submodules updated successfully!"
