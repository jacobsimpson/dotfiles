if has('nvim')
    " NeoTerm allows selected text to be sent to the interpreter running in a
    " terminal.
    Plug 'kassio/neoterm'

    " Configuration of the NeoTerm plugin.
    " Position was deprecated in favor of default_mod.
    "let g:neoterm_position = 'horizontal'
    let g:neoterm_default_mod = 'rightbelow'
    let g:neoterm_automap_keys = ',tt'

    nnoremap <silent> ,sf :TREPLSendFile<cr>
    nnoremap <silent> ,sl :TREPLSendLine<cr>
    vnoremap <silent> ,ss :TREPLSendSelection<cr>

    " run set test lib
    nnoremap <silent> ,ra :call neoterm#test#run('all')<cr>
    nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
    nnoremap <silent> ,rc :call neoterm#test#run('current')<cr>
    nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

    " Useful maps
    " hide/close terminal
    nnoremap <silent> ,th :call neoterm#close()<cr>
    " clear terminal
    nnoremap <silent> ,tl :call neoterm#clear()<cr>
    " kills the current job (send a <c-c>)
    nnoremap <silent> ,tc :call neoterm#kill()<cr>
endif
