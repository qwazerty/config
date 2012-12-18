" Generate headers
function Headers()
    let gatename = substitute(toupper(expand("%:t")), "[^A-Za-z0-9]", "_", "g")
    execute "normal! ggO#ifndef " . gatename
    execute "normal! o# define " . gatename
    execute "normal! Go#endif /* !" . gatename . " */"
    execute "normal! O"
    call cursor(4, 0)
endfunction

" Map generate headers on <F12>
map <F12> :call Headers()<CR>

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

" Map generate headers on <F11>
map <F11> :call Class()<CR>
