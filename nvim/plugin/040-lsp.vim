" Neoformat (format on save)
" --------------------------

let g:neoformat_try_formatprg = 0
let g:neoformat_basic_format_align = 0
let g:neoformat_basic_format_trim = 1

augroup fmt
  autocmd!
  " Ignore error E790: undojoin is not allowed after undo
  autocmd BufWritePre * try | undojoin | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

let s:typescript_prettier_config = {
  \ 'exe': './node_modules/.bin/prettier',
  \ 'args': ['--write', '--config .prettierrc'],
  \ 'replace': 1
  \ }

let g:neoformat_typescript_prettier = s:typescript_prettier_config

let g:neoformat_enabled_typescript = ['prettier']

let g:neoformat_enabled_javascript= ['prettier']

let g:neoformat_enabled_css = ['prettier']

let g:neoformat_enabled_html = ['prettier']

let g:neoformat_enabled_haskell = ['brittany']

let g:neoformat_enabled_python = ['autopep8']

let g:neoformat_enabled_cpp = ['clangformat']

let g:neoformat_enabled_c = ['clangformat']

let g:neoformat_enabled_markdown = []

" LSP - code completion and snippets
" ----------------------------------

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_fuzzy_match = 1
let g:completion_trigger_keyword_length = 2
let g:completion_matching_ignore_case = 1
let g:completion_matching_strategy_list = ['fuzzy', 'exact', 'substring']

fun! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endf

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" : completion#trigger_completion()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LSP - code analysis and diagnostics (linting)
" ---------------------------------------------

fun! LSP__goToDefinition()
  call Main__closeFloatingWindow()
  lua vim.lsp.buf.definition()
endfun

fun! LSP__showTypeDefinition()
  lua vim.lsp.buf.hover()
endfun

fun! LSP__showReferences()
  call Main__closeFloatingWindow()
  lua vim.lsp.buf.references()
endfun

fun! LSP__NextDiagnosticCycle()
  lua vim.lsp.diagnostic.goto_next()
endfun

fun! LSP__PrevDiagnosticCycle()
  lua vim.lsp.diagnostic.goto_prev()
endfun

fun! LSP__OpenDiagnostics()
  lua vim.lsp.diagnostic.set_loclist()
endfun
