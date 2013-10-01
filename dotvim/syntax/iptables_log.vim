" Vim syntax file
" Language: Iptables log
" Maintainer: qwazerty
" Latest Revision: 01 October 2013

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "iptables_log"

syn match date         "^[^ ]* *[^ ]* *[^ ]*" nextgroup=hostid
syn match hostid       " [^ ]*" contained nextgroup=threadid
syn match threadid     " [^ ]*" contained nextgroup=msgnature
syn match msgnature    " [^ ]*" contained nextgroup=loglocation
syn match loglocation  " [^ ]*" contained

syn keyword Warn IN OUT SRC DST PROTO SPT DPT
syn keyword Info PHYSIN MAC LEN TOS PREC TTL
syn keyword Dev eth0 virbr0

hi date         ctermfg=red
hi hostid       ctermfg=blue
hi threadid     ctermfg=cyan
hi msgnature    ctermfg=green
hi loglocation  ctermfg=yellow
hi Warn         ctermfg=red
hi Info         ctermfg=cyan
hi Dev          ctermfg=magenta
