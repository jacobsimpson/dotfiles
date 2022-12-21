return function()
    -- The plugin repo itself has some nice guidance:
    --     - https://github.com/neovim/nvim-lspconfig
    --     - https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
    --     - https://raygervais.dev/articles/2021/3/neovim-lsp/

    -- Frequently the diagnostic virtual text goes off the screen. Currently the guidance is to just
    -- call:
    --    :lua vim.lsp.diagnostic.show_line_diagnostics()
    -- though I've noticed
    --    :lua vim.diagnostic.open_float()
    -- does the trick too.

    -- Make the sign column always there, even when there isn't an error. By reserving the space for the
    -- column always, there is less flicker during refreshes or loads. Without reserving this space, the
    -- LSP integration will clear the column on each save, then run the analysis, then insert the column
    -- with errors, causing the text to shift right.
    vim.opt.signcolumn = 'yes'

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            -- Change the character beside the LSP floating text.
            prefix = 'x', -- Could be '■', '●', '▎', 'x'
        },
    })

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions theme=dropdown<CR>', opts)
    vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations theme=dropdown<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references theme=dropdown<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- -- Use an on_attach function to only map the following keys after the language server
    -- -- attaches to the current buffer.
    -- -- NOTE: This seems like a good idea, but the on_attach function never fired, so the keys
    -- -- never mapped.
    -- local on_attach = function(client, bufnr)
    --     print "Attaching LSP to a buffer..."
    --     -- Enable completion triggered by <c-x><c-o>
    --     --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --
    --     -- Mappings.
    --     -- See `:help vim.lsp.*` for documentation on any of the below functions
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --     --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --     --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --     --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --     --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- end
    --
    -- As far as I can tell, these lines are not required. There is equivalent lines in the
    -- lsp-config documentation, but when I leave these out, I don't see a difference.
    -- NOTE: Sometimes language relevant plugins will configure LSP.
    --
    -- For a while, I did have the gopls line in my configuration. I don't know why these don't have
    -- to be uncommented, all I can do is observe that these LSP servers seem to be working.
    -- require'lspconfig'.gopls.setup{on_attach = on_attach}
    -- require'lspconfig'.sumneko_lua.setup{}

    -- This LSP configuration is handled by the rust-tools plugin. No need to have it here in LSP
    -- config.
    -- require'lspconfig'.rust_analyzer.setup{on_attach = on_attach}

    --
    -- Python language server configuration.
    --
    -- cd ~/.virtualenvs
    -- python3 -m venv pyright
    -- pyright/bin/python -m pip install pyright
    --
    require'lspconfig'.pyright.setup{
        cmd = {
            "/home/jacobsimpson/.virtualenvs/pyright/bin/pyright-langserver",
            "--stdio"
        },
        root_dir = function() return vim.fn.getcwd() end,
    }
end
