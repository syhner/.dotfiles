autoload -U +X bashcompinit && bashcompinit
# autoload -U +X compinit && compinit

# terraform
complete -o nospace -C "$HOME/bin/terraform" terraform

# tabtab
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# bun
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"
