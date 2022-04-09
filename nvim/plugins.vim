" There is a very good chance this can be replaced with a telescope configuration.
" This command seems to supply the 'Buffers' command, which I have mapped to ,bl, which I use _a
" lot_.
" The ',bl' mapping is defined in init.vim. I've created a new mapping to use Telescope buffers
" instead.
"call SourceConfig("plugins/fzf.vim")

call SourceConfig("plugins/vim-test.vim")

"This was going to be a plugin I develop for note taking. However, then I found telekasten.
"Plug '~/src/nvim-cognisance'

" ############################################################
" ################### Experimental Plugins ###################
"
call SourceConfig("plugins/treesitter.vim")

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
