" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ '| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

"Author: @mrioas on Telegram/Twitter
"	PLUGINS
"		-
"		-
"		-
"Repo: https://github.com/junegunn/vim-plug
" Install: yay -S neovim-plug
" Next Step: PluginInstall into neovim
call plug#begin('~/.config/nvim/autoload')
"-----------------"
" Plugins for Git "
" ----------------"
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
"-------------
" Fuzzy Finder
" ------------
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',{'do':{-> fzf#install()}}
call plug#end()
"-----------------------"
" Configurations for Git
"-----------------------"
set updatetime=100
"-----------------------
" Global configurations
"-----------------------
set number
let mapleader = ";"
noremap <Leader>a <Esc>:SignifyToggleHighlight<CR>
noremap <Leader>c <Esc>:G commit -uno % <CR>
set clipboard=unnamedplus
