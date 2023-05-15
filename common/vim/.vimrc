set nocompatible

syntax on
filetype plugin on

set encoding=UTF-8
set number
set relativenumber
set autoread
set autowriteall
set noerrorbells
set belloff=all
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
set incsearch
"set nohlsearch

set updatetime=750
set mouse=n
set backspace=indent,eol,start
set showcmd
set showmode
set hidden
set list
set listchars=eol:\ ,tab:>·,trail:~,extends:>,precedes:<
set completeopt=menuone,noinsert,noselect
set wildmenu
set shortmess+=c
set scrolloff=8
set cursorline
set signcolumn=yes
set splitright
set splitbelow
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete

set colorcolumn=100

:imap jk <Esc>
nnoremap <SPACE> <Nop>
let mapleader=" "

map <leader>ve :vsp $MYVIMRC<CR>
map <leader>vs :source $MYVIMRC<CR>
map <leader>vev :vsp ~/.vimrc<CR>

" this was replaced by <C-L> in nvim 0.6.0 but 'vim-tmux-navigator' plugin already occupies <C-L>
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" keep my buffer centered when navigating vertically
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

" move lines in VISUAL mode with "J" & "K"
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" more convenient horizontal navigation
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" other remaps
nnoremap <silent> <leader>gs :terminal git status<CR>
nnoremap <silent> <leader>tw :set wrap!<CR>

" auto commands
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

