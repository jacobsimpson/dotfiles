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

function language#Build()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#Build()
    elseif &ft ==# 'java' || &ft ==# 'groovy' || &ft ==# 'ant'
        call language#java#Build()
    elseif &ft ==# 'lua'
        call language#lua#Build()
    elseif &ft ==# 'typescript'
        call language#typescript#Build()
    elseif &ft ==# ''
        if !empty(glob("build.gradle"))
            call language#java#Build()
        endif
    else
        echom "There is no build step defined for this file type."
    endif
endfunction

function language#GoAlternate()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#GoAlternate()
    elseif &ft ==# 'java'
        call language#java#GoAlternate()
    elseif &ft ==# 'lua'
        call language#lua#GoAlternate()
    elseif &ft ==# 'typescript'
        call language#typescript#GoAlternate()
    else
        echom "There is no alternate navigation for this file type."
    endif
endfunction

function language#Format()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#Format()
    elseif &ft ==# 'java'
        call language#java#Format()
    elseif &ft ==# 'json'
        call language#json#Format()
    elseif &ft ==# 'lua'
        call language#lua#Format()
    elseif &ft ==# 'typescript'
        call language#typescript#Format()
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
    elseif &ft ==# 'lua'
        call language#lua#Comment()
    elseif &ft ==# 'typescript'
        call language#typescript#Comment()
    elseif &ft ==# 'vim'
        call language#vim#Comment()
    else
        echom "There is no commenter defined for this file type."
    endif
endfunction

function language#Run()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#Run()
    elseif &ft ==# 'java'
        call language#java#Run()
    elseif &ft ==# 'lua'
        call language#lua#Run()
    elseif &ft ==# 'typescript'
        call language#typescript#Run()
    else
        echom "There is no run function defined for this file type."
    endif
endfunction

function language#Scratch()
    " Clear the current messages.
    echo ""

    if &ft ==# ''
        call ctrlp#init(ctrlp#projects#scratch#id())
    else
        call language#ScratchByName(&ft)
    endif
endfunction

function language#ScratchByName(name)
    if a:name ==# 'go'
        call language#go#Scratch()
    elseif a:name ==# 'java'
        call language#java#Scratch()
    elseif a:name ==# 'lua'
        call language#lua#Scratch()
    elseif a:name ==# 'typescript'
        call language#typescript#Scratch()
    else
        echom "There is no scratch function defined for this file type."
    endif
endfunction

function language#Test()
    " Clear the current messages.
    echo ""

    if &ft ==# 'go'
        call language#go#Test()
    elseif &ft ==# 'java' || &ft ==# 'groovy' || &ft ==# 'ant'
        call language#java#Test()
    elseif &ft ==# 'lua'
        call language#lua#Test()
    elseif &ft ==# 'typescript'
        call language#typescript#Test()
    else
        echom "There is no test function defined for this file type."
    endif
endfunction

" These are the key mappings that are expected to be common across all
" languages, though a given language can just show an error message instead of
" carrying out the intended activity.
"nmap <silent> <Space>a  :call language#GoAlternate()<CR>
"vmap          <Space>c  :call language#Comment()<CR>
"nmap          <Space>c  :call language#Comment()<CR>
"nmap <silent> <Space>b  :call language#Build()<CR>
"nmap <silent> <Space>f  :call language#Format()<CR>
"nmap <silent> <Space>ga :call language#GoAlternate()<CR>
"nmap          <Space>r  :call language#Run()<CR>
"nmap          <Space>s  :call language#Scratch()<CR>
"nmap <silent> <Space>t  :call language#Test()<CR>
