-- Stuff about SQL files.

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

local UP_EXTENSION = ".up.sql"
local DOWN_EXTENSION = ".down.sql"

-- Adding the autocommands in a group means that when this file gets reloaded,
-- the group gets cleared and autocommands are re-added. Makes the development
-- process of reloading this file with changes idempotent.
local group = vim.api.nvim_create_augroup("sql", {clear = true})

vim.api.nvim_create_autocmd('FileType', {
    pattern = "sql",
    group = group,
    callback = function()
        vim.keymap.set(
            'n',
            '<Space>a',
            function()
                local current_file = vim.api.nvim_buf_get_name(0)
                local alternate_file = nil
                if (ends_with(current_file, UP_EXTENSION)) then
                    alternate_file = current_file:sub(0, -#UP_EXTENSION) .. "down.sql"
                end
                if (ends_with(current_file, DOWN_EXTENSION)) then
                    alternate_file = current_file:sub(0, -#DOWN_EXTENSION) .. "up.sql"
                end
                if (alternate_file ~= nil) then
                    vim.cmd('e ' .. alternate_file)
                end
            end,
            {
                desc = 'Switch to the alternate file',
                remap = false,
                buffer = true,
                silent = true
            }
        )
    end,
})
