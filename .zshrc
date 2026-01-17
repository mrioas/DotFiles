autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
# Installed from AUR yay -S antigen-git
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle soimort/translate-shell
antigen bundle hschne/fzf-git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen theme mdev
antigen apply

#Create a copy of pacman default, and add personal config
alias p='yay --config ~/.config/pacman/pacman.conf'
alias e=$EDITOR
alias pdf='zathura'
#Create a VAR ENV for my files 
export MYFILES='/run/media/mas/E8380E98380E65C2/Files/'
export PATH=/home/mas/.stack/programs/x86_64-linux/ghc-tinfo6-9.0.2/bin:~/.bin:/home/mas/.local/bin:/home/mas/.cabal/bin:$PATH
# export PATH=~/.bin:/home/mas/.local/bin:/home/mas/.cabal/bin:$PATH
export EDITOR=nvim
export BIB=/run/media/mas/E8380E98380E65C2/Files/Docs/Biblio/bibliography.bib
#MY ALIAS
alias l='exa -a --icons --long'
alias lL='exa --long --icons'
alias lT2='exa -R --tree --level=2 | fzf'
alias lf='exa -F | rg -v / | fzf'
alias lT3='exa -R --tree --level=3 | fzf'
alias lTT='exa -l -R --tree | fzf'
alias lR='exa -d -R --icons | fzf'
alias finder='find * -type f | fzf > selected'
alias T="trash"
# Alias for  GIT
alias git_S='git status --long -uno'
# TEXLIVE EDITING
export PATH=~/.bin:/home/mas/.local/bin:'/usr/local/texlive/2022/bin/x86_64-linux':$PATH
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
export MBLOG='/run/media/mas/E8380E98380E65C2/Files/Git/mBlog'
function yta () {
	mpv --ytdl-format=bestaudio/best ytdl://ytsearch100:"$*"
}
function ytv () {
	mpv --no-border --ytdl-format="bestvideo[height<=?240][fps<=?30][vcodec!=vp9]+bestaudio/best" ytdl://ytsearch100:"$*"
}
# For conda
source /opt/miniconda/etc/profile.d/conda.sh
eval "$(stack --bash-completion-script stack)"
eval "$(starship init zsh)"
# sudo ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
