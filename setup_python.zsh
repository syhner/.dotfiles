#!/usr/bin/env zsh

echo "\n<<< Starting Python setup >>>\n"

# pyenv should already be installed through the Brewfile

if exists python; then
  echo "Python $(python --version) is already installed"
elif exists pyenv; then
  echo "Installing Python with pyenv..."
  eval "$(pyenv init -)"
  pyenv install 3.10.6
  pyenv global 3.10.6
else
  echo "pyenv needs to be installed — use the Brewfile"
fi