" Shows how to show documentation in a popup window.
" https://oren.github.io/articles/rust/neovim/
"

Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Enable Rust formatting on save.
let g:rustfmt_autosave = 1

function language#rust#Comment()
    execute "s#^#//#"
endfunction

lua << EOF

-- Adding the autocommands in a group means that when this file gets reloaded, the group gets
-- cleared and autocommands are re-added. Makes the development process of reloading this file with
-- changes idempotent.
local group = vim.api.nvim_create_augroup("rust", {clear = true})
vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    callback = function()
        vim.schedule(
            function()
                require('rust-tools').setup({})
            end
        )
    end
})

EOF

" These are the key mappings that are expected to be common across all
" carrying out the intended activity.
au FileType rust vmap <buffer>          <C-c>  :call language#rust#Comment()<CR>
au FileType rust nmap <buffer>          <C-c>  :call language#rust#Comment()<CR>
au FileType rust vmap <buffer>          <Space>c  :call language#rust#Comment()<CR>
au FileType rust nmap <buffer>          <Space>c  :call language#rust#Comment()<CR>
au FileType rust nmap <buffer> <silent> <Space>b  :sp <BAR> term cargo build<CR>
au FileType rust nmap <buffer> <silent> <Space>f  :RustFmt<CR>
au FileType rust nmap <buffer> <silent> <Space>ga :call language#rust#GoAlternate()<CR>
au FileType rust nmap <buffer>          <Space>r  :RustRun<CR>
au FileType rust nmap <buffer>          <Space>s  :call language#rust#Scratch()<CR>
au FileType rust nmap <buffer> <silent> <Space>t  :RustTest<CR>

" Make it easy to get out of the build buffer. The TermClose event happens when the process in the
" terminal exits. However, it can leave the buffer open on the screen, even though the terminal is
" closed. So, when the contained process exits, map the ESC key to close the buffer, to make it easy
" to get out.
autocmd TermClose * nnoremap <silent> <buffer> <ESC> :bd!<CR>
autocmd TermClose * nnoremap <silent> <buffer> <C-C> :bd!<CR>
autocmd TermClose * nnoremap <silent> <buffer> q :bd!<CR>
