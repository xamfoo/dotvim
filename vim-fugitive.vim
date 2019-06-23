function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
      bd .git/index
  else
      Gstatus
  endif
endfunction
" vim:set sw=2 sts=2:
