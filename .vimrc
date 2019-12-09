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
set foldenable         " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10     " 10 nested fold max
set foldmethod=indent  " fold based on indent level
set autoindent
set cindent
set shiftround
set nolazyredraw       " don't allow lazy redraws
set vb t_vb=           " no visual bell

au FileType js set sw=2 ts=2 sts=2 sta et

" utf-8 ftw!
set encoding=utf-8
set fileencodings=utf-8
setglobal fileencoding=utf-8
set noemoji            " Ensure emoji chars are single width
set ambiwidth=single   " Ensure ambiguous chars are single width

" space open/closes folds
nnoremap <space> za

" syntax on            " enable syntax processing
" https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
    syntax enable
endif
" filetype on
" filetype indent on
" filetype plugin on
filetype plugin indent on " load filetype-specific indent files

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

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

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
set incsearch          " search as characters are entered
set hlsearch           " highlight matches
set showmatch          " highlight matching [{()}]

" powerline
let g:powerline_pycmd = 'py3'
let g:powerline_eval = 'py3eval'
source /Users/cgilmer/.pyenv/versions/3.8.0/Python.framework/Versions/3.8/lib/python3.8/site-packages/powerline/bindings/vim/plugin/powerline.vim
set t_Co=256

" prettier
" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 120

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'avoid'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'babylon'

" RustFmt
let g:rustfmt_autosave = 1
