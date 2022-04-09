return function()
    -- Adding the autocommands in a group means that when this file gets reloaded, the group gets
    -- cleared and autocommands are re-added. Makes the development process of reloading this file with
    -- changes idempotent.
    local group = vim.api.nvim_create_augroup('comment_initialization', { clear = true })
    vim.api.nvim_create_autocmd('VimEnter', {
        group = group,
        callback = function()
            vim.schedule(function()
                require('Comment').setup({
                    --toggler = {
                    --    line = '<Space-c>'
                    --},
                    --opleader = {
                    --    line = '<Space-c>'
                    --},
                })
            end)
        end,
    })
end
