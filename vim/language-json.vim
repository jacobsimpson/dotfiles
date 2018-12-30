
autocmd FileType json nmap <C-A-F> :%!python -m json.tool<CR>

autocmd FileType json autocmd BufWritePre <buffer> StripWhitespace
