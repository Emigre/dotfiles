" Fix to search results leaking into terminal
" https://github.com/mileszs/ack.vim/issues/18
set shellpipe=>

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --ignore-dir={.git,bower_components,node_modules} --vimgrep --hidden'
endif

nnoremap <leader>a :Ack!<space>

" Find and Replace
function! s:FindAndReplace(pattern, newpattern)
  " TODO
endfunction

command! -nargs=3 FindAndReplace call s:FindAndReplace(<f-args>)
nnoremap <leader>f :FindAndReplace <space>

