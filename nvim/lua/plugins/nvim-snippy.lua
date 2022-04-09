-- These functions are used in expanding snippets.
function _G.snippy_get_java_classname()
    local f = vim.fn.expand('%')
    local i = f:reverse():find('/')
    if i then
        f = f:sub(i * -1 + 1)
    end
    return f:sub(0, -6)
end

return function()
    require('snippy').setup({
        mappings = {
            is = {
                ['<Tab>'] = 'expand_or_advance',
                ['<S-Tab>'] = 'previous',
            },
            nx = {
                ['<leader>x'] = 'cut_text',
            },
        },
    })

    -- This is an interesting idea. I'd love to have different patterns for test files than for code
    -- files.
    ----    autocmd BufRead,BufNewFile *_spec.lua lua require('snippy').setup_buffer(0,
    ----        \ { scopes = { '_', 'lua', 'busted' } })

    -- Any 'snippets' directory on the runtimepath will be added to the available
    -- snippets. This directory is in my 'dotfiles' repo.
    vim.cmd([[let &runtimepath.="," . g:ConfigDir . "/snippets"]])
end
