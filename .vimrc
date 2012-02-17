filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manage Vundle required!
Bundle 'gmarik/vundle'

" Start Bundles
" github repos
Bundle 'scrooloose/nerdtree'
" vim-scripts repos
" non github repos
" End Bundles

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible

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
 
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l
 
"map <C-w> <C-w>+<bar>
"map <C-q> <C-w>-<bar>
"map <C-a> <C-w>=<bar>
 
"map <silent> <C-y> <C-w>>
"map <silent> <C-u> <C-w>-
"map <silent> <C-i> <C-w>+
"map <silent> <C-o> <C-w><

noremap  <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0'  : '^')
imap <Home> <C-o><Home>

map <C-t> :NERDTreeToggle<cr>

let NERDTreeIgnore=['\.vim$', '\.pyc$']

:colorscheme desert

"highlight OverLength ctermbg=darkred ctermfg=white
"match OverLength /\%81v.*/

:highlight OverColLimit term=bold cterm=bold
:au BufRead,BufNewFile * match OverColLimit '\%>80v.\+'

"let g:JavaImpSortPkgSep = 0
"let g:JavaImpPaths = '/opt/android-sdk/platforms/android-1.5/,'.$HOME.'/ext/shing/src'
"let g:JavaImpDataDir = $HOME.'/.vim/JavaImp' 
"map <silent> <C-o> :JavaImpSilent<cr>:JIS<cr>

"set tw=80
set spell

vmap > >gv
vmap < <gv


map q :w<cr>:exe ':!./%' <cr>

set statusline=%f%m%=%c%V\ \ %l/%L\ \ %{strftime(\"%H:%M\")}\ \ 
set laststatus=2
set colorcolumn=80

"Fixes backspace not working to dedent a line
set backspace=indent,eol,start
