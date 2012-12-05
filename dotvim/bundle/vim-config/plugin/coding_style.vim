" Highlight column after 80 characters
set colorcolumn=80

" Trailing spaces and trim
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t\| [^\t]\zs\t\+\| \(\s*\n\)\+\%$/
