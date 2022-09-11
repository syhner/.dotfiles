#!/usr/bin/env zsh

echo "\n<<< Starting homebrew setup >>>\n"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --verbose