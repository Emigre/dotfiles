local map = vim.api.nvim_set_keymap

map('', '<leader>f', ':Ranger<CR>', {})
map('', '<leader>F', ':RangerWorkingDirectory<CR>', {})

-- the code below is based on https://github.com/francoiscabrol/ranger.vim
-- before this code runs bclose needs to be applied: https://github.com/rbgrouleff/bclose.vim

vim.cmd [[
  " Copyright (c) 2015 François Cabrol
  "
  " MIT License
  "
  " Permission is hereby granted, free of charge, to any person obtaining
  " a copy of this software and associated documentation files (the
  " "Software"), to deal in the Software without restriction, including
  " without limitation the rights to use, copy, modify, merge, publish,
  " distribute, sublicense, and/or sell copies of the Software, and to
  " permit persons to whom the Software is furnished to do so, subject to
  " the following conditions:
  "
  " The above copyright notice and this permission notice shall be
  " included in all copies or substantial portions of the Software.
  "
  " THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  " EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  " MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  " NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  " LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  " OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  " WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


  " ================ Ranger =======================
  function! OpenRangerIn(path, edit_cmd)
    " temporary file, TODO set a better file name ?
    let choice_file_path = '/tmp/chosenfile'
    let ranger_command = '~/ranger/ranger.py'
    let currentPath = expand(a:path)
    let rangerCallback = { 'name': 'ranger', 'edit_cmd': a:edit_cmd }

    function! rangerCallback.on_exit(job_id, code, event)
      let choice_file_path = '/tmp/chosenfile'
      if a:code == 0
        silent! Bclose!
      endif
      try
        if filereadable(choice_file_path)
          for f in readfile(choice_file_path)
            exec self.edit_cmd . f
          endfor
          call delete(choice_file_path)
        endif
      endtry
    endfunction

    enew
    if isdirectory(currentPath)
      call termopen(ranger_command . ' --choosefiles=' . choice_file_path . ' "' . currentPath . '"', rangerCallback)
    else
      call termopen(ranger_command . ' --choosefiles=' . choice_file_path . ' --selectfile="' . currentPath . '"', rangerCallback)
    endif
    startinsert
  endfunction

  let default_edit_cmd='edit '
  command! Ranger call OpenRangerIn("%", default_edit_cmd)
  command! RangerWorkingDirectory call OpenRangerIn(".", default_edit_cmd)

  " Open Ranger in the directory passed by argument
  function! OpenRangerOnVimLoadDir(argv_path)
    let path = expand(a:argv_path)
    Bclose! " Delete empty buffer created by vim
    call OpenRangerIn(path, 'edit')
  endfunction

  " To open ranger when vim load a directory
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter * if isdirectory(expand("%")) | call OpenRangerOnVimLoadDir("%") | endif
]]
