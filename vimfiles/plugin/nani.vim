" File: nani.vim
" Author: Mike Guo (myguo@microsoft.com)
" Version: 1.0
" Last Modified: 2011-12-27
"
" Nani utility script which can be used to redirect nani output to quickfix
" windows. 
" Nani utility is http://toolbox/nani

if exists("loaded_nani")
  finish
endif

let loaded_nani=1

let nani_path = 'nani'

function! s:RunNaniCmd(...)
  let s:param = ""
  for nextVal in a:000
    let s:param .= " " . nextVal
  endfor

  let cmd_output = system("nani " . s:param)
  if cmd_output == ""
    return
  endif

  let tmpfile=tempname()
  exe "redir! > " . tmpfile
  silent echon cmd_output
  redir END

  execute "silent! cgetfile " . tmpfile

  call delete(tmpfile)
  cw
endf

"Define nani commands
command! -nargs=* -complete=file Nani call s:RunNaniCmd(<f-args>)
