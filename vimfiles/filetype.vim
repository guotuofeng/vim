if exists("did_load_filetypes")
  finish
endif

" refresh filetype detection when :file or :saveas is called
au BufFilePost * filetype detect 

augroup filetypedetect
  " Xaml, *.dui, *.ds
  au BufNewFile,BufRead *.xaml,*.dui,*.ds set filetype=xml
  au BufNewFile,BufRead *.targets,*.props set filetype=xml
  " fx 
  au BufNewFile,BufRead *.fx,*.fxh,*.fxc,*.hlsl set filetype=fx
  au BufNewFile,BufRead *.il	setf il
  au BufRead,BufNewFile *.txt setlocal ft=txt 

  " Turn on number for help files
  au FileType help setlocal nu 

  au BufNewFile,BufRead *.mm set filetype=objcpp
  au BufNewFile,BufRead *.m set filetype=objc
  au BufRead,BufNewFile *.aspx,*.asmx,*.ascx  set filetype=aspnet 
  au BufNewFile,BufRead CMakeLists.txt set filetype=cmake
augroup END

" See ftdetect/make.vim
" makefile.*
function! GetMyMakefileFold(lnum)
    let lvl = foldlevel(a:lnum-1)
    if getline(a:lnum) =~? '^!\s*if'
        "let n=lvl + 1
        "if n > 0
        "    return ">".n
        "else
        "    return ">1"
        "endif
        return "a1"
    elseif getline(a:lnum) =~? '^!\s*endif'
       " let n=lvl 
       " if n > 0
       "     return "<".n
       " endif
        return "s1"
    "elseif getline(a:lnum) =~ '!\s*else'
    "    return lvl + 1
    endif
    return '='
endfunction

augroup makefile
  au!
  au BufNewFile,BufRead makefile*,makefil0,makefiln,sources* set filetype=make
  au FileType make let b:match_words = '!\s*\(if\|ifdef\|ifndef\)\>:!\s*\(else\|elseif\)\>:!\s*endif\>'
  au FileType make set foldexpr=GetMyMakefileFold(v:lnum)
augroup END

au FileType vim setlocal shiftwidth=2

au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType xml set omnifunc=xmlcomplete#CompleteTags
"au FileType java set omnifunc=javacomplete#Complete
au FileType cs set omnifunc=syntaxcomplete#Complete 

augroup csharpfold
  au!

  au FileType cs set foldmethod=marker 
  au FileType cs set foldmarker={,}
  " au FileType cs set foldlevelstart=2
augroup END

"Java indent
au FileType java setlocal cinoptions+=:0,l1,t0,(s,u0,(0,W4

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunc

autocmd BufWrite *.py,*.cpp,*.c,*.h,*.java,*.cs :call DeleteTrailingWS()
