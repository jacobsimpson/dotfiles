
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Enable Rust formatting on save.
let g:rustfmt_autosave = 1

function language#rust#Comment()
    execute "s#^#//#"
endfunction

function language#rust#Format()
    let save_pos = getpos(".")
    execute "%!rustfmt"
    call setpos('.', save_pos)
endfunction

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
"au FileType rust nmap <buffer> <silent> <Space>a  :call language#rust#GoAlternate()<CR>
au FileType rust vmap <buffer>          <C-c>  :call language#rust#Comment()<CR>
au FileType rust nmap <buffer>          <C-c>  :call language#rust#Comment()<CR>
au FileType rust vmap <buffer>          <Space>c  :call language#rust#Comment()<CR>
au FileType rust nmap <buffer>          <Space>c  :call language#rust#Comment()<CR>
au FileType rust nmap <buffer> <silent> <Space>b  :sp <BAR> term cargo build<CR>
au FileType rust nmap <buffer> <silent> <Space>f  :RustFmt<CR>
au FileType rust nmap <buffer> <silent> <Space>ga :call language#rust#GoAlternate()<CR>
au FileType rust nmap <buffer>          <Space>r  :RustRun<CR>
au FileType rust nmap <buffer>          <Space>s  :call language#rust#Scratch()<CR>
au FileType rust nmap <buffer> <silent> <Space>t  :call language#rust#Test()<CR>
