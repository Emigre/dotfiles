" let b:gutentags_tagfile = 'tags'

fun! s:beamMeUp()
  " let line = getline('.')
  let word = expand('<cWORD>')
  " let strBeforeCursor  = strpart(str, 0, col('.') - 1)
  " let strAfterCursor  = strpart(str, col('.'))
  let str = substitute(word, '[^A-Za-z]', '', 'g')
  echo str
  " let w = expand('<cWORD>')
  " echo '' . expand('<cword>')
  let g:ctrlp_default_input = str
  exe 'CtrlPTag'
  " exe 'normal \<C-P>'
  let g:ctrlp_default_input = ''
endf

" nnoremap <C-]> :call <SID>beamMeUp()<CR>

" function! s:JumpToTag()
"   " try to find a word under the cursor
"   let current_word = expand("<cword>")
" 
"   " check if there is one
"   if current_word == ''
"     echomsg "No word under the cursor"
"     return
"   endif
" 
"   " find all tags for the given word
"   let tags = taglist('^'.current_word.'$')
" 
"   " if no tags are found, bail out
"   if empty(tags)
"     echomsg "No tags found for: ".current_word
"     return
"   endif
" 
"   " take the first tag, or implement some more complicated logic here
"   let selected_tag = tags[0]
" 
"   " edit the relevant file, jump to the tag's position
"   exe 'edit '.selected_tag.filename
"   exe selected_tag.cmd
" endfunction
