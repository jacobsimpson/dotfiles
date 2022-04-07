function! language#vim#Format()
    echom "vimscript can not be auto formatted."
endfunction

function! language#vim#Comment()
    execute "s#^#\"#"
endfunction

function language#vim#Build()
    echom "vimscript has no build mechanism."
endfunction

function! language#vim#Run()
    execute "source %"
endfunction

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType vim nmap <buffer> <silent> <Space>a  :call language#vim#GoAlternate()<CR>
"au FileType vim vmap <buffer>          <Space>c  :call language#vim#Comment()<CR>
"au FileType vim nmap <buffer>          <Space>c  :call language#vim#Comment()<CR>
au FileType vim nmap <buffer> <silent> <Space>b  :call language#vim#Build()<CR>
au FileType vim nmap <buffer> <silent> <Space>f  :call language#vim#Format()<CR>
au FileType vim nmap <buffer> <silent> <Space>ga :call language#vim#GoAlternate()<CR>
au FileType vim nmap <buffer>          <Space>r  :call language#vim#Run()<CR>
au FileType vim nmap <buffer>          <Space>s  :call language#vim#Scratch()<CR>
au FileType vim nmap <buffer> <silent> <Space>t  :call language#vim#Test()<CR>
