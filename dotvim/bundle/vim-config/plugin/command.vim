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
command ResetArrow execute "call ResetArrow()"
command SetArrow execute "call SetArrow()"
