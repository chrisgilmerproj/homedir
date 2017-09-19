execute pathogen#infect()

" au FileType py set nocompatible
" au FileType py set smartindent
" au FileType py set shiftwidth=4
" au FileType py set expandtab
set paste
set nocompatible
set smartindent
set shiftwidth=4
set expandtab          " tabs are spaces
set tabstop=4          " number of visual spaces per TAB
set softtabstop=4      " number of spaces in tab when editing
set noerrorbells       " turn off error bells
set visualbell         " turn off visual bells
set showmatch          " highlight matching [{()}]
set foldenable         " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10     " 10 nested fold max
set foldmethod=indent  " fold based on indent level

" space open/closes folds
nnoremap <space> za

" syntax on            " enable syntax processing
" https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
    syntax enable
endif
filetype on
filetype indent on      " load filetype-specific indent files
filetype plugin on
filetype plugin indent on

autocmd BufNewFile,BufRead *.cfg set filetype=ini
autocmd BufNewFile,BufRead *.pp set filetype=ruby
autocmd BufNewFile,BufRead *.yml set filetype=yaml.ansible
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

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

" file checkers
let g:syntastic_aggregate_errors = 1
let g:syntastic_ansible_checkers = ['ansible-lint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args='--ignore=F405'
let g:syntastic_yaml_checkers = ['yamllint']

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0

" color
" set background=dark
" :colorscheme Tomorrow-Night
" :colorscheme space-vim-dark
" :highlight OverColLimit term=bold cterm=bold
" :au BufRead,BufNewFile * match OverColLimit '\%>120v.\+'

vmap > >gv
vmap < <gv

map q :w<cr>:exe ':!./%' <cr>

" set statusline=%f%m%=%c%V\ \ %l/%L\ \ %{strftime(\"%H:%M\")}\ \
set laststatus=2
set colorcolumn=120

"Fixes backspace not working to dedent a line
set backspace=indent,eol,start

" Remove whitespace from end of lines
:command Nowhitespace :%s/\s\+$//
:command Nws :%s/\s\+$//

" Enable search term highlighting
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" powerline
let g:powerline_pycmd = 'py3'
let g:powerline_eval = 'py3eval'
source /Users/cgilmer/.pyenv/versions/3.6.1/Python.framework/Versions/3.6/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim
set t_Co=256
