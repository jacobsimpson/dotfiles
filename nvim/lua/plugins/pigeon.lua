return function()
    local group = vim.api.nvim_create_augroup('pigeon_initialization', { clear = true })
    vim.api.nvim_create_autocmd('BufNewFile', {
        group = group,
        callback = function()
            vim.opt.filetime = 'pigeon'
        end,
    })
end
