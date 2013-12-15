" Remap : on ;
nnoremap ; :

" Allow to move in wrapped lines
nnoremap j gj
nnoremap k gk

" Yank line until end of line like D
nnoremap Y y$

" Map split buffer start cmd on space
noremap <SPACE> <C-W><C-W>

" Map set number command
noremap <F1> :set norelativenumber<CR>:set number<CR>

" Map set relativenumber command
noremap <F2> :set nonumber<CR>:set relativenumber<CR>

" Map set nonumber command
noremap <F3> :set nonumber<CR>:set norelativenumber<CR>

" Map next buffer
noremap <C-H> :bp<CR>

" Map next buffer
noremap <C-L> :bn<CR>

" Disable this f*cking binding
noremap Q <Nop>
