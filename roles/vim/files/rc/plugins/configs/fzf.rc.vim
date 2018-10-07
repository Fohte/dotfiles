let g:fzf_command_prefix = 'Fzf'

let g:fzf_ag_options = '--hidden'

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ }

let g:fzf_colors = {
      \ 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'Normal'],
      \ 'hl': ['fg', 'Comment'],
      \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+': ['fg', 'Statement'],
      \ 'info': ['fg', 'PreProc'],
      \ 'border': ['fg', 'Ignore'],
      \ 'prompt': ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker': ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header': ['fg', 'Comment']
      \ }

command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, g:fzf_ag_options, <bang>0)

function! s:run_fzf_ag()
  let l:input_value = input('Pattern: ')
  if l:input_value == ''
    return
  endif
  execute 'FzfAg' l:input_value
endfunction

function! s:run_fzf_files_in_current_dir()
  execute 'FzfFiles' expand('%:h')
endfunction

nnoremap <silent> <Leader>p :<C-u>FzfGFiles -co --exclude-standard<CR>
nnoremap <silent> <Leader>f :<C-u>FzfFiles<CR>
nnoremap <silent> <Leader>. :<C-u>call <SID>run_fzf_files_in_current_dir()<CR>
nnoremap <silent> <Leader>g :<C-u>call <SID>run_fzf_ag()<CR>
nnoremap <silent> <Leader>s :<C-u>FzfGFiles?<CR>
nnoremap <silent> <Leader>b :<C-u>FzfBuffers<CR>
nnoremap <silent> <Leader>l :<C-u>FzfLines<CR>