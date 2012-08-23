set enc=utf-8
syntax on
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=3
set ts=3
set number
set showcmd
set nocp
set laststatus=2
set hlsearch

" CursorLine only on insert mode
hi CursorLine ctermbg=darkgrey cterm=none
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" Highlight column after 80 characters
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Opening and closing quotes
imap <C-F> ''<Esc>i

" Opening and closing parenthesis
imap <C-D> ()<Esc>i

" Opening and closing square brackets
imap <C-G> ""<Esc>i

" End of line semi-colon
imap <C-V> <Esc>$a;<Esc>

nnoremap <C-V> <Esc>$a;<Esc>
nnoremap <C-C> <Esc>^i<Tab><Down><Esc>
nnoremap <C-X> <Esc>^X<Down><Esc>
nnoremap <C-Z> <Esc>^XXXXXXXXXXXXXXXXXXXXXXXX<Down><Esc>

" Comment current line C-style
imap <C-B> <Esc>^i//<Esc><Down>
nnoremap <C-B> <Esc>^i//<Esc><Down>

" Uncomment current line C-style
imap <C-N> <Esc>^xx<Down>
nnoremap <C-N> <Esc>^xx<Down>

" Goto beginning of line
imap <C-H> <Esc>^i
nnoremap <C-H> <Esc>^i

" Goto end of line
imap <C-L> <Esc>$a
nnoremap <C-L> <Esc>$a

" Php open balise
imap <C-E> <?php
nnoremap <C-E> i<?php

" Matching parenthesis fix
hi MatchParen cterm=bold ctermfg=red ctermbg=none

" Trailing spaces and trim
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t\| [^\t]\zs\t\+/
" Show tabs that are not at the start of a line:
"match ExtraWhitespace /[^\t]\zs\t\+/

autocmd InsertLeave * redraw!
autocmd BufWinLeave * call clearmatches()

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

map <F12> :call TrimWhiteSpace()<CR>