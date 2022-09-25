echo 'Hello from .zshrc'

# Set variables
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk" # https://reactnative.dev/docs/environment-setup
export DOTFILES="$HOME/.dotfiles" # Shortcut to this directory
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home # https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/macos-install.html
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax highlighting for man pages using bat
export NULLCMD=bat # Use bat instead of cat
export NVM_DIR="$HOME/.nvm" # https://github.com/nvm-sh/nvm#installing-and-updating
export PYENV_ROOT="$HOME/.pyenv" # https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
export ZSHRC="$HOME/.zshrc" # Shortcut to this file

# Change ZSH options

# Create aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias brewdump='brew bundle dump --force --describe --file=dump.Brewfile'
alias cmd='command'
alias exa='exa -aFhl --git' # -a all files except ./ and ../ || -F show file type || -h readable file sizes || -l list format
alias ftrail='<<<${(F)fpath}'
alias ls='exa'
alias mkdir='mkdir -p'
alias myip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'
alias sudo='sudo ' # Allow aliases to be sudoed
alias trail='<<<${(F)path}'

# Add locations to $path and $fpath arrays
typeset -U path
path=(
  $JAVA_HOME/bin
  $PYENV_ROOT/bin # https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
  $path
  $ANDROID_SDK_ROOT/emulator # https://reactnative.dev/docs/environment-setup
  $ANDROID_SDK_ROOT/platform-tools # https://reactnative.dev/docs/environment-setup
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # https://code.visualstudio.com/docs/setup/mac
)
typeset -U fpath
fpath=(
  "$HOMEBREW_PREFIX/share/zsh/site-functions"
  $fpath
)

# Functions
function gitclonecd() {
  git clone "$1" && cd "$(basename "$_" .git)"
}
function greps() {
  eval grep \""$(join "\|" "$@")"\"
}
function join() {
  out="$2"
  for i in "${@:3}"; do
    out+="$1$i"
  done
  echo $out
}
function resource() {
  source ~/.zshrc;
}
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Source
. /opt/homebrew/etc/profile.d/z.sh # https://github.com/rupa/z
source /opt/homebrew/opt/spaceship/spaceship.zsh
source "$DOTFILES/spaceship.zsh" # Customise prompt
source /opt/homebrew/opt/nvm/nvm.sh # This loads nvm
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# -----------------
# Other ZSH options
# -----------------

autoload -U compinit && compinit # List flags with TAB

# Navigate up and down through history starting from input field
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Bind up arrow key
bindkey "^[[B" down-line-or-beginning-search # Bind down arrow key