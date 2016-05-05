function! s:replace_chars()
  let cursor = getpos('.')

  %s/\s\+$//ge

  call setpos('.', cursor)
endfunction
autocmd BufWritePre * call s:replace_chars()
