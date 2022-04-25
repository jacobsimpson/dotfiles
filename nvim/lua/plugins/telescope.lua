-- NOTE: For reasons I have not been able to discover, these functions must not be local, or
-- attempts to call them from the function returned from this file will fail.
--
--   packer.nvim: Error running config for telescope.nvim: [string "..."]:0: attempt to call upvalue '' (a nil value)
--
-- -   I tested 'require'ing a function returned from a module that references local functions, and
--     it worked as expected.
-- -   I tested invoking a function to return a function from this module, that had no effect, I
--     still got the error listed above.

function telescope_plugin_list_open_buffers()
    require('telescope.builtin').buffers({
        sort_mru = true,
        show_all_buffers = false,
        -- This seems like a useful option, it would be nice to exclude the current buffer
        -- from the list, however when there is only one buffer, this option results in the
        -- floating window not appearing at all.
        -- ignore_current_buffer = true,
    })
end

function telescope_plugin_list_source_files()
    require('telescope.builtin').find_files({
        search_dirs = {
            'src/',
            'migrations/',
            'plugin/',
            'lua/',
            'doc/',
            'Cargo.toml',
            'build.rs',
        },
    })
end

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

    -- " I'm doing a little experiment to see which works better for me, <noun>-<action>, or
    -- " <action>-<noun>
    -- map <silent> ,bl <cmd>lua require('telescope.builtin').buffers({sort_mru = true, show_all_buffers = false, ignore_current_buffer = true})<cr>
    -- map <silent> ,lb <cmd>lua require('telescope.builtin').buffers({sort_mru = true, show_all_buffers = false, ignore_current_buffer = true})<cr>

    vim.api.nvim_set_keymap('n', ',bl', '', {
        desc = 'List currently open buffers.',
        noremap = true,
        callback = telescope_plugin_list_open_buffers,
    })

    vim.api.nvim_set_keymap('n', ',lb', '', {
        desc = 'List currently open buffers.',
        noremap = true,
        callback = telescope_plugin_list_open_buffers,
    })

    -- -- map <silent> ,ls :lua require('telescope.builtin').find_files( { search_dirs = { 'src/', 'migrations/', 'plugin/', 'lua/', 'doc/', 'Cargo.toml', 'build.rs' } })<CR>
    -- -- map <silent> ,sl :lua require('telescope.builtin').find_files( { search_dirs = { 'src/', 'migrations/', 'plugin/', 'lua/', 'doc/', 'Cargo.toml', 'build.rs' } })<CR>

    -- Switch to lua.keymap
    vim.api.nvim_set_keymap('n', ',ls', '', {
        desc = 'List source files.',
        noremap = true,
        callback = telescope_plugin_list_source_files,
    })

    vim.api.nvim_set_keymap('n', ',sl', '', {
        desc = 'List source files.',
        noremap = true,
        callback = telescope_plugin_list_source_files,
    })
end
