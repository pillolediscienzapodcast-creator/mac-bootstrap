#!/bin/bash

brew update
brew upgrade
brew cleanup

npm update -g || true

echo ""
echo "Everything updated."