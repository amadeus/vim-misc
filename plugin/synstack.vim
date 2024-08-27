" Show the stack of syntax hilighting classes affecting
" whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'),
    \ " > ")
endfunc

if has('nvim') == 1
  nnoremap <F7> :Inspect<CR>
  inoremap <F7> exec "Inspect"
else
  nnoremap <F7> :call SynStack()<CR>
  inoremap <F7> exec "call SynStack()"
end
