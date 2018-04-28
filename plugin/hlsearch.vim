" Always enable hlsearch when searching, but only keep it on if it
" was already set on previously
let g:hl_was_on = 0
function! ToggleHLSearch(enter)
  if a:enter == 1 && v:hlsearch == 1
    let g:hl_was_on = 1
  elseif a:enter == 1
    let g:hl_was_on = 0
    set hlsearch
  elseif a:enter == 0 && g:hl_was_on == 0
    let g:hl_was_on = 0
    set nohlsearch
  else
    let g:hl_was_on = 0
  endif
endfunction

augroup searching
  autocmd!
  if has('CmdlineEnter')
    autocmd CmdlineEnter * :call ToggleHLSearch(1)
    autocmd CmdlineLeave * :call ToggleHLSearch(0)
  endif
augroup END

