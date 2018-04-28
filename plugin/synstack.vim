" Show the stack of syntax hilighting classes affecting
" whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'),
    \ " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>
inoremap <F7> exec "call SynStack()"
