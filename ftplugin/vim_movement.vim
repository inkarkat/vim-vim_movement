" vim_movement.vim: Movement over VIM functions with ]m etc. 
"
" DEPENDENCIES:
"
" Copyright: (C) 2009 by Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"	001	12-Feb-2009	file creation

" Move around functions.
"
" This is duplicated from $VIMRUNTIME/ftplugin/vim.vim, using the (IMHO) correct
" mappings "move to method", not "move to paragraph". 
nnoremap <silent> <buffer> [m m':call search('^\s*fu\%[nction]\>', "bW")<CR>
vnoremap <silent> <buffer> [m m':<C-U>exe "normal! gv"<Bar>call search('^\s*fu\%[nction]\>', "bW")<CR>
nnoremap <silent> <buffer> ]m m':call search('^\s*fu\%[nction]\>', "W")<CR>
vnoremap <silent> <buffer> ]m m':<C-U>exe "normal! gv"<Bar>call search('^\s*fu\%[nction]\>', "W")<CR>
nnoremap <silent> <buffer> [M m':call search('^\s*endf*\%[unction]\>', "bW")<CR>
vnoremap <silent> <buffer> [M m':<C-U>exe "normal! gv"<Bar>call search('^\s*endf*\%[unction]\>', "bW")<CR>
nnoremap <silent> <buffer> ]M m':call search('^\s*endf*\%[unction]\>', "W")<CR>
vnoremap <silent> <buffer> ]M m':<C-U>exe "normal! gv"<Bar>call search('^\s*endf*\%[unction]\>', "W")<CR>

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
