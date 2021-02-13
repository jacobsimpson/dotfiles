function language#typescript#Build()
    execute "!clasp push"
endfunction

function language#typescript#Comment()
    execute "s#^#//#"
endfunction

function language#typescript#Format()
    let save_pos = getpos(".")
    execute "%!npx prettier %"
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

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType typescript nmap <buffer> <silent> <Space>a  :call language#typescript#GoAlternate()<CR>
au FileType typescript vmap <buffer>          <Space>c  :call language#typescript#Comment()<CR>
au FileType typescript nmap <buffer>          <Space>c  :call language#typescript#Comment()<CR>
au FileType typescript nmap <buffer> <silent> <Space>b  :call language#typescript#Build()<CR>
au FileType typescript nmap <buffer> <silent> <Space>f  :call language#typescript#Format()<CR>
au FileType typescript nmap <buffer> <silent> <Space>ga :call language#typescript#GoAlternate()<CR>
au FileType typescript nmap <buffer>          <Space>r  :call language#typescript#Run()<CR>
au FileType typescript nmap <buffer>          <Space>s  :call language#typescript#Scratch()<CR>
au FileType typescript nmap <buffer> <silent> <Space>t  :call language#typescript#Test()<CR>

