
autocmd FileType json autocmd BufWritePre <buffer> StripWhitespace

function language#json#Format()
    let save_pos = getpos(".")
    execute "%!python -m json.tool"
    call setpos('.', save_pos)
endfunction

function language#json#Comment()
    echom "JSON can not be commented."
endfunction

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType json nmap <buffer> <silent> <Space>a  :call language#json#GoAlternate()<CR>
au FileType json vmap <buffer>          <Space>c  :call language#json#Comment()<CR>
au FileType json nmap <buffer>          <Space>c  :call language#json#Comment()<CR>
au FileType json nmap <buffer> <silent> <Space>b  :call language#json#Build()<CR>
au FileType json nmap <buffer> <silent> <Space>f  :call language#json#Format()<CR>
au FileType json nmap <buffer> <silent> <Space>ga :call language#json#GoAlternate()<CR>
au FileType json nmap <buffer>          <Space>r  :call language#json#Run()<CR>
au FileType json nmap <buffer>          <Space>s  :call language#json#Scratch()<CR>
au FileType json nmap <buffer> <silent> <Space>t  :call language#json#Test()<CR>

