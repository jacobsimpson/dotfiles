" Vim Script
Plug 'folke/twilight.nvim'

" At this point, we are still in the special vim-plug initialization section,
" so the twilight has not yet been executed, and the twilight.setup object
" does not yet exist. So, each of the module initialization sections creates a
" function that completes the twilight module initialization, and uses
" VimEnter to execute it the initialization function at some time in the
" future.

lua << EOF
function twilight_initialize()
  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
end
EOF
autocmd VimEnter * :lua twilight_initialize()
