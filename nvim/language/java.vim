"Plug 'google/vim-codefmt'
Plug 'mfussenegger/nvim-jdtls'

lua<<EOF
function nvim_jdtls_initialize()
    v = vim.api.nvim_buf_get_var(0, "has_been_entered")
    vim.api.nvim_buf_set_var(0, "has_been_entered", 1)

    local config = {
      -- The command that starts the language server
      cmd = {
        -- '/Library/Java/JavaVirtualMachines/graalvm-ce-java17-21.3.0/Contents/Home/bin/java',
        '/Users/jacob.simpson/bin/jdt-language-server-1.5.0/run.sh',
        '-Dosgi.bundles.defaultStartLevel=4',
        -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
      },

      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'build.gradle'})
    }
    -- start_or_attach needs to run each time you open a java file or buffer.
    require('jdtls').start_or_attach(config)
end
EOF

" Extra care was taken here to prevent multiple attachments to a buffer. Run :LspInfo to see the
" buffers that have attachments. If a number appears more than once in the list, it seems to cause
" odd problems in reformatting imports, if nothing else.
autocmd BufEnter *.java if !exists('b:has_been_entered') |
    \ let b:has_been_entered = 1 | call v:lua.nvim_jdtls_initialize() | endif

"" `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"" use this mapping also with other language servers
nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
"nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
nnoremap crv :echo "this is the thing"<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>


"" If using nvim-dap
"" This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>




function! language#java#Build()
    if !empty(glob("build.gradle"))
        execute(":make build")
    else
        execute "!javac %"
    endif
endfunction

function! language#java#Comment()
    " There was some old code around for comment lines.
    " au FileType java vmap <C-_> :s#^#//#<CR>
    " au FileType java nmap <C-_> :s#^#//#<CR>
    execute "s#^#//#"
endfunction

function! language#java#Format()
    let save_pos = getpos(".")
    execute "%!java -jar " . g:ConfigDir . "/support/google-java-format-1.6-all-deps.jar -"
    call setpos('.', save_pos)
endfunction

function! language#java#GoAlternate()
    let l = expand('%')
    if l =~ "Test\.java$"
        let n = strpart(l, 0, strlen(l) - 9) . ".java"
        if n =~ "^src/test/"
            let n = "src/main" . strpart(n, 8)
        endif
        if n =~ "^app/src/test/"
            let n = "app/src/main" . strpart(n, 12)
        endif
        execute "edit " . n
    else
        let n = strpart(l, 0, strlen(l) - 5) . "Test.java"
        if n =~ "^src.main."
            let n = "src/test" . strpart(n, 8)
        endif
        if n =~ "^app.src.main."
            let n = "app/src/test" . strpart(n, 12)
        endif
        execute "edit " . n
    endif
endfunction

function! language#java#Run()
    execute "!javac %"
    execute "!java -cp %:h %:t:r"
endfunction

function! language#java#Scratch()
    let tmpdir="/tmp/vim-scratch-java-".strftime('%Y-%m-%d-%H-%M-%S')
    let src=g:ConfigDir . "language/templates/Scratch.java"
    let dst=l:tmpdir . "/Main.java"

    if !isdirectory(tmpdir)
        call mkdir(tmpdir, "p")
    endif
    execute "silent !cp " . l:src . " " . l:dst
    execute ":edit " . l:dst
    execute ":normal jj"
endfunction

"function! language#java#Test()
"    execute(":make test")
"endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remap :make to ant for Java files.
function! SetJavaCompilerAnt()
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

function! SetJavaCompilerGradle()
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

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType java nmap <buffer> <silent> <Space>a  :call language#java#GoAlternate()<CR>
au FileType java vmap <buffer>          <Space>c  :call language#java#Comment()<CR>
au FileType java nmap <buffer>          <Space>c  :call language#java#Comment()<CR>
au FileType java nmap <buffer> <silent> <Space>b  :call language#java#Build()<CR>
au FileType java nmap <buffer> <silent> <Space>f  :call language#java#Format()<CR>
au FileType java nmap <buffer>          <Space>r  :call language#java#Run()<CR>
au FileType java nmap <buffer>          <Space>s  :call language#java#Scratch()<CR>

" This behavior depends on the 'vim-test/vim-test' plugin.
au FileType java nmap <buffer> <silent> <Space>tn :TestNearest<CR>
au FileType java nmap <buffer> <silent> <Space>tf :TestFile<CR>
au FileType java nmap <buffer> <silent> <Space>ts :TestSuite<CR>
au FileType java nmap <buffer> <silent> <Space>tl :TestLast<CR>
au FileType java nmap <buffer> <silent> <Space>tv :TestVisit<CR>
autocmd FileType java let test#java#runner = 'gradletest'

" Navigation commands.
au FileType java nmap <buffer> <silent> <Space>ga :call language#java#GoAlternate()<CR>
au FileType java nmap <buffer> <silent> <Space>gd <cmd>lua vim.lsp.buf.definition()<CR>
