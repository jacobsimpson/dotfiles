function! Get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - 2]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction

function! GrepJavaScriptFiles(selection)
    "let selection = @@
    execute "vimgrep /" . selection . "/j /home/jsimpson/projects/RigFocusMobileProtoype/src/js/src/mobile/**/*.js /home/jsimpson/projects/RigFocusMobileProtoype/src/pylons/datahub/datahub/templates/rfm/*.mako"
    let prompt = printf("Found %d uses of '%s'. Show? (y/N) ", len(getqflist()), selection)
    let rc = input(prompt)
    if rc == "y"
        copen
    endif
endfunction
vmap <C-c><C-g> "ry :GrepJavaScriptFiles(@r)<CR>
vmap <C-c><C-g> "ry :echo @r<CR>
"nmap <leader>g :call GrepJavaScriptFiles()<CR>

function! CodeReviewNote()
    let result = []
    call add(result, "")
    call add(result, printf("In file '%s' on line number %d:", expand('%'), line('.')))
    call add(result, @@)
    call add(result, "")
    call add(result, "    * ")

    "let selection = @@
    "let line_number = line()
    "let filename = %
    
    " Switch buffer.
    buffer ~/CodeReviewNotes.txt

    " Append text.
    let failed = append(line('$'), result)

    " Give the user edit mode.
    call setpos(".", [0, '$', 1, 0])
endfunction
nmap <leader>c :call CodeReviewNote()<CR>

function! Maketags()
    let filename = findfile("tags", getcwd() . ";")
    if filename == ""
        " Execute the tags command right here.
        let filename = "tags"
        let options = ""
        try
            call writefile([1], filename)
            call delete(filename)
        catch /E482:/
            let filename = "/tmp/tags"
            let options = "--tag-relative=yes"
        endtry
        exe '!ctags -f ' . filename . ' ' . options . ' --exclude=*.sql --exclude=build --exclude=.svn --exclude=*.egg-info -R *'
    endif
    execute "set tags=" . filename . ",/home/jsimpson/.vim/commontags/javatags"
    echo "Created the tags files."
endfunction

" Map the function to a command-line.
com! -nargs=* Maketags call Maketags()

function! Lint()
    if b:current_syntax == "python"    
        compiler pylint
        make
        copen
    endif
endfunction

com! -nargs=* Lint call Lint()
nmap <leader>l :Lint<CR>

function! Unittest()
    if b:current_syntax == "python"
        let fn = expand('%')
        if strpart(fn, 0, 1) != '/'
            let fn = getcwd() . '/' . fn
        endif
        let fn = simplify(fn)
        echo "Current file = " . fn
        if stridx(fn, '/src/pylons/') > 0
            echo "This should have a unit test."
            let testfn = ""
            if stridx(fn, '/tests/') > 0
                let testfn = fn
            else
                let testfn = substitute(fn, "/datahub/datahub/", "/datahub/datahub/tests/", "")
                let loc = strridx(testfn, "/")
                let testfn = strpart(testfn, 0, loc + 1) . "test_" . strpart(testfn, loc + 1)
                echo 
            endif
            echo "The test case to run is : " . testfn
            if getftype(testfn) == ""
                echo "The test '" . testfn . "' doesn't exist."
            else
                compiler nosetests
                execute "make " . testfn
                copen
            endif
        endif
    elseif b:current_syntax == "java"
        let currentFile = expand("%")
        let testFile = currentFile
        let pre = strpart(currentFile, 0, stridx(currentFile, "/"))
        if pre == "src"
            let testFile = strpart(currentFile, stridx(currentFile, "/") + 1)
            let testFile = strpart(testFile, 0, stridx(testFile, ".java")) . "Test.java"
        elseif pre == "test"
            let testFile = strpart(currentFile, stridx(currentFile, "/") + 1)
        endif
        execute "make -Dtest=" . testFile . " test"
    endif
endfunction

com! -nargs=* Unittest call Unittest()
nmap <leader>u :Unittest<CR>

function! Man(cmd)
    let name = "man\\ " . a:cmd
    execute "badd " . name
    execute "buffer " . name
    execute "r !man " . a:cmd . " | ul -t vi"
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    0
endfunction

com! -nargs=1 Man call Man(<f-args>)

function! Test()
    echo "Something..."
    "let currentFile = expand("%")
    "let basename = strpart(currentFile, strridx(currentFile, "/") + 1)
    "if strridx(basename, ".java") < 0
    "    echo "You can not unit test a non-Java file."
    "else
    "    let classname = strpart(basename, 0, strridx(basename, ".java"))
    "    execute "make -Dtest=" . classname . " runtest"
    "endif
endfunction

com! -nargs=0 Test call Test()
nmap ,t :Test<CR>


"
" Standard Java Project Navigation.
" -- tries to emulate the rails.vim plugin, adjusting to
" a conventional Java project.
"
"    Current file            Alternate file      Related file ~
"    model                   unit test           schema definition
"    controller (in method)  functional test     template (view)
"    template (view)         functional test     controller (jump to method)
"    migration               previous migration  next migration
"    config/database.yml     config/routes.rb    config/environments/*.rb
function! JavaNavigate()
    let currentFile = expand("%")
    let dstFile = currentFile
    let pre = strpart(currentFile, 0, stridx(currentFile, "/"))
    if pre == "src"
        let dstFile = strpart(currentFile, stridx(currentFile, "/") + 1)
        let dstFile = "test/" . strpart(dstFile, 0, stridx(dstFile, ".java")) . "Test.java"
    elseif pre == "test"
        let dstFile = strpart(currentFile, stridx(currentFile, "/") + 1)
        let dstFile = "src/" . strpart(dstFile, 0, stridx(dstFile, "Test.java")) . ".java"
    endif
    echo "Navigating to " . dstFile
    execute "edit " . dstFile
endfunction

com! -nargs=0 A call JavaNavigate()
"nmap ,t :Test<CR>

function! Import()
    echo @@
    "execute "mz"
endfunction

"com! -nargs=0 A call Import()
nmap ,m :call Import()<CR>

