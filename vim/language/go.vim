" Golang development.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

let g:go_bin_path = $HOME."/golang"

" Configure the whitespace plugin to auto strip trailing whitespace when the
" given file types are saved.
autocmd FileType go autocmd BufWritePre <buffer> StripWhitespace
" Settings for vim-go -- https://github.com/fatih/vim-go#settings

" Make the output of GoTest appear in a terminal window instead of in
" quickfix.
" -- with experimentation I found that this is not so useful. Although the
"  quick fix window is quirky and difficult to read, it stays visible, and is
"  navigable. The terminal window is nicer with respect to size, but it
"  doesn't have highlighting and disappears when I press a key.
"let g:go_term_enabled = 1

" Use goimports for formatting instead of gofmt. goimports is a superset that
" includes automatically adjusting the import list of the file on save.
let g:go_fmt_command = "goimports"

" Debugging output from `go test` and `go build` should appear in the quickfix
" window.
let g:go_list_type = "quickfix"

let g:go_disable_autoinstall = 1

" Open new terminals in a horizontal split by default.
let g:go_term_mode = "split"

" Enable some keyboard shortcuts.
au FileType go nmap ,e  <Plug>(go-rename)
au FileType go nmap ,gb <Plug>(go-doc-browser)
au FileType go nmap ,i  <Plug>(go-info)
au FileType go nmap ,l  :GoLint<CR>
au FileType go nmap ,m  :GoBuild<CR>
au FileType go nmap ,n  <Plug>(go-rename)
au FileType go nmap ,o  <Plug>(go-coverage)
au FileType go nmap ,q  <Plug>(go-doc-split)
au FileType go nmap ,r  <Plug>(go-run-split)
au FileType go nmap ,t  <Plug>(go-test)

" Improve the syntax highlighting defaults.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go uses tabs everywhere, so change the tab width.
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Without these highlight groups defined, vim-go errors out when invoking
" `:GoCoverage`
highlight goCoverageNormalText guibg=Black guifg=White
"highlight goCoverageUncover ctermbg=red guibg=darkred
highlight goCoverageUncover ctermbg=lightred
"highlight goCoverageCovered ctermbg=green guibg=darkgreen
highlight goCoverageCovered ctermbg=lightgreen


if has('nvim')
    if exists("g:loaded_goext")
      finish
    endif
    let g:loaded_goext = 1


    function GoNew(project)
        let path = go#path#Detect() . "/src/"
        let filename = path
        if a:project =~ "\.go$"
            " If the new project ends in .go, assume a file name and chop it off the
            " directory to create.
            let end = strridx(a:project, "/")
            let path = path . strpart(a:project, 0, end)
            let filename = path . strpart(a:project, end)
        else
            let path = path . a:project
            let filename = path . "/main.go"
        endif

        if !isdirectory(path)
            call mkdir(path, "p")
            execute "edit " . path . "/" . filename
        endif
    endfunction

    function GoScratch()
        " This function should open a new main file in a new temporary package and
        " and let the user paste in their code an run it easily. When the buffer
        " closes, the file, and package, should be deleted. The idea is to make it
        " dead easy to cut, paste, restructure, edit and execute a bit of code. I
        " want to easily experiment with things and see how stuff works.
        "
        " As an advanced feature, you could fold away everything except the user's
        " code.
    endfunction

    au FileType go nmap ,gs :call GoScratch()<CR>
endif

function language#go#Format()
    execute ":GoFmt"
endfunction

function language#go#Comment()
    execute "s#^#//#"
endfunction

function language#go#GoAlternate()
    execute ":GoAlternate"
endfunction

function language#go#Build()
    execute ":GoBuild"
endfunction
