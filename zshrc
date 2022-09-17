echo 'Hello from .zshrc'

# Set variables
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk # https://reactnative.dev/docs/environment-setup
export DOTFILES="$HOME/.dotfiles"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax highlighting for man pages using bat
export NULLCMD=bat # Use bat as NULLCMD instead of cat
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Change ZSH options

# Create aliases
alias brewdump='brew bundle dump --force --describe'
alias exa='exa -aFhl --git' # -a all files except ./ and ../ || -F show file type || -h readable file sizes || -l list format
alias ftrail='<<<${(F)fpath}'
alias ls='exa'
alias mkdir='mkdir -p'
alias trail='<<<${(F)path}'

# Customise prompts
PROMPT='
%1~ %L %# ' # %n username || %m host || %1~ current directory || %# default prompt symbol || %L shell level
RPROMPT='%*' # %* timestamp

# Add locations to $path array
typeset -U path
path=(
  $path
  $ANDROID_SDK_ROOT/emulator # https://reactnative.dev/docs/environment-setup
  $ANDROID_SDK_ROOT/platform-tools # https://reactnative.dev/docs/environment-setup
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # https://code.visualstudio.com/docs/setup/mac
)

# Functions
function resource() {
  source ~/.zshrc;
}
function mkcd() {
  mkdir -p "$@" && cd "$_"; # -p make parent directories || "$&" fn args || "$_" last arg
}

# Plugins

# Other
