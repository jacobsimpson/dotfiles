"
" Customizations for working with programming languages. The goal is to have
" key strokes the same, or nearly the same, for any different language, and
" for the settings to only load when the specific language is in use.
"
" <Space>b = build current file
" <Space>c = comment out the current line, or the currently highlighted block.
" <Space>f = format the current file.
" <Space>ga = go to the 'alternate' file, like to the test file from the source file,
"      or to the source file from the test file.
" <Space>gb = go to the build file for this project.
" <Space>gd = go to the definition of the symbol under the cursor.
" <Space>l = run linter
" <Space>m = make project - this one tends to be hard as there are a lot of build
"      systems, and many projects don't have clean build systems, requiring
"      instead a series of steps.
" <Space>n = rename symbol under the cursor.
" <Space>r = run current file
" <Space>s = make a scratch file to experiment in.
" <Space>t = test current file
"
" Each language should configure for their file type to strip whitespace on save.
"

function language#Format()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#Format()
    elseif &ft ==# 'java'
        call language#java#Format()
    elseif &ft ==# 'json'
        call language#json#Format()
    elseif &ft ==# 'vim'
        call language#vim#Format()
    else
        echom "There is no formatter defined for this file type."
    endif
endfunction

function language#Comment()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#Comment()
    elseif &ft ==# 'java'
        call language#java#Comment()
    elseif &ft ==# 'json'
        call language#json#Comment()
    elseif &ft ==# 'vim'
        call language#vim#Comment()
    else
        echom "There is no commenter defined for this file type."
    endif
endfunction

" These are the key mappings that are expected to be common across all
" languages, though a given language can just show an error message instead of
" carrying out the intended activity.
nmap <silent> <Space>f  :call language#Format()<CR>
vmap <Space>c :call language#Comment()<CR>
nmap <Space>c :call language#Comment()<CR>
