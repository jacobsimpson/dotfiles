return function()
    require('nvim-treesitter.configs').setup({
        -- Specify the parsers I want to have available.
        ensure_installed = {
            'bash',
            'dockerfile',
            'go',
            'gomod',
            'java',
            'lua',
            'markdown',
            'rust',
            'toml',
            'vim',
        },
        highlight = {
            enable = true,
        },
        --incremental_selection = {
        --  enable = true,
        --  keymaps = {
        --    init_selection = "gnn",
        --    node_incremental = "grn",
        --    scope_incremental = "grc",
        --    node_decremental = "grm",
        --  },
        --},
    })

    require('nvim-treesitter.configs').setup({
        textobjects = {

            select = {
                enable = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['a/'] = '@comment.outer',
                    ['i/'] = '@comment.outer',
                    ['ic'] = '@conditional.inner',
                    ['ac'] = '@conditional.outer',
                    ['ab'] = '@block.outer',
                    ['ib'] = '@block.inner',
                    ['ap'] = '@parameter.outer',
                    ['ip'] = '@parameter.inner',
                    ['as'] = '@statement.outer',
                },
            },

            move = {
                enable = true,
                goto_next_start = {
                    [']f'] = '@function.outer',
                    [']]'] = '@block.outer',
                    [']i'] = '@conditional.outer',
                    [']c'] = '@class.outer',
                    [']/'] = '@comment.outer',
                },
                goto_next_end = {
                    [']F'] = '@function.outer',
                    [']['] = '@block.outer',
                    [']I'] = '@conditional.outer',
                    [']C'] = '@class.outer',
                    [']\\'] = '@comment.outer',
                },
                goto_previous_start = {
                    ['[f'] = '@function.outer',
                    ['[['] = '@block.outer',
                    ['[i'] = '@conditional.outer',
                    ['[c'] = '@class.outer',
                    ['[/'] = '@comment.outer',
                },
                goto_previous_end = {
                    ['[F'] = '@function.outer',
                    ['[]'] = '@block.outer',
                    ['[I'] = '@conditional.outer',
                    ['[C'] = '@class.outer',
                    ['[\\'] = '@comment.outer',
                },
            },

            swap = {
                enable = true,
                swap_next = {
                    [',a'] = '@parameter.inner',
                },
                swap_previous = {
                    [',A'] = '@parameter.inner',
                },
            },
        },
    })

    require('nvim-treesitter.configs').setup({
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
        },
    })
end
