" The easy motion system, where you type an activating letter, then the letter
" you see on the screen, then the disambiguating letter that appears over the
" letter you see. Move anywhere on the screen in 3 keys.
Plug 'phaazon/hop.nvim'

lua <<EOF

vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.api.nvim_set_keymap('v', 's', "<cmd>lua require'hop'.hint_char1()<cr>", {})

EOF
