filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manage Vundle required!
Bundle 'gmarik/vundle'

" Start Bundles
" github repos
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/pep8'
" vim-scripts repos
"
" non github repos
"
" End Bundles

set nocompatible
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set visualbell

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

map <silent> <left>  h
map <silent> <down>  j
map <silent> <up>    k
map <silent> <right> l

map j gj
map k gk
map - <C-w>-
map = <C-w>+
map < <C-w><
map > <C-w>>
"map <C-t> :tabe .<cr>
"map <C-e> :tabclose <cr>

map <silent> <C-d> gT
map <silent> <C-f> gt
map <silent> <C-e> :q<cr>

" Move around windows with control key
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" Disable increment and decrement of numbers
nmap <C-A> <Nop>
nmap <C-X> <Nop>

noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0'  : '^')
imap <Home> <C-o><Home>

" NERDTree
map <C-t> :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyo$', '\.pyc$', '\.svn[\//]$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" pyflakes-vim
let g:pyflakes_use_quickfix = 0

" color
:colorscheme elflord
:highlight OverColLimit term=bold cterm=bold
:au BufRead,BufNewFile * match OverColLimit '\%>80v.\+'

" set spell

vmap > >gv
vmap < <gv


map q :w<cr>:exe ':!./%' <cr>

set statusline=%f%m%=%c%V\ \ %l/%L\ \ %{strftime(\"%H:%M\")}\ \
set laststatus=2
"set colorcolumn=80

"Fixes backspace not working to dedent a line
set backspace=indent,eol,start

:command Nowhitespace :%s/\s\+$//
