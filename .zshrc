# Installed from AUR yay -S antigen-git
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen theme nicoulaj
antigen apply

#Create a copy of pacman default, and add personal config
alias pack='yay --config ~/.config/pacman/pacman.conf'
#Create a VAR ENV for my files 
export MYFILES='/run/media/mas/E8380E98380E65C2/Files/'
#MY ALIAS
alias lf='exa -a --icons --long'
alias lfL='exa --long --icons'
alias lfT='exa -R --tree --level=2'
alias lfTT='exa -l -R --tree | fzf'
alias lfR='exa -d -R --icons | fzf'
alias finder='find * -type f | fzf > selected'
# Alias for  GIT
alias git_S='git status --long -uno'
