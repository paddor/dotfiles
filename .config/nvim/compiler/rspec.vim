" Vim compiler file
" Language:		RSpec

if exists("current_compiler")
  finish
endif
let current_compiler = "rspec"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=bundle\ exec\ rspec\ -ff


CompilerSet errorformat=
    \\ \ \ \ \ %\\+\#\ %f:%l:%m,
    \\#\ %f:%l:%m,
    \%f:%l:\ %tarning:\ %m,
    \%f:%l:%t:%m

" original
" CompilerSet errorformat=
"     \%f:%l:\ %tarning:\ %m,
"     \%f:%l:%t:%m,
"     \%E%.%#:in\ `load':\ %f:%l:%m,
"     \%E%f:%l:in\ `%*[^']':\ %m,
"     \%-Z\ \ \ \ \ %\\+\#\ %f:%l:%.%#,
"     \%E\ \ \ \ \ Failure/Error:\ %m,
"     \%E\ \ \ \ \ Failure/Error:,
"     \%C\ \ \ \ \ %m,
"     \%C%\\s%#,
"     \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
