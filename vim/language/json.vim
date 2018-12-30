
autocmd FileType json autocmd BufWritePre <buffer> StripWhitespace

function language#json#Format()
    let save_pos = getpos(".")
    execute "%!python -m json.tool"
    call setpos('.', save_pos)
endfunction

function language#json#Comment()
    echom "JSON can not be commented."
endfunction
