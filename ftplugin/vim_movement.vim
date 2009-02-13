" vim_movement.vim: Movement over VIM functions with ]m etc. 
"
" DEPENDENCIES:
"   - custommotion.vim autoload script. 
"
" Copyright: (C) 2009 by Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"	001	12-Feb-2009	file creation
"				Extracted mapping scheme into general helper
"				function. 

"			Move around VIM functions: 
"]m			Go to [count] next start of a function. 
"]M			Go to [count] next end of a function. 
"[m			Go to [count] previous start of a function. 
"[M			Go to [count] previous end of a function. 

" This is duplicated from $VIMRUNTIME/ftplugin/vim.vim, using the (IMHO) correct
" mappings "move to method", not "move to paragraph". 
call custommotion#MakeBracketMotionWithCountSearch('<buffer>', 'm', 'M', '^\s*fu\%[nction]\>', '^\s*endf*\%[unction]\>', 0)

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
