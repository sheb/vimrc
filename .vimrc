syn on
colorscheme wombat
set nocompatible
set autoindent
set nobackup
set tabstop=4
set shiftwidth=4
set wildmenu
set encoding=utf-8
set expandtab
set hls
set nu

let Tlist_File_Fold_Auto_Close = 1

au BufNewFile,BufRead *.go setf go

filetype on
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType go map <F4> :!make test<CR>

" %% expand to the path of the current open file
cabbr <expr> %% expand('%:p:h')

" Pydoc help via <F2>
map <F2> :BufExplorer<CR>
map ;l :BufExplorer<CR>
" coding unicode python
map <F4> :0<CR>O# -*- coding: utf-8 -*-

" TlistToggle Open/Close via <F3>
map <F3> :TlistToggle<CR>
map <F5> :bd!<CR>
map <F7> <C-^>
map <F6> :w<CR>

map gt :exec("tag ".expand("<cword>"))<CR>
map \gt :split<CR>:exec("tag ".expand("<cword>"))<CR>


" Refresh tags
map <F8> :!sh reload_ctags.sh<CR>
" autocmd FileType python :!ctags -R .

" map ] `

"Python
autocmd BufNewFile,BufRead *.py inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<CR>
autocmd BufRead,BufNewFile *.py inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<CR>

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

"Press c-q insted of space (or other key) to complete the snippet
imap <C-q> <C-]>

set path+=templates
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

python << EOF

import time
import vim

def	insertDate():
	vim.current.line += time.strftime(" %d %B %Y")
EOF

winpos 654 36
set lines=50
set columns=150
