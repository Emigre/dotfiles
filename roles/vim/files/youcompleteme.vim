let g:ycm_error_symbol = '▸'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/scripts/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1

nnoremap <C-]> :YcmCompleter GoTo<CR>
nnoremap [ :YcmCompleter GetType<CR>
nnoremap ] :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <leader>k :YcmRestartServer<CR>

hi YcmErrorSign ctermfg=9 ctermbg=237
