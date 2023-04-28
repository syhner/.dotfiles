source "$DOTFILES/zshrc/exports.zsh"
source "$DOTFILES/zshrc/aliases.zsh"
source "$DOTFILES/zshrc/typesets.zsh"
source "$DOTFILES/zshrc/functions.zsh"
source "$DOTFILES/zshrc/sources.zsh"
source "$DOTFILES/zshrc/config.zsh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C "$HOME/bin/terraform" terraform

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
