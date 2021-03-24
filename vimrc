if $TERM == "xterm-kitty" | let &t_ut='' | endif
set encoding=utf-8
set nocompatible
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
aug global | au! | aug END
if executable("nnn")
  let g:nnn#set_default_mappings = 0
  let g:nnn#command = 'nnn -H'
  nn <silent> - :call nnn#pick(expand('%:p:h') . '/' . expand('%:p:t'))<CR>
endif
if executable("fzf")
  nno <silent> <Leader>b :Buffers<CR>
  nno <silent><expr> <Leader>n (len(system('git rev-parse'))) ? ':Files' : ':GFiles -c -o --exclude-standard'."\<CR>"
  if executable("rg")
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
    nno <silent> <Leader>f :RG<CR>
  endif
endif
" coc.nvim {
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-eslint',
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
nm <silent> clr <Plug>(coc-refactor)
nm <silent> clf :CocFix<CR>
vm <silent> Lf <Plug>(coc-codeaction-selected)
au global FileType
  \ graphql,javascript,javascriptreact,json,typescript,typescriptreact
  \ vm <buffer> = <Plug>(coc-format-selected) |
  \ nm <buffer> == V<Plug>(coc-format-selected) |
  \ setl formatexpr=CocAction('formatSelected')
au global BufRead coc-settings.json set ft=jsonc
nno <silent> K :call <SID>show_documentation()<CR>
nm <silent> [ge <Plug>(coc-diagnostic-prev-error)
nm <silent> ]ge <Plug>(coc-diagnostic-next-error)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }
