
" The treesitter plugin itself provides language parsing and supports
" queries. Actual functionality is implemented by modules, configured below.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"
" Module configuration.
"

" At this point, we are still in the special vim-plug initialization section,
" so the nvim-treesitter has not yet been executed, and the
" nvim-treesitter.configs object does not yet exist. So, each of the module
" initialization sections creates a function that completes the treesitter
" module initialization, and uses VimEnter to execute it the initialization
" function at some time in the future.

" Incremental selection module configuration.
lua <<EOF
function nvim_treesitter_incremental_selection_initialize()
    require'nvim-treesitter.configs'.setup {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    }
end
EOF
autocmd VimEnter * :lua nvim_treesitter_incremental_selection_initialize()

" Treesitter text object module configuration.
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
lua <<EOF
function nvim_treesitter_text_object_initialize()
    require'nvim-treesitter.configs'.setup {
      textobjects = {

        select = {
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.outer",
            ["ic"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
        },

        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]]"] = "@block.outer",
            ["]i"] = "@conditional.outer",
            ["]c"] = "@class.outer",
            ["]/"] = "@comment.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]["] = "@block.outer",
            ["]I"] = "@conditional.outer",
            ["]C"] = "@class.outer",
            ["]\\"] = "@comment.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[["] = "@block.outer",
            ["[i"] = "@conditional.outer",
            ["[c"] = "@class.outer",
            ["[/"] = "@comment.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[]"] = "@block.outer",
            ["[I"] = "@conditional.outer",
            ["[C"] = "@class.outer",
            ["[\\"] = "@comment.outer",
          },
        },

        swap = {
          enable = true,
          swap_next = {
            [",a"] = "@parameter.inner",
          },
          swap_previous = {
            [",A"] = "@parameter.inner",
          },
        },

      },
    }
end
EOF
autocmd VimEnter * :lua nvim_treesitter_text_object_initialize()

Plug 'nvim-treesitter/playground'
lua <<EOF
function nvim_treesitter_playground_initialize()
    require "nvim-treesitter.configs".setup {
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false -- Whether the query persists across vim sessions
        }
    }
end
EOF
autocmd VimEnter * :lua nvim_treesitter_playground_initialize()
