#!/usr/bin/env zsh

echo "\n<<< Starting Node setup >>>\n"

# nvm should already be installed through the Brewfile

if exists node; then
  echo "Node $(node --version) and NPM $(npm --version) are already installed"
elif exists nvm; then
  echo "Installing Node and NPM with nvm..."
  nvm install --lts
  nvm use --lts

  # Install global NPM packages
  npm install --global eslint
  npm install --global http-server
  npm install --global json-server
  npm install --global prettier
  npm install --global trash-cli
  npm install --global ts-node
  npm install --global typescript
  npm install --global yarn
else
  echo "nvm needs to be installed — use the Brewfile"
fi

echo "Global NPM packages:"
npm list --global --depth=0
