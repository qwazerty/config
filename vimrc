"""""""""""""""""""""""""""""""""
" dotvimrc config file          "
" by Kevin "qwazerty" Houdebert "
"""""""""""""""""""""""""""""""""

" Set tabs as spaces
set expandtab

" Set indent
set tabstop=8

" Set indent spaces
set shiftwidth=2

" Indent spaces when <tab>
set softtabstop=2

" Add autoindent
set autoindent

" Enable syntax highlight
syntax on

" Handle utf-8
set encoding=utf-8

" File utf-8 encoding
set fileencoding=utf-8

" Force vim instead of vi
set nocompatible

" Disable indent if Makefile
autocmd FileType make set noexpandtab
autocmd FileType make set softtabstop=8

" Filetypes
au BufNewFile,BufRead *.tmpl set filetype=sh
au BufNewFile,BufRead *.md set filetype=markdown

" Enable filetype plugin
filetype plugin indent on

" Keep history when switching between buffers
set hidden

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

" Remove latency when leaving insert mode
set timeoutlen=1

" Set normal backspace behaviour
set backspace=2

" Allow to open files in the current directory
set autochdir

" Show autocompletion in command line
set wildmenu
set wildmode=longest,full

" Don't syntax highlight long lines for performance
set synmaxcol=400

" Highlight column after 80 characters
set colorcolumn=80

" Set backup and undo directory
set backup
set undofile

set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/temp
set undodir=~/.vim/tmp/undo

"silent !mkdir -p ~/.vim/tmp/backup
"silent !mkdir -p ~/.vim/tmp/temp
"silent !mkdir -p ~/.vim/tmp/undo

" Trailing spaces and trim
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\|^\%$/

"
hi Visual ctermbg=20

" Change LineNumber color
hi LineNr cterm=none ctermfg=yellow

" Set cursorline color
hi CursorLine cterm=none ctermbg=234

" Set 80 columns color
hi ColorColumn cterm=none ctermbg=53

" Set TODO color
hi Todo cterm=bold ctermfg=Magenta ctermbg=Black

" Matching parenthesis changes
highlight MatchParen cterm=bold ctermfg=red ctermbg=none

" CursorLine only on insert mode
au InsertEnter * hi LineNr cterm=bold ctermfg=red
au InsertEnter * set cursorline
au InsertLeave * hi LineNr cterm=none ctermfg=yellow
au InsertLeave * set nocursorline

" Remap : on ;
nnoremap ; :

" Yank line until end of line like D
nnoremap Y y$

" Map split buffer start cmd on space
noremap <SPACE> <C-W><C-W>
noremap + <C-W>=

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

" Add custom command to change tab width
command Tab2 execute "set sts=2 | set sw=2"
command Tab4 execute "set sts=4 | set sw=4"

" Open the corresponding file format
command C execute "edit " . expand('%:t:r') . ".c"
command H execute "edit " . expand('%:t:r') . ".h"
command CC execute "edit " . expand('%:t:r') . ".cc"
command HH execute "edit " . expand('%:t:r') . ".hh"
command HXX execute "edit " . expand('%:t:r') . ".hxx"

" Bind Arrow reset
command ArrowReset execute "call ArrowReset()"
command ArrowSet execute "call ArrowSet()"

" Bind generate headers
command Header execute "call Headers()"
command Class execute "call Class()"

" Write the file with sudo
command W execute ':silent w !sudo tee % > /dev/null' | :edit

" Generate headers
function Headers()
    let gatename = substitute(toupper(expand("%:t")), "[^A-Za-z0-9]", "_", "g")
    execute "normal! ggO#ifndef " . gatename
    execute "normal! o# define " . gatename
    execute "normal! Go#endif /* !" . gatename . " */"
    execute "normal! O"
    call cursor(4, 0)
endfunction

" Generate c++ class
function Class()
    let classname = substitute(expand("%:t:r"), "\[_-]\\(.\\)", "\\u\\1", "g")
    let classname = substitute(classname, "^.*", "\\u&", "g")
    let headername = expand("%")
    execute "split " . expand("%:t:r") . ".cc"
    execute "normal! i#include \"" . headername . "\""
    execute "normal! o"
    execute "normal! o" . classname . "::" . classname . " ()"
    execute "normal! o{"
    execute "normal! o}"
    execute "normal! o"
    execute "normal! o" . classname . "::~" . classname . " ()"
    execute "normal! o{"
    execute "normal! o}"
    execute "wincmd j"
    call Headers()
    execute "normal! iclass " . classname
    execute "normal! o{"
    execute "normal! o    public:"
    execute "normal! o        " . classname . " ();"
    execute "normal! o        ~" . classname . " ();"
    execute "normal! o    private:"
    execute "normal! o};"
    execute "normal! o"
endfunction

function ArrowReset()
    unmap <UP>
    unmap <DOWN>
    unmap <LEFT>
    unmap <RIGHT>
endfunction

function ArrowSet()
    map <UP> <C-W>-
    map <DOWN> <C-W>+
    map <LEFT> <C-W><
    map <RIGHT> <C-W>>
endfunction

call pathogen#infect()
