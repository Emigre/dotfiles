let g:ycm_global_ycm_extra_conf = '~/scripts/ycm_extra_conf.py'
let g:ycm_error_symbol = '▸'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

fun! s:beamMeUp()
  let str = getline('.')
  let strBeforeCursor  = strpart(str, 0, col('.') - 1)
  let strAfterCursor  = strpart(str, col('.'))

  if &ft ==# 'cpp' || &ft ==# 'c'
    if str =~ '^#include'
      " I think that this is an include
      exe 'YcmCompleter GoToInclude'
    elseif strBeforeCursor =~ ':'
      " I think that this is a method
      exe 'YcmCompleter GoToDeclaration'
    elseif strAfterCursor =~ ':'
      " I think that this is a class
      exe 'YcmCompleter GoToDefinition'
    else
      " I don't know what this is
      exe 'YcmCompleter GoTo'
    endif
  endif
endf

nnoremap <C-]> :call <SID>beamMeUp()<CR>
nnoremap [ :YcmCompleter GetType<CR>
nnoremap ] :YcmForceCompileAndDiagnostics<CR>

hi YcmErrorSign ctermfg=9 ctermbg=237
