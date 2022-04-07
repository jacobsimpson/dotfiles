return function()
    require'hop'.setup()

    vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char1()<cr>", {})
    vim.api.nvim_set_keymap('v', 's', "<cmd>lua require'hop'.hint_char1()<cr>", {})
end
