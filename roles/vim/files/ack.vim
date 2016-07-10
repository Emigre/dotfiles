" Fix to search results leaking into terminal
" https://github.com/mileszs/ack.vim/issues/18
set shellpipe=>

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden'
endif

nnoremap <leader>a :Ack!<space>
