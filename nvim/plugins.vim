source ~/home-dir/nvim/plugins/easymotion.vim

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
Plug 'bronson/vim-visual-star-search'

Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lsp'

source ~/home-dir/nvim/plugins/ultisnips.vim

" Git access from inside Vim.
Plug 'tpope/vim-fugitive'
"autocmd Filetype gitcommit cnoremap <silent> <buffer> wq bd<CR>

" Creates a nicer status line.
"Plug 'bling/vim-airline'

" In Vim support for some standard Unix commands. I'm mostly interested in
" Move.
Plug 'tpope/vim-eunuch'

"" These two plugins are for Language Server Protocal integration.
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

" Add better text object handling, things like ci" or ci(
Plug 'wellle/targets.vim'

source ~/home-dir/nvim/plugins/signify.vim

" Strip trailing whitespace on save.
source ~/home-dir/nvim/plugins/vim-better-whitespace.vim

" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
"Plug 'othree/eregex.vim'

source ~/home-dir/nvim/plugins/fzf.vim

" ############################################################
" ################### Experimental Plugins ###################
"
Plug 'jrozner/vim-antlr'

" After a yank, the yanked text is highlighted in a different color to show
" what happened.
Plug 'machakann/vim-highlightedyank'

Plug 'neomake/neomake'

source ~/home-dir/nvim/language/go.vim
source ~/home-dir/nvim/language/java.vim
source ~/home-dir/nvim/language/json.vim
source ~/home-dir/nvim/language/lua.vim
source ~/home-dir/nvim/language/typescript.vim
source ~/home-dir/nvim/language/markdown.vim
source ~/home-dir/nvim/language/rust.vim
source ~/home-dir/nvim/language/vim.vim
source ~/home-dir/nvim/language/make.vim
source ~/home-dir/nvim/language.vim
