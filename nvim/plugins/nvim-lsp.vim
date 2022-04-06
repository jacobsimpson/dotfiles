Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

" Nice example LSP configuration: https://raygervais.dev/articles/2021/3/neovim-lsp/

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

    -- Frequently the virtual text goes off the screen. Currently the guidance is to just call
    -- vim.lsp.diagnostic.show_line_diagnostics()

    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    -- When 'omnifunc' is set to `v:lua.vim.lsp.omnifunc`, |i_CTRL-X_CTRL-O|
    --vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- NOTE: Pretty sure this is not the thing to do. When I activate it, I get a window with the
    -- options, but it isn't a very usable window. Checking into nvim-cmp instead.
EOF

autocmd BufEnter,BufNew *.rs        lua vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
