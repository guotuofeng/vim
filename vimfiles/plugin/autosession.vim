"============================================================================
" File:   autosession.vim
" Author: Mike Guo (myguo@microsoft.com)
" Briefs: Auto save/load last session
" Last Change: 2011/04/10 14:37:26
"
" Note: 
" Copied from http://vim.wikia.com/wiki/Go_away_and_come_back
" Then modified by myguo@microsoft.com
" Options: 
"       g:als_session_dir
"           The customized session directory. By default it is empty. If it is
"           empty, "$HOME/vimfiles/sessions" will be used as the session directory
"       g:als_session_file
"           The customized session file name used by auto save/load. By
"           default is empty. If it is empty, ".last_session.vim" will be used
"           as the session file.
"
"       g:session_autoload
"           Flag to indicate whether auto load last saved session after
"           starting vim. By default: 1. If it is 0, you can use <Leader>l to
"           load the last session.
"
if exists("loaded_autosession")
  finish
endif

let loaded_autosession=1

if exists("g:als_session_dir")
  let s:session_dir  = g:als_session_dir
else
  if has("win32")
    let s:session_dir = $HOME . "/vimfiles"
  else
    let s:session_dir = $HOME . "/.vim"
  endif
endif

if exists("g:als_session_file")
  let s:session_file = g:als_session_file
else
  let s:session_file = ".last_session.vim"
endif

if !exists("g:session_autoload")
  let g:session_autoload=1
endif

let s:session_filepath = s:session_dir . "/" . s:session_file

" If you omit 'options' from 'sessionoptions', you might want to use nested
" flag from VimEnter autocmd. SYNTAX HIGHLIGHTING AND MAPPINGS might not be
" restored otherwise. 
"
" Creates a session
function! MakeSession()
  if (filewritable(s:session_dir) != 2)
    if exists("*mkdir")
      call mkdir(s:session_dir, "p")
    else
      if has("win32")
        exe 'silent !mkdir ' . s:session_dir
      else
        exe 'silent !mkdir -p ' . s:session_dir
      endif
    endif
    redraw!
  endif
  exe "mksession! " . s:session_filepath
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    if (filereadable(s:session_filepath))
      exe 'source ' s:session_filepath
    else
      echo "No session loaded."
    endif
  endif
endfunction

augroup als_AutoLoadSession
  au!
  au VimLeave * :call MakeSession()
  if g:session_autoload
    au VimEnter * nested :call LoadSession()
  else
    map <Leader>l :call LoadSession()<CR>
  endif
augroup END

