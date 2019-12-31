" Shows lines added or removed according to the version control system.
Plug 'mhinz/vim-signify'

" Signify is a plugin that adds signs to the gutter indicating that there are
" local changes.
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_realtime = 1
