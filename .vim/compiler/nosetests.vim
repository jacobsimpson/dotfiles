if exists("current_compiler")
    finish
endif
let current_compiler = "nosetests"
setlocal makeprg=nosetests\ $*

"Traceback (most recent call last):
"  File "/home/jsimpson/projects/RigFocusMobileProtoype/src/pylons/datahub/datahub/tests/controllers/test_beta_features.py", line 27, in testSubmit_noParams
"    self.assertTrue(beta_feature_common.updateBetaFeatureUsers.args[3] != None)
"AssertionError
" ** REMEMBER: , is a special character which indicates a new formatting
" string, enabling multiple formatting strings in one efm= setting. So,
" I used %. instead, which is basically escaping out of the scanf 
" functionality (%) to use a vim RE (.).
"setl errorformat=File\ "%f"%.\ line\ %l
setl errorformat=File\ "%f"
