let g:ale_sign_error = '░ '
let g:ale_sign_warning = '░ '

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

hi! link ALEError SpellBad
hi! ALEWarning ctermfg=NONE
hi! link ALEErrorSign SpellBad
hi! link ALEWarningSign SpellRare

nmap <silent> ' <Plug>(ale_next_wrap)

let g:ale_linters = {
\ 'jsx': ['eslint'],
\ 'java': [],
\ 'haskell': ['hlint'],
\ 'cpp': ['clang', 'clangcheck', 'clangtidy', 'clang-format']
\}

let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

let s:openframeworks_options = "-std=c++14 -Wall".
      \" -I../openFrameworks/libs/openFrameworks".
      \" -I../openFrameworks/libs/openFrameworks/3d".
      \" -I../openFrameworks/libs/openFrameworks/app".
      \" -I../openFrameworks/libs/openFrameworks/communication".
      \" -I../openFrameworks/libs/openFrameworks/events".
      \" -I../openFrameworks/libs/openFrameworks/gl".
      \" -I../openFrameworks/libs/openFrameworks/graphics".
      \" -I../openFrameworks/libs/openFrameworks/math".
      \" -I../openFrameworks/libs/openFrameworks/sound".
      \" -I../openFrameworks/libs/openFrameworks/types".
      \" -I../openFrameworks/libs/openFrameworks/utils".
      \" -I../openFrameworks/libs/openFrameworks/video".
      \" -I../openFrameworks/libs/FreeImage/include".
      \" -I../openFrameworks/libs/boost/include".
      \" -I../openFrameworks/libs/boost/include/boost".
      \" -I../openFrameworks/libs/cairo/include".
      \" -I../openFrameworks/libs/cairo/include/cairo".
      \" -I../openFrameworks/libs/curl/include".
      \" -I../openFrameworks/libs/curl/include/curl".
      \" -I../openFrameworks/libs/fmodex/include".
      \" -I../openFrameworks/libs/freetype/include".
      \" -I../openFrameworks/libs/freetype/include/freetype2".
      \" -I../openFrameworks/libs/freetype/include/freetype2/freetype".
      \" -I../openFrameworks/libs/freetype/include/freetype2/freetype/config".
      \" -I../openFrameworks/libs/freetype/include/freetype2/freetype/internal".
      \" -I../openFrameworks/libs/freetype/include/freetype2/freetype/internal/services".
      \" -I../openFrameworks/libs/glew/include".
      \" -I../openFrameworks/libs/glew/include/GL".
      \" -I../openFrameworks/libs/glfw/include".
      \" -I../openFrameworks/libs/glfw/include/GLFW".
      \" -I../openFrameworks/libs/glm/include".
      \" -I../openFrameworks/libs/glm/include/glm".
      \" -I../openFrameworks/libs/glm/include/glm/detail".
      \" -I../openFrameworks/libs/glm/include/glm/gtc".
      \" -I../openFrameworks/libs/glm/include/glm/gtx".
      \" -I../openFrameworks/libs/json/include".
      \" -I../openFrameworks/libs/pugixml/include".
      \" -I../openFrameworks/libs/rtAudio/include".
      \" -I../openFrameworks/libs/tess2/include".
      \" -I../openFrameworks/libs/uriparser/include".
      \" -I../openFrameworks/libs/uriparser/include/uriparser".
      \" -I../openFrameworks/libs/utf8/include".
      \" -I../openFrameworks/libs/utf8/include/utf8"

if !empty(glob("Makefile"))
  if system("grep -c 'OF_ROOT' Makefile") != 0
    let g:ale_cpp_clang_options = s:openframeworks_options
  endif
endif
