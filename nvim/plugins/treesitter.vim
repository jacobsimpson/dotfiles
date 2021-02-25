
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" At this point, we are still in the special vim-plug initialization section,
" so the nvim-treesitter has not yet been executed, an nvim-treesitter.configs
" does not yet exist. So, make a function that completes the treesitter
" initialization, and use VimEnter to execute it later.
lua <<EOF
function nvim_treesitter_initialize()
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

autocmd VimEnter * :lua nvim_treesitter_initialize()

