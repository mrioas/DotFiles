# Installed from AUR yay -S antigen-git
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen theme zhann 
antigen apply

#Create a copy of pacman default, and add personal config
alias pack='yay --config ~/.config/pacman/pacman.conf'
