Plug 'dcampos/nvim-snippy'

imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-next)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

" This is very interesting. I'd love to have different patterns for test files
" than for code files.
""    autocmd BufRead,BufNewFile *_spec.lua lua require('snippy').setup_buffer(0,
""        \ { scopes = { '_', 'lua', 'busted' } })

" Any 'snippets' directory on the runtimepath will be added to the available
" snippets.
let &runtimepath.="," . g:ConfigDir . "/snippets"


" These functions are used in expanding snippets.
lua <<EOF
function _G.snippy_get_java_classname()
    local f = vim.fn.expand('%')
    local i = f:reverse():find('/')
    if i then
        f = f:sub(i*-1+1)
    end
    return f:sub(0, -6)
end
EOF
