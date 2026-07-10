#!/bin/bash

echo "========================================="
echo "🚀 Mac Bootstrap - Environment Check"
echo "========================================="
echo

check_version () {
    NAME=$1
    CMD=$2

    if command -v "$CMD" >/dev/null 2>&1; then
        VERSION=$($CMD --version 2>/dev/null | head -n 1)
        echo "✅ $NAME"
        echo "   $VERSION"
        echo
    else
        echo "❌ $NAME"
        echo
    fi
}

check_version "Git" git
check_version "Homebrew" brew
check_version "Docker" docker
check_version "Python" python3
check_version "Node" node
check_version "npm" npm
check_version "pnpm" pnpm
check_version "GitHub CLI" gh
check_version "uv" uv
check_version "PostgreSQL" psql
check_version "Redis" redis-server

if command -v code >/dev/null 2>&1; then
    echo "✅ Visual Studio Code"
else
    echo "❌ Visual Studio Code"
fi