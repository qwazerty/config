" Handle utf-8
set encoding=utf-8

" File utf-8 encoding
set fileencoding=utf-8

" Force vim instead of vi
set nocompatible

" Disable indent if Makefile
autocmd FileType make set noexpandtab
autocmd FileType make set softtabstop=8

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
