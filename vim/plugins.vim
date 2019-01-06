source ~/home-dir/vim/plugins/colorscheme.vim
source ~/home-dir/vim/plugins/easymotion.vim

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
Plug 'bronson/vim-visual-star-search'


" Unite is a super flexible plugin, searches buffers and the like.
Plug 'Shougo/unite.vim'
" Support Unite with async operations.
Plug 'Shougo/vimproc.vim'

" Syntax and other language specific settings for many languages.
Plug 'sheerun/vim-polyglot'

" NERDTree - directory tree navigation in a Vim window.
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'

source ~/home-dir/vim/plugins/ultisnips.vim

" Git access from inside Vim.
Plug 'tpope/vim-fugitive'

" In Vim support for Silver Searcher.
Plug 'rking/ag.vim'

" Creates a nicer status line.
Plug 'bling/vim-airline'

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

" Vim Org Mode
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
Plug 'majutsushi/tagbar'

Plug 'ctrlpvim/ctrlp.vim'
Plug '~/home-dir/vim/ctrlp-projects'

"
" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
"Plug 'othree/eregex.vim'

source ~/home-dir/vim/plugins/neoterm.vim

" Vim OrgMode related plugins.
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/utl.vim'
Plug 'mattn/calendar-vim'


" ############################################################
" ################### Experimental Plugins ###################
"
" Can't remember what this plugin does. Guess it wasn't a big hit.
" Plug 'elubow/cql-vim'

Plug 'rhysd/vim-crystal'

Plug 'jrozner/vim-antlr'

" After a yank, the yanked text is highlighted in a different color to show
" what happened.
Plug 'machakann/vim-highlightedyank'

source ~/home-dir/vim/language/go.vim
source ~/home-dir/vim/language/java.vim
source ~/home-dir/vim/language/json.vim
source ~/home-dir/vim/language/lua.vim
source ~/home-dir/vim/language/markdown.vim
source ~/home-dir/vim/language/rust.vim
source ~/home-dir/vim/language/vim.vim
source ~/home-dir/vim/language.vim
