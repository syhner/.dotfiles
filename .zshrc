# (1 of 2) Uncomment to debug startup
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# ENABLE_CORRECTION="true"
zstyle ':omz:update' mode disabled      # disable automatic updates
ZSH_THEME="powerlevel10k/powerlevel10k" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
plugins=(git web-search)
if [[ -n $SSH_CONNECTION ]]; then # Preferred editor for local and remote sessions
  export EDITOR='nano'
else
  export EDITOR='code'
fi
source $ZSH/oh-my-zsh.sh

source "$DOTFILES/zshrc/exports.zsh"
source "$DOTFILES/zshrc/aliases.zsh"
source "$DOTFILES/zshrc/typesets.zsh"
source "$DOTFILES/zshrc/functions.zsh"
source "$DOTFILES/zshrc/sources.zsh"
source "$DOTFILES/zshrc/config.zsh"
source "$DOTFILES/zshrc/completions.zsh"

# eval "neofetch"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# (2 of 2) Uncomment to debug startup
# zprof
