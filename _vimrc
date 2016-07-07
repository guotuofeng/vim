" vim: foldmethod=marker foldmarker={,}{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Mike Guo <guotuofeng@yahoo.com.cn>
" Version: 5.0
" Last Change: 2012/07/13 10:43:58
" 
" Fixed (win32 compatible) by: Mike Guo
" This vimrc file is tested on platforms on win32 and vim7.3
"
" Tip:
" If you find anything that you can't understand than do this:
" help keyword OR helpgrep keyword
" How to show the value of runtimepath: echo &rtp
"
" Example:
" Go into command-line mode and type helpgrep nocompatible, ie.
" :helpgrep nocompatible
" then press <leader>qo to see the results, or :botright cw
" Section:
"       -> General
"       -> Mappings
"       -> Autocmd
"       -> Customcmd
"       -> Plugin
"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "get out of VI's compatible mode

" Use pathogen to easily modify the runtime path to include all plugins under the ~/.vim/bundle directory
silent! call pathogen#infect()

" encoding
if has("multi_byte")
  set encoding=utf-8

  if &termencoding == ""
    set termencoding=&encoding
  endif

  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
endif

" language
set langmenu=zh_CN.utf-8
language messages zh_CN.utf-8

" Sets how many lines of history VIM has to remember, default 50
set history=400

filetype plugin indent on " Enable filetype plugin
syntax on " enable syntax

" Set to auto read when a file is changed from the outside
set autoread

" Set mapleader
let g:mapleader = ","
let g:maplocalleader = "_"
noremap \ ,

" Always display line numbers and ruler
set number
set ruler

"The commandbar is 2 high
set cmdheight=2

" allow buffer switching without saving
set hidden

" Allow backspacing over indent, eol, and the start of an insert
set backspace=eol,start,indent

" backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Ignore case when searching by default
set ignorecase
set smartcase
"set infercase " Keep current case on autocompletion

" Highlight search and display incremental matches
set hlsearch
set incsearch

"Don't redraw while executing macros 
set lazyredraw

"show matching bracets
set showmatch

" show whitespace and tab characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set list

set nosol "nostartofline

" Always show the status line
set laststatus=2

if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%t\ " file name
  set titlestring+=%h%m%r%w " flag
  "set titlestring+=\ -\ %{v:progname} " program name
  set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}  " working directory
endif

set fo-=t "remove auto format text
set textwidth=120
set colorcolumn=+1
set linebreak   "Wrap lines at convenient points
set nowrap

" Tabs
set smarttab
set expandtab

set tabstop=4
set shiftwidth=4
set softtabstop=4

" Indent
set autoindent
set smartindent
" c-indent options
"set cinkeys-=0#
set cinoptions=:0,l1,g0,t0,(s,u0,(0,W4,j1,N-s

" Completion
set wildmenu
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*.pyc,*.swp,*.zip,*.exe,*.so
set completeopt=longest,menu,preview
" ignore the annoying scan for header files
set complete-=i

" Fonts
if has("mac") || has("macunix")
  set gfn=Monaco:h12
  set shell=/bin/bash
elseif has("win32")
  set gfn=DejaVu_Sans_Mono:h11,Consolas:h10
  " set gfn=Consolas:h10
  set gfw=Yahei_Mono:h11
elseif has ("unix")
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

" scroll
set scrolloff=2

" Fold
set foldcolumn=1

if has("gui_running")
  set guioptions-=a
  set guioptions+=b
  set guioptions-=T
  set guioptions-=e
  set guioptions-=m "Hide menu bar

  " The following command must be placed before the colo command
  " autocmd ColorScheme * hi Search guifg=#fffffF guibg=#0099ff
  set background=dark
  try
    let g:solarized_contrast="high"
    let g:solarized_italic=0
    colo solarized
    " colo molokai
  catch
    "colo molokai
    colo desert
  endtry
  if has("win32")
    "start gvim maximized
    if has("autocmd")
      au GUIEnter * simalt ~x
    endif
  endif

  if has('mac')
    set transparency=15
  endif

  " Disable acces to menu using alt key
  set winaltkeys=no
else
  if &term=="win32"
    set t_Co=256
    " set background=light
    " colo moria
    colo solarized
  else
    set t_Co=256
    colo molokai
  endif
endif

" Highlight current line, default is off comment it
" set nocursorline

" standard file type
if has("win32")
  set ffs=dos,unix,mac
else
  set ffs=unix,dos,mac
endif

" File, backup and undo
set nobackup
set nowritebackup
set noswapfile

if !exists("$temp") && has("unix")
  let $temp="/tmp"
endif

set directory=$temp
set backupdir=$temp

set undodir=~/vimfiles/undodir,$temp
set undofile

" Session
set sessionoptions-=options
set sessionoptions-=localoptions
set sessionoptions-=blank

set t_vb=

" Not clear the screen after exit
set t_ti=
set t_te=
set tm=500 "timeoutlen

if exists("&ambiwidth")
  set ambiwidth=double
endif
"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mswin{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
  source $VIMRUNTIME/mswin.vim
  "clear the keymodel in order to let Ctrl-F, Ctrl-B select the text in visual mode
  set km=
  " CTRL-C shortcut on normal mode
  nnoremap <C-C> "+y
  " we want to use the C-Y/C-E in insert mode
  iunmap <C-Y>

  unmap <C-Y>
  nunmap <C-a>
endif
"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings {
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix window
" Do :help cope if you are unsure what cope is. It's super useful!
" quickfix ref shorcut :cNext :cprevious
nnoremap <leader>qo :botright copen<CR>
nnoremap <leader>qc :call setqflist([])<CR>
nmap <F4> :cnext<CR>
nmap <S-F4> :cprevious<CR>

" Command mode
" Smart mappings on the command line
cno $h e ~/
if !has("unix")
  cno $d e ~/Desktop/
endif
cno $j e ./
cno $c e <C-R>=expand("%:p:h")<CR>
cno $n expand('%:p')
cno $p <C-R>=getcwd()<CR>
" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-D> <Delete>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-d> <S-right><Delete>
cnoremap <C-g> <C-c>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-K> <C-U>

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if (has("win16") || has("win32")) && !&shellslash
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if (has("win16") || has("win32")) && !&shellslash
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

" Navigation
nnoremap j gj
nnoremap k gk

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>
nnoremap JJ <Nop>

"Remap VIM 0
nnoremap 0 ^
vnoremap 0 ^
noremap <Home> g0
noremap <End> g$

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tags
set tags=tags;/

nnoremap <leader>tn :ptnext<CR>
nnoremap <leader>tp :ptNext<CR>

" Use the arrows to something usefull
map <c-right> :bn<cr>
map <c-left> :bp<cr>

" Tab configuration
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Close all the buffers
map <leader>ba :%bd!<cr>

nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>d "*d
vnoremap <leader>d "*d
vnoremap <leader>p "*p

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Bubble single lines, they depends unimpair plugin
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" Fast editing of the .vimrc
map <leader>ev :e! $MYVIMRC<cr>

" clear search highlight
map <silent> <leader><cr> :noh<cr>

" Spell checks
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=

"Remove the Windows ^M
noremap <Leader>rm mmHmt:%s/<C-Q><cr>//ge<cr>'tzt'm

"Remove duplicated empty lines: http://vim.wikia.com/wiki/Power_of_g
map QE :%s/^\s*$\n^\s*$//g<CR>
map QU :g/^\(.*\)\ze\n\%(.*\n\)*\1$/d<CR>

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

"Remove indenting on empty line
map <Leader>ri :%s/\s*$//g<cr>:noh<cr>''

map <leader>bb :cd ..<cr>
map <leader>pp :setlocal paste!<cr>

" Diff shortcuts 
noremap <S-F1> :browse vert diffsplit<CR> 

" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yy :let @*=expand("%:p")<cr>:echo "Copied file path to clipboard"<cr>
" Copy current filename to system clipboard
nnoremap <Leader>yf :let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>
" Copy current buffer path without filename to system clipboard
nnoremap <Leader>yd :let @*=expand("%:p:h")<cr>:echo "Copied file directory to clipboard"<cr>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>ew :e %%
map <leader>es :sp %%

" cnoreabbrev json %!python -m json.tool
" copied from http://stackoverflow.com/questions/15108622/how-to-yank-a-code-block-without-folded-content
":g/^/if line('.')==foldclosed('.') || foldclosed('.')==-1|y Z|endif<CR>
nnoremap <leader>cf :g/^/if line('.')==foldclosed('.') <Bar><Bar> foldclosed('.')==-1<Bar>y Z<Bar>endif<CR>

"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc_commands
  autocmd!

  " Copied from http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window. Protect against
  " screwing up folding when switching between windows.
  " autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  " autocmd InsertLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd InsertEnter * set noignorecase
  autocmd InsertLeave * set ignorecase

  " When vimrc is edited, reload it
  "autocmd! BufWritePost $MYVIMRC source $MYVIMRC 

  autocmd BufReadPost,FileReadPost,BufNewFile * normal zR

  "Comment for C like language abbrevations for comments
  autocmd BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css ino $c /**<cr> **/<esc>O
augroup END
"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Customcmd{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Redirect to clipboard.
" copied from http://derekwyatt.org/
function! RedirToClipboardFunction(cmd,...)
  let cmd = a:cmd . " " . join(a:000, " ")
  redir @z>
  exe cmd
  redir END
  let @*=@z
endfunction

command! -complete=command -nargs=+ RedirToClipboard
      \ silent! call RedirToClipboardFunction(<f-args>)

cab rc RedirToClipboard

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c/cpp
let g:c_gnu=1

"  Java.vim
let g:java_comment_strings=1
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_highlight_functions="style"
let g:java_space_errors=1
let g:java_mark_braces_in_parens_as_errors=1

" Xml.vim
" Turn on the following line will break Csharp's syntax
" let g:xml_syntax_folding=1
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

let g:sql_type_default = "sqlserver"

"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load the matchit plugin.
runtime macros/matchit.vim

"BufExplorer 
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy = "name"
let g:bufExplorerShowNoName=1

"netrw
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize=20

"function! ToggleVExplorer()
"  if exists("t:expl_buf_num")
"      let expl_win_num = bufwinnr(t:expl_buf_num)
"      if expl_win_num != -1
"          let cur_win_nr = winnr()
"          exec expl_win_num . 'wincmd w'
"          close
"          exec cur_win_nr . 'wincmd w'
"          unlet t:expl_buf_num
"      else
"          unlet t:expl_buf_num
"      endif
"  else
"      exec '1wincmd w'
"      Vexplore
"      let t:expl_buf_num = bufnr("%")
"  endif
"endfunction

" Toggle Vexplore with Ctrl-E
"map <silent> <C-E> :call ToggleVExplorer()<CR>

"NERDTree
"let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeMouseMode=3
" let g:NERDTreeQuitOnOpen=1

nmap <leader>nn :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

"MRU 
let MRU_Max_Entries = 400
map <leader>fr :MRU<CR>

"noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <C-F12> :call GenCTagsAll()<CR>

"let g:tagbar_left = 1
map <leader>t :TagbarToggle<cr>

" tagbar settings for language
let g:tagbar_type_ps1 = { 'ctagstype' : 'powershell', 'kinds' : [ 'd:definition', ], 'sort' : 0 }

" Taglist language extenstion for objc
" let tlist_objc_settings = 'objc;i:interface;c:class;m:method;p:property'

"Taglist extension for objcpp
" let tlist_objcpp_settings = 'objcpp;i:interface;c:class;m:method;p:property'

" Tagbar language extenstion for objc
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'objc',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

" Tagbar extension for objcpp
let g:tagbar_type_objcpp = {
    \ 'ctagstype' : 'objcpp',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" gen ctags for all languages
function! GenCTagsAll()
  "Command is:
  " '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c,c++,c\\#,python,vim,html,lua,javascript,java --langmap=c++:+.inl,c:+.fx,c:+.fxh,c:+.hlsl,c:+.vsh,c:+.psh,c:+.cg,c:+.shd,javascript:+.as .'
  let cwd = getcwd()
  let tagfile = cwd . "\\tags"
  let tagfile = "c:\\tags"
  " let cmd = "!ctags -f \"" . tagfile . "\" -R --c++-kinds=+p --fields=+iaS --extra=+q "
  " " The following line will generate tags only for the languages in the list
  " "let cmd = cmd . "--languages=c,c++,c\\#,python,vim,html,lua,javascript,java "
  " let cmd = cmd . "--langmap=c++:+.inl,c:+.fx.fxh.hlsl.vsh.psh.cg.shd,javascript:+.as "
  " let cmd = cmd . "."
  " silent! execute cmd
  " let cmd = "!ctags -f \"" . tagfile ."\" -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=c++ \"" . cwd . "\""
  let cmd = "!ctags -R ."
  execute cmd
endfunction

" cscope
if has('cscope')
  set csprg=cscope.exe
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

function! GenCscopeTag()
  if(executable('cscope') && has("cscope") )
    silent! execute "!dir /s /b *.c,*.cpp,*.h,*.hpp,*.inl > cscope.files"
    silent! execute "!cscope -b"
    if filereadable("cscope.out")
      silent! execute "cs add cscope.out"
    endif
  endif
endf

noremap <S-F12> :call GenCscopeTag()<CR>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocsverb " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set csverb
  endif
endfunction
au BufEnter /* call LoadCscope()

"SuperTab
" The following two lines are to reverse the TAB selection order
let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" The following setting will cause vim deadlock
"let g:SuperTabLongestHighlight=1

let g:SuperTabLongestEnhanced=1
"let g:SuperTabCrMapping=0

" CtrlP
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
if has("win32")
  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
else
  let g:ctrlp_user_command = 'find %s -type f'
endif

"Alternate
map <F12> :A<CR>
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC,m,mm"
let g:alternateExtensions_H="cpp,mm,c,m"
let g:alternateExtensions_hpp="cpp,mm,c,m"
let g:alternateExtensions_m="h"
let g:alternateExtensions_mm="h,hpp"

" Snipmate
let g:snips_author = 'Mike Guo'

" EasyMotion
let g:EasyMotion_leader_key="'"

" YankRing
if has("win32")
  let g:yankring_clipboard_monitor = 0
endif
let g:yankring_window_auto_close = 0
let g:yankring_zap_keys = 'f t'

"Space
let g:space_no_character_movements = 1 " disable the movement in order to make snipMate work correctly
let g:space_no_search = 1
let g:space_no_jump = 1

" delimitMate
let g:delimitMate_expand_cr = 0
au FileType xml,html let b:delimitMate_matchpairs = "(:),[:],{:}"

" omnicpp_complete
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:OmniCpp_SelectFirstItem=2 "Select the first item in pop-up

" Session
let g:session_autoload=0
let g:sessionman_save_on_exit=0

" SourceDepot 
if has("win32")
  map <silent> <leader>se :call SDCheckOut()<cr>
  map <silent> <leader>sr :call SDRevertChanges()<cr>
  map <silent> <Leader>so :call SDdiffopened()<cr>
endif

" tcomment
let g:tcomment_types={
  \'java' : "// %s",
  \}

" airline
let g:airline#extensions#branch#enabled = 0

" neocomplete
if has("lua")
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  " let g:neocomplete#enable_smart_case = 1

  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
  endfunction

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif

  let g:neocomplete#enable_fuzzy_completion = 0

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

"}

if filereadable(expand("~/_vimrc.local"))
  source ~/_vimrc.local
endif
