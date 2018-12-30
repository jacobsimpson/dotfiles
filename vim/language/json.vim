
autocmd FileType json autocmd BufWritePre <buffer> StripWhitespace

function language#json#Format()
    execute "%!python -m json.tool"
endfunction

function language#json#Comment()
    echom "JSON can not be commented."
endfunction
