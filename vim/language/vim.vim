function language#vim#Format()
    echom "vimscript can not be auto formatted."
endfunction

function language#vim#Comment()
    execute "s#^#\"#"
endfunction
