function language#lua#Build()
    execute "!luajit %"
endfunction

function language#lua#Comment()
    execute "s#^#--#"
endfunction

function language#lua#Format()
    let save_pos = getpos(".")
    "execute "%!java -jar ~/home-dir/vim/support/google-java-format-1.6-all-deps.jar -"
    call setpos('.', save_pos)
endfunction

function language#lua#GoAlternate()
endfunction

function language#lua#Run()
    execute "!luajit %"
endfunction

function language#lua#Scratch()
    let tmpdir="/tmp/vim-scratch-lua-".strftime('%Y-%m-%d-%H-%M-%S')
    let dst=l:tmpdir . "/main.lua"

    if !isdirectory(tmpdir)
        call mkdir(tmpdir, "p")
    endif
    execute ":edit " . l:dst
endfunction

function language#lua#Test()
endfunction

" Configure the whitespace plugin to auto strip trailing whitespace when the
" given file types are saved.
autocmd FileType lua autocmd BufWritePre <buffer> StripWhitespace
"
