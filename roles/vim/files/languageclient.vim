" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
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
