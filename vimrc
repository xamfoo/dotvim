if $TERM == "xterm-kitty" | let &t_ut='' | endif
set background=dark
set backspace=indent,eol,start
set belloff=all
set hidden
set incsearch
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set nrformats-=octal
set number
set ruler
set shortmess+=c
set updatetime=300
let g:mapleader="\t"
syntax on
filetype plugin indent on
colorscheme gruvbox
ino <F1> <Esc>
nno <F1> <Esc>
nno / /\c
ino jk <Esc>
cno jk <Esc>
nno <Leader>b :Buffers<CR>
nno <Leader>f :Rg<CR>
nno <Leader>n :Files<CR>
