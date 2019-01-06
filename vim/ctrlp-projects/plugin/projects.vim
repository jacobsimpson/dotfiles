" Create a command to directly call the new search type
"
command! CtrlPOpenProject call ctrlp#init(ctrlp#projects#open#id())
map <C-M-O> :CtrlPOpenProject<CR>

command! CtrlPNewProject call ctrlp#init(ctrlp#projects#new#id())
map <C-M-N> :CtrlPNewProject<CR>
