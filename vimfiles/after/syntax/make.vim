" used for unix makefile
":syn region myFoldIf start="if\s" end="fi" transparent fold contained

" The following fold is correct but it lose the highlight syntax
":syn region myFold start="^!\s*if\c" end="^!\s*endif\c" transparent fold contains=myFold

" The following fold is correct but the time to parse the file is two times
" than that of set foldmethd=expr. However, it would be faster if we will edit
" the makefile after opening it.
":syn region myFold start="^!\s*if\c" end="^!\s*endif\c" transparent fold keepend extend


" fold !if...!else...!endif constructs
syn region IfFoldContainer
      \ start="^\s*!\s*if\(n\?def\)\?\c"
      \ end="!\s*endif\c"
      \ transparent
      \ keepend extend
      \ containedin=NONE
      \ contains=SynFoldIf,SynFoldElif,SynFoldElse
syn region SynFoldIf
      \ start="^\s*!\s*if\(n\?def\)\?\c"
      \ end="^\s*!\s*else\c"ms=s-1,me=s-1
      \ fold transparent
      \ keepend
      \ contained
      \ nextgroup=SynFoldElif,SynFoldElse
      \ contains=TOP
syn region SynFoldElif
      \ start="^\s*!\s*else\s*if\>\c"
      \ end="^\s*!\s*else\>\c"ms=s-1,me=s-1
      \ fold transparent
      \ keepend
      \ contained
      \ nextgroup=SynFoldElse
      \ contains=TOP
syn region SynFoldElse
      \ start="^\s*!\s*else\>\c"
      \ end="^\s*!\s*endif\>\c"
      \ fold transparent
      \ keepend
      \ contained
      \ contains=TOP 

:syn sync fromstart
":set foldmethod=syntax
