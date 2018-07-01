let g:ycm_error_symbol = '▸'
let g:ycm_warning_symbol = '▸'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/scripts/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_vim_data = ['&filetype']

nnoremap <silent> <leader>jh :YcmCompleter<CR>
nnoremap <silent> <leader>jl :YcmToggleLogs<CR>
nnoremap <silent> <leader>jr :YcmRestartServer<CR>
nnoremap <silent> <leader>jd :YcmDebugInfo<CR>
nnoremap <silent> <leader>jf :YcmForceCompileAndDiagnostics<CR>

nnoremap <silent> <leader>jj :YcmCompleter GoTo<CR>
nnoremap [ :YcmCompleter GoToDeclaration<CR>
nnoremap ] :YcmCompleter GoToDefinition<CR>

nnoremap <silent> <leader>jt :YcmCompleter GetType<CR>
nnoremap <silent> <leader>jk :YcmCompleter RestartServer<CR>

" Other YcmCompleter commands:
" - GoToReferences
" - FixIt
" - Format
" - GetDoc
" - RefactorRename

hi YcmErrorSign ctermfg=9 ctermbg=237
hi YcmErrorSection ctermfg=9 ctermbg=237

hi YcmWarningSign ctermfg=5 ctermbg=237
hi YcmWarningSection ctermfg=5 ctermbg=237
