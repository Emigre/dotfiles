" nerdtree.vim
" ------------
function! NERDTreeCustomToggle()
  if (exists("t:NERDTreeBufName"))
    if (bufwinnr(t:NERDTreeBufName) != -1)
      exe ":winc w"
    else
      exe ":NERDTreeToggle"
    endif
  else
    exe ":NERDTree"
  endif
endfunction
map <silent> § :call NERDTreeCustomToggle()<CR>

function! NERDTreeCustomClose()
  if (exists("t:NERDTreeBufName"))
    if (bufwinnr(t:NERDTreeBufName) != -1)
      exe ":NERDTreeToggle"
    endif
  endif
endfunction
map <silent> ± :call NERDTreeCustomClose()<CR>

map <leader>t :NERDTreeFind<CR>

let g:NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['^\.git$', '^bower_components$', '^node_modules$', '^\.sass-cache$', '^\.DS_Store$', '^\.idea$', '^venv$', '^__pycache__$']

function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension . 'FileType ctermbg=' . a:bg .' ctermfg='. a:fg
  if a:extension == 'hidden'
    exec 'autocmd filetype nerdtree syn match ' . a:extension . 'FileType #^\s\+\..*' . '$#'
  else
    exec 'autocmd filetype nerdtree syn match ' . a:extension . 'FileType #^\s\+.*\.' . a:extension .'$#'
  endif
endfunction

" Colors in NERDTree
call NERDTreeHighlightFile('c', '34', 'none')
call NERDTreeHighlightFile('cc', '34', 'none')
call NERDTreeHighlightFile('cpp', '34', 'none')
call NERDTreeHighlightFile('css', '115', 'none')
call NERDTreeHighlightFile('h', '28', 'none')
call NERDTreeHighlightFile('hidden', 'darkGrey', 'none')
call NERDTreeHighlightFile('hpp', '28', 'none')
call NERDTreeHighlightFile('html', '110', 'none')
call NERDTreeHighlightFile('jade', '40', 'none')
call NERDTreeHighlightFile('js', '223', 'none')
call NERDTreeHighlightFile('json', '136', 'none')
call NERDTreeHighlightFile('jsx', '33', 'none')
call NERDTreeHighlightFile('less', '115', 'none')
call NERDTreeHighlightFile('md', '249', 'none')
call NERDTreeHighlightFile('py', '166', 'none')
call NERDTreeHighlightFile('pyc', 'darkGrey', 'none')
call NERDTreeHighlightFile('rb', '89', 'none')
call NERDTreeHighlightFile('sass', '115', 'none')
call NERDTreeHighlightFile('scss', '115', 'none')
call NERDTreeHighlightFile('tpl', '40', 'none')
call NERDTreeHighlightFile('ts', '33', 'none')
call NERDTreeHighlightFile('tsx', '33', 'none')
call NERDTreeHighlightFile('yml', '136', 'none')
