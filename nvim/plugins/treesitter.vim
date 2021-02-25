
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  incremental_selection = {
"    enable = true,
"    keymaps = {
"      init_selection = "gnn",
"      node_incremental = "grn",
"      scope_incremental = "grc",
"      node_decremental = "grm",
"    },
"  },
"}
"EOF

