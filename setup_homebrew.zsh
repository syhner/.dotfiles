#!/usr/bin/env zsh

echo "\n<<< Starting homebrew setup >>>\n"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install httpie
brew install bat

brew install google-chrome --cask
brew install visual-studio-code --cask