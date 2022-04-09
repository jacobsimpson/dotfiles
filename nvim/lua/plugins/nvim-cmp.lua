return function()
    local cmp = require('cmp')

    cmp.setup({
        snippet = {
            expand = function(args)
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                require('snippy').expand_snippet(args.body) -- For `snippy` users.
            end,
        },

        mapping = {
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.scroll_docs(-4),
            ['<C-n>'] = cmp.mapping.scroll_docs(4),
            --['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        },

        -- You should specify your *installed* sources. The order of these items
        -- matters, it will determine the order that the potential results appear in.
        sources = {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            --{ name = 'luasnip' },
            --{ name = 'snippy' }, -- For snippy users.
        },

        experimental = {
            -- There is an experimental new menu implementation. This turns off the default.
            native_menu = false,
            ghost_text = true,
        },
    })
end
