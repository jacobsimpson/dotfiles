
" Enable some keyboard shortcuts.
au FileType vim nmap ,a  :GoAlternate<CR>
au FileType vim nmap ,b  <Plug>(go-build)
au FileType vim vmap <Space>c :s#^#"#<CR>
au FileType vim nmap <Space>c :s#^#"#<CR>
au FileType vim nmap ,e  <Plug>(go-rename)
au FileType vim nmap ,ga GoAlternate<CR>
au FileType vim nmap ga  GoAlternate<CR>
au FileType vim nmap ,gb <Plug>(go-doc-browser)
au FileType vim nmap ,i  <Plug>(go-info)
au FileType vim nmap ,l  :GoLint<CR>
au FileType vim nmap ,m  :GoBuild<CR>
au FileType vim nmap ,n  <Plug>(go-rename)
au FileType vim nmap ,o  <Plug>(go-coverage)
au FileType vim nmap ,q  <Plug>(go-doc-split)
au FileType vim nmap ,r  <Plug>(go-run-split)
au FileType vim nmap ,t  <Plug>(go-test)


au FileType vim vmap <C-_> :s#^#"#<CR>
au FileType vim nmap <C-_> :s#^#"#<CR>
