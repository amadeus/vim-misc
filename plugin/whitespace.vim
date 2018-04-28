" Remove trailing whitespace on save
function! ClearTrailingWhitespace(command)
  " Allow me to preserve whitespace on certain files
  if exists('b:preserve_whitespace') || exists('g:preserve_whitespace')
    return
  endif
  " Save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
  echom 'Trailing whitespace cleared'
endfunction

" Execute clear whitespace on save
augroup whitespace
  autocmd!
  autocmd BufWritePre * :call ClearTrailingWhitespace("%s/\\s\\+$//e")
augroup END

"  Toggle whitespace save shortcut
function! ToggleWhitespaceSave(force)
  if a:force == 1
    let b:preserve_whitespace = 1
  elseif exists('b:preserve_whitespace') && b:preserve_whitespace == 1
    unlet b:preserve_whitespace
    echo 'Stripping whitespace on save'
  else
    let b:preserve_whitespace = 1
    echo 'Preserving whitespace on save'
  endif
endfunction
nnoremap <leader>pw :call ToggleWhitespaceSave(0)<cr>
