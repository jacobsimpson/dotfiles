
" Disable concealing behavior (where Markdown link syntax is shorted to just
" the link name.
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

function language#markdown#Comment()
    echom "Markdown can not be commented."
endfunction

autocmd Filetype markdown setlocal conceallevel=0

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType markdown nmap <buffer> <silent> <Space>a  :call language#markdown#GoAlternate()<CR>
au FileType markdown vmap <buffer>          <Space>c  :call language#markdown#Comment()<CR>
au FileType markdown nmap <buffer>          <Space>c  :call language#markdown#Comment()<CR>
au FileType markdown nmap <buffer> <silent> <Space>b  :call language#markdown#Build()<CR>
au FileType markdown nmap <buffer> <silent> <Space>f  :call language#markdown#Format()<CR>
au FileType markdown nmap <buffer> <silent> <Space>ga :call language#markdown#GoAlternate()<CR>
au FileType markdown nmap <buffer>          <Space>r  :call language#markdown#Run()<CR>
au FileType markdown nmap <buffer>          <Space>s  :call language#markdown#Scratch()<CR>
au FileType markdown nmap <buffer> <silent> <Space>t  :call language#markdown#Test()<CR>

