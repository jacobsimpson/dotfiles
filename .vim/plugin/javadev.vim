

"function! JavaTest()
"    let currentFile = expand("%")
"    let basename = strpart(currentFile, strridx(currentFile, "/") + 1)
"    if strridx(basename, ".java") < 0
"        echo "You can not unit test a non-Java file."
"    else
"        let classname = strpart(basename, 0, strridx(basename, ".java"))
"        execute "make test -DtestFile=" . classname
"    endif
"endfunction
"
"com! -nargs=0 JTest call JavaTest()
"nmap ,t :Test<CR>

