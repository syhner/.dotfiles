alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias brewcasks="brew ls --casks | parallel \"echo -n 'cask \"{}\" #'; brew desc --cask --eval-all {} | cut -d ':' -f 2-\""
alias brewdump='brew bundle dump --describe --file=~/.dotfiles/Brewfile.dump --force'
alias brewformulae="brew leaves --installed-on-request | parallel \"echo -n 'brew \"{}\" #'; brew desc --formula --eval-all {} | cut -d ':' -f 2-\""
alias cmd='command'
alias exitcode='echo $?'
alias ftrail='<<<${(F)fpath}'

alias gcma='git commit --all --message'
alias gcmA='git add -A && git commit --message'
alias gacm='git commit --all --message'
alias gAcm='git add -A && git commit --message'

alias gcob='git checkout -b'
alias gcoB='git checkout -B'
alias gsm='git switch -'

alias ls='exa --across --all --classify --git --group-directories-first'
alias mkdir='mkdir -p'
alias myip='ipconfig getifaddr en0'
alias pi='ssh raspberrypi.local -l pi'
alias expose-cf='cloudflared tunnel run local'
alias expose-ng="ngrok --domain=$NGROK_DOMAIN"               # expose-ng http 3000
alias expose-ng-edge="ngrok tunnel --label edge=$NGROK_EDGE" # expose-ng-edge 3000
alias rm='trash'                                             # trash-cli
alias sudo='sudo '                                           # Allow aliases to be sudoed
alias tf='terraform'
alias trail='<<<${(F)path}'
alias work='code ~/work/all.code-workspace'
