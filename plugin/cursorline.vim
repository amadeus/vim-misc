" Fancy cursorline settings
" Only set cursorline on the active buffer
" Only highlight the number column
" Change highlight based on mode
" Certain buftypes should have a full cursorline
function! SetCursorLine(mode)
  hi CursorLine   guifg=NONE    guibg=NONE    gui=NONE
  hi CursorLineNr guifg=#ff027f guibg=#1b1b13 gui=BOLD

  if &buftype == 'quickfix' || a:mode == 'leave' || (exists('&filetype') && (&filetype == 'fugitiveblame' || &filetype == 'gitv'))
    setlocal nocursorline
  else
    setlocal cursorline
  end

  if exists('&filetype') && a:mode == 'enter' && (&filetype == 'startify' || &filetype == 'vaffle' || &filetype == 'GV' || &filetype == 'fugitive')
    hi CursorLine guibg=#000000
  end
endfunction

function! SetCursorNumber(mode)
  if a:mode == 'enter'
    hi Cursor       guifg=#008ffd guibg=#008ffd gui=NONE
    hi CursorLineNr guifg=#121212 guibg=#008ffd gui=BOLD
  else
    hi Cursor       guifg=#000000 guibg=#ff027f gui=NONE
    hi CursorLineNr guifg=#ff027f guibg=#1b1b13 gui=BOLD
  end
endfunction

augroup cursorline
  autocmd!
  autocmd BufEnter,WinEnter,FileType,TabEnter,TabNew,CmdlineLeave,CmdwinLeave * :call SetCursorLine('enter')
  autocmd BufLeave,WinLeave,TabLeave,CmdwinLeave,TabLeave,CmdlineEnter,CmdwinEnter * :call SetCursorLine('leave')
  autocmd InsertLeave * :call SetCursorNumber('leave')
  autocmd InsertEnter * :call SetCursorNumber('enter')
augroup END
