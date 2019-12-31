" Where to keep the snippets. While it would be preferrable to just use one
" absolute directory here, as the UltiSnips documentation indicates I can,
" that seems to fail when other plugins modify the
" g:UltiSnipsSnippetDirectories list to include themselves. vim-go is one
" example that does this.
"
" The documentation indicates I should not use a directory named 'snippets'.
let &runtimepath.="," . $HOME . "/home-dir/vim/runtime"
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" Improved snippet support.
Plug 'SirVer/ultisnips'

" I tried using these, but they don't match my expectations, so they are kind
" of annoying
"Plug 'honza/vim-snippets'

"
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
