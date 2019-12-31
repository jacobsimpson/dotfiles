" Load guard
if ( exists('g:loaded_ctrlp_projects_scratch') && g:loaded_ctrlp_projects_scratch )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_projects_scratch = 1

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
if !exists('g:ctrlp_extensions')
    let g:ctrlp_extensions = []
endif
let g:ctrlp_extensions = g:ctrlp_extensions + ['projects_scratch']

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
	\ 'init': 'ctrlp#projects#scratch#init()',
	\ 'accept': 'ctrlp#projects#scratch#accept',
	\ 'lname': 'List of projects and things',
	\ 'sname': 'projects_scratch',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#projects#scratch#enter()',
	\ 'exit': 'ctrlp#projects#scratch#exit()',
	\ 'opts': 'ctrlp#projects#scratch#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#projects#scratch#init()
  let g:ctrlp_projects_scratch_type = ''
  return ['Java', 'Go', 'Lua']
endfunction


" It is unclear to me if there is a way to return a value from CtrlP
" representing what was selected from the list, so I added this global
" variable. It will be blank when nothing was selected (if the user Ctrl-C
" cancelled out of the list) and will contain the selected value if the user
" selected an item. This variable should be set to the appropriate Vim filetype
" value. So, open a `.java` file, then `:set ft` to see what the string looks
" like, then use that in this variable.
let g:ctrlp_projects_scratch_type = ''

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#projects#scratch#accept(mode, str)
    call ctrlp#exit()
    if a:str ==# 'Go'
        call language#ScratchByName('go')
    elseif a:str ==# 'Java'
        call language#ScratchByName('java')
    elseif a:str ==# 'Lua'
        call language#ScratchByName('lua')
    endif
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#projects#scratch#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#projects#scratch#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#projects#scratch#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#projects#scratch#id()
	return s:id
endfunction


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
