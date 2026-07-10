#!/bin/bash

set -e

echo "==============================="
echo "Mac Bootstrap"
echo "==============================="

echo ""
echo "Updating Homebrew..."
brew update

echo ""
echo "Installing packages..."
brew bundle

echo ""
echo "Starting PostgreSQL..."
brew services start postgresql@16

echo ""
echo "Starting Redis..."
brew services start redis

echo ""
echo "Installation completed."

POSTGRES_PATH='export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"'

if ! grep -Fq "$POSTGRES_PATH" ~/.zshrc; then
    echo "" >> ~/.zshrc
    echo "$POSTGRES_PATH" >> ~/.zshrc
fi

source ~/.zshrc