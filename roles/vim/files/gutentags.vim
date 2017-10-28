let g:gutentags_init_user_func = "SetGutentagsDirectory"
function! SetGutentagsDirectory(buffer_filename)
  let l:git_root=system('git rev-parse --git-dir 2>/dev/null')
  if v:shell_error
    let b:gutentags_tagfile = 'tags'
  else
    let b:gutentags_tagfile = '.git/tags'
  endif
  return 1
endfunction
