" The easy motion system, where you type an activating letter, then the letter
" you see on the screen, then the disambiguating letter that appears over the
" letter you see. Move anywhere on the screen in 3 keys.
Plug 'easymotion/vim-easymotion'

" EasyMotion configuration.
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_leader_key = ','
nmap s <Plug>(easymotion-overwin-f)

