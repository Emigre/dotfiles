" Fix to search results leaking into terminal
" https://github.com/mileszs/ack.vim/issues/18
set shellpipe=>

" set vim ack to use ag instead of ack
let g:ackprg = 'ag --ignore-case --ignore-dir={.git,bower_components,node_modules} --vimgrep --hidden'

" customize ack
fun! CustomAck(pattern, ...)
  let path = a:0 < 1 ? '' : a:1
  let search = substitute(a:pattern, "\'", "\\\\x27", "g")
  exe "Ack! '".search."' ".path
endfun
command! -nargs=* Search call CustomAck(<f-args>)
nnoremap <leader>s :Search<space>

" use ag but only return one match per file
fun! FindByContent(pattern, ...)
  let error_file = tempname()
  let path = a:0 < 1 ? '' : a:1
  let search = substitute(a:pattern, "\'", "\\\\x27", "g")
  silent exe "!".g:ackprg." --print0 --files-with-matches '".search."' ".path." | xargs -0 file | sed 's/:/:1:/' > ".error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  copen
  call delete(error_file)
  redraw!
endfun
command! -nargs=* Encounter call FindByContent(<f-args>)
nnoremap <leader>e :Encounter<space>

" search for text in files, populate the quickfix list with them and run replace on it
fun! SearchAndReplace(pattern, newpattern, ...)
  let error_file = tempname()
  let path = a:0 < 1 ? '' : a:1
  let search = substitute(a:pattern, "\'", "\\\\x27", "g")
  silent exe "!".g:ackprg." --print0 --files-with-matches '".search."' ".path." | xargs -0 file | sed 's/:/:1:/' > ".error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  copen
  call delete(error_file)
  redraw!
  exe 'cdo %s/\v\c'.a:pattern.'/'.a:newpattern.'/gci | update'
endfun
command! -nargs=* Replace call SearchAndReplace(<f-args>)
nnoremap <leader>r :Replace<space>

" Shortcut to substitute
:nnoremap <Leader>a :%s/\c\<<C-r><C-w>\>//gc<Left><Left><Left>

" find files by filename and populate the quickfix list with them
fun! FindFiles(filename, ...)
  let error_file = tempname()
  let path = a:0 < 1 ? '.' : a:1
  silent exe '!find '.path.' -type d \( -path .*/node_modules -o -path .*/.git -o -path .*/bower_components \) -prune -o -iname "'.a:filename.'" -print0 | xargs -0 file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  copen
  call delete(error_file)
  redraw!
endfun
command! -nargs=* Find call FindFiles(<f-args>)
nnoremap <leader>f :Find<space>

