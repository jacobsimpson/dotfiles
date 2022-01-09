call SourceConfig("plugins/hop.vim")

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
Plug 'bronson/vim-visual-star-search'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call SourceConfig("plugins/nvim-lsp.vim")

" Snippet support. I've never been really good at using this, but it seems
" like a good idea.
call SourceConfig("/plugins/vsnip.vim")

" Git access from inside Vim.
Plug 'tpope/vim-fugitive'
"autocmd Filetype gitcommit cnoremap <silent> <buffer> wq bd<CR>

" In Vim support for some standard Unix commands. I'm mostly interested in
" Move.
Plug 'tpope/vim-eunuch'

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

" Adds a matching closing element whenever an opening element is inserted, for a list of elements
" that commonly occur in pairs.
call SourceConfig("plugins/nvim-autopairs.vim")

call SourceConfig("plugins/vim-test.vim")

Plug 'jacobsimpson/nvim-editconfig'

" ############################################################
" ################### Experimental Plugins ###################
"
Plug 'hashivim/vim-terraform'

" Overrides the 'delete' operations (d, c, etc) so that they don't put the deleted text in the
" default buffer.
" NOTE: Although this seems useful, in practice I am commonly moving text from one place to another
" and depend on the 'delete-to-buffer' behavior. Sometimes, I want to be able to delete or edit and
" then paste. Maybe if there was a way that only explicit yanks were duplicated to a different
" buffer (z?), then the default buffer would maintain it's current behavior, but the last yanked
" text would always be available.
"Plug 'svermeulen/vim-cutlass'

Plug 'jrozner/vim-antlr'

Plug 'jasontbradshaw/pigeon.vim'
autocmd BufNewFile,BufRead *.peg set filetype=pigeon

" Should cause the current block to be brighter and the surrounding code
" to be dimmed.
call SourceConfig("plugins/twilight.vim")

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
