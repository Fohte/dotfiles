if has('vim_starting') && &encoding !=# 'utf-8'
   set encoding=utf-8
endif

if has('clipboard')
  set clipboard&
  if has('unnamedplus')
    set clipboard^=unnamedplus
  else
    set clipboard^=unnamed
  endif
endif

set autoread

set noswapfile
set nobackup
set noundofile

set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

set backspace=indent,eol,start

set hlsearch
set incsearch
set smartcase
set wrapscan

set showcmd

set iskeyword+=-
