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
"-------------------"
" Plugins for LaTeX
" ------------------
Plug 'lervag/vimtex'
"--------------
" Color Plugins
" -------------
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
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
set noswapfile
"-------------------------"
" Configuration for LaTeX
" ------------------------
augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal foldmethod=marker
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks'   : [] ,
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_compiler_latexmk_engines = {
        \ 'xelatex'          : '-xelatex',
        \ '_'                : '-pdf',
        \ 'pdfdvi'           : '-pdfdvi',
        \ 'pdfps'            : '-pdfps',
        \ 'pdflatex'         : '-pdf',
        \ 'luatex'           : '-lualatex',
        \ 'lualatex'         : '-lualatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}
augroup END
function! Pandoc() 
    :!pandoc -f latex -t markdown --pdf-engine xelatex --toc --toc-depth 3 -o %.md %
endfunction
nnoremap <F5> :call Pandoc()<CR>
imap <F5> <C-O>:call Pandoc()<CR>
