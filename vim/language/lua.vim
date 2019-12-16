function! language#lua#Build()
    execute "!luajit %"
endfunction

function! language#lua#Comment()
    execute "s#^#--#"
endfunction

function! language#lua#Format()
    let save_pos = getpos(".")
    "execute "%!java -jar ~/home-dir/vim/support/google-java-format-1.6-all-deps.jar -"
    call setpos('.', save_pos)
endfunction

function! language#lua#GoAlternate()
endfunction

function! language#lua#Run()
    execute "!luajit %"
endfunction

function! language#lua#Scratch()
    let tmpdir="/tmp/vim-scratch-lua-".strftime('%Y-%m-%d-%H-%M-%S')
    let dst=l:tmpdir . "/main.lua"

    if !isdirectory(tmpdir)
        call mkdir(tmpdir, "p")
    endif
    execute ":edit " . l:dst
endfunction

function! language#lua#Test()
endfunction

" Configure the whitespace plugin to auto strip trailing whitespace when the
" given file types are saved.
autocmd FileType lua autocmd BufWritePre <buffer> StripWhitespace

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType lua nmap <buffer> <silent> <Space>a  :call language#lua#GoAlternate()<CR>
au FileType lua vmap <buffer>          <Space>c  :call language#lua#Comment()<CR>
au FileType lua nmap <buffer>          <Space>c  :call language#lua#Comment()<CR>
au FileType lua nmap <buffer> <silent> <Space>b  :call language#lua#Build()<CR>
au FileType lua nmap <buffer> <silent> <Space>f  :call language#lua#Format()<CR>
au FileType lua nmap <buffer> <silent> <Space>ga :call language#lua#GoAlternate()<CR>
au FileType lua nmap <buffer>          <Space>r  :call language#lua#Run()<CR>
au FileType lua nmap <buffer>          <Space>s  :call language#lua#Scratch()<CR>
au FileType lua nmap <buffer> <silent> <Space>t  :call language#lua#Test()<CR>

