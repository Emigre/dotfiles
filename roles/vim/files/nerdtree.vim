" nerdtree.vim
" ------------
function! NERDTreeCustomToggle()
  if (exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1))
    exe ":winc w"
  else
    exe ":NERDTree"
  endif
endfunction
map <silent> § :call NERDTreeCustomToggle()<CR>
map <silent> ± :NERDTreeClose<CR>
map <leader>f :NERDTreeFind<CR>

let g:NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['^\.git$', '^bower_components$', '^node_modules$', '^\.sass-cache$', '^\.DS_Store$', '^\.idea', 'venv', '__pycache__']

function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension . 'FileType ctermbg=' . a:bg .' ctermfg='. a:fg
  if a:extension == 'hidden'
    exec 'autocmd filetype nerdtree syn match ' . a:extension . 'FileType #^\s\+\..*' . '$#'
  else
    exec 'autocmd filetype nerdtree syn match ' . a:extension . 'FileType #^\s\+.*\.' . a:extension .'$#'
  endif
endfunction

" Colors in NERDTree
call NERDTreeHighlightFile('c', '40', 'none')
call NERDTreeHighlightFile('cpp', '40', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none')
call NERDTreeHighlightFile('h', '17', 'none')
call NERDTreeHighlightFile('hidden', 'darkGrey', 'none')
call NERDTreeHighlightFile('hpp', '17', 'none')
call NERDTreeHighlightFile('html', 'cyan', 'none')
call NERDTreeHighlightFile('jade', '40', 'none')
call NERDTreeHighlightFile('js', '33', 'none')
call NERDTreeHighlightFile('json', '136', 'none')
call NERDTreeHighlightFile('jsx', '33', 'none')
call NERDTreeHighlightFile('md', '249', 'none')
call NERDTreeHighlightFile('py', '166', 'none')
call NERDTreeHighlightFile('pyc', 'darkGrey', 'none')
call NERDTreeHighlightFile('rb', '89', 'none')
call NERDTreeHighlightFile('tpl', '40', 'none')
call NERDTreeHighlightFile('ts', '33', 'none')
call NERDTreeHighlightFile('tsx', '33', 'none')
call NERDTreeHighlightFile('yml', '136', 'none')
