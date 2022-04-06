Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

" Make the sign column always there, even when there isn't an error. By reserving the space for the
" column always, there is less flicker during refreshes or loads. Without reserving this space, the
" LSP integration will clear the column on each save, then run the analysis, then insert the column
" with errors, causing the text to shift right.
set signcolumn=yes

lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    -- Change the character beside the LSP floating text.
    prefix = 'x', -- Could be '■', '●', '▎', 'x'
  }
})

-- Adding the autocommands in a group means that when this file gets reloaded, the group gets
-- cleared and autocommands are re-added. Makes the development process of reloading this file with
-- changes idempotent.
local group = vim.api.nvim_create_augroup("lsp-configuration", {clear = true})
vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    callback = function()
        vim.schedule(
            function()
                require'lspconfig'.gopls.setup{}
            end
        )
    end
})
EOF

" Frequently the virtual text goes off the screen. Currently the guidance is to just call
" vim.lsp.diagnostic.show_line_diagnostics()

nnoremap <silent> gd    :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" Replaced below in the lua config... except there was some kind of error.
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> <c-s> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>

lua << EOF
    --vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    -- When 'omnifunc' is set to `v:lua.vim.lsp.omnifunc`, |i_CTRL-X_CTRL-O|
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
EOF

autocmd BufEnter,BufNew *.rs        lua vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

" Nice example LSP configuration: https://raygervais.dev/articles/2021/3/neovim-lsp/
"
