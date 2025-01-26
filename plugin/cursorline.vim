if has('nvim') == 1
  finish
endif
" Fancy cursorline settings
" Only set cursorline on the active buffer
" Only highlight the number column
" Change highlight based on mode
" Certain buftypes should have a full cursorline
function! SetCursorLine(mode)
  hi clear CursorLine
  hi CursorLineNr guifg=#ff027f guibg=#1b1b13 gui=BOLD

  let l:output = 'SetCursorLine: '.expand('%').', '.a:mode

  if &buftype ==# 'quickfix' || a:mode ==# 'leave' || (exists('&filetype') && (&filetype ==# 'fugitiveblame' || &filetype ==# 'gitv'))
    let l:output = output.', no-line'
    setlocal nocursorline
  else
    let l:output = output.', line'
    setlocal cursorline
  end

  if exists('&filetype') && a:mode ==# 'enter' && (&filetype ==# 'startify' || &filetype ==# 'vaffle' || &filetype ==# 'GV' || &filetype ==# 'fugitive')
    let l:output = output.', set-bg-color'
    hi CursorLine guibg=#000000
  end
endfunction

function! SetCursorNumber(mode)
  if a:mode ==# 'enter'
    hi Cursor       guifg=#008ffd guibg=#008ffd gui=NONE
    hi CursorLineNr guifg=#121212 guibg=#008ffd gui=BOLD
  else
    hi Cursor       guifg=#000000 guibg=#ff027f gui=NONE
    hi CursorLineNr guifg=#ff027f guibg=#1b1b13 gui=BOLD
  end
endfunction

augroup cursorline
  autocmd!
  " Debugging
  " autocmd WinEnter * echom 'winenter'
  " autocmd FileType * echom 'filetype: '.&filetype
  " autocmd WinLeave * echom 'winleave'

  " New way, hopefully tubed and more reliable
  autocmd WinEnter * :call SetCursorLine('enter')
  autocmd FileType startify,vaffle :call SetCursorLine('enter')
  autocmd WinLeave,BufLeave * :call SetCursorLine('leave')

  " Old way - was kind of expensive... and didn't reliably work
  " autocmd BufEnter,WinEnter,FileType,FocusGained,TabEnter,TabNew,CmdlineLeave,CmdwinLeave * :call SetCursorLine('enter')
  " autocmd BufLeave,WinLeave,FocusLost,TabLeave,CmdwinLeave,TabLeave,CmdlineEnter,CmdwinEnter * :call SetCursorLine('leave')
  " autocmd BufEnter,WinEnter,FileType,FocusGained,TabEnter,TabNew * :call SetCursorLine('enter')
  " autocmd BufLeave,WinLeave,FocusLost,TabLeave,CmdwinLeave,TabLeave * :call SetCursorLine('leave')
  autocmd InsertLeave * :call SetCursorNumber('leave')
  autocmd InsertEnter * :call SetCursorNumber('enter')
augroup END
