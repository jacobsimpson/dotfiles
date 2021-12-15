Plug 'windwp/nvim-autopairs'

lua <<EOF
function nvim_autopairs_initialize()
    require('nvim-autopairs').setup{}
end
EOF
autocmd VimEnter * :lua nvim_autopairs_initialize()
