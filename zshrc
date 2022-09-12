echo 'Hello from .zshrc'

# Set variables
# Syntax highlighting for man pages using bat
export HOMEBREW_CASK_OPTS="--no-quarantine"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export N_PREFIX="$HOME/.n"
export NULLCMD=bat
export PREFIX="$N_PREFIX"

# Change ZSH options

# Create aliases
alias brewdump='brew bundle dump --force --describe'
# -a all files except ./ and ../ || -F show file type || -h readable file sizes || -l list format
alias exa='exa -aFhl --git'
alias ls='exa'
alias mkdir='mkdir -p'
alias trail='<<<${(F)path}'

# Customise prompts
# %n username || %m host || %1~ current directory || %# default prompt symbol || %L shell level
PROMPT='
%1~ %L %# '
# %* timestamp
RPROMPT='%*'

# Add locations to $PATH
export PATH="$PATH:$N_PREFIX/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Functions
function resource() {
  source ~/.zshrc;
}
function mkcd() {
  mkdir -p "$@" && cd "$_"; # -p make parent directories || "$&" fn args || "$_" last arg
}

# Plugins

# Other
