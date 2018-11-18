" llvm, google, chromium, mozilla are supported
let g:clang_format#code_style = 'chromium'

let g:clang_format#auto_format = 1

let g:clang_format#style_options = {
      \ 'AccessModifierOffset': -1,
      \ 'AllowShortFunctionsOnASingleLine': 'Empty',
      \ }
