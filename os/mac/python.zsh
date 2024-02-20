#!/usr/bin/env zsh

echo "\n<<< Starting Python setup >>>\n"

# pyenv should already be installed through the Brewfile

if exists pyenv; then
  echo "Initialising pyenv..."
  eval "$(pyenv init -)"
else
  echo "pyenv needs to be installed — use the Brewfile"
fi
