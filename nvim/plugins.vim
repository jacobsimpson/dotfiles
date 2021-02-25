source ~/dotfiles/nvim/plugins/easymotion.vim

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
Plug 'bronson/vim-visual-star-search'

Plug 'tpope/vim-surround'

source ~/dotfiles/nvim/plugins/nvim-lsp.vim

source ~/dotfiles/nvim/plugins/ultisnips.vim

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

source ~/dotfiles/nvim/plugins/signify.vim

" Strip trailing whitespace on save.
source ~/dotfiles/nvim/plugins/vim-better-whitespace.vim

" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
"Plug 'othree/eregex.vim'

source ~/dotfiles/nvim/plugins/fzf.vim

" After a yank, the yanked text is highlighted in a different color to show
" what happened.
Plug 'machakann/vim-highlightedyank'

" Adds the closing element whenever an opening element is inserted.
Plug 'Raimondi/delimitMate'

" ############################################################
" ################### Experimental Plugins ###################
"
Plug 'jrozner/vim-antlr'

source ~/dotfiles/nvim/plugins/treesitter.vim
source ~/dotfiles/nvim/plugins/neomake.vim

source ~/dotfiles/nvim/language/go.vim
source ~/dotfiles/nvim/language/java.vim
source ~/dotfiles/nvim/language/json.vim
source ~/dotfiles/nvim/language/lua.vim
source ~/dotfiles/nvim/language/typescript.vim
source ~/dotfiles/nvim/language/markdown.vim
source ~/dotfiles/nvim/language/rust.vim
source ~/dotfiles/nvim/language/vim.vim
source ~/dotfiles/nvim/language/make.vim
source ~/dotfiles/nvim/language.vim
