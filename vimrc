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
set nrformats+=alpha
set nrformats-=octal
set number
set ruler
set shortmess+=c
set updatetime=300
let g:mapleader="\t"
syntax on
filetype plugin indent on
try | colorscheme gruvbox | catch | endtry
ino <F1> <Esc>
nno <F1> <Esc>
nno <silent> / /\c
ino jk <Esc>
cno jk <Esc>
ino <silent> <Leader>, <C-o>m`<C-o><S-a>,<C-o>``
ino <silent> <Leader>; <C-o>m`<C-o><S-a>;<C-o>``
if executable("nnn")
  let g:nnn#set_default_mappings = 0
  let g:nnn#command = 'nnn -H'
  nn <silent> - :call nnn#pick(expand('%:p:h') . '/' . expand('%:p:t'))<CR>
endif
if executable("fzf")
  nno <silent> <Leader>b :Buffers<CR>
  nno <silent> <Leader>n :Files<CR>
  if executable("rg")
    nno <silent> <Leader>f :Rg<CR>
  endif
endif
" coc.nvim {
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-deno',
  \'coc-json',
  \'coc-prettier',
  \'coc-tsserver',
  \'coc-vimlsp',
  \]
nm <silent> gld <Plug>(coc-definition)
nm <silent> gli <Plug>(coc-implementation)
nm <silent> glt <Plug>(coc-type-definition)
nm <silent> glr <Plug>(coc-references)
vm <silent> <Leader>f <Plug>(coc-format-selected)
nno <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }
