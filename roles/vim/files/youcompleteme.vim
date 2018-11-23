nnoremap [ :YcmCompleter GoToDeclaration<CR>
nnoremap ] :YcmCompleter GoToDefinition<CR>

nnoremap <silent> <leader>jj :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>jt :YcmCompleter GetType<CR>

nnoremap <silent> <leader>jk :YcmRestartServer<CR>
nnoremap <silent> <leader>jl :YcmToggleLogs<CR>
nnoremap <silent> <leader>jr :YcmCompleter RestartServer<CR>
nnoremap <silent> <leader>jd :YcmDebugInfo<CR>
nnoremap <silent> <leader>jf :YcmForceCompileAndDiagnostics<CR>

fun! s:isPreviewWindowOpen()
  for i in range(1, winnr('$'))
    if getwinvar(i, "&pvw") == 1
      retu i
    endif
  endfor
endfun

fun! s:togglePreviewWindow()
  let preview_window = <SID>isPreviewWindowOpen()
  if preview_window
    exe 'pc'
  else
    exe 'YcmCompleter GetDoc'
  endif
endfun

nnoremap <silent> <leader>jh :call <SID>togglePreviewWindow()<CR>

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

" number of characters the user needs to type before identifier-based completion suggestions are triggered
" let g:ycm_min_num_of_chars_for_completion = 2

" minimum number of characters that a completion candidate coming from the identifier completer must have
" to be shown in the popup menu
" let g:ycm_min_num_identifier_candidate_chars = 0

" maximum number of semantic completion suggestions
" let g:ycm_max_num_candidates = 50

" maximum number of completion suggestions from the identifier-based engine
" let g:ycm_max_num_identifier_candidates = 10

" turns on YCM's identifier completer (the as-you-type popup) and the semantic triggers
" (the popup you'd get after typing . or -> in say C++)
" let g:ycm_auto_trigger = 1

" which Vim filetypes should YCM be turned on
" let g:ycm_filetype_whitelist = { '*': 1 }

" which Vim filetypes should YCM be turned off
" let g:ycm_filetype_blacklist = {
"       \ 'tagbar' : 1,
"       \ 'qf' : 1,
"       \ 'notes' : 1,
"       \ 'markdown' : 1,
"       \ 'unite' : 1,
"       \ 'text' : 1,
"       \ 'vimwiki' : 1,
"       \ 'pandoc' : 1,
"       \ 'infolog' : 1,
"       \ 'mail' : 1
"       \}

" which Vim filetypes should the YCM semantic completion engine be turned off
" let g:ycm_filetype_specific_completion_to_disable = {
"       \ 'gitcommit': 1
"       \}

" which Vim filetypes should filepath completion be disabled
" let g:ycm_filepath_blacklist = {
"       \ 'html' : 1,
"       \ 'jsx' : 1,
"       \ 'xml' : 1,
"       \}

" turns on YCM's diagnostic display features
" let g:ycm_show_diagnostics_ui = 1

" symbol for errors in the Vim gutter
let g:ycm_error_symbol = '░'

" symbol for warnings in the Vim gutter
let g:ycm_warning_symbol = '░'

" shows icons in Vim's gutter on lines that have a diagnostic set
" let g:ycm_enable_diagnostic_signs = 1

" highlight regions of text that are related to the diagnostic that is present on a line
" let g:ycm_enable_diagnostic_highlighting = 1

" show the text of the diagnostic present on the current line when you move your cursor to that line
" let g:ycm_echo_current_diagnostic = 1

" controls which diagnostics will be rendered by YCM
" let g:ycm_filter_diagnostics = {}

" populate the location list automatically every time it gets new diagnostic data
" let g:ycm_always_populate_location_list = 0

" automatically open the location list after forcing a compilation and filling the list with diagnostic data
" let g:ycm_open_loclist_on_ycm_diags = 1

" show the completion menu even when typing inside comments
" let g:ycm_complete_in_comments = 0

" show the completion menu even when typing inside strings
" let g:ycm_complete_in_strings = 1

" collect identifiers from strings and comments
" let g:ycm_collect_identifiers_from_comments_and_strings = 0

" collect identifiers from tags files
" let g:ycm_collect_identifiers_from_tags_files = 0

" seed the identifier database with the keywords of the programming language
" let g:ycm_seed_identifiers_with_syntax = 0

" sends data from Vim to the Settings function in .ycm_extra_conf.py
" let g:ycm_extra_conf_vim_data = []

" force the use of a specific Python interpreter
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

" keep the logfiles around after shutting down
let g:ycm_keep_logfiles = 0

" log level (debug, info, warning, error, critical)
" let g:ycm_log_level = 'info'

" automatically start the OmniSharp server when opening a C# file
" let g:ycm_auto_start_csharp_server = 1

" automatically stop the OmniSharp server when closing Vim
" let g:ycm_auto_stop_csharp_server = 1

" specifies the port for OmniSharp, if 0 use any port
" let g:ycm_csharp_server_port = 0

" in C#, insert the using statement under the nearest using statement
" let g:ycm_csharp_insert_namespace_expr = ''

" add the preview string to Vim's completeopt option (see :h completeopt)
" If your completeopt option already has preview set, there will be no effect
let g:ycm_add_preview_to_completeopt = 1

" completeopt default is menu,preview
set cot=menuone,preview

" auto-close the preview window after the user accepts the offered completion
let g:ycm_autoclose_preview_window_after_completion = 1

" maximum number of diagnostics shown to the user when errors or warnings are detected
let g:ycm_max_diagnostics_to_display = 999

" key mappings used to select the first completion string
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" key mappings used to select the previous completion string
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" key mappings used to close the completion menu
" let g:ycm_key_list_stop_completion = ['<C-y>']

" key mapping used to invoke the completion menu for semantic completion
" By default, semantic completion is triggered automatically after typing ., -> and :: in insert mode
" let g:ycm_key_invoke_completion = '<C-Space>'

" key mapping used to show the full diagnostic text when the user's cursor
" is on the line with the diagnostic. It basically calls :YcmShowDetailedDiagnostic
" let g:ycm_key_detailed_diagnostics = '<leader>d'

" YCM searches for a .ycm_extra_conf.py file for compilation flags. This option specifies a fallback
" path to a config file which is used if no .ycm_extra_conf.py is found
" let g:ycm_global_ycm_extra_conf = ''

" YCM will ask once per .ycm_extra_conf.py file if it is safe to be loaded
" let g:ycm_confirm_extra_conf = 1

" If using confirmation of .ycm_extra_conf.py files, this allows to set automatic whitelist
" or blacklist files so they are automatically confirmed or declined without asking the user
let g:ycm_extra_conf_globlist = ['~/code/c++/chromium/*']

" by default YCM's filepath completion will interpret relative paths like ../ as being
" relative to the folder of the file of the currently active buffer. Setting this option will
" force YCM to always interpret relative paths as being relative to Vim's current working directory
" let g:ycm_filepath_completion_use_working_dir = 0

" option that controls the character-based triggers for the various semantic completion engines
" let g:ycm_semantic_triggers =  {
"   \ 'c' : ['->', '.'],
"   \ 'cpp,cuda,objcpp' : ['->', '.', '::'],
"   \ 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"   \ 'erlang' : [':'],
"   \ 'lua' : ['.', ':'],
"   \ 'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
"   \ 'ocaml' : ['.', '#'],
"   \ 'perl' : ['->'],
"   \ 'php' : ['->', '::'],
"   \ 'ruby' : ['.', '::'],
"   \ }

" some omnicompletion engines do not work well with the YCM cache—in particular, they might not produce
" all possible results for a given prefix. By unsetting this option you can ensure that the
" omnicompletion engine is re-queried on every keypress. That will ensure all completions will be
" presented, but might cause stuttering and lagginess if the omnifunc is slow
" let g:ycm_cache_omnifunc = 1

" YCM will query the UltiSnips plugin for possible completions of snippet triggers
" let g:ycm_use_ultisnips_completer = 1

" where GoTo* commands result should be opened
" let g:ycm_goto_buffer_command = 'same-buffer'

" max size (in Kb) for a file to be considered for completion
" let g:ycm_disable_for_files_larger_than_kb = 1000

" specifies the Python interpreter to use to run the jedi completion library. By default the Python
" under which ycmd runs is used (ycmd runs on Python 2.7.1+ or 3.4+)
" let g:ycm_python_binary_path = ''

" for semantic analysis with rust including the standard library, you must have a local copy of
" the Rust source code. YCM will find its location automatically. Otherwise, download the archive,
" extract it somewhere, and set the following option so YCM can locate it
let g:ycm_rust_src_path='~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
