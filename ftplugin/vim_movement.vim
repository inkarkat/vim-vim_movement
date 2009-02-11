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

function! s:CountSearch( mode, ... )
    normal! m'
    if a:mode ==# 'v'
	normal! gv
    endif

    for l:i in range(1, v:count1)
	if ! call('search', a:000)
	    " Ring the bell to indicate that no further match exists. This is
	    " unlike the old vi-compatible motions, but consistent with newer
	    " movements like ]s. 
	    "
	    " As long as this mapping does not exist, it causes a beep in both
	    " normal and visual mode. This is easier than the customary "normal
	    " \<Esc>", which only works in normal mode. 
	    execute "normal \<Plug>RingTheBell"

	    return
	endif
    endfor

    " Open the fold at the final search result. This makes the search work like
    " the built-in motions, and avoids that some visual selections get stuck at
    " a match inside a closed fold. 
    normal! zv
endfunction

" Move around functions.
"
" This is duplicated from $VIMRUNTIME/ftplugin/vim.vim, using the (IMHO) correct
" mappings "move to method", not "move to paragraph". 
" It also enhances the original mappings so that a [count] can be specified, and
" folds at the found search position are opened. 
nnoremap <silent> <buffer> [m :<C-U>call <SID>CountSearch('n', '^\s*fu\%[nction]\>', "bW")<CR>
vnoremap <silent> <buffer> [m :<C-U>call <SID>CountSearch('v', '^\s*fu\%[nction]\>', "bW")<CR>
nnoremap <silent> <buffer> ]m :<C-U>call <SID>CountSearch('n', '^\s*fu\%[nction]\>', "W")<CR>
vnoremap <silent> <buffer> ]m :<C-U>call <SID>CountSearch('v', '^\s*fu\%[nction]\>', "W")<CR>
nnoremap <silent> <buffer> [M :<C-U>call <SID>CountSearch('n', '^\s*endf*\%[unction]\>', "bW")<CR>
vnoremap <silent> <buffer> [M :<C-U>call <SID>CountSearch('v', '^\s*endf*\%[unction]\>', "bW")<CR>
nnoremap <silent> <buffer> ]M :<C-U>call <SID>CountSearch('n', '^\s*endf*\%[unction]\>', "W")<CR>
vnoremap <silent> <buffer> ]M :<C-U>call <SID>CountSearch('v', '^\s*endf*\%[unction]\>', "W")<CR>

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
