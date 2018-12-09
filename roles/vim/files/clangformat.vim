" llvm, google, chromium, mozilla are supported
if getcwd() =~? '^/Users/[^/]\+/code/chromium'
  let g:clang_format#code_style = 'chromium'
else
  let g:clang_format#code_style = 'google'
endif

fun! s:clangFormatIfInCodeFolder()
    let file = expand('%:p')
    if file =~? '^/Users/[^/]\+/code/'
          \ && (
          \   file !~? '^/Users/[^/]\+/code/openFrameworks'
          \   || file =~? '^/Users/[^/]\+/code/openFrameworks/apps'
          \ )
      ClangFormat
    endif
endf
au BufWritePre *.{c,cpp,h,hpp,m,mm} :call <SID>clangFormatIfInCodeFolder()

" https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#style_options = {
      \ 'AccessModifierOffset': -1,
      \ 'AllowShortBlocksOnASingleLine': 'false',
      \ 'AllowShortFunctionsOnASingleLine': 'None',
      \ 'AllowShortIfStatementsOnASingleLine': 'false',
      \ }
