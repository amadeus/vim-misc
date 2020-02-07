" Custom Buffer deletion command
" https://github.com/junegunn/fzf.vim/pull/733#issuecomment-559720813
" https://github.com/junegunn/fzf/blob/master/README-VIM.md

function! Bufs()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': Bufs(),
  \ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
