echo 'Hello from .zshrc'

# ------------- #
# Set variables #
# ------------- #

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk" # https://reactnative.dev/docs/environment-setup
export DOTFILES="$HOME/.dotfiles" # Shortcut to this directory
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home # https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/macos-install.html
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax highlighting for man pages using bat
export NULLCMD=bat # Use bat instead of cat
export NVM_DIR="$HOME/.nvm" # https://github.com/nvm-sh/nvm#installing-and-updating
export PYENV_ROOT="$HOME/.pyenv" # https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
export ZSHRC="$HOME/.zshrc" # Shortcut to this file

# -------------- #
# Create aliases #
# -------------- #

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias brewdump='brew bundle dump --force --describe --file=~/.dotfiles/dump.Brewfile'
alias cmd='command'
alias exa='exa -aFhl --git' # -a all files except ./ and ../ || -F show file type || -h readable file sizes || -l list format
alias ftrail='<<<${(F)fpath}'
alias ls='exa'
alias mkdir='mkdir -p'
alias myip='ipconfig getifaddr en0'
alias sudo='sudo ' # Allow aliases to be sudoed
alias trail='<<<${(F)path}'

# ---------------------------------------- #
# Add locations to $path and $fpath arrays #
# ---------------------------------------- #

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

# --------- #
# Functions #
# --------- #

function gitclonecd() {
  git clone "$1" && cd "$(basename "$_" .git)"
}
function greps() {
  eval grep \""$(join "\|" "$@")"\"
}
function join() {
  local out="$2"
  for i in "${@:3}" ; do
    out+="$1$i"
  done
  echo $out
}
function resource() {
  source ~/.zshrc
}
function mkcd() {
  mkdir -p "$@" && cd "$_"
}
function setlocaldns() {
  local myip=$(myip)

  echo "Setting dnsmasq config"
  echo "address=/.local/$myip" > /opt/homebrew/etc/dnsmasq.conf

  echo "Restarting dnsmasq (password may be required)"
  sudo brew services restart dnsmasq

  echo "Setting DNS servers to $myip 8.8.8.8..."
  networksetup -setdnsservers Wi-Fi $myip 8.8.8.8

  echo "\nSuccess! You must add $myip as the first DNS server for each additional device"
}
function runinsubdirs() {
  for d in ./*/ ; do 
    (
      cd "$d"
      echo "${PWD##*/} "
      "$@"
    )
  done
}
# e.g. local author=$(flag --short a --long author --default siraj --required --args $@)"
function flag() {
  # Set parameters from flags
  while [ "$#" -gt 0 ] && [ "$1" != "--args" ] ; do
    case "${1}" in
      -b|--isboolean) local isboolean=true ;;
      -d|--default) local default="$2" ;;
      -l|--long) local long="$2" ;;
      -s|--short) local short="$2" ;;
      -r|--required) local required=true ;;
    esac

    # Shift twice if there is a flag followed by a value
    if [[ "$2" == \-* ]] ; then
      shift 
    else
      shift 2
    fi
  done

  # Shift the --args argument
  shift

  # Search for the short or long flag in the remaning args
  while [ "$#" -gt 0 ] ; do
    if [ "$1" = "-$short" ] || [ "$1" = "--$long" ] ; then
      if [ "$isboolean" ] ; then
        echo true
        return
      elif [ "$2" = "" ] ; then
        break
      else
        echo "$2"
        return
      fi
    fi
    shift
  done
  if [ -n "$default" ] ; then
    echo "$default"
    return
  fi

  if [ "$required" ] ; then
    if [ -n "$short" ] ; then
      local reqshort="-$short"
    fi
    if [ -n "$long" ] ; then
      local reqlong="--$long"
    fi
    if [ -n "$short" ] && [ -n "$long" ] ; then
      local reqor=" or "
    fi

    echo "The flag $reqshort$reqor$reqlong is required"
    return 1
  fi
}
function blame() {
  local author=$(flag --short a --long author --default siraj --required --args $@)
  local files=$(flag --short f --long files --default . --args $@)
  local output=$(flag --short o --long output --isboolean --default false --args $@)
  local search=$(flag --short s --long search --args $@)

  local count=0
  while IFS= read -rd '' file ; read -rd '' nr ; read -r line ; do
    if git annotate -p -L "$nr,$nr" -- "$file" | grep -q "$author" ; then
      ((count++))
      if $output ; then
        echo "$file:$nr"
      else
        echo -ne "($count rows)\r"
      fi
    fi
  done < <(git grep -nz "$search" -- "${files[@]}")
  echo "($count rows)"
}

# ------ #
# Source #
# ------ #

# Customise prompt with spaceship
source /opt/homebrew/opt/spaceship/spaceship.zsh
source "$DOTFILES/spaceship.zsh" 

# Brews
source /opt/homebrew/opt/nvm/nvm.sh
source "$DOTFILES/load_nvm.zsh"
source /opt/homebrew/etc/profile.d/z.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ----------------------------------------------------------------- #
# ZSH options - https://zsh.sourceforge.io/Doc/Release/Options.html #
# ----------------------------------------------------------------- #

# 01 - Changing directories

# 02 - Completion

# 03 - Expansion and Globbing

# 04 - History
setopt extendedHistory
setopt histIgnoreAllDups
setopt histNoStore
setopt incAppendHistoryTime

# 05 - Initialisation

# 06 - Input/Output

# 07 - Job Control

# 08 - Prompting

# 09 - Scripts and Functions

# 10 - Shell emulation

# 11 - Shell state

# ------#
# Other #
# ----- #

autoload -U compinit && compinit # List flags with TAB

# Navigate up and down through history starting from what is in input field
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Use arrow keys to navigate between TAB suggestions
zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case insensitive autocompletion