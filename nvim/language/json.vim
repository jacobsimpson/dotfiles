
" The default processing for JSON files in Neovim conceals the quotes if the 'conceallevel' is set
" higher than 0.
autocmd FileType json setlocal conceallevel=0 concealcursor=niv

autocmd FileType json autocmd BufWritePre <buffer> StripWhitespace

function language#json#Build()
    split | terminal jq -M . %
endfunction

function language#json#Comment()
    echom "JSON does not support comments."
endfunction

function language#json#Format()
    let save_pos = getpos(".")
    execute "%!jq -M ."
    call setpos('.', save_pos)
endfunction

function language#json#GoAlternate()
    echom "JSON does not have an alternate file."
endfunction

function language#json#Test()
    split | terminal jq -M . %
endfunction

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType json nmap <buffer> <silent> <Space>a  :call language#json#GoAlternate()<CR>
au FileType json vmap <buffer>          gc        :call language#json#Comment()<CR>
au FileType json nmap <buffer>          gcc       :call language#json#Comment()<CR>
au FileType json nmap <buffer> <silent> <Space>b  :call language#json#Build()<CR>
au FileType json nmap <buffer> <silent> <Space>f  :call language#json#Format()<CR>
au FileType json nmap <buffer> <silent> <Space>ga :call language#json#GoAlternate()<CR>
au FileType json nmap <buffer>          <Space>r  :call language#json#Run()<CR>
au FileType json nmap <buffer>          <Space>s  :call language#json#Scratch()<CR>
au FileType json nmap <buffer> <silent> <Space>tn :call language#json#Test()<CR>
au FileType json nmap <buffer> <silent> <Space>tf :call language#json#Test()<CR>
au FileType json nmap <buffer> <silent> <Space>ts :call language#json#Test()<CR>
au FileType json nmap <buffer> <silent> <Space>tl :call language#json#Test()<CR>
au FileType json nmap <buffer> <silent> <Space>tv :echom "Nothing to visit."<CR>
