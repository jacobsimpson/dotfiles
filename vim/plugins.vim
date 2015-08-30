
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'Shougo/neobundle.vim'

    " My Bundles here:
    " Refer to |:NeoBundle-examples|.
    " Note: You don't set neobundle setting in .gvimrc!

    " Unite is a super flexible plugin, searches buffers and the like.
    NeoBundle 'Shougo/unite.vim'
    " Support Unite with async operations.
    NeoBundle 'Shougo/vimproc.vim'

    " Syntax and other language specific settings for many languages.
    NeoBundle 'sheerun/vim-polyglot'

    " NERDTree - directory tree navigation in a Vim window.
    NeoBundle 'scrooloose/nerdtree'

    NeoBundle 'tpope/vim-surround'

    " Select with :color jellybeans
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'tomasr/molokai'

    " Snippet support.
    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'

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
call neobundle#end()

