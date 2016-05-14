" ----------------------------------------------------------
"                .__
"          ___  _|__| ____________   ____
"          \  \/ /  |/     \_  __ \_/ ___\
"           \   /|  |  Y Y  \  | \/\  \___
"            \_/ |__|__|_|  /__|    \___  >
"                         \/            \/    @Fohte
" ----------------------------------------------------------

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

let s:rc_dir = resolve(expand('~/.vim/rc'))
function! s:source_rc(path) abort
  let abspath = resolve(expand(s:rc_dir . '/' . a:path))
  execute 'source' fnameescape(abspath)
endfunction


" ----------------------------------------------------------
"   Plugins
" ----------------------------------------------------------
let s:dein_dir = expand($CACHE . '/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [expand('<sfile>')] + split(glob(s:rc_dir . '/*.toml'), '\n'))

  call dein#load_toml(s:rc_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:rc_dir . '/dein.lazy.toml', {'lazy': 1})

  call s:source_rc('plugins.rc.vim')

  call dein#end()
  call dein#save_state()
endif


" ----------------------------------------------------------
"   Editor Settings
" ----------------------------------------------------------
filetype plugin indent on
call s:source_rc('edit.rc.vim')

" ----------------------------------------------------------
"   View
" ----------------------------------------------------------
call s:source_rc('view.rc.vim')

" ----------------------------------------------------------
"   Key Mappings
" ----------------------------------------------------------
call s:source_rc('mappings.rc.vim')

" ----------------------------------------------------------
"   Utils
" ----------------------------------------------------------
call s:source_rc('utils.rc.vim')
