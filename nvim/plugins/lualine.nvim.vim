
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

lua << END
function lualine_initialize()
    require('lualine').setup {
        options = {
            theme = 'gruvbox'
        }
    }
end
vim.cmd [[ autocmd VimEnter * :lua lualine_initialize() ]]
--autocmd VimEnter * :lua lualine_initialize()
END
