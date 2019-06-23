function! s:VimCustomColor(mList)
  let l:setOptions = {
    \'t_Co': (&t_Co == 8 && $TERM !~# '^linux\|^Eterm') ? { '=': '16' } : {},
  \}

  " tomorrow night https://github.com/chriskempson/tomorrow-theme
  let g:terminal_ansi_colors = [
        \'black',
        \'#cc6666',
        \'#b5bd68',
        \'#de935f',
        \'#81a2be',
        \'#b294bb',
        \'#8abeb7',
        \'#373b41',
        \'#666666',
        \'#FF3334',
        \'#9ec400',
        \'#f0c674',
        \'#81a2be',
        \'#b777e0',
        \'#54ced6',
        \'white',
  \]

  let l:hasTrueColor = (has('gui_running') || $COLORTERM == 'truecolor')

  if l:hasTrueColor
    let $COLORTERM = 'truecolor'

    return a:mList + [{
      \'colorscheme': 'base16-tomorrow-night',
      \'setOptions': extend(deepcopy(l:setOptions), { 'termguicolors': 1 }),
    \}]
  endif

  return a:mList + [{ 'colorscheme': 'dracula', 'setOptions': l:setOptions }]
endfunction

function! s:VimConfigureBackupSwap(mList)
  let l:config_path = has('win32') ? 'vimfiles' : '.vim'
  let l:backupdir = $HOME . '/' . l:config_path . '/backup'
  let l:swapdir = $HOME . '/' . l:config_path . '/swap'

  for d in [l:backupdir, l:swapdir]
    if isdirectory(d) == 0
      call mkdir(d, "p", 0700)
    endif
  endfor

  return a:mList + [{
    \'setOptions': {
      \'backup': 1,
      \'backupdir': { '=': l:backupdir },
      \'directory': { '=': l:swapdir },
      \'swapfile': 1,
    \},
  \}]
endfunction

packadd! json-config
let s:config_list = json_config#read_file('~/.vim/vimrc.json')
let s:config_list = s:VimCustomColor(s:config_list)
let s:config_list = s:VimConfigureBackupSwap(s:config_list)
call json_config#load(s:config_list, { 'junegunn/vim-plug': { 'directory': '~/.vim/plugged' } })

" Ranger plugin settings
" let g:ranger_command = 'login -fp xam ranger'
" let g:ranger_buffer_close_cmd = 'BD'
nmap - :call RangerPickFile()<CR>
