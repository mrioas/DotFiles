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
"-----------
" Formatter
" ----------
Plug 'sbdchd/neoformat'
"--------------------------------"
" LSP -> Language Server Protocol
"--------------------------------"
Plug 'w0rp/ale'
"------------------------------------"
" IDE thinking about Embedded devices
"------------------------------------"
Plug 'normen/vim-pio'
"-----------------"
"-----------------"
" For C language
" ----------------"
" Plug 'deoplete-plugins/deoplete-clang'
"_________________
" For haskell
" ---------------
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
" -----------------
"  Resembling VScode
"-----------------"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
call plug#end()
"-----------------------"
" Configurations for Git
"-----------------------"
set updatetime=100
"-----------------------
" Global configurations
"-----------------------
set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch
set number
set expandtab
set tabstop=4
set softtabstop=4
set mouse=a "n,v,i,,c,h,r,a:all previous mode"
let mapleader = ";"
noremap <Leader>a <Esc>:SignifyToggleHighlight<CR>
noremap <Leader>c <Esc>:G commit -uno % <CR>
set clipboard=unnamedplus
set noswapfile
"-------------------------"
" Config for haskell
"_________________________"
augroup filetype_hs
"set rtp+=~/.vim/pack/XXX/start/LanguageClient-neovim
"let g:LanguageClient_serverCommands = { 'haskell': ['haskell-language-server-wrapper', '--lsp'] }
let g:ale_linters_ignore = {'haskell':['ghc', 'cabal-ghc','ghc-mod']}
augroup END
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
augroup filetype_c
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
augroup END
autocmd FileType css setl iskeyword+=-
autocmd FileType scss setl iskeyword+=@-@
function! Pandoc() 
    :!pandoc -f latex -t markdown --pdf-engine xelatex --toc --toc-depth 3 -o %.md %
endfunction
nnoremap <F5> :call Pandoc()<CR>
imap <F5> <C-O>:call Pandoc()<CR>

function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
