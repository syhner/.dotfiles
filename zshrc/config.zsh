# List flags with TAB
autoload -U compinit && compinit

# Navigate up and down through history starting from what is in input field
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Use arrow keys to navigate between TAB suggestions
zstyle ':completion:*' menu select

# Case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
