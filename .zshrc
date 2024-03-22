if [[ -n $DEBUG_ZSH_STARTUP ]]; then
  zmodload zsh/zprof
fi

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

source "$DOTFILES/zshrc/exports.zsh"
source "$DOTFILES/zshrc/aliases.zsh"
source "$DOTFILES/zshrc/typesets.zsh"
source "$DOTFILES/zshrc/functions.zsh"

autoload -Uz compinit
compinit

source "$DOTFILES/zshrc/sources.zsh"
source "$DOTFILES/zshrc/config.zsh"
source "$DOTFILES/zshrc/completions.zsh"

# eval "neofetch"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -n $DEBUG_ZSH_STARTUP ]]; then
  zprof
fi
