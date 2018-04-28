function! <SID>IsGitConflict()
  " Don't attempt this search on a large file
  if getfsize(expand(@%)) > 100000
    return
  endif
  if search('<<<<<<<', 'npw') && search('>>>>>>>', 'npw')
    runtime misc/gitconflicts.vim
  endif
endfu
" This may be causing issues for me when sourcing
" augroup githighlighting
"   autocmd!
"   autocmd Syntax * call <SID>IsGitConflict()
" augroup END
