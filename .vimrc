set enc=utf-8
set tabstop=2
set shiftwidth=2
syntax on
"set expandtab
"set autoindent
"set smartindent
"set showmatch

set ts=3
set number
set showcmd
set nocp
set laststatus=2
set cindent

" CursorLine only on insert mode
if version >= 700 
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
hi CursorLine ctermbg=darkgrey cterm=none
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

"Highlight column after 80 characters
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Opening and closing braces
imap <C-F> {<CR>}<C-O>O

" Opening and closing parenthesis
imap <C-D> ()<Esc>i

" Opening and closing square brackets
imap <C-G> []<Esc>i

" Matching parenthesis fix
hi MatchParen cterm=bold ctermbg=none ctermfg=red
