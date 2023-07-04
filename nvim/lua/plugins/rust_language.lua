-- Adding the autocommands in a group means that when this file gets reloaded,
-- the group gets cleared and autocommands are re-added. Makes the development
-- process of reloading this file with changes idempotent.
local group = vim.api.nvim_create_augroup("rust", {clear = true})

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

function basename(str)
	local name = string.gsub(str, "(.*/)(.*)", "%2")
	return name
end

function dirname(str)
	local name = string.gsub(str, "(.*/)(.*)", "%1")
	return name
end

-- Attempts to detect the 'alternate' file. In many circumstances, that just
-- means the file with the tests. Rust is very flexible about where tests are
-- located, so this alternate detection implementation is just based on the
-- coding conventions of where I work.
local function go_alternate_file()
    local current_file = vim.api.nvim_buf_get_name(0)
    local alternate_file = nil
    if (ends_with(current_file, "/test.rs")) then
        alternate_file = dirname(current_file) .. ".rs"
    elseif (ends_with(current_file, ".rs")) then
        -- If the file name is also a module name, then look for the test file
        -- in the module.
        local filename = basename(current_file)
        local path = dirname(current_file)
        local stem = filename:sub(0, -4)
        alternate_file = path .. "/" .. stem .. "/" .. "test.rs"

        -- else if the file name is not a module name, but is in a module, then
        -- look for the test file colocated with the current file.
    end

    -- If an alternate was found, go there.
    if (alternate_file ~= nil) then
        vim.cmd('e ' .. alternate_file)
    else
        print("No alternate file found.")
    end
end

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

    local lsp = require'lspconfig'

    -- An experimental little thing to try to clear the warnings appearing
    -- beside each macro "proc macro x not expanded".
    -- https://users.rust-lang.org/t/how-to-disable-rust-analyzer-proc-macro-warnings-in-neovim/53150
    lsp.rust_analyzer.setup {
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = true,
                    disabled = {"unresolved-proc-macro"},
                    enableExperimental = true,
                },
            },
        }
    }

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

            vim.keymap.set(
                'n',
                '<space>a',
                go_alternate_file,
                { desc = 'Go to the alternate file.', remap = false, buffer = true, silent = true }
            )

        end,
    })
end
