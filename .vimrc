" ================= "
" Vimrc by qwazerty "
" ================= "

" utf-8 encoding
set enc=utf-8

" Enable syntax highlight
syntax on

" Force vim instead of vi
set nocompatible

" Set tabs as spaces
set expandtab

" Disable indent if Makefile
autocmd FileType make set noexpandtab

"#Just a random comment
set copyindent

"#And another one
set preserveindent

" Set indent
set tabstop=4

" Set another indent
set shiftwidth=4

" Yet another indent
set softtabstop=0

" Force command show
set showcmd

" Show command on two lines with a white line
set laststatus=2

" Show numbers
set number

" Set highlight color
set hlsearch

" Add Scroll limit to scroll before end of window
set scrolloff=99

" Fix background for syntax color
set background=dark

" Remove latency when leaving insertmode
set timeoutlen=0

" CursorLine only on insert mode
au InsertEnter * set cursorline
au InsertLeave * set nocursorline
highlight cursorline cterm=none ctermbg=darkgray

" Highlight column after 80 characters
set colorcolumn=80

" Remap : on ;
nmap ; :

" HARDCORE MODE! Unbind arrow keys
imap <UP> <Nop>
imap <DOWN> <Nop>
imap <LEFT> <Nop>
imap <RIGHT> <Nop>
nmap <UP> <Nop>
nmap <DOWN> <Nop>
nmap <LEFT> <Nop>
nmap <RIGHT> <Nop>

" End of line semi-colon
imap <C-V> <Esc>$a;<Esc>
nmap <C-V> <Esc>$a;<Esc>

" Indent current line by one tab
nmap <C-C> <Esc>^i<Tab><Down><Esc>

" Comment current line C-style
imap <C-B> <Esc>^i/*<Esc>$a*/<Down>
nmap <C-B> <Esc>^i/*<Esc>$a*/<Down>

" Uncomment current line C-style
imap <C-N> <Esc>^xx$xx<Down>
nmap <C-N> <Esc>^xx$xx<Down>

" Matching parenthesis changes
hi MatchParen cterm=bold ctermfg=red ctermbg=none

" Trailing spaces and trim
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t\| [^\t]\zs\t\+\| \(\s*\n\)\+\%$/

" Removes trailing spaces
function TrimWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s*$\| \(\s*\n\)\+\%$//
  call cursor(l, c)
:endfunction

" Map removing trailing spaces on <F12>
map <F12> :call TrimWhiteSpace()<CR>

" Map set number command
map <F2> :set number<CR>

" Map set relativenumber command
map <F3> :set relativenumber<CR>

" Map set nonumber command
map <F4> :set nonumber<CR>
