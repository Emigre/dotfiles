fun! s:applyHeaderguardIfNoGuardsInTheFile()
  if !search('^#\(ifndef \|pragma once\)', 'nw')
    HeaderguardAdd
  end
endf

au BufWritePre *.h,*.hpp silent! call <SID>applyHeaderguardIfNoGuardsInTheFile()

fun! g:HeaderguardName()
  let l:path = expand('%:s$^\(src\|include\)/$$')
  retu toupper(substitute(l:path, '[^0-9a-zA-Z_]', '_', 'g')) . '_'
endf

fun! g:HeaderguardLine1()
  retu "#ifndef " . g:HeaderguardName()
endf

fun! g:HeaderguardLine2()
  retu "#define " . g:HeaderguardName()
endf

fun! g:HeaderguardLine3()
  retu "#endif  // " . g:HeaderguardName()
endf
