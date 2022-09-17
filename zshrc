echo 'Hello from .zshrc'

# Set variables
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk # https://reactnative.dev/docs/environment-setup
export DOTFILES="$HOME/.dotfiles"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax highlighting for man pages using bat
export NULLCMD=bat # Use bat as NULLCMD instead of cat
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"

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
  $PYENV_ROOT/bin # https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
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

# Customise prompts
source "$DOTFILES/spaceship_shlvl.zsh"
SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
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
  # exec_time     # Execution time
  async         # Async jobs indicator
  line_sep      # Line break
  shlvl         # Custom section from spaceship_shlvl.zsh
  # battery       # Battery level and status
  jobs          # Background jobs indicator
  # exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  exit_code     # Exit code section
  exec_time     # Execution time
  time          # Time stamps section
)