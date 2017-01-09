let g:buftabline_indicators=1

" colors for zenburn
hi BufTabLineCurrent ctermbg=237 ctermfg=8
hi BufTabLineActive ctermbg=236 ctermfg=8
hi BufTabLineHidden ctermbg=235 ctermfg=8
hi BufTabLineFill ctermbg=235

fun! GoToTab(n)
  if a:n <= len(buftabline#user_buffers())
    exe "normal \<Plug>BufTabLine.Go(".a:n.")"
  endif
endfun

nmap <silent> <leader>1 :call GoToTab(1)<cr>
nmap <silent> <leader>2 :call GoToTab(2)<cr>
nmap <silent> <leader>3 :call GoToTab(3)<cr>
nmap <silent> <leader>4 :call GoToTab(4)<cr>
nmap <silent> <leader>5 :call GoToTab(5)<cr>
nmap <silent> <leader>6 :call GoToTab(6)<cr>
nmap <silent> <leader>7 :call GoToTab(7)<cr>
nmap <silent> <leader>8 :call GoToTab(8)<cr>
nmap <silent> <leader>9 :call GoToTab(9)<cr>
nmap <silent> <leader>0 :call GoToTab(0)<cr>
