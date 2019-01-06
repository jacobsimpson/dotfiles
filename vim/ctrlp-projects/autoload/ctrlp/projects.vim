echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"

" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['projects']
"
" Where 'projects' is the name of the file 'projects.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'extension1',
"         \ 'extension2',
"         \ ]
let g:ctrlp_extensions = ['projects']

" Load guard
if ( exists('g:loaded_ctrlp_projects') && g:loaded_ctrlp_projects )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_projects = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#projects#init()',
	\ 'accept': 'ctrlp#projects#accept',
	\ 'lname': 'List of projects and things',
	\ 'sname': 'projects',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#projects#enter()',
	\ 'exit': 'ctrlp#projects#exit()',
	\ 'opts': 'ctrlp#projects#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#projects#init()
	let input = [
		\ 'one',
		\ 'two',
		\ 'three',
		\ 'four',
		\ 'five',
		\ 'six',
		\ ]
	return input
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#projects#accept(mode, str)
	" For this example, just exit ctrlp and run help
	call ctrlp#exit()
	echo "I'm going to switch to the project ".a:str
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#projects#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#projects#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#projects#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#projects#id()
	return s:id
endfunction


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
