if exists("current_compiler")
    finish
endif
let current_compiler = "pylint"
setlocal makeprg=pylint\ %

"W: 15,0: Wildcard import datahub.lib.base
"C: 24,0: Invalid name "log" (should match (([A-Z_][A-Z0-9_]*)|(__.*__))$)
"E: 29,4:RfmLoginController._mustNotBeLoggedIn: Method has no argument
"W: 37,20:RfmLoginController.index: Unused argument 'environ'
"W: 63,19:RfmLoginController.full: Unused argument 'environ'
" ** REMEMBER: , is a special character which indicates a new formatting
" string, enabling multiple formatting strings in one efm= setting. So,
" I used %. instead, which is basically escaping out of the scanf 
" functionality (%) to use a vim RE (.).
setl errorformat=%t:\ %#%l%.%c:%m
