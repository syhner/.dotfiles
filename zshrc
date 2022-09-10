echo 'Hello from .zshrc'

# Set variables

# Change ZSH options

# Create aliases

# -A all files except ./ and ../ || -F append / to directories || -h readable file sizes || -l list format
alias ls='ls -AF' # 

# Customise prompts
# %n username || %m host || %1~ current directory || %# default prompt symbol || %L shell level
PROMPT='
%1~ %L %# '

# %* timestamp
RPROMPT='%*'

# Add locations to $PATH

# Functions
function resource() {
  source .zshrc;
}

function mkcd() {
  mkdir -p "$@" && cd "$_"; # -p make parent directories || "$&" fn args || "$_" last arg
}

# Plugins

# Other