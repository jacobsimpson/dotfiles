"Plug 'google/vim-codefmt'

function language#java#Test()
    execute(":make test")
endfunction

function language#java#GoAlternate()
    let l = expand('%')
    if l =~ "Test\.java$"
        let n = strpart(l, 0, strlen(l) - 9) . ".java"
        if n =~ "^src/tests/"
            let n = "src/main" . strpart(n, 9)
        endif
        execute "edit " . n
    else
        let n = strpart(l, 0, strlen(l) - 5) . "Test.java"
        if n =~ "^src.main."
            let n = "src/tests" . strpart(n, 8)
        endif
        execute "edit " . n
    endif
endfunction

function language#java#Format()
    let save_pos = getpos(".")
    execute "%!java -jar ~/home-dir/vim/support/google-java-format-1.6-all-deps.jar -"
    call setpos('.', save_pos)
endfunction

function language#java#Comment()
    " There was some old code around for comment lines.
    " au FileType java vmap <C-_> :s#^#//#<CR>
    " au FileType java nmap <C-_> :s#^#//#<CR>
    execute "s#^#//#"
endfunction

function language#java#Build()
    if !empty(glob("build.gradle"))
        execute(":make build")
    else
        execute "!javac %"
    endif
endfunction

function language#java#Run()
    execute "!javac %"
    execute "!java -cp %:h %:t:r"
endfunction

function language#java#Scratch()
    let tmpdir="/tmp/vim-scratch-java-".strftime('%Y-%m-%d-%H-%M-%S')

    if !isdirectory(tmpdir)
        call mkdir(tmpdir, "p")
    endif
    execute ":e ~/home-dir/vim/language/templates/Scratch.java"
    execute ":saveas ".tmpdir."/Main.java"
    execute ":normal jj"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remap :make to ant for Java files.
function SetJavaCompilerAnt()
    set makeprg=ant
    " Things learned about efm.
    "   The pattern MUST consume the whole line, or it will just fail to match.
    "   .* regular expression is represented as %.%#
    "   :clist shows the matched lines. If no lines match, the whole output is displayed.
    "   although the docs indicate you can cat a bunch of syntax strings together, this doesn't actually work.
    set efm=\ %#[javac]\ %f:%l:%m
    set efm=\ %#[junit]\ %.at%m

    let &efm=' %#[javac] %f:%l:%m'
endfunction

function SetJavaCompilerGradle()
    set makeprg=gradle
    " Things learned about efm.
    "   The pattern MUST consume the whole line, or it will just fail to match.
    "   .* regular expression is represented as %.%#
    "   :clist shows the matched lines. If no lines match, the whole output is displayed.
    "   although the docs indicate you can cat a bunch of syntax strings together, this doesn't actually work.
    "   :compileJava/Users/jacobsimpson/src/code-retreat/java-ag/src/main/java/Main.java:4: error: ';' expec
    "
    set efm=\%E[ant:scalac]\ %f:%l:\ error:\ %m,\%W[ant:scalac]\ %f:%l:\ warning:\ %m,\%E%.%#:compile%\\w%#Java%f:%l:\ error:\ %m
    ",%-Z%p^,%-C%.%#,\%W%.%#:compile%\\w%#Java%f:%l:\ warning:\ %m,%-Z%p^,%-C%.%#,\%E%f:%l:\ error:\ %m,%-Z%p^,%-C%.%#, \%W%f:%l:\ warning:\ %m,%-Z%p^,%-C%.%#,\%E%f:\ %\\d%\\+:\ %m\ @\ line\ %l\\,\ column\ %c.,%-C%.%#,%Z%p^,\%E%>%f:\ %\\d%\\+:\ %m,%C\ @\ line\ %l\\,\ column\ %c.,%-C%.%#,%Z%p^,\%-G%.%#
    "
endfunction

"" The autocmd lines conditionally remap the makeprg if you navigate to or open Java files.
autocmd BufEnter,BufNew *.java         call SetJavaCompilerGradle()
autocmd BufEnter,BufNew build.xml      call SetJavaCompilerAnt()
autocmd BufEnter,BufNew build.gradle   call SetJavaCompilerGradle()

" Configure the whitespace plugin to auto strip trailing whitespace when the
" given file types are saved.
autocmd FileType java autocmd BufWritePre <buffer> StripWhitespace
"
