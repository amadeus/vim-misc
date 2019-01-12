function! Optimize()
  syntax off
  filetype plugin off
  filetype indent off
  filetype off

  try
    :ALEDisable
  catch /.*/
    echom 'ALE is not installed'
  endtry

  echom 'Vim is now optimized...'
endfunction

function! Deoptimize()
  syntax on
  filetype plugin on
  filetype indent on
  filetype on

  try
    :ALEEnable
  catch /.*/
    echom 'ALE is not installed'
  endtry

  echom 'Vim is now deoptimized...'
endfunction

command! Optimize call Optimize()
command! Deoptimize call Deoptimize()
