Plug 'ntpeters/vim-better-whitespace'

" Configure the whitespace plugin to auto strip trailing whitespace when the
" given file types are saved.
autocmd FileType ruby,python,javascript,html,c,cpp,text,vim,json,xml,sh,rs,coffee,groovy,scala,jproperties,toml,vue
      \  autocmd BufWritePre <buffer> StripWhitespace
