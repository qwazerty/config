" Enable syntax highlight
syntax on

" Set 256 color
set t_Co=256

" Change LineNumber color
hi LineNr cterm=none ctermfg=yellow

" Set background color
hi Normal ctermbg=0

" Set cursorline color
hi CursorLine cterm=none ctermbg=234

" Set TODO color
hi Todo cterm=bold ctermfg=Magenta ctermbg=Black

" Matching parenthesis changes
highlight MatchParen cterm=bold ctermfg=red ctermbg=none

" CursorLine only on insert mode
au InsertEnter * hi LineNr cterm=bold ctermfg=red
au InsertEnter * set cursorline
au InsertLeave * hi LineNr cterm=none ctermfg=yellow
au InsertLeave * set nocursorline
