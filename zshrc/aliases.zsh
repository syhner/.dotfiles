alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias brewdump='brew bundle dump --describe --file=~/.dotfiles/Brewfile.dump --force'
alias cmd='command'
alias exitcode='echo $?'
alias ftrail='<<<${(F)fpath}'
alias ls='exa --across --all --classify --git --group-directories-first'
alias mkdir='mkdir -p'
alias myip='ipconfig getifaddr en0'
alias pi='ssh raspberrypi.local -l pi'
alias expose-cf='cloudflared tunnel run local'
alias expose-ng="ngrok --domain=$NGROK_DOMAIN"               # expose-ng http 3000
alias expose-ng-edge="ngrok tunnel --label edge=$NGROK_EDGE" # expose-ng-edge 3000
alias sudo='sudo '                                           # Allow aliases to be sudoed
alias tf='terraform'
alias trail='<<<${(F)path}'
alias work='code ~/work/all.code-workspace'
