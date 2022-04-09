return function()
    require('telescope').setup({
        defaults = {
            -- Ctrl-/ in Telescope will show the current key mappings.
            mappings = {
                i = {
                    ['<C-j>'] = 'move_selection_next',
                    ['<C-k>'] = 'move_selection_previous',
                },
                n = {
                    ['<C-c>'] = require('telescope.actions').close,
                },
            },
        },
        layout_strategy = 'vertical',
    })
end
