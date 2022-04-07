" Strip trailing whitespace on save.
call SourceConfig("plugins/vim-better-whitespace.vim")

" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
"Plug 'othree/eregex.vim'

" There is a very good chance this can be replaced with a telescope configuration.
call SourceConfig("plugins/fzf.vim")

" Adds a matching closing element whenever an opening element is inserted, for a list of elements
" that commonly occur in pairs.
call SourceConfig("plugins/nvim-autopairs.vim")

call SourceConfig("plugins/vim-test.vim")

"This was going to be a plugin I develop for note taking. However, then I found telekasten.
"Plug '~/src/nvim-cognisance'

" ############################################################
" ################### Experimental Plugins ###################
"
call SourceConfig("plugins/telekasten.vim")

" Overrides the 'delete' operations (d, c, etc) so that they don't put the deleted text in the
" default buffer.
" NOTE: Although this seems useful, in practice I am commonly moving text from one place to another
" and depend on the 'delete-to-buffer' behavior. Sometimes, I want to be able to delete or edit and
" then paste. Maybe if there was a way that only explicit yanks were duplicated to a different
" buffer (z?), then the default buffer would maintain it's current behavior, but the last yanked
" text would always be available.
"Plug 'svermeulen/vim-cutlass'

" Should cause the current block to be brighter and the surrounding code
" to be dimmed.
call SourceConfig("plugins/twilight.vim")

call SourceConfig("plugins/treesitter.vim")
call SourceConfig("plugins/neomake.vim")

call SourceConfig("plugins/lualine.nvim.vim")

call SourceConfig("plugins/nvim-cmp.vim")

call SourceConfig("language/go.vim")
call SourceConfig("language/java.vim")
call SourceConfig("language/json.vim")
call SourceConfig("language/lua.vim")
call SourceConfig("language/sql.vim")
call SourceConfig("language/typescript.vim")
call SourceConfig("language/markdown.vim")
call SourceConfig("language/rust.vim")
call SourceConfig("language/vim.vim")
call SourceConfig("language/make.vim")
call SourceConfig("language.vim")
