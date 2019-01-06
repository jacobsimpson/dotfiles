" Load guard
if ( exists('g:loaded_ctrlp_projects_new') && g:loaded_ctrlp_projects_new )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_projects_new = 1

" NOTE: By experimentation, this little section is unnecessary. I don't know
" exactly what it is supposed to do (I mean adding my item to the ctrlp list),
" but when I leave it out, CtrlP seems to continue working.
"
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
let g:ctrlp_extensions = g:ctrlp_extensions + ['projects_new']


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
	\ 'init': 'ctrlp#projects#new#init()',
	\ 'accept': 'ctrlp#projects#new#accept',
	\ 'lname': 'List of projects and things',
	\ 'sname': 'projects_new',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#projects#new#enter()',
	\ 'exit': 'ctrlp#projects#new#exit()',
	\ 'opts': 'ctrlp#projects#new#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#projects#new#init()
  return [
    \ 'Go',
    \ 'Java',
    \ 'Vim Plugin in Lua',
  \ ]
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#projects#new#accept(mode, str)
	" For this example, just exit ctrlp and run help
	call ctrlp#exit()
  if (a:str == 'Go')
    call inputsave()
    let name = input('Enter name: ')
    call inputrestore()
    let full = $HOME . "/src/".name."/src/github.com/jacobsimpson/".name
    execute("!mkdir -p " . full)
    execute("cd " . full)
    let $GOPATH=$HOME."/src/".name
  elseif (a:str == 'Java')
    call inputsave()
    let name = input('Enter name: ')
    call inputrestore()
    let template = $HOME . "/home-dir/vim/ctrlp-projects/templates/Java"
    let project = $HOME . "/src/".name
    execute("!cp -R " . template . " " . project)
    execute("!mkdir -p ".project."/src/main/java/".name)
    execute("!mkdir -p ".project."/src/tests/java/".name)
    execute("cd " . project)
  else
    echo "Don't know how to make a new project for '".a:str."'."
  endif
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#projects#new#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#projects#new#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#projects#new#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#projects#new#id()
	return s:id
endfunction


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
