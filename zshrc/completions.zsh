autoload -U +X bashcompinit && bashcompinit
# autoload -U +X compinit && compinit

if type brew &>/dev/null; then
  autoload -Uz compinit
  compinit
fi

# terraform
complete -o nospace -C "$HOME/bin/terraform" terraform

# tabtab
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi
