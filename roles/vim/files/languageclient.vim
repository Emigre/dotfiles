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
let g:LanguageClient_diagnosticsList = "Location"

" Valid options: Never, Auto, Always
let g:LanguageClient_hoverPreview = 'Auto'

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" LanguageClient#textDocument_implementation()
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" LanguageClient#textDocument_documentSymbol()
" LanguageClient#textDocument_references()
" LanguageClient#textDocument_documentHighlight()
" LanguageClient#clearDocumentHighlight()
" LanguageClient#workspace_symbol()

" LanguageClient#serverStatus()
" LanguageClient#serverStatusMessage()
" LanguageClient#explainErrorAtPoint

" :LspCodeAction	Gets a list of possible commands that can be applied to a file so it can be fixed (quick fix)
" :LspDocumentDiagnostics	Get current document diagnostics information
" :LspDefinition	Go to definition
" :LspDocumentFormat	Format entire document
" :LspDocumentRangeFormat	Format document selection
" :LspDocumentSymbol	Show document symbols
" :LspHover	Show hover information
" :LspNextError	jump to next error
" :LspPreviousError	jump to previous error
" :LspImplementation	Show implementation of interface
" :LspReferences	Find references
" :LspRename	Rename symbol
" :LspTypeDefinition	Go to type definition
" :LspWorkspaceSymbol	Search/Show workspace symbol




" fun! UpdateRuf(timer)
"   if get(g:, 'LanguageClient_serverStatus', 'no LSP server') == 0
"     echo g:LanguageClient_serverStatus() . ' "' .  g:LanguageClient_serverStatusMessage() . '"'
"   endif
"
"   " set ruf=%l,%c%=%{call('LanguageClient#statusLine')}%P
" endf

" call timer_start(1000, function('UpdateRuf'), {'repeat': -1})
" call UpdateRuf(0)
set ruf=%l,%c%=%P
