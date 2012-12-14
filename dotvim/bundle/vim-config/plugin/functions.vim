" Removes trailing spaces
function TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\(\s*\n\)\+\%$\| \s*$\//
    call cursor(l, c)
endfunction

" Map removing trailing spaces on <F12>
map <F12> :call TrimWhiteSpace()<CR>

" Generate headers
function Headers()
    let l = line(".")
    let c = col(".")
    let gatename = substitute(toupper(expand("%:t")), "[^A-Za-z0-9]", "_", "g")
    execute "normal! ggO#ifndef " . gatename
    execute "normal! o# define " . gatename
    execute "normal! o"
    execute "normal! Go#endif /* !" . gatename . " */"
    execute "normal! O"
    call cursor(l, c)
endfunction

" Map generate headers on <F11>
map <F11> :call Headers()<CR>
