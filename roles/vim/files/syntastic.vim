let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "░"
let g:syntastic_style_error_symbol = "░"
let g:syntastic_warning_symbol = "░"
let g:syntastic_style_warning_symbol = "░"
let g:syntastic_javascript_checkers=['eslint']

hi! link SyntasticErrorSign SpellBad
hi! link SyntasticStyleErrorSign SpellCap
hi! link SyntasticWarningSign SpellRare
hi! link SyntasticStyleWarningSign SpellLocal
