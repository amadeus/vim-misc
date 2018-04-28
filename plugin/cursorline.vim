" Fancy cursorline settings
" Only set cursorline on the active buffer
" Only highlight the number column
" Change highlight based on mode
" Startify should have full cursorline
function! SetCursorLine(mode)
  highlight CursorLine guifg=NONE guibg=NONE gui=NONE
  highlight CursorLineNr guifg=#121212 guibg=#3cff00 gui=BOLD
  set laststatus=2

  if &buftype == 'quickfix' || a:mode == 'leave' || (exists('&filetype') && (&filetype == 'fugitiveblame' || &filetype == 'gitv'))
    setlocal nocursorline
  else
    setlocal cursorline
  end

  if exists('&filetype') && a:mode == 'enter' && &filetype == 'startify'
    set laststatus=0
    hi CursorLine guibg=#000000
  end
endfunction

function! SetCursorNumber(mode)
  if a:mode == 'enter'
    hi CursorLineNr guifg=#121212 guibg=#008ffd gui=BOLD
  else
    hi CursorLineNr guifg=#121212 guibg=#3cff00 gui=BOLD
  end
endfunction

augroup cursorline
  autocmd!
  autocmd BufEnter,WinEnter,FileType,FocusGained,TabEnter,TabNew,CmdlineLeave,CmdwinLeave * :call SetCursorLine('enter')
  autocmd BufLeave,WinLeave,FocusLost,TabLeave,CmdwinLeave,TabLeave,CmdlineEnter,CmdwinEnter * :call SetCursorLine('leave')
  autocmd InsertLeave * :call SetCursorNumber('leave')
  autocmd InsertEnter * :call SetCursorNumber('enter')
augroup END
