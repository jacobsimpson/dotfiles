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

    vim.api.nvim_set_keymap('n', ',bl', '', {
        desc = 'List currently open buffers.',
        noremap = true,
        callback = function()
            require('telescope.builtin').buffers({
                sort_mru = true,
                show_all_buffers = false,
                -- This seems like a useful option, it would be nice to exclude the current buffer
                -- from the list, however when there is only one buffer, this option results in the
                -- floating window not appearing at all.
                -- ignore_current_buffer = true,
            })
        end
    })

    vim.api.nvim_set_keymap('n', ',lb', '', {
        desc = 'List currently open buffers.',
        noremap = true,
        callback = function()
            require('telescope.builtin').buffers({
                sort_mru = true,
                show_all_buffers = false,
                -- This seems like a useful option, it would be nice to exclude the current buffer
                -- from the list, however when there is only one buffer, this option results in the
                -- floating window not appearing at all.
                -- ignore_current_buffer = true,
            })
        end
    })

    -- " I'm doing a little experiment to see which works better for me, <noun>-<action>, or
    -- " <action>-<noun>
    -- map <silent> ,bl <cmd>lua require('telescope.builtin').buffers({sort_mru = true, show_all_buffers = false, ignore_current_buffer = true})<cr>
    -- map <silent> ,lb <cmd>lua require('telescope.builtin').buffers({sort_mru = true, show_all_buffers = false, ignore_current_buffer = true})<cr>

end
