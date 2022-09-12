#!/usr/bin/env zsh

echo "\n<<< Starting ZSH setup >>>\n"

echo "Enter superuser (sudo) password to edit /etc/shells"
echo '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells'

# -s newshell
chsh -s /opt/homebrew/bin/zsh

echo "A restart may be required for default shell changes to take effecte"