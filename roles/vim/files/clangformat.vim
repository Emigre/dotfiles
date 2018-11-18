" llvm, google, chromium, mozilla are supported
let g:clang_format#code_style = 'chromium'

let g:clang_format#auto_format = 1

" https://clang.llvm.org/docs/ClangFormatStyleOptions.html

let g:clang_format#style_options = {
      \ 'AccessModifierOffset': -1,
      \ 'AllowShortBlocksOnASingleLine': 'false',
      \ 'AllowShortFunctionsOnASingleLine': 'None',
      \ }
