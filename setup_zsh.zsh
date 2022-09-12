#!/usr/bin/env zsh

echo "\n<<< Starting ZSH setup >>>\n"

# ZSH should already be installed through the Brewfile

if grep -Fqx '/opt/homebrew/bin/zsh' '/etc/shells'; then
  echo '/opt/homebrew/bin/zsh already exists in /etc/shells'
else
  echo "Enter superuser (sudo) password to edit /etc/shells"
  echo '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

if [ $"SHELL" = '/opt/homebrew/bin/zsh' ]; then
  echo '$SHELL is already /opt/homebrew/bin/zsh'
else
  echo "Enter user password to change login shell"
  chsh -s /opt/homebrew/bin/zsh # -s newshell
fi

if sh --version | grep -q zsh; then
  echo '/private/var/select/sh is already linked to /bin/zsh'
else
  echo "Enter superuser (sudo) password to symlink sh to preinstalled zsh"
  sudo ln -fsv /bin/zsh /private/var/select/sh
fi

echo "A restart may be required for default shell changes to take effect"