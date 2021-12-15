Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    -- Change the character beside the LSP floating text.
    prefix = 'x', -- Could be '■', '●', '▎', 'x'
  }
})

function nvim_lsp_configure()
    require'lspconfig'.gopls.setup{}
end
EOF

" Frequently the virtual text goes off the screen. Currently the guidance is to just call
" vim.lsp.diagnostic.show_line_diagnostics()

" Make the sign column always there, even when there isn't an error. By reserving the space for the
" column always, there is less flicker during refreshes or loads. Without reserving this space, the
" LSP integration will clear the column on each save, then run the analysis, then insert the column
" with errors, causing the text to shift right.
set signcolumn=yes

autocmd VimEnter * :lua nvim_lsp_configure()

nnoremap <silent> gd    :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
