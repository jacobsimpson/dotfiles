
" Unite is a super flexible plugin, searches buffers and the like.
NeoBundle 'Shougo/unite.vim'
" Support Unite with async operations.
NeoBundle 'Shougo/vimproc.vim'

" Syntax and other language specific settings for many languages.
NeoBundle 'sheerun/vim-polyglot'

" NERDTree - directory tree navigation in a Vim window.
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'tpope/vim-surround'

" The easy motion system, where you type an activating letter, then the letter
" you see on the screen, then the disambiguating letter that appears over the
" letter you see. Move anywhere on the screen in 3 keys.
NeoBundle 'easymotion/vim-easymotion'

" Select with :color jellybeans
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'

" Snippet support.
"NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

" Improved snippet support.
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" Git access from inside Vim.
NeoBundle 'tpope/vim-fugitive'

" In Vim support for Silver Searcher.
NeoBundle 'rking/ag.vim'

" When a visual selection is active, pressing * or # will do a file
" search of the selection, instead of a file search of the word under the
" cursor.
NeoBundle 'bronson/vim-visual-star-search'

" Creates a nicer status line.
NeoBundle 'bling/vim-airline'

" In Vim support for some standard Unix commands. I'm mostly interested in
" Move.
NeoBundle 'tpope/vim-eunuch'

" These two plugins are for Language Server Protocal integration.
NeoBundle 'prabirshrestha/async.vim'
NeoBundle 'prabirshrestha/vim-lsp'

" Add better text object handling, things like ci" or ci(
NeoBundle 'wellle/targets.vim'

" Strip trailing whitespace on save.
NeoBundle 'ntpeters/vim-better-whitespace'

" Vim Org Mode
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'vim-scripts/utl.vim'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'majutsushi/tagbar'

if has('nvim')

" Golang development.
NeoBundle 'fatih/vim-go'
NeoBundle 'ctrlpvim/ctrlp.vim'

" Extended regular expression support for / and ? searches.
" Haven't figured out how to make it work incrementally.
NeoBundle 'othree/eregex.vim'

" Vim OrgMode related plugins.
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'vim-scripts/utl.vim'
NeoBundle 'mattn/calendar-vim'

NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'

" ############################################################
" ################### Experimental Plugins ###################
"
" Can't remember what this plugin does. Guess it wasn't a big hit.
" NeoBundle 'elubow/cql-vim'

NeoBundle 'rhysd/vim-crystal'

NeoBundle 'jrozner/vim-antlr'

NeoBundle 'kassio/neoterm'

" After a yank, the yanked text is highlighted in a different color to show
" what happened.
NeoBundle 'machakann/vim-highlightedyank'
