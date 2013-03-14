" Remap : on ;
nmap ; :

" Allow to move in wrapped lines
noremap j gj
noremap k gk

" HARDCORE MODE! Unbind arrow keys
imap <UP> <Nop>
imap <DOWN> <Nop>
imap <LEFT> <Nop>
imap <RIGHT> <Nop>
nmap <UP> <Nop>
nmap <DOWN> <Nop>
nmap <LEFT> <Nop>
nmap <RIGHT> <Nop>

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
