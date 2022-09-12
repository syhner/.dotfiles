#!/usr/bin/env zsh

echo "\n<<< Starting Node setup >>>\n"

# n should already be installed through the Brewfile

if exists node; then
  echo "Node $(node --version) and NPM $(npm --version) are already installed"
else
  echo "Installing Node and NPM with n..."
  n lts
fi