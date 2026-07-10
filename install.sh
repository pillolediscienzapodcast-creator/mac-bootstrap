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

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew non è installato."
    exit 1
fi

brew bundle

echo ""
echo "Verifica installazione Python..."

if ! command -v python3 >/dev/null 2>&1; then
    echo "ERRORE: Python non installato."
    exit 1
fi

echo "Python OK"

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