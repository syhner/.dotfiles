echo 'Hello from .zshrc'

# Set variables
# Syntax highlighting for man pages using bat
export HOMEBREW_CASK_OPTS="--no-quarantine"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Change ZSH options

# Create aliases

# -A all files except ./ and ../ || -F show file type || -h readable file sizes || -l list format
alias exa='exa -aFhl --git'
alias ls='exa'
alias mkdir='mkdir -p'

# Customise prompts
# %n username || %m host || %1~ current directory || %# default prompt symbol || %L shell level
PROMPT='
%1~ %L %# '

# %* timestamp
RPROMPT='%*'

# Add locations to $PATH
# Add Visual Studio Code (code)
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
