#!/bin/bash

set -e

echo "=================================="
echo "Git Initial Configuration"
echo "=================================="
echo

# Richiesta dati
read -p "Git user name: " GIT_NAME
read -p "Git email: " GIT_EMAIL

echo
echo "Configuring Git..."

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global fetch.prune true

# Imposta VS Code come editor solo se installato
if command -v code >/dev/null 2>&1; then
    git config --global core.editor "code --wait"
fi

# Migliora la visualizzazione dei branch
git config --global color.ui auto

echo
echo "=================================="
echo "Configuration completed"
echo "=================================="
echo
echo "Current configuration:"
echo

git config --global --list

echo
echo "Done!"