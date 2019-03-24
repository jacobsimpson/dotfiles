function language#typescript#Build()
    execute "!clasp push"
endfunction

function language#typescript#Comment()
    execute "s#^#//#"
endfunction

function language#typescript#Format()
    let save_pos = getpos(".")
    execute "%!prettier %"
    call setpos('.', save_pos)
endfunction

function language#typescript#GoAlternate()
    echo "There is no GoAlternate behavior defined for Typescript."
endfunction

function language#typescript#Run()
    echo "There is no run behavior defined for Typescript."
endfunction

function language#typescript#Scratch()
    let tmpdir="/tmp/vim-scratch-typescript-".strftime('%Y-%m-%d-%H-%M-%S')
    let dst=l:tmpdir . "/main.typescript"

    if !isdirectory(tmpdir)
        call mkdir(tmpdir, "p")
    endif
    execute ":edit " . l:dst
endfunction

function language#typescript#Test()
    echo "There is no test behavior defined for Typescript."
endfunction

" Configure the whitespace plugin to auto strip trailing whitespace when the
" given file types are saved.
autocmd FileType typescript autocmd BufWritePre <buffer> StripWhitespace
"
