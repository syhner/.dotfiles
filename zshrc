echo 'Hello from .zshrc'

# Set variables
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk # https://reactnative.dev/docs/environment-setup
export DOTFILES="$HOME/.dotfiles"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax highlighting for man pages using bat
export NULLCMD=bat # Use bat instead of cat
export NVM_DIR="$HOME/.nvm" # https://github.com/nvm-sh/nvm#installing-and-updating
export PYENV_ROOT="$HOME/.pyenv" # https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
export ZSH="$HOME/.zshrc" # Shortcut to this file

# Change ZSH options

# Create aliases
alias brewdump='brew bundle dump --force --describe'
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

# Plugins

# Customise view
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  python        # Python section
  elm           # Elm section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  java          # Java section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  async         # Async jobs indicator
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

source /opt/homebrew/opt/spaceship/spaceship.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh