" Remap : on ;
nmap ; :

" Allow to move in wrapped lines
noremap j gj
noremap k gk

" Map C-Arrow key on resize split
"map <UP> <C-W>-
"map <DOWN> <C-W>+
"map <LEFT> <C-W><
"map <RIGHT> <C-W>>

" Map split buffer start cmd on space
map <SPACE> <C-W><C-W>

" Unmap help
imap <F1> <Nop>

" Map set number command
map <F1> :set number<CR>

" Map set relativenumber command
map <F2> :set relativenumber<CR>

" Map set nonumber command
map <F3> :set nonumber<CR>

" Map next buffer
map <C-H> :bp<CR>

" Map next buffer
map <C-L> :bn<CR>

" Delete current buffer
map <C-J> :bd<CR>
