set enc=utf-8
set tabstop=2
set shiftwidth=2
syntax on
set showmatch
"set expandtab
"set autoindent
"set smartindent

set ts=3
set number
set showcmd
set nocp
set laststatus=2

if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
hi CursorLine ctermbg=darkgrey cterm=none
au InsertEnter * set cursorline
au InsertLeave * set nocursorline
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
