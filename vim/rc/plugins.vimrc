if has('nvim') && dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_auto_select = 1
  let g:deoplete#enable_camel_case_completion = 0
  let g:deoplete#max_list = 5
  let g:deoplete#auto_completion_start_length = 2

  if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
  endif
  let g:deoplete#keyword_patterns._ = '\h\w*'

  if !exists('g:deoplete#force_omni_input_patterns')
    let g:deoplete#force_omni_input_patterns = {}
  endif
  let g:deoplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
endif

if has('lua') && dein#tap('neocomplete.vim')
endif

if dein#tap('unite.vim')
  let g:unite_enable_start_insert = 0
  let g:unite_enable_auto_select = 0

  call unite#custom_source('buffer', 'sorters', 'sorter_word')

  nnoremap [unite] <Nop>
  nmap <Space> [unite]
  map <silent> [unite] :<C-u>Unite
  map <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  map <silent> [unite]p :<C-u>Unite file_rec/async:!<CR>
  map <silent> [unite]b :<C-u>Unite buffer -auto-preview<CR>

  autocmd FileType unite call s:unite_settings()
endif

function! s:unite_settings()
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction

if dein#tap('vim-easymotion')
  let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
  let g:EasyMotion_leader_key="'"
  nmap g/ <Plug>(easymotion-sn)
  xmap g/ <Plug>(easymotion-sn)
  omap g/ <Plug>(easymotion-tn)
endif

if dein#tap('lexima.vim')
  call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'latex'})
  call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'latex'})
  call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'latex'})
endif

if dein#tap('lightline.vim')
  let g:lightline = {
  \   'colorscheme': 'landscape',
  \   'active': {
  \     'right': [['lineinfo'], ['filetype'], ['fileencoding', 'fileformat']]
  \   },
  \   'inactive': {
  \     'right': [['lineinfo'], ['filetype']]
  \   },
  \   'component': {
  \     'readonly': '%{&readonly ? "×" : ""}',
  \     'filename': '%{expand("%") != "" ? expand("%:~:.") : ""}',
  \   },
  \   'separator': { 'left': '⮀', 'right': '⮂' },
  \   'subseparator': { 'left': '⮁', 'right': '⮃' },
  \ }
endif
