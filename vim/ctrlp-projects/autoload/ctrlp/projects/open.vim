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
let g:ctrlp_extensions = ['projects_open']

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
	\ 'init': 'ctrlp#projects#open#init()',
	\ 'accept': 'ctrlp#projects#open#accept',
	\ 'lname': 'List of projects and things',
	\ 'sname': 'projects_open',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#projects#open#enter()',
	\ 'exit': 'ctrlp#projects#open#exit()',
	\ 'opts': 'ctrlp#projects#open#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#projects#open#init()
  return split(globpath('~/src', '*'), '\n')
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#projects#open#accept(mode, str)
	" For this example, just exit ctrlp and run help
	call ctrlp#exit()
  execute('cd '.a:str)
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#projects#open#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#projects#open#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#projects#open#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#projects#open#id()
	return s:id
endfunction


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
