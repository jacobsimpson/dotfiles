source ~/home-dir/vim/plugins/colorscheme.vim
source ~/home-dir/vim/plugins/easymotion.vim

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
Plug 'bronson/vim-visual-star-search'

" Unite is a super flexible plugin, searches buffers and the like.
" Stopped using this in favor of fzf, which seems to do the things I want to
" do even better.
"Plug 'Shougo/unite.vim'
" Support Unite with async operations.
"Plug 'Shougo/vimproc.vim'

" Syntax and other language specific settings for many languages.
Plug 'sheerun/vim-polyglot'

" NERDTree - directory tree navigation in a Vim window.
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'

source ~/home-dir/vim/plugins/ultisnips.vim

" Git access from inside Vim.
Plug 'tpope/vim-fugitive'
"autocmd Filetype gitcommit cnoremap <silent> <buffer> wq bd<CR>

" Creates a nicer status line.
"Plug 'bling/vim-airline'

" In Vim support for some standard Unix commands. I'm mostly interested in
" Move.
Plug 'tpope/vim-eunuch'

" These two plugins are for Language Server Protocal integration.
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" Add better text object handling, things like ci" or ci(
Plug 'wellle/targets.vim'

source ~/home-dir/vim/plugins/signify.vim

" Strip trailing whitespace on save.
Plug 'ntpeters/vim-better-whitespace'

" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
"Plug 'othree/eregex.vim'

source ~/home-dir/vim/plugins/neoterm.vim

source ~/home-dir/vim/plugins/fzf.vim

" ############################################################
" ################### Experimental Plugins ###################
"
Plug 'jrozner/vim-antlr'

" After a yank, the yanked text is highlighted in a different color to show
" what happened.
Plug 'machakann/vim-highlightedyank'

Plug 'neomake/neomake'

source ~/home-dir/vim/language/go.vim
source ~/home-dir/vim/language/java.vim
source ~/home-dir/vim/language/json.vim
source ~/home-dir/vim/language/lua.vim
source ~/home-dir/vim/language/typescript.vim
source ~/home-dir/vim/language/markdown.vim
source ~/home-dir/vim/language/rust.vim
source ~/home-dir/vim/language/vim.vim
source ~/home-dir/vim/language/make.vim
source ~/home-dir/vim/language.vim
