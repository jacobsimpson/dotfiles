Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap ,fb :Files %:p:h<CR>
nnoremap ,fl :Files .<CR>
" Make a mapping to do a search analogous to how vim searches when
" the * key is hit, but recursively in the file tree.
nnoremap ,* :Ag "<cword>"<CR>
vnoremap ,* :<C-u>call VisualStarSearchSet('/')<CR>:execute 'noautocmd Ag ' . @/ . ''<CR>
"
"" Make Ag easier to use.
"nnoremap <silent> ,g :Ag <C-r><C-w><CR>
"xnoremap <silent> ,g :<C-u>let cmd = "Ag " . functions#GetVisualSelection() <bar>
"                        \ call histadd("cmd",cmd) <bar>



