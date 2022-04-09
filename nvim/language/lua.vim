function! language#lua#Build()
    execute "!luajit %"
endfunction

function! language#lua#GoAlternate()
    echo "There is no alternate file configured for Lua."
endfunction

function! language#lua#Run()
    execute "split | term luajit %"
    execute "normal Ga"
endfunction

function! language#lua#Test()
endfunction

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType lua nmap <buffer> <silent> <Space>a  :call language#lua#GoAlternate()<CR>
au FileType lua nmap <buffer> <silent> <Space>ga :call language#lua#GoAlternate()<CR>
au FileType lua nmap <buffer> <silent> <Space>b  :call language#lua#Build()<CR>
au FileType lua nmap <buffer> <silent> <Space>f  :lua require("stylua-nvim").format_file()<CR>
au FileType lua nmap <buffer>          <Space>r  :call language#lua#Run()<CR>
au FileType lua nmap <buffer>          <Space>s  :Luapad<CR>
au FileType lua nmap <buffer> <silent> <Space>t  :call language#lua#Test()<CR>
