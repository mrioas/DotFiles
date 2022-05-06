# Installed from AUR yay -S antigen-git
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen theme mdev
antigen apply

#Create a copy of pacman default, and add personal config
alias p='yay --config ~/.config/pacman/pacman.conf'
alias e=$EDITOR
#Create a VAR ENV for my files 
export MYFILES='/run/media/mas/E8380E98380E65C2/Files/'
export PATH=~/.bin:/home/mas/.local/bin:$PATH
export EDITOR=nvim
#MY ALIAS
alias l='exa -a --icons --long'
alias lL='exa --long --icons'
alias lT='exa -R --tree --level=2'
alias lTT='exa -l -R --tree | fzf'
alias lR='exa -d -R --icons | fzf'
alias finder='find * -type f | fzf > selected'
# Alias for  GIT
alias git_S='git status --long -uno'
# TEXLIVE EDITING
export PATH=~/.bin:/home/mas/.local/bin:$PATH
export PATH='/usr/local/texlive/2022/bin/x86_64-linux':$PATH
#export MANPATH='/usr/local/texlive/2022/texmf-dist/doc/man'
#export INFOPATH='/usr/local/texlive/2022/texmf-dist/doc/info'
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
