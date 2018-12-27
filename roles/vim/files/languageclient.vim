" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'javascript.jsx': ['flow-language-server', '--stdio'],
    \ 'cpp': ['/usr/local/opt/llvm/bin/clangd'],
    \ }

let g:LanguageClient_diagnosticsDisplay = {
    \ 1: {
    \   "name": "Error",
    \   "texthl": "ALEError",
    \   "signText": "▸",
    \   "signTexthl": "ALEErrorSign",
    \ },
    \ 2: {
    \  "name": "Warning",
    \  "texthl": "ALEWarning",
    \  "signText": "▸",
    \  "signTexthl": "ALEWarningSign",
    \ },
    \ 3: {
    \  "name": "Information",
    \  "texthl": "ALEError",
    \  "signText": "▸",
    \  "signTexthl": "ALEWarningSign",
    \ },
    \ 4: {
    \  "name": "Hint",
    \  "texthl": "ALEInfo",
    \  "signText": "▸",
    \  "signTexthl": "ALEWarningSign",
    \ }
    \ }


" Valid options: Quickfix | Location | Disabled
" let g:LanguageClient_diagnosticsList = "Location"

" Valid options: Never, Auto, Always
let g:LanguageClient_hoverPreview = 'Auto'

" preview window at bottom (with the type info)
set splitbelow
set previewheight=3

" do not run language server outside the code folders
fun! s:disableLanguageClientIfNeeded()
  if &filetype ==# 'vimfiler'
    retu
  else
    let folder = expand('%:p:h')
    if folder !~? '^/Users/[^/]\+/code/[^/]\+'
      LanguageClientStop
    endif
  endif
endfun
au BufEnter,BufWinEnter,WinEnter,CmdwinEnter *.cpp,*.c,*.incl,*.hpp,*.h,*.js,*.jsx,*.ts
      \ call <SID>disableLanguageClientIfNeeded()

fun! s:disableStatusline(bn)
  if a:bn == bufname('%')
    set laststatus=0
  endif
endfun
au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * call <SID>disableStatusline('__LanguageClient__')

fun! s:toggleHover()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&pvw") == 1
      " found a preview window: close it
      exe 'pc'
      retu 1
    endif
  endfor
  call LanguageClient#textDocument_hover()
endfun

nnoremap <silent> t :call <SID>toggleHover()<CR>

nnoremap <silent> T :call LanguageClient#textDocument_hover()<CR>

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

fun! s:switchBetweenHeaderAndImplementation()
  if match(expand('%'), '\.\(c\|cc\|cpp\)$') > 0
    let target = 'header'
    let search_pattern = substitute(expand('%:t'), '\.c\(.*\)$', '.h*', '')
  elseif match(expand('%'), '\.\(h\|hpp\)$') > 0
    let target = 'implementation'
    let search_pattern = substitute(expand('%:t'), '\.h\(.*\)$', '.c*', '')
  else
    echo 'Failed to switch to header or implementation for this file'
    retu
  endif
  let dir_name = fnamemodify(expand('%:p'), ':h')
  let cmd = 'find ' . dir_name .  ' . -type f ' .
        \ '-iname ' . search_pattern . ' -print -quit'
  let file_name = substitute(system(cmd), '\n$', '', '')
  if filereadable(file_name)
    exe 'e ' file_name
  else
    echo 'No ' . target . ' file found for ' . expand('%:t')
  endif
endfun
nnoremap <silent> <leader>o :call <SID>switchBetweenHeaderAndImplementation()<CR>

fun! s:addInclude(...)
  let include_item = ''
  if a:0
    if match(a:0, '\.\(h\|hpp\)$') > 0
      let include_item = '"' . a:1 . '"'
    else
      let include_item = '<' . a:1 . '>'
    endif
  else
    let path = expand('%')
    if match(path, '\.\(c\|cc\|cpp\)$') > 0
      let file_path = substitute(path, '^src\/', '', '')
      let header_path = substitute(file_path, '\.\(c\|cc\|cpp\)$', '.h', '')
      let include_item = '"' . header_path . '"'
    endif
  endif
  if include_item != ''
    echo include_item
    exe 'normal! gg}k'
    call append(line('.'), '#include ' . include_item)
    exe 'normal jj'
  endif
endf
command! -nargs=* Include call <SID>addInclude(<f-args>)
nnoremap <leader>i :Include<space>
