#!/usr/bin/env zsh

echo "\n<<< Starting Node setup >>>\n"

# n should already be installed through the Brewfile

if exists node; then
  echo "Node $(node --version) and NPM $(npm --version) are already installed"
else
  echo "Installing Node and NPM with n..."
  n lts
fi

# Install global NPM packages
npm install --global cross-env
npm install --global http-server
npm install --global json-server
npm install --global nodemon
npm install --global prettier
npm install --global ts-node
npm install --global ts-node-dev
npm install --global typescript
npm install --global yarn

echo "Global NPM packages:"
npm list --global --depth=0