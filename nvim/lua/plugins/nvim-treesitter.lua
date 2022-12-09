-- Some treesitter code that might be useful to learn from
--    - https://github.com/nvim-treesitter/nvim-treesitter-refactor

-- NOTE: I was getting some semi-random errors about no tree-sitter CLI. In theory, the plugin
-- should download and compile the necessary C files, but apparently that doesn't happen for _some_
-- grammars.
-- install_cargo tree-sitter-cli
-- Down at the bottom: https://github.com/nvim-treesitter/nvim-treesitter/issues/1097
return function()
    require('nvim-treesitter.configs').setup({
        -- Specify the parsers I want to have available.
        ensure_installed = {
            'awk',
            'bash',
            'dockerfile',
            'go',
            'gomod',
            'java',
            'jq',
            'lua',  -- As of 2022-09, this was causing errors in Vim Lua files.
            -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1887
            -- Some people found it was a problem compiling the parsers. I disabled the treesitter
            -- plugin, used PackerSync to get rid of it, then re-enabled the treesitter plugin and
            -- PackerSync to bring it back, with these misbehaving parsers disabled. That cleared
            -- the errors, but left me without markdown support.
            --'markdown',        -- This stopped working 2022-09-16.
            --'markdown_inline', -- The markdown parser is a two phase parser, so two components.
            'python',
            'rust',
            'sql',
            'toml',
            -- I think this was popping up sprurious errors when browsing help files and
            -- Lua config.
            'vim',
            'yaml',
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

    -- https://tree-sitter.github.io/tree-sitter/using-parsers#pattern-matching-with-queries
    --    -   documentation on the query language.
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/rust/highlights.scm
    --    -   scm files with Treesitter queries.
    -- https://www.youtube.com/watch?v=86sgKa0jeO4&ab_channel=s1n7ax
    --    -   A tutorial on making and testing queries. It's a little more about the nvim stuff.
    --require("vim.treesitter.query").set_query("rust", "injections", "(line_comment) @stuff")
    --require("vim.treesitter.query").set_query("rust", "injections", "[ (line_comment) (block_comment) ] @stuff")

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
