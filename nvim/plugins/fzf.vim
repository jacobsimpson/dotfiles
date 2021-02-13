Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Put the preview window above the search list, full width, height 40% of fzf
" popup window.
let g:fzf_preview_window = ['up:40%', 'ctrl-/']


" Customization to search the starting from a specified directory.
" https://github.com/junegunn/fzf.vim/issues/27
"
" AgIn: Start ag in the specified directory
"
" e.g.
"   :AgIn .. foo
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

nnoremap ,fb :Files %:p:h<CR>
nnoremap ,fu :Files %:p:h/../<CR>
nnoremap ,fl :Files .<CR>

function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" Make a mapping to do a search analogous to how vim searches when
" the * key is hit, but recursively in the file tree.
nnoremap ,* :AgIn %:h nnoremap<CR>
"vnoremap ,* :<C-u>call VisualStarSearchSet('/')<CR>:execute 'noautocmd AgIn %:h ' . @/ . ''<CR>
" <C-u> removes the visual highlighting, or else this command will fail with no
" range allowed error. https://vi.stackexchange.com/questions/7149/mapping-a-command-in-visual-mode-results-in-error-e481-no-range-alllowed
vnoremap ,* :<C-u>execute 'noautocmd AgIn %:h ' . GetVisualSelection() . ''<CR>
