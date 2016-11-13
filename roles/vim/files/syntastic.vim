let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "░"
let g:syntastic_style_error_symbol = "░"
let g:syntastic_warning_symbol = "░"
let g:syntastic_style_warning_symbol = "░"
let g:syntastic_javascript_checkers=['eslint']

" Errors are red
hi! link SyntasticErrorSign SpellBad
" Warnings are pink
hi! link SyntasticWarningSign SpellRare

" Style errors are  blue
hi! link SyntasticStyleErrorSign SpellCap
" Stylye warnings are light blue
hi! link SyntasticStyleWarningSign SpellLocal
