-- Adding the autocommands in a group means that when this file gets reloaded,
-- the group gets cleared and autocommands are re-added. Makes the development
-- process of reloading this file with changes idempotent.
local group = vim.api.nvim_create_augroup("Trouble", {clear = true})

print "Making the trouble autocmd"
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'Trouble',
    group = group,
    callback = function()
        -- This function fires when transitioning to a Rust buffer.

        print "entering a trouble buffer."
        -- So weird, somewhere this value is getting overridden to 99, so I'm
        -- setting it each time I enter a rust buffer.
        -- vim.opt.textwidth = 80

        print "Entering a Trouble buffer."

        -- These are the right commands, but somehow they are not working.
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.breakindent = true
        vim.opt.breakindentopt = { 'shift:7', 'sbr' }

        -- vim.cmd([[<cmd>set wrap<cr>]])
        -- vim.cmd([[<cmd>set linebreak<cr>]])
        -- vim.cmd([[<cmd>set breakindent<cr>]])
        -- vim.cmd([[<cmd>set breakindentopt=shift:7,min:40,sbr<cr>]])
    end,
})

function fix_quick_fix_buffer()
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.breakindent = true
    vim.opt.breakindentopt = { 'shift:7', 'sbr' }
end

return function()
    require("trouble").setup {}
    vim.api.nvim_set_keymap(
        'n',
        '<space>q',
        '<cmd>TroubleToggle<CR>',
        { noremap = true, silent = true })
end
