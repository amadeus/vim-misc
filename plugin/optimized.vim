function! Optimize()
  syntax off
  filetype plugin off
  filetype indent off
  filetype off
  set eventignore=all

  try
    :ALEDisable
  catch /.*/
    echom 'ALE is not installed'
  endtry

  try
    call ddc#disable()
  catch /.*/
    echom 'ddc failed to disable'
  endtry

  echom 'Vim is now optimized...'
endfunction

function! Deoptimize()
  syntax on
  filetype plugin on
  filetype indent on
  filetype on
  set eventignore=''

  try
    :ALEEnable
  catch /.*/
    echom 'ALE is not installed'
  endtry

  echom 'Vim is now deoptimized...'
endfunction

command! Optimize call Optimize()
command! Deoptimize call Deoptimize()
