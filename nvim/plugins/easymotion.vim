" The easy motion system, where you type an activating letter, then the letter
" you see on the screen, then the disambiguating letter that appears over the
" letter you see. Move anywhere on the screen in 3 keys.
Plug 'easymotion/vim-easymotion'

" EasyMotion configuration.
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_leader_key = ','

" Maps the s as the key to do searchs in most modes, using the in buffer
" motion function so that it will work in Visual mode.
map s <Plug>(easymotion-bd-f)
" In normal mode, the s key will use the overwin motion function that allows
" you to move between splits as well. The overwin motion function will not
" work (at all) if you are in visual mode, since being in visual mode implies
" selection is part of the motion, and selection can't carry between windows.
nmap s <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

