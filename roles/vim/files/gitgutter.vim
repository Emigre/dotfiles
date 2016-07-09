let g:gitgutter_sign_column_always = 1
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_signs = 1

hi SignColumn ctermbg=237
hi GitGutterAdd ctermfg=237
hi GitGutterChange ctermfg=16
hi GitGutterDelete ctermfg=16
hi GitGutterChangeDelete ctermfg=0

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" hi GitGutterAddLine ctermbg=22 ctermfg=22
" hi GitGutterChangeLine ctermbg=52 ctermfg=52
" hi GitGutterDeleteLine ctermbg=52 ctermfg=52
" hi GitGutterChangeDeleteLine ctermbg=1 ctermfg=1
