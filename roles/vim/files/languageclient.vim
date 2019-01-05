" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'typescript': ['typescript-language-server', '--stdio'],
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

let g:LanguageClient_diagnosticsList = "Location"

" Valid options: Never, Auto, Always
let g:LanguageClient_hoverPreview = 'Always'

" preview window at bottom (with the type info)
set splitbelow
set previewheight=6

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

fun! MyLanguageClientHoverCallback(output, ...) abort
    if has_key(a:output, 'result')
        let tmp = tempname()
        try
          let result = get(a:output, 'result')
          let contents = get(result, 'contents')
          let firstContent = contents[0]
          let value = get(firstContent, 'value')
          let language = get(firstContent, 'language')
          silent exe ':pedit! __MyLanguageClient__'
          wincmd P
          silent put=value
          execute '1delete'
          setlocal laststatus=0
          setlocal buftype=nofile
          setlocal noswapfile
          exe 'setlocal syntax=' . language
          setlocal bufhidden=delete
          setlocal nobuflisted
          setlocal readonly
          execute "resize " . line('$')
          wincmd p
        catch
        endtry
        return get(a:output, 'result')
    elseif has_key(a:output, 'error')
        let l:error = get(a:output, 'error')
        let l:message = get(l:error, 'message')
        echo l:error
        echo l:message
        call input('ERROR: ' . l:error . ' ' . l:message)
        return v:null
    else
        call input('ERROR: Unknown output type:' . json_encode(a:output))
      return v:null
    endif
endfun
nnoremap <silent> t :call LanguageClient#textDocument_hover({}, function('MyLanguageClientHoverCallback'))<CR>

nnoremap <silent> T :pc<CR>

" go to the declaration
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" go to the implementation
nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>

" LanguageClient#textDocument_typeDefinition()

" LanguageClient#textDocument_rename()

" LanguageClient#textDocument_documentSymbol()

" LanguageClient#textDocument_codeAction()

" LanguageClient#textDocument_completion()

" LanguageClient#serverStatus()
