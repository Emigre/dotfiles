" Fix to search results leaking into terminal
" https://github.com/mileszs/ack.vim/issues/18
set shellpipe=>

" use ag instead of ack
let g:ackprg = 'ag --ignore-case --ignore-dir={.git,bower_components,node_modules} --vimgrep --hidden'

fun! CustomAck(pattern)
  exe "Ack! '".a:pattern."'"
endfun
command! -nargs=* Ag call CustomAck(<f-args>)
nnoremap <leader>a :Ag<space>

" use ag but only return one match per file
fun! FindWithAck(pattern)
  let error_file = tempname()
  silent exe "!ag --ignore-case --ignore-dir={.git,bower_components,node_modules} --vimgrep --hidden --print0 --files-with-matches '".a:pattern."' | xargs -0 file | sed 's/:/:1:/' > ".error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  copen
  call delete(error_file)
  redraw!
endfun
command! -nargs=* Encounter call FindWithAck(<f-args>)
nnoremap <leader>e :Encounter<space>

" search for text in files, populate the quickfix list with them and run replace on it
fun! SearchAndReplace(pattern, newpattern)
  let error_file = tempname()
  silent exe "!ag --ignore-case --ignore-dir={.git,bower_components,node_modules} --vimgrep --hidden --print0 --files-with-matches '".a:pattern."' | xargs -0 file | sed 's/:/:1:/' > ".error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  copen
  call delete(error_file)
  redraw!
  exe 'cdo %s/\v\c'.a:pattern.'/'.a:newpattern.'/gc'
endfun
command! -nargs=* Replace call SearchAndReplace(<f-args>)
nnoremap <leader>r :Replace<space>

