" =================
" Vimrc by qwazerty
" =================

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

"#Set another indent
set shiftwidth=4

"#Yet another indent
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
set scrolloff=20

" Fix background for syntax color
set background=dark

" CursorLine only on insert mode
au InsertEnter * set cursorline
au InsertLeave * set nocursorline
highlight cursorline cterm=none ctermbg=darkgray

" Highlight column after 80 characters
":highlight OverLength cterm=none ctermfg=100
":match OverLength /\%>80v.\+/
set colorcolumn=80

" Remap : on ;
nnoremap ; :

" HARDCORE MODE! Unbind arrow keys
imap <UP> <Nop>
imap <DOWN> <Nop>
imap <LEFT> <Nop>
imap <RIGHT> <Nop>
nnoremap <UP> <Nop>
nnoremap <DOWN> <Nop>
nnoremap <LEFT> <Nop>
nnoremap <RIGHT> <Nop>

" End of line semi-colon
imap <C-V> <Esc>$a;<Esc>

" Add ; at end of line
nnoremap <C-V> <Esc>$a;<Esc>

" Indent current line by one tab
nnoremap <C-C> <Esc>^i<Tab><Down><Esc>

" Unindent current line by one char
nnoremap <C-X> <Esc>^X<Down><Esc>

" Completly unindent current line (more or less)
nnoremap <C-Z> <Esc>^XXXXXXXXXXXXXXXXXXXXXXXX<Down><Esc>

" Comment current line C-style
imap <C-B> <Esc>^i/*<Esc>$a*/<Down>
nnoremap <C-B> <Esc>^i/*<Esc>$a*/<Down>

" Uncomment current line C-style
imap <C-N> <Esc>^xx$xx<Down>
nnoremap <C-N> <Esc>^xx$xx<Down>

" Goto beginning of line
imap <C-H> <Esc>^i
nnoremap <C-H> <Esc>^i

" Goto end of line
imap <C-L> <Esc>$a
nnoremap <C-L> <Esc>$a

" Matching parenthesis changes
hi MatchParen cterm=bold ctermfg=red ctermbg=none

" Trailing spaces and trim
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t\| [^\t]\zs\t\+\| \(\s*\n\)\+\%$/

autocmd InsertLeave * redraw!
autocmd BufWinLeave * call clearmatches()

" Removes trailing spaces
function TrimWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s*$\| \(\s*\n\)\+\%$//
  call cursor(l, c)
:endfunction

" Map removing trailing spaces on <F12>
map <F12> :call TrimWhiteSpace()<CR>