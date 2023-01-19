-- Adding the autocommands in a group means that when this file gets reloaded, the group gets
-- cleared and autocommands are re-added. Makes the development process of reloading this file with
-- changes idempotent.
local group = vim.api.nvim_create_augroup("rust", {clear = true})

-- This section will affect all closed terminals, not just Rust related terminals.
vim.api.nvim_create_autocmd('TermClose', {
    group = group,
    callback = function()
        vim.keymap.set(
            'n',
            '<ESC>',
            "<cmd>bd!<cr>",
            { desc = 'Close completed terminal.', remap = false, buffer = true, silent = true }
        )

        vim.keymap.set(
            'n',
            '<C-C>',
            "<cmd>bd!<cr>",
            { desc = 'Close completed terminal.', remap = false, buffer = true, silent = true }
        )

        vim.keymap.set(
            'n',
            'q',
            "<cmd>bd!<cr>",
            { desc = 'Close completed terminal.', remap = false, buffer = true, silent = true }
        )
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    callback = function()
        if vim.lsp.buf.server_ready() then
            -- Using the LSP format functionality is here is somewhat convenient,
            -- and will be consistent across all languages configured for LSP,
            -- however this function doesn't work when the LSP service is restarting
            -- or reloading. So, each time there is a Cargo change in Rust.
            -- Could be worth integrating the rust formatter instead.
            vim.lsp.buf.format()
        end
    end,
})

return function()
    -- https://oren.github.io/articles/rust/neovim/
    -- - Shows how to show documentation in a popup window.
    --
    --
    ------
    ------ Plug 'rust-lang/rust.vim'
    ------ Plug 'simrat39/rust-tools.nvim'

    require('rust-tools').setup({})

    -- Enable Rust formatting on save. This setting is associated with the rust.vim
    -- plugin.
    --vim.api.nvim_set_var('rustfmt_autosave', 1)

    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'rust',
        group = group,
        callback = function()
            -- This function fires when transitioning to a Rust buffer.

            -- So weird, somewhere this value is getting overridden to 99, so I'm
            -- setting it each time I enter a rust buffer.
            vim.opt.textwidth = 80
        end,
    })


    --au FileType rust nmap <buffer> <silent> <Space>b  :sp <BAR> term cargo build<CR>
    --au FileType rust nmap <buffer> <silent> <Space>f  :RustFmt<CR>
    --au FileType rust nmap <buffer> <silent> <Space>ga :call language#rust#GoAlternate()<CR>
    --au FileType rust nmap <buffer>          <Space>r  :RustRun<CR>
    --au FileType rust nmap <buffer>          <Space>s  :call language#rust#Scratch()<CR>
    --au FileType rust nmap <buffer> <silent> <Space>t  :RustTest<CR>
    vim.api.nvim_create_autocmd('FileType', {
        pattern = "rust",
        group = group,
        callback = function()
            vim.keymap.set(
                'n',
                '<Space>b',
                "<cmd>sp <bar> term cargo build<cr>",
                { desc = 'Start build.', remap = false, buffer = true, silent = true }
            )

            vim.keymap.set(
                'n',
                '<Space>f',
                "<cmd>lua vim.lsp.buf.format()<cr>",
                { desc = 'Format this file.', remap = false, buffer = true, silent = true }
            )

            vim.keymap.set(
                'n',
                '<Space>ga',
                "<cmd>call language#rust#GoAlternate()<CR>",
                { desc = 'Go to the alternate file.', remap = false, buffer = true, silent = true }
            )

            vim.keymap.set(
                'n',
                '<Space>r',
                "<cmd>RustRun<CR>",
                { desc = 'Run the project.', remap = false, buffer = true, silent = true }
            )

            vim.keymap.set(
                'n',
                '<Space>s',
                "<cmd>call language#rust#Scratch()<CR>",
                { desc = 'Create a scratch.', remap = false, buffer = true, silent = true }
            )

            vim.keymap.set(
                'n',
                '<Space>t',
                "<cmd>RustTest<CR>",
                { desc = 'Run a test.', remap = false, buffer = true, silent = true }
            )

        end,
    })
end
