call SourceConfig("plugins/hop.vim")

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
Plug 'bronson/vim-visual-star-search'

Plug 'tpope/vim-surround'

call SourceConfig("plugins/nvim-lsp.vim")

call SourceConfig("/plugins/ultisnips.vim")

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

call SourceConfig("plugins/signify.vim")

" Strip trailing whitespace on save.
call SourceConfig("plugins/vim-better-whitespace.vim")

" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
"Plug 'othree/eregex.vim'

call SourceConfig("plugins/fzf.vim")

" After a yank, the yanked text is highlighted in a different color to show
" what happened.
Plug 'machakann/vim-highlightedyank'

" Adds the closing element whenever an opening element is inserted.
Plug 'Raimondi/delimitMate'

" ############################################################
" ################### Experimental Plugins ###################
"
Plug 'jrozner/vim-antlr'

Plug 'jasontbradshaw/pigeon.vim'
autocmd BufNewFile,BufRead *.peg set filetype=pigeon

call SourceConfig("plugins/treesitter.vim")
call SourceConfig("plugins/neomake.vim")

Plug 'famiu/bufdelete.nvim'

call SourceConfig("language/go.vim")
call SourceConfig("language/java.vim")
call SourceConfig("language/json.vim")
call SourceConfig("language/lua.vim")
call SourceConfig("language/typescript.vim")
call SourceConfig("language/markdown.vim")
call SourceConfig("language/rust.vim")
call SourceConfig("language/vim.vim")
call SourceConfig("language/make.vim")
call SourceConfig("language.vim")
