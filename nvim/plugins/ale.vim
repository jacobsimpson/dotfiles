Plug 'dense-analysis/ale'

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
" Make the gutters visible always.
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt'],
\}
inoremap <silent><expr><TAB>
    \ pumvisible() ? "\<C-n>" : "\<TAB>"
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'rust': ['analyzer', 'cargo', 'rls', 'rustc'],
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Map movement through errors without wrapping.
nmap <silent> <A-k> <Plug>(ale_previous)
nmap <silent> <A-j> <Plug>(ale_next)
