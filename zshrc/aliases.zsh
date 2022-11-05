alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias brewdump='brew bundle dump --force --describe --file=~/.dotfiles/Brewfile.dump'
alias cmd='command'
alias exa='exa -aFhl --git' # -a all files except ./ and ../ || -F show file type || -h readable file sizes || -l list format
alias ftrail='<<<${(F)fpath}'
alias ls='exa'
alias mkdir='mkdir -p'
alias myip='ipconfig getifaddr en0'
alias sudo='sudo ' # Allow aliases to be sudoed
alias trail='<<<${(F)path}'